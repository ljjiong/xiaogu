<?php
namespace app\api_systems\validate;

use think\Validate;

class Nav extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '菜单ID不能为空'],
        ['name', 'require|max:255', '菜单名称不能为空|菜单名称最大限255字符'],
        ['icon', 'max:255', '菜单图标最大限255字符'],
        ['module', 'max:255', '模块名最大限255字符'],
        ['class', 'max:255', '类名最大限255字符'],
        ['method', 'max:255', '方法名最大限255字符'],
        ['pid', 'require|checkValue:pid', '父级菜单不能为空'],
        ['is_top', 'require|in:0,1', '是否置顶不能为空|是否置顶值非法'],
        ['status', 'require|in:1,2', '状态不能为空|状态值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'icon', 'module', 'module', 'class', 'method', 'pid', 'is_top', 'status'],
        'update' => ['name', 'icon', 'module', 'module', 'class', 'method', 'pid', 'is_top', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'pid':
                if ($value == 0) {
                    return true;
                } else {
                    $nav = model('navs')->getOne($value);
                    if ($nav) {
                        if ($this->currentScene == 'create') {
                            return true;
                        } elseif ($this->currentScene == 'update') {
                            if ($value == $id) {
                                return '父级菜单不能为自身';
                            } else {
                                return true;
                            }
                        }
                    } else {
                        return '数据不存在';
                    }
                }
                break;
            case 'id':
                $nav = model('navs')->getOne($value);
                if ($nav) {
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
