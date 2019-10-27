<?php
namespace app\api_users\validate;

use think\Validate;

class Mobile extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员ID不能为空'],
        ['mobile', 'require|mobile|checkValue:mobile', '手机号不能为空|手机号格式错误'],
    ];

    protected $regex = [
        'mobile' => '/^1[0-9]{1}\d{9}$/',
    ];

    protected $scene = [
        'admin_mod' => ['id', 'mobile'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'mobile':
                $user = model('users')->findOne(['mobile' => $value]);
                if ($user) {
                    if ($user['id'] == $id) {
                        return '新手机号不能与旧手机号相同';
                    } else {
                        return '当前手机号已被使用';
                    }
                } else {
                    return true;
                }
                break;
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
