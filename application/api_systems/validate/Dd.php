<?php
namespace app\api_systems\validate;

use think\Validate;

class Dd extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '数据字典ID不能为空'],
        ['name', 'require|max:255', '数据字典名称不能为空|数据字典名称最大限255字符'],
        ['table_name', 'require|alpha|max:20|checkValue:table_name', '数据字典表名不能为空|数据字典表名必须为英文|数据字典表名最大限20字符'],
    ];

    protected $scene = [
        'create' => ['name', 'table_name'],
        'update' => ['name', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'table_name':
                $dd = model('dds')->findOne(['table_name' => $value]);
                if ($dd) {
                    return '数据字典表名已存在';
                } else {
                    return true;
                }
                break;
            case 'id':
                $dd = model('dds')->getOne($value);
                if ($dd) {
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
