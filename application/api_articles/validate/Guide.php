<?php
namespace app\api_articles\validate;

use think\Validate;

class Guide extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '手册ID不能为空'],
        ['type_id', 'require|checkValue:type_id', '手册类别不能为空'],
        ['title', 'require|max:255', '手册标题不能为空|手册标题最大限255字符'],
        ['author', 'max:50', '作者限50字符'],
        ['status', 'in:1,2', '手册状态值非法'],
        ['imgs', 'array', '手册图片集数据类型值非法'],
    ];

    protected $scene = [
        'create' => ['type_id', 'title', 'author', 'status', 'imgs'],
        'update' => ['type_id', 'title', 'author', 'status', 'imgs', 'id'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'type_id':
                // 规则类别分类树根ID为20
                $is_has = is_cate_child(20, $value);
                if (!$is_has) {
                    return '手册类别不存在';
                }
                break;
            case 'id':
                $guide = model('guides')->getOne($value);
                if (!$guide) {
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
