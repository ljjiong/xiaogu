<?php

/**
 *  电子面单（快递鸟）
 * */
class Eprint
{

    private $api_url        = 'http://www.kdniao.com/External/PrintOrder.aspx';
    private $ip_service_url = 'http://www.kdniao.com/External/GetIp.aspx';
    private $EBusinessID    = '1307717';
    private $APIKey         = '1849c738-8d6e-45aa-82d5-6d314e87eda3';

    // 打印电子面单
    public function create($order_id)
    {
        return $this->build_form([$order_id]);
    }

    // 批量打印电子面单
    public function batch_create($order_ids)
    {
        return $this->build_form($order_ids);
    }

    public function build_form($order_ids)
    {
        $orders = model('orders')->getAll(['id' => ['in', $order_ids]]);
        //OrderCode:需要打印的订单号，和调用快递鸟电子面单的订单号一致，PortName：本地打印机名称，请参考使用手册设置打印机名称。支持多打印机同时打印。
        $data = [];
        foreach ($orders as $key => $value) {
            $data[] = [
                "OrderCode" => $value['order_no'],
                "PortName"  => "Lenovo M7206",
            ];
        }

        $request_data = json_encode($data, JSON_UNESCAPED_UNICODE);
        $data_sign    = $this->encrypt($this->get_ip() . $request_data, $this->APIKey);
        //是否预览，0-不预览 1-预览
        $is_priview = 0;

        //组装表单
        $form = '<form id="form1" method="POST" action="' . $this->api_url . '"><input type="text" name="RequestData" value=\'' . $request_data . '\'/><input type="text" name="EBusinessID" value="' . $this->EBusinessID . '"/><input type="text" name="DataSign" value="' . $data_sign . '"/><input type="text" name="IsPriview" value="' . $is_priview . '"/></form><script>form1.submit();</script>';
        
        return $form;
    }

    public function is_private_ip($ip)
    {
        return !filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE);
    }

    public function get_ip()
    {
        //获取客户端IP
        if (getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
            $ip = getenv('HTTP_CLIENT_IP');
        } elseif (getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
            $ip = getenv('HTTP_X_FORWARDED_FOR');
        } elseif (getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
            $ip = getenv('REMOTE_ADDR');
        } elseif (isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        if (!$ip || $this->is_private_ip($ip)) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $ip_service_url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $output = curl_exec($ch);
            return $output;
        } else {
            return $ip;
        }
    }

    public function encrypt($data, $appkey)
    {
        return urlencode(base64_encode(md5($data . $appkey)));
    }

}
