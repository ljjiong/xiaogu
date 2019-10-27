<?php
namespace app\api_users\validate;

use think\Validate;

class UserAuth extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员认证ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['name', 'require|max:20', '会员姓名不能为空|会员姓名限20字符'],
        ['id_card', 'require|id_card', '身份证号不能为空|身份证号格式错误'],
        ['status', 'require|in:1,2,3', '认证状态值不能为空|认证状态值非法'],
        ['imgs', 'array', '图片集数据类型值非法'],
    ];

    protected $regex = [
        'id_card'    => '/[0-9]{17}([0-9]|X)/',
    ];


    protected $scene = [
        'create' => ['user_id', 'name', 'id_card', 'status', 'imgs'],
        'update' => ['user_id', 'name', 'id_card', 'status', 'imgs', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    $user_auth = model('user_auths')->findOne(['user_id' => $value]);
                    if ($this->currentScene == 'create') {
                        if ($user_auth) {
                            return '您已提交认证信息';
                        }
                    } elseif ($this->currentScene == 'update') {
                        if (!$user_auth) {
                            return '您暂未提交认证信息';
                        }
                    }
                    return true;
                } else {
                    return '会员不存在';
                }
                break;
            case 'id':
                $user_auth = model('user_auths')->getOne($value);
                if ($user_auth) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
