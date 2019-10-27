<?php
namespace app\api_systems\validate;

use think\Validate;

class Role extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '规则ID不能为空'],
        ['name', 'require|max:50', '角色名称不能为空|角色名称最大限50字符'],
        ['intro', 'max:255', '角色简介最大限255字符'],
        ['type', 'require|in:user,admin', '角色类别不能为空|角色类别值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'intro', 'type'],
        'update' => ['name', 'intro', 'type', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $role = model('roles')->getOne($value);
                if ($role) {
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
