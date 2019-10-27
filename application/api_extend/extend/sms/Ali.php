<?php
/**
 *  阿里大鱼短信
 **/
class Ali
{
    // 是否开启阿里大鱼短信
    private $is_open;

    // 短信抬头
    private $company;

    // 应用ID
    private $access_key_id;

    // 应用密钥
    private $access_key_secret;

    // 模板ID
    private $template_code;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $ali  = $data['sms']['ali'];

        $this->is_open           = $ali['is_open'];
        $this->company           = $ali['company'];
        $this->access_key_id     = $ali['account'];
        $this->access_key_secret = $ali['password'];
        $this->template_code     = $ali['template_code'];
    }

    /**
     * 【发送短信】
     * $template_params 为短信模板的参数组成的数组
     */
    public function send($mobile, $template_params)
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '阿里短信验证码已关闭'];
        }

        $params = [
            'PhoneNumbers'  => $mobile,
            'SignName'      => $this->company,
            'TemplateCode'  => $this->template_code,
            'TemplateParam' => $template_params,
            'RegionId'      => 'cn-hangzhou',
            'Action'        => 'SendSms',
            'Version'       => '2017-05-25',
        ];

        if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }

        $apiParams = array_merge(array(
            "SignatureMethod"  => "HMAC-SHA1",
            "SignatureNonce"   => uniqid(mt_rand(0, 0xffff), true),
            "SignatureVersion" => "1.0",
            "AccessKeyId"      => $this->access_key_id,
            "Timestamp"        => gmdate("Y-m-d\TH:i:s\Z"),
            "Format"           => "JSON",
        ), $params);
        ksort($apiParams);

        $sortedQueryStringTmp = "";
        foreach ($apiParams as $key => $value) {
            $sortedQueryStringTmp .= "&" . $this->encode($key) . "=" . $this->encode($value);
        }

        $stringToSign = "GET&%2F&" . $this->encode(substr($sortedQueryStringTmp, 1));
        $sign         = base64_encode(hash_hmac("sha1", $stringToSign, $this->access_key_secret . "&", true));
        $signature    = $this->encode($sign);

        $url    = "https://dysmsapi.aliyuncs.com/?Signature={$signature}{$sortedQueryStringTmp}";
        $result = $this->fetchContent($url);

        if ($result['Code'] == 'OK') {
            return ['code' => 1, 'msg' => '发送成功'];
        } else {
            return ['code' => 0, 'msg' => $result['Message']];
        }
    }

    private function encode($str)
    {
        $res = urlencode($str);
        $res = preg_replace("/\+/", "%20", $res);
        $res = preg_replace("/\*/", "%2A", $res);
        $res = preg_replace("/%7E/", "~", $res);
        return $res;
    }

    private function fetchContent($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "x-sdk-client" => "php/2.0.0",
        ));

        if (substr($url, 0, 5) == 'https') {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        }

        $rtn = curl_exec($ch);

        if ($rtn === false) {
            trigger_error("[CURL_" . curl_errno($ch) . "]: " . curl_error($ch), E_USER_ERROR);
        }
        curl_close($ch);

        return json_decode($rtn,true);
    }
}
