<?php
namespace app\api_articles\validate;

use think\Validate;

class Annoncement extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '公告ID不能为空'],
        ['type_id', 'require|checkValue:type_id', '公告类别不能为空'],
        ['title', 'require|max:255', '公告标题不能为空|公告标题最大限255字符'],
        ['author', 'max:50', '作者限50字符'],
        ['status', 'in:1,2', '公告状态值非法'],
        ['imgs', 'array', '公告图片集数据类型值非法'],
    ];

    protected $scene = [
        'create' => ['type_id', 'title', 'author', 'status', 'imgs'],
        'update' => ['type_id', 'title', 'author', 'status', 'imgs', 'id'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'type_id':
                // 公告分类树根ID为5
                $is_has = is_cate_child(5, $value);
                if (!$is_has) {
                    return '公告类别不存在';
                }
                break;
            case 'id':
                $annoncement = model('annoncements')->getOne($value);
                if (!$annoncement) {
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
