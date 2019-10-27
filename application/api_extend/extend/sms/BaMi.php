<?php
/**
 *  八米短信
 **/
class BaMi
{
    // 是否开启八米短信
    private $is_open;

    // 短信账号
    private $account;

    // 短信密码
    private $password;

    // 短信抬头
    private $company;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $bami = $data['sms']['bami'];

        $this->is_open  = $bami['is_open'];
        $this->account  = $bami['account'];
        $this->password = $bami['password'];
        $this->company  = $bami['company'];
    }

    /**
     * 【发送短信】
     */
    public function send($mobile, $content)
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '八米短信验证码已关闭'];
        }

        $response = file_get_contents('http://www.itcc8.com:8890/mtPort/mt2?phonelist=' . $mobile . '&content=' . urldecode('【' . $this->company . '】' . $content) . '&pwd=' . $this->password . '&uid=' . $this->account);

        $result = xml_to_arr($response);
        if ($result['CODE'] == 0) {
            return ['code' => 1, 'msg' => '发送成功'];
        } else {
            return ['code' => 0, 'msg' => $result['DESCRIPTION']];
        }
    }
}
