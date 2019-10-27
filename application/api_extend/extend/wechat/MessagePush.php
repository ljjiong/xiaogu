<?php

/**
 *  微信消息推送
 **/

class MessagePush
{
    // 请配置参数
    private $appId     = "";
    private $appSecret = "";

    private $openId;
    private $access_token;

    public function __construct($openId)
    {
        $data       = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $wechat_pay = $data['pay']['wechat'];

        $this->appId     = $wechat_pay['appid'];
        $this->appSecret = $wechat_pay['appsecret'];

        $this->openId       = $openId;
        $this->access_token = $this->get_access_token();
    }

    /**
     * 获取微信access_token
     * **/
    private function get_access_token()
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $this->appId . '&secret=' . $this->appSecret;
        $ch  = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        $data = curl_exec($ch);
        curl_close($ch);
        $data = json_decode($data, true);

        return $data['access_token'];
    }

    /**
     * 推送消息
     * */
    public function send_msg($formwork)
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=' . $this->access_token;
        $ch  = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $formwork);
        $data = curl_exec($ch);
        curl_close($ch);

        return $data;
    }

    /**
     *  推送购买信息
     *
     *  示例：$message = ['url'=>'', 'keyword1' => '商品1','keyword2' => '商品2','keyword3' => '商品3','keyword4' => '商品4','remark' => '备注信息'];
     *
     **/
    public function push_buy_msg($message)
    {
        $formwork = [
            'touser'      => $this->openId,
            'template_id' => 'JmI4Udwb2gue4Kl9Anp1w4tI6xZNp3bioTY7ZNNHeO0',
            'url'         => $message['url'],
            'data'        => [
                'first'    => [
                    'value' => '您的订单已支付成功!',
                    'color' => '#000',
                ],
                'keyword1' => [
                    'value' => $message['keyword1'],
                    'color' => '#000',
                ],
                'keyword2' => [
                    'value' => $message['keyword2'],
                    'color' => '#000',
                ],
                'keyword3' => [
                    'value' => $message['keyword3'],
                    'color' => '#000',
                ],
                'keyword4' => [
                    'value' => $message['keyword4'],
                    'color' => '#000',
                ],
                'remark'   => [
                    'value' => $message['remark'],
                    'color' => '#0F0',
                ],
            ],
        ];

        $formwork = json_encode($formwork, true);

        return $this->send_msg($formwork);
    }

    /**
     *  推送发货信息
     *
     *  示例：$message = ['url'=>'', 'keyword1' => '商品1','keyword2' => '商品2','keyword3' => '商品3','keyword4' => '商品4','remark' => '备注信息'];
     *
     **/
    public function push_deliver_msg($message)
    {
        $formwork = [
            'touser'      => $this->openId,
            'template_id' => 'JmI4Udwb2gue4Kl9Anp1w4tI6xZNp3bioTY7ZNNHeO0',
            'url'         => $message['url'],
            'data'        => [
                'first'    => [
                    'value' => '您的订单已发货!',
                    'color' => '#000',
                ],
                'keyword1' => [
                    'value' => $message['keyword1'],
                    'color' => '#000',
                ],
                'keyword2' => [
                    'value' => $message['keyword2'],
                    'color' => '#000',
                ],
                'keyword3' => [
                    'value' => $message['keyword3'],
                    'color' => '#000',
                ],
                'keyword4' => [
                    'value' => $message['keyword4'],
                    'color' => '#000',
                ],
                'remark'   => [
                    'value' => $message['remark'],
                    'color' => '#0F0',
                ],
            ],
        ];

        $formwork = json_encode($formwork, true);

        return $this->send_msg($formwork);
    }

    /**
     *  推送分佣信息
     *
     *  示例：$message = ['url'=>'', 'keyword1' => '商品1','keyword2' => '商品2','keyword3' => '商品3','keyword4' => '商品4','remark' => '备注信息'];
     *
     **/
    public function push_commission_msg($message)
    {
        $formwork = [
            'touser'      => $this->openId,
            'template_id' => 'JmI4Udwb2gue4Kl9Anp1w4tI6xZNp3bioTY7ZNNHeO0',
            'url'         => $message['url'],
            'data'        => [
                'first'    => [
                    'value' => '您的订单佣金已到账!',
                    'color' => '#000',
                ],
                'keyword1' => [
                    'value' => $message['keyword1'],
                    'color' => '#000',
                ],
                'keyword2' => [
                    'value' => $message['keyword2'],
                    'color' => '#000',
                ],
                'keyword3' => [
                    'value' => $message['keyword3'],
                    'color' => '#000',
                ],
                'keyword4' => [
                    'value' => $message['keyword4'],
                    'color' => '#000',
                ],
                'remark'   => [
                    'value' => $message['remark'],
                    'color' => '#0F0',
                ],
            ],
        ];

        $formwork = json_encode($formwork, true);

        return $this->send_msg($formwork);
    }

}
