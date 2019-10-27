<?php
namespace app\api_admins\validate;

use think\Validate;

class Register extends Validate
{
    protected $rule = [
        ['guid', 'require|checkValue:guid', '账户名不能为空'],
        ['password', 'require|min:6|max:15', '密码不能为空|密码最少6位|密码最大15位'],
        ['role_ids', 'array|checkValue:role_ids', '角色IDs格式错误'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'guid':
                $admin_account = model('admin_accounts')->findOne(['guid' => $value]);
                if ($admin_account) {
                    return '账户名已被使用';
                } else {
                    return true;
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
            default:
                # code...
                break;
        }
    }
}
