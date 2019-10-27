<?php
namespace app\api_users\validate;

use think\Validate;

class PayPassword extends Validate
{
    protected $rule = [
        ['mobile', 'require|checkValue:mobile', '手机号不能为空'],
        ['code', 'require|checkValue:code', '验证码不能为空'],
        ['pay_password', 'require|min:6|max:15|confirm', '支付密码不能为空|支付密码最少6位|支付密码最大15位|支付密码与确认支付密码不一致'],
    ];

    protected $scene = [
        'reset' => ['mobile', 'code', 'pay_password'],
    ];

    protected function checkValue($value, $rule)
    {
        $mobile = input('mobile');

        switch ($rule) {
            case 'mobile':
                $user_account = model('user_accounts')->findOne(['guid' => $mobile]);
                if ($user_account) {
                    return true;
                } else {
                    return '当前手机号暂未注册';
                }
                break;
            case 'code':
                $check = check_mobile_code($mobile, $value);
                if ($check) {
                    return true;
                } else {
                    return '验证码错误';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
