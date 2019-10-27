<?php
/**
 *  查询物流（快递鸟）
 **/
class Esearch
{
    private $EBusinessID = '1307717';
    private $AppKey      = '1849c738-8d6e-45aa-82d5-6d314e87eda3';
    private $ReqURL      = 'http://api.kdniao.cc/Ebusiness/EbusinessOrderHandle.aspx';

    public function read($express_type, $express_no)
    {
        $logisticResult = $this->getOrderTracesByJson($express_type, $express_no);
        return $logisticResult;
    }

    public function getOrderTracesByJson($express_type, $express_no)
    {
        $requestData = "{'OrderCode':'','ShipperCode':'" . $express_type . "','LogisticCode':'" . $express_no . "'}";

        $datas = array(
            'EBusinessID' => $this->EBusinessID,
            'RequestType' => '1002',
            'RequestData' => urlencode($requestData),
            'DataType'    => '2',
        );
        $datas['DataSign'] = $this->encrypt($requestData, $this->AppKey);
        $result            = $this->sendPost($this->ReqURL, $datas);

        //解析电子面单返回结果
        $result = json_decode($result, true);
        if ($result["Success"]) {
            return ['code' => 1, 'data' => $result, 'msg' => '查询成功'];
        } else {
            return ['code' => 0, 'data' => [], 'msg' => $result['Reason']];
        }
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
}
