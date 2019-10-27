<?php
/**
 *  美联短信
 **/
class MeiLian
{
    // 是否开启美联短信
    private $is_open;

    // 短信账号
    private $account;

    // 短信密码
    private $password;

    // 密钥
    private $apikey;

    // 短信抬头
    private $company;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data    = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $meilian = $data['sms']['meilian'];

        $this->is_open  = $meilian['is_open'];
        $this->account  = $meilian['account'];
        $this->password = $meilian['password'];
        $this->apikey   = $meilian['apikey'];
        $this->company  = $meilian['company'];
    }

    /**
     * 【发送短信】
     */
    public function send($mobile, $content)
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '美联短信验证码已关闭'];
        }

        $url  = "http://m.5c.com.cn/api/send/index.php?"; //如连接超时，可能服务器不支持域名解析，请将【m.5c.com.cn】修改为IP：【115.28.23.78】
        $data = [
            'username'     => $this->account,
            'password_md5' => md5($this->password),
            'apikey'       => $this->apikey,
            'mobile'       => $mobile,
            'content'      => urldecode('【' . $this->company . '】' . $content),
            'encode'       => 'UTF-8',
        ];
        $response = $this->curlSMS($url, $data);
        $result   = explode(':', $response);
        if ($result[0] == 'success') {
            return ['code' => 1, 'msg' => '发送成功'];
        } else {
            return ['code' => 0, 'msg' => $result[1]];
        }
    }

    public function curlSMS($url, $post_fields = array())
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_HEADER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_fields);
        $data = curl_exec($ch);
        curl_close($ch);
        $res = explode("\r\n\r\n", $data);
        return $res[2];
    }
}
