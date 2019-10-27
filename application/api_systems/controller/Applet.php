<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;

class Applet extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【user】生成分享二维码
     */
    public function share_qrcode()
    {
        $path = input('path');
        if (!$path) {
            self::createResponse(0, '参数缺失');
        }

        $img_name = md5($path);
        $data     = [
            'path'       => $path,
            'width'      => 20,
            'auto_color' => false,
        ];

        $access_token = $this->get_access_token();
        $url          = 'https://api.weixin.qq.com/wxa/getwxacode?access_token=' . $access_token;

        $result = https_request($url, json_encode($data));
        file_put_contents('./public/static/applet/' . $img_name . '.jpeg', $result);

        $this->data['data'] = get_host() . '/public/static/applet/' . $img_name . '.jpeg';

        return $this->data;
    }

    /**
     * 【user】生成access_token
     */
    private function get_access_token()
    {
        $config_data = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $wechat      = $config_data['third_login']['wechat'];

        $applet_appid  = $wechat['applet_appid'];
        $applet_secret = $wechat['applet_appsecret'];

        $res          = https_request_get('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $applet_appid . '&secret=' . $applet_secret);
        $result       = explode("\"", $res);
        $access_token = $result[3];

        return $access_token;
    }
}
