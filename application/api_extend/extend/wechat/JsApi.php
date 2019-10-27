<?php
use think\Db;

/**
 *  微信支付
 **/
class JsApi
{
    // 微信公众号
    public $appid = 'wxac9f1b2f4fc8ff5c';

    // 微信公众帐号secert
    public $appsecret = '655f090dc79348ed8a53794e10a697cf';

    public function getSignPackage()
    {
        $jsapiTicket = $this->getJsApiTicket();

        // 注意 URL 一定要动态获取，不能 hardcode.
        $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        $url      = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

        $timestamp = time();
        $nonceStr  = $this->createNonceStr();

        // 这里参数的顺序要按照 key 值 ASCII 码升序排序
        $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

        $signature = sha1($string);

        $signPackage = array(
            "appid"     => $this->appid,
            "nonceStr"  => $nonceStr,
            "timestamp" => $timestamp,
            "url"       => $url,
            "signature" => $signature,
            "rawString" => $string,
        );
        
        return $signPackage;
    }

    public function createNonceStr($length = 16)
    {
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $str   = "";
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }

        return $str;
    }

    public function getJsApiTicket()
    {
        $data = Db::name('wechat')->where(['id' => 1])->find();
        if ($data['last_ticket_time'] < time()) {
            $accessToken = $this->getAccessToken();
            // 如果是企业号用以下 URL 获取 ticket
            // $url = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token=$accessToken";
            $url    = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=" . $accessToken;
            $res    = json_decode(file_get_contents($url));
            $ticket = $res->ticket;
            if ($ticket) {
                $update_data = [
                    'last_ticket_time' => time() + 7000,
                    'jsapi_ticket'     => $ticket,
                ];
                Db::name('wechat')->where(['id' => 1])->update($update_data);
            }
        } else {
            $ticket = $data['jsapi_ticket'];
        }

        return $ticket;
    }

    public function getAccessToken()
    {
        $data = Db::name('wechat')->where(['id' => 1])->find();
        if ($data['last_token_time'] < time()) {
            $url          = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" . $this->appid . "&secret=" . $this->appsecret;
            $res          = json_decode(file_get_contents($url));
            $access_token = $res->access_token;
            if ($access_token) {
                $update_data = [
                    'last_token_time' => time() + 7000,
                    'access_token'    => $access_token,
                ];
                Db::name('wechat')->where(['id' => 1])->update($update_data);
            }
        } else {
            $access_token = $data['access_token'];
        }

        return $access_token;
    }
}
