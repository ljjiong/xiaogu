<?php
namespace app\api_articles\validate;

use think\Validate;

class Register extends Validate
{
    protected $rule = [
        ['mobile', 'require|mobile|checkValue:mobile', '手机号不能为空|手机号格式错误'],
        // ['code', 'require|checkValue:code', '验证码不能为空'],
        ['password', 'require|min:6|max:15', '密码不能为空|密码最少6位|密码最大15位'],
        ['qq_openid', 'checkValue:qq_openid'],
        ['wechat_openid', 'checkValue:wechat_openid'],
        ['role_ids', 'array|checkValue:role_ids', '角色IDs格式错误'],
        ['parent_mobile', 'checkValue:parent_mobile'],
    ];

    protected $regex = [
        'mobile' => '/^1[0-9]{1}\d{9}$/',
    ];

    protected function checkValue($value, $rule)
    {
        $mobile = input('mobile');

        switch ($rule) {
            case 'mobile':
                $user    = model('users')->findOne(['mobile' => $value]);
                $account = model('user_accounts')->findOne(['guid' => $value]);
                if ($user || $account) {
                    return "手机号已被注册";
                } else {
                    return true;
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
            case 'qq_openid':
                $account = model('user_accounts')->findOne(['qq_openid' => $value]);
                if ($account) {
                    return 'qq_openid已绑定会员';
                } else {
                    return true;
                }
                break;
            case 'wechat_openid':
                $account = model('user_accounts')->findOne(['wechat_openid' => $value]);
                if ($account) {
                    return 'wechat_openid已绑定会员';
                } else {
                    return true;
                }
                break;
            case 'role_ids':
                foreach ($value as $role_id) {
                    $role = model('roles')->findOne(['id' => $role_id, 'type' => 'user']);
                    if (!$role) {
                        return '角色' . $role_id . '不存在';
                        break;
                    }
                }
                return true;
                break;
            case 'parent_mobile':
                $user = model('users')->findOne(['mobile' => $value]);
                if ($user) {
                    if ($user['is_distributor'] == 1 || $user['is_bonus'] == 1) {
                        return true;
                    } else {
                        return '推介人不可用';
                    }
                } else {
                    return '推荐人手机号不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
