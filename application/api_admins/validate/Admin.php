<?php
namespace app\api_admins\validate;

use think\Validate;

class Admin extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', 'ID不能为空'],
        ['guid', 'require|checkValue:guid', '账户名不能为空'],
        ['password', 'min:6|max:15|require', '密码最少6位|密码最大15位|密码不能为空'],
        ['mobile', 'mobile|checkValue:mobile', '手机号格式错误'],
        ['name', 'max:50', '真实姓名最大10位'],
        ['user_name', 'max:50', '会员名最大10位'],
        ['nick_name', 'max:50', '会员昵称最大10位'],
        ['telephone', 'telephone', '联系电话格式错误'],
        ['qq', 'max:20', 'qq最大为20位'],
        ['wechat', 'max:20', '微信号最大为20位'],
        ['email', 'email', '邮箱格式错误'],
        ['status', 'in:1,9', '管理员状态值非法'],
        ['role_ids', 'array|checkValue:role_ids', '角色IDs格式错误'],
    ];

    protected $regex = [
        'mobile'    => '/^1[0-9]{1}\d{9}$/',
        'telephone' => '/^([0-9]{3,4})?[0-9]{7,8}$/',
    ];

    protected $scene = [
        'create'      => ['guid', 'password', 'mobile', 'name', 'user_name', 'nick_name', 'telephone', 'qq', 'wechat', 'email', 'status', 'role_ids'],
        'update'      => ['guid' => 'checkValue:guid', 'password' => 'min:6|max:15', 'mobile', 'name', 'user_name', 'nick_name', 'telephone', 'qq', 'wechat', 'email', 'status', 'role_ids', 'id'],
        'update_self' => ['guid' => 'checkValue:guid', 'password' => 'min:6|max:15', 'mobile', 'name', 'user_name', 'nick_name', 'telephone', 'qq', 'wechat', 'email', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'guid':
                if ($id) {
                    $admin_account = model('admin_accounts')->findOne(['guid' => $value, 'admin_id' => ['neq', $id]]);
                    if ($admin_account) {
                        return '账户名已被使用';
                    } else {
                        return true;
                    }
                } else {
                    $admin_account = model('admin_accounts')->findOne(['guid' => $value]);
                    if ($admin_account) {
                        return '账户名已被使用';
                    } else {
                        return true;
                    }
                }
                break;
            case 'mobile':
                if ($id) {
                    $admin = model('admins')->findOne(['mobile' => $value, 'id' => ['neq', $id]]);
                    if ($admin) {
                        return '手机号已被使用';
                    } else {
                        return true;
                    }
                } else {
                    $admin = model('admins')->findOne(['mobile' => $value]);
                    if ($admin) {
                        return '手机号已被使用';
                    } else {
                        return true;
                    }
                }
                break;
            case 'role_ids':
                foreach ($value as $role_id) {
                    $role = model('roles')->findOne(['id' => $role_id, 'type' => 'admin']);
                    if (!$role) {
                        return '角色' . $role_id . '不存在';
                        break;
                    }
                }
                return true;
                break;
            case 'id':
                $admin = model('admins')->getOne($value);
                if ($admin) {
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
