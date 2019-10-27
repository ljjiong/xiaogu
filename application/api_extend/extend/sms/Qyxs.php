<?php
/**
 *  企业信使短信
 **/
class Qyxs
{
    // 是否开启企业信使短信
    private $is_open;

    // 短信账号
    private $account;

    // 短信密码
    private $password;

    // 短信抬头
    private $company;

    // 短信会员ID
    private $user_id;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $qyxs = $data['sms']['qyxs'];

        $this->is_open  = $qyxs['is_open'];
        $this->account  = $qyxs['account'];
        $this->password = $qyxs['password'];
        $this->company  = $qyxs['company'];
        $this->company  = $qyxs['user_id'];
    }

    /**
     * 【发送短信】
     */
    public function send($mobile, $content)
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '企业信使短信验证码已关闭'];
        }

        $params = [
            'userid'   => $this->user_id,
            'account'  => $this->account,
            'password' => $this->password,
            'content'  => '【' . $this->company . '】' . $content,
            'mobile'   => $mobile,
        ];
        $str = '';
        foreach ($params as $k => $v) {
            $str .= $k . '=' . urlencode($v) . '&';
        }
        $post_data = substr($str, 0, -1);
        $url       = 'http://42.121.98.132:8888/sms.aspx?action=send';

        $response = https_request($url, $post_data);
        $result   = xml_to_arr($response);
        if ($result['returnstatus'] == 'Success') {
            return ['code' => 1, 'msg' => '发送成功'];
        } else {
            return ['code' => 0, 'msg' => $result['message']];
        }
    }
}
