<?php
namespace app\api_articles\validate;

use think\Validate;

class Article extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '文章ID不能为空'],
        ['type_id', 'require|checkValue:type_id', '文章类别不能为空'],
        ['title', 'require|max:255', '文章标题不能为空|文章标题最大限255字符'],
        ['click_num', 'integer|egt:0', '必须为整数|不能小于0'],
        ['author', 'max:50', '作者限50字符'],
        ['status', 'in:1,2', '文章状态值非法'],
        ['imgs', 'array', '文章图片集数据类型值非法'],
    ];

    protected $scene = [
        'create' => ['type_id', 'title', 'author', 'status', 'imgs','click_num'],
        'update' => ['type_id', 'title', 'author', 'status', 'imgs', 'id','click_num'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'type_id':
                // 文章分类树根ID为24
                $is_has = is_cate_child(40, $value);
                if (!$is_has && $value != 59) {
                    return '文章分类不存在';
                }
                break;
            case 'id':
                $article = model('articles')->getOne($value);
                if (!$article) {
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
