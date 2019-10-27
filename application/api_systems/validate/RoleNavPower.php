<?php
namespace app\api_systems\validate;

use think\Validate;

class RoleNavPower extends Validate
{
    protected $rule = [
        ['role_id', 'require|checkValue:role_id', '角色ID不能为空'],
        ['nav_ids', 'require|array|checkValue:nav_ids', '菜单IDs不能为空|菜单IDs数据格式错误'],
    ];

    protected $scene = [
        'create' => ['role_id', 'nav_ids'],
        'update' => ['role_id', 'nav_ids'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'role_id':
                $role = model('roles')->getOne($value);
                if ($role) {
                    if ($this->currentScene == 'create') {
                        $role_nav_power = model('role_nav_powers')->getOne($value);
                        if ($role_nav_power) {
                            return '角色菜单权限已存在';
                        } else {
                            return true;
                        }
                    } elseif ($this->currentScene == 'update') {
                        $role_nav_power = model('role_nav_powers')->getOne($value);
                        if ($role_nav_power) {
                            return true;
                        } else {
                            return '角色菜单权限暂不存在';
                        }
                    } else {
                        return true;
                    }
                } else {
                    return '角色不存在';
                }
                break;
            case 'nav_ids':
                foreach ($value as $nav_id) {
                    $nav = model('navs')->getOne($nav_id);
                    if (!$nav) {
                        return 'ID为' . $nav_id . '的菜单不存在';
                        break;
                    }
                }
                return true;
                break;
            // case 'id':
            //     $dd = model('role_nav_powers')->getOne($value);
            //     if ($dd) {
            //         return true;
            //     } else {
            //         return '数据不存在';
            //     }
            //     break;
            default:
                # code...
                break;
        }
    }
}
