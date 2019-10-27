<?php
namespace app\api_users\validate;

use think\Validate;

class Password extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员ID不能为空'],
        ['mobile', 'require|checkValue:mobile', '手机号不能为空'],
        // ['code', 'require|checkValue:code', '验证码不能为空'],
        ['old_password', 'require', '旧密码不能为空'],
        ['password', 'require|min:6|max:15', '密码不能为空|密码最少6位|密码最大15位'],
    ];

    protected $scene = [
        'mod'       => ['mobile', 'old_password', 'password'],
        'reset'     => ['mobile', 'code', 'password'],
        'admin_mod' => ['id', 'password'],
    ];

    protected function checkValue($value, $rule)
    {
        $mobile       = input('mobile');
        $old_password = input('old_password');

        switch ($rule) {
            case 'mobile':
                $user_account = model('user_accounts')->findOne(['guid' => $mobile]);
                if ($user_account) {
                    if ($this->currentScene == 'mod') {
                        if ($user_account['password'] === wancll_md5($old_password)) {
                            return true;
                        } else {
                            return '旧密码错误';
                        }
                    } else {
                        return true;
                    }
                } else {
                    return '当前手机号暂未注册';
                }
                break;
            // case 'code':
            //     $check = check_mobile_code($mobile, $value);
            //     if ($check) {
            //         return true;
            //     } else {
            //         return '验证码错误';
            //     }
            //     break;
            case 'id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员ID不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
