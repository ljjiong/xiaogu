<?php
namespace app\api_users\validate;

use think\Validate;

class User extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', 'ID不能为空'],
        ['mobile', 'mobile|checkValue:mobile', '手机号格式错误'],
        ['password', 'min:6|max:15|require', '密码最少6位|密码最大15位|密码不能为空'],
        ['user_name', 'max:50', '会员名最大10位'],
        ['nick_name', 'max:50', '会员昵称最大10位'],
        ['telephone', 'telephone', '联系电话格式错误'],
        ['qq', 'max:20', 'qq最大为20位'],
        ['wechat', 'max:20', '微信号最大为20位'],
        ['email', 'email', '邮箱格式错误'],
        ['gender', 'in:0,1,2', '会员性别值非法'],
        ['status', 'in:1,9', '会员状态值非法'],
        ['role_ids', 'array|checkValue:role_ids', '角色IDs格式错误'],
    ];

    protected $regex = [
        'mobile'    => '/^1[0-9]{1}\d{9}$/',
        'telephone' => '/^([0-9]{3,4})?[0-9]{7,8}$/',
    ];

    protected $scene = [
        'create' => ['mobile', 'user_name', 'nick_name', 'telephone', 'qq', 'wechat', 'email', 'gender', 'status', 'role_ids', 'password'],
        'update' => ['mobile', 'user_name', 'nick_name', 'telephone', 'qq', 'wechat', 'email', 'gender', 'status', 'role_ids', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'mobile':
                if ($id) {
                    $user    = model('users')->findOne(['mobile' => $value, 'id' => ['neq', $id]]);
                    $account = model('user_accounts')->findOne(['guid' => $value, 'user_id' => ['neq', $id]]);
                    if ($user || $account) {
                        return '手机号已被使用';
                    } else {
                        return true;
                    }
                } else {
                    $user    = model('users')->findOne(['mobile' => $value]);
                    $account = model('user_accounts')->findOne(['guid' => $value]);
                    if ($user || $account) {
                        return '手机号已被使用';
                    } else {
                        return true;
                    }
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
            case 'id':
                $user = model('users')->getOne($value);
                if ($user) {
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
