<?php
namespace app\api_articles\validate;

use think\Validate;

class Advertisement extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '广告ID不能为空'],
        ['type_id', 'require|checkValue:type_id', '广告类别不能为空'],
        ['name', 'require|max:255', '广告名称不能为空|广告名称最大限255字符'],
        ['alt', 'max:255', '广告alt属性限255字符'],
        ['position', 'max:50', '广告位置限50字符'],
        ['is_open_model', 'in:0,1', '是否开启模型状态值非法'],
        ['status', 'in:1,2', '广告状态值非法'],
    ];

    protected $scene = [
        'create' => ['type_id', 'name', 'alt', 'position', 'is_open_model', 'status'],
        'update' => ['type_id', 'name', 'alt', 'position', 'is_open_model', 'status', 'id'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'type_id':
                // 广告分类树根ID为1
                $is_has = is_cate_child(1, $value);
                if (!$is_has) {
                    return '广告类别不存在';
                }
                break;
            case 'id':
                $advertisement = model('advertisements')->getOne($value);
                if (!$advertisement) {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }

        return true;
    }
}
