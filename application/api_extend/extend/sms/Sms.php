<?php
/**
 *  发送短信类
 **/

use think\Db;

import('app.api_extend.extend.sms.BaMi');
import('app.api_extend.extend.sms.MeiLian');
import('app.api_extend.extend.sms.Ali');

class Sms
{
    // 是否开启短信验证码校验
    private $is_open_check;

    // 短信验证码使用平台
    private $mobile_code_type;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data  = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $basic = $data['sms']['basic'];

        $this->is_open_check    = $basic['is_open_check'];
        $this->mobile_code_type = $basic['mobile_code_type'];
    }

    /**
     * 【发送短信验证码】
     */
    public function sendCode($mobile)
    {
        $code    = rand(100000, 999999);
        $content = '您的验证码是：' . $code . '，请不要把验证码泄露给其他人。如非本人操作，可不用理会！';

        switch ($this->mobile_code_type) {
            case 'bami':
                # 八米短信
                $BaMi   = new \BaMi();
                $result = $BaMi->send($mobile, $content);
                break;
            case 'meilian':
                # 美联短信
                $MeiLian = new \MeiLian();
                $result  = $MeiLian->send($mobile, $content);
                break;
            case 'ali':
                # 阿里大鱼短信
                $Ali             = new \Ali();
                $template_params = [
                    'code' => $code,
                ];
                $result = $Ali->send($mobile, $template_params);
                break;
            default:
                return ['code' => 0, 'msg' => '短信类别值非法'];
                break;
        }

        if ($result['code']) {
            $data = [
                'mobile'    => $mobile,
                'msg'       => $content,
                'code'      => $code,
                'status'    => 1,
                'send_time' => date('Y-m-d H:i:s'),
            ];
            Db::name('mobile_msgs')->insert($data);

            return ['code' => 1, 'msg' => '发送成功'];
        } else {
            $data = [
                'mobile'    => $mobile,
                'msg'       => $content,
                'code'      => $code,
                'status'    => 0,
                'send_time' => date('Y-m-d H:i:s'),
            ];
            Db::name('mobile_msgs')->insert($data);

            return ['code' => 0, 'msg' => $result['msg']];
        }
    }

    /**
     * 【校验短信验证码】
     */
    public function checkCode($mobile, $code)
    {
        if ($this->is_open_check == '1') {
            $result = Db::name('mobile_msgs')->where(['mobile' => $mobile])->order('id DESC')->find();
            if ($result) {
                //验证码10分钟内有效
                if ($result['code'] == $code && (time() - strtotime($result['send_time'])) <= 600) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } else {
            return true;
        }
    }
}
