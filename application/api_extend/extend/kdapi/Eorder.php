<?php
/**
 *  电子面单（快递鸟）
 **/
class Eorder
{
    private $EBusinessID = '1307717';
    private $AppKey      = '1849c738-8d6e-45aa-82d5-6d314e87eda3';
    private $ReqURL      = 'http://api.kdniao.com/api/EOrderService';

    public function create($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if (!$order) {
            return ['code' => 0, 'data' => [], 'msg' => '订单不存在'];
        }

        if (!($order['status'] == 3 || $order['status'] == 4)) {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误, 暂不可创建电子发单'];
        }

        $sender = [
            'Name'         => '网开创',
            'Mobile'       => '4000-500-740',
            'ProvinceName' => '湖南省',
            'CityName'     => '长沙市',
            'ExpAreaName'  => '长沙县',
            'Address'      => '经济开发区开源鑫贸大楼9楼906室',
        ];

        $receiver = [
            'Name'         => $order['consignee_name'],
            'Mobile'       => $order['mobile'],
            'ProvinceName' => $order['province'],
            'CityName'     => $order['city'],
            'ExpAreaName'  => $order['area'],
            'Address'      => str_replace(array("\r\n", "\r", "\n"), "", $order['address']),
        ];

        $commodity        = [];
        $order_goods_info = $order['order_goods_info'];
        foreach ($order_goods_info as $key => $value) {
            $commodity[] = [
                'GoodsName'     => $value['name'],
                'Goodsquantity' => $value['num'],
                'GoodsPrice'    => $value['sell_price'],
                'GoodsWeight'   => $value['weight'] * 0.001,
                'GoodsDesc'     => $value['spec_group_info'] ? $value['spec_group_info'] : $value['standard'],
            ];
        }

        //构造电子面单提交信息
        $eorder = [
            'Sender'      => $sender,
            'Receiver'    => $receiver,
            'Commodity'   => $commodity,
            'ShipperCode' => $order['eorder_express_type'], //快递公司编码
            'OrderCode'   => $order['order_no'], //订单编号
            'PayType'     => 1, //邮费支付方式:1-现付，2-到付，3-月结，4-第三方支付
            'ExpType'     => 1, //快递类型：1-标准快件
        ];

        //调用电子面单
        $jsonParam  = json_encode($eorder, JSON_UNESCAPED_UNICODE);
        $jsonResult = $this->submitEOrder($jsonParam);
        //解析电子面单返回结果
        $result = json_decode($jsonResult, true);
        if ($result["ResultCode"] == "100") {
            // 更新第三方返回的订单号
            model('orders')->editOne(['id' => $order_id, 'express_no' => $result['Order']['LogisticCode'], 'is_submit_eorder' => 1]);

            return ['code' => 1, 'data' => $result, 'msg' => '电子面单下单成功'];
        } else {
            return ['code' => 0, 'data' => [], 'msg' => $result['Reason']];
        }
    }

