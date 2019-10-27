<?php
namespace app\api_users\validate;

use think\Validate;

class ChangeMobile extends Validate
{
    protected $rule = [
        ['old_mobile', 'require|checkValue:old_mobile', '旧手机号不能为空'],
        ['new_mobile', 'require|new_mobile|different:old_mobile|checkValue:new_mobile', '新手机号不能为空|新手机号格式错误|新手机号不能与旧手机号相同'],
        ['new_code', 'require|checkValue:new_code', '新手机号验证码不能为空'],
    ];

    protected $regex = [
        'new_mobile' => '/^1[0-9]{1}\d{9}$/',
    ];

    protected $scene = [
        'change' => ['old_mobile', 'new_mobile', 'new_code'],
    ];

    protected function checkValue($value, $rule)
    {
        $old_mobile = input('old_mobile');
        $new_mobile = input('new_mobile');

        switch ($rule) {
            case 'old_mobile':
                $user_account = model('user_accounts')->findOne(['guid' => $value]);
                $user         = model('users')->findOne(['mobile' => $value]);
                if ($user_account && $user) {
                    return true;
                } else {
                    return '旧手机号暂未注册或未绑定会员';
                }
                break;
            case 'new_mobile':
                $user_account = model('user_accounts')->findOne(['guid' => $value]);
                $user         = model('users')->findOne(['mobile' => $value]);
                if ($user_account || $user) {
                    return '新手机号已使用';
                } else {
                    return true;
                }
                break;
            case 'new_code':
                $check = check_mobile_code($new_mobile, $value);
                if ($check) {
                    return true;
                } else {
                    return '新手机号验证码错误';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
