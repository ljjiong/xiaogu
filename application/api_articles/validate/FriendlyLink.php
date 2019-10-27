<?php
namespace app\api_articles\validate;

use think\Validate;

class FriendlyLink extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '友情链接ID不能为空'],
        ['type_id', 'require|checkValue:type_id', '友情链接类别不能为空'],
        ['name', 'require|max:255', '友情链接名称不能为空|友情链接名称最大限255字符'],
        ['alt', 'max:255', '友情链接alt属性限255字符'],
        ['position', 'max:50', '友情链接位置限50字符'],
        ['is_open_model', 'in:0,1', '是否开启模型状态值非法'],
        ['status', 'in:1,2', '友情链接状态值非法'],
    ];

    protected $scene = [
        'create' => ['type_id', 'name', 'alt', 'position', 'is_open_model', 'status'],
        'update' => ['type_id', 'name', 'alt', 'position', 'is_open_model', 'status', 'id'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'type_id':
                // 友情链接分类树根ID为13
                $is_has = is_cate_child(13, $value);
                if (!$is_has) {
                    return '友情链接类别不存在';
                }
                break;
            case 'id':
                $friendly_link = model('friendly_links')->getOne($value);
                if (!$friendly_link) {
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