    public function cancel($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if (!$order) {
            return ['code' => 0, 'data' => [], 'msg' => '订单不存在'];
        }

        if ($order['is_submit_eorder'] == 0) {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误, 暂不可取消电子发单'];
        }

        $sender = [
            'Name'         => '网开创',
            'Mobile'       => '4000-500-740',
            'ProvinceName' => '湖南省',
            'CityName'     => '长沙市',
            'ExpAreaName'  => '长沙县',
            'Address'      => '经济开发区开源鑫贸大楼9楼906室',
        ];

        $receiver = [
            'Name'         => $order['consignee_name'],
            'Mobile'       => $order['mobile'],
            'ProvinceName' => $order['province'],
            'CityName'     => $order['city'],
            'ExpAreaName'  => $order['area'],
            'Address'      => str_replace(array("\r\n", "\r", "\n"), "", $order['address']),
        ];

        $commodity        = [];
        $order_goods_info = $order['order_goods_info'];
        foreach ($order_goods_info as $key => $value) {
            $commodity[] = [
                'GoodsName'     => $value['name'],
                'Goodsquantity' => $value['num'],
                'GoodsPrice'    => $value['sell_price'],
                'GoodsWeight'   => $value['weight'] * 0.001,
                'GoodsDesc'     => $value['spec_group_info'] ? $value['spec_group_info'] : $value['standard'],
            ];
        }

        //构造电子面单提交信息
        $eorder = [
            'Sender'      => $sender,
            'Receiver'    => $receiver,
            'Commodity'   => $commodity,
            'ShipperCode' => $order['eorder_express_type'], //快递公司编码
            'OrderCode'   => $order['order_no'], //订单编号
            'PayType'     => 1, //邮费支付方式:1-现付，2-到付，3-月结，4-第三方支付
            'ExpType'     => 1, //快递类型：1-标准快件
        ];

        //调用电子面单
        $jsonParam  = json_encode($eorder, JSON_UNESCAPED_UNICODE);
        $jsonResult = $this->cancelEOrder($jsonParam);
        //解析电子面单返回结果
        $result = json_decode($jsonResult, true);
        return $result;
        // if ($result["ResultCode"] == "100") {
        //     // 更新第三方返回的订单号
        //     model('orders')->editOne(['id' => $order_id, 'express_no' => $result['Order']['LogisticCode'], 'is_submit_eorder' => 1]);

        //     return ['code' => 1, 'data' => $result, 'msg' => '电子面单下单成功'];
        // } else {
        //     return ['code' => 0, 'data' => [], 'msg' => $result['Reason']];
        // }
    }

    public function submitEOrder($requestData)
    {
        $datas = array(
            'EBusinessID' => $this->EBusinessID,
            'RequestType' => '1007',
            'RequestData' => urlencode($requestData),
            'DataType'    => '2',
        );
        $datas['DataSign'] = $this->encrypt($requestData, $this->AppKey);
        $result            = $this->sendPost($this->ReqURL, $datas);

        //根据公司业务处理返回的信息......
        return $result;
    }

    public function cancelEOrder($requestData)
    {
        $datas = array(
            'RequestData' => urlencode($requestData),
            'EBusinessID' => $this->EBusinessID,
            'RequestType' => '1147',
            'DataSign'    => $this->encrypt($requestData, $this->AppKey),
        );
        $result = $this->sendPost($this->ReqURL, $datas);

        return $result;
    }

    public function sendPost($url, $datas)
    {
        $temps = array();
        foreach ($datas as $key => $value) {
            $temps[] = sprintf('%s=%s', $key, $value);
        }
        $post_data = implode('&', $temps);
        $url_info  = parse_url($url);
        if (empty($url_info['port'])) {
            $url_info['port'] = 80;
        }
        $httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
        $httpheader .= "Host:" . $url_info['host'] . "\r\n";
        $httpheader .= "Content-Type:application/x-www-form-urlencoded\r\n";
        $httpheader .= "Content-Length:" . strlen($post_data) . "\r\n";
        $httpheader .= "Connection:close\r\n\r\n";
        $httpheader .= $post_data;
        $fd = fsockopen($url_info['host'], $url_info['port']);
        fwrite($fd, $httpheader);
        $gets       = "";
        $headerFlag = true;
        while (!feof($fd)) {
            if (($header = @fgets($fd)) && ($header == "\r\n" || $header == "\n")) {
                break;
            }
        }
        while (!feof($fd)) {
            $gets .= fread($fd, 128);
        }
        fclose($fd);

        return $gets;
    }

    public function encrypt($data, $appkey)
    {
        return urlencode(base64_encode(md5($data . $appkey)));
    }

    public function arrayRecursive(&$array, $function, $apply_to_keys_also = false)
    {
        static $recursive_counter = 0;
        if (++$recursive_counter > 1000) {
            die('possible deep recursion attack');
        }
        foreach ($array as $key => $value) {
            if (is_array($value)) {
                $this->arrayRecursive($array[$key], $function, $apply_to_keys_also);
            } else {
                $array[$key] = $function($value);
            }

            if ($apply_to_keys_also && is_string($key)) {
                $new_key = $function($key);
                if ($new_key != $key) {
                    $array[$new_key] = $array[$key];
                    unset($array[$key]);
                }
            }
        }
        $recursive_counter--;
    }

    public function JSON($array)
    {
        $this->arrayRecursive($array, 'urlencode', true);
        $json = json_encode($array);
        return urldecode($json);
    }
}
