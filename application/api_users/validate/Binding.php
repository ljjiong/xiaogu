<?php
namespace app\api_users\validate;

use think\Validate;

class Binding extends Validate
{
    protected $rule = [
        ['mobile', 'require|checkValue:mobile', '手机号不能为空'],
        ['code', 'require|checkValue:code', '验证码不能为空'],
        ['openid_type', 'require|in:qq,wechat', 'openid类型不能为空|openid类型值非法'],
        ['openid', 'require|checkValue:openid', 'openid不能为空'],
    ];

    protected $scene = [
        'in_no_login' => ['mobile', 'code', 'openid_type', 'openid'],
        'in_login'    => ['openid_type', 'openid'],
        'no_binding'  => ['openid_type', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $mobile      = input('mobile');
        $openid_type = input('openid_type');

        switch ($rule) {
            case 'mobile':
                $user_account = model('user_accounts')->findOne(['guid' => $value]);
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
            case 'openid':
                if ($openid_type == 'qq') {
                    $user_account = model('user_accounts')->findOne(['qq_openid' => $value]);
                } elseif ($openid_type == 'wechat') {
                    $user_account = model('user_accounts')->findOne(['wechat_openid' => $value]);
                } else {
                    return 'openid类型错误';
                }

                if ($user_account) {
                    return '该微信账号已被绑定';
                } else {
                    return true;
                }
                break;
            case 'id':
                $user_account = model('user_accounts')->getOne($value);
                if (($openid_type == 'qq' && $user_account['qq_openid'] == '') || ($openid_type == 'wechat' && $user_account['wechat_openid'] == '')) {
                    return '当前账户暂未绑定授权账号';
                } else {
                    return true;
                }
                break;
            default:
                # code...
                break;
        }
    }
}
