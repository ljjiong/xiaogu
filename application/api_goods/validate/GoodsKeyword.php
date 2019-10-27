<?php
namespace app\api_goods\validate;

use think\Validate;

class GoodsKeyword extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '商品搜索关键词ID不能为空'],
        ['keyword', 'require|max:20|checkValue:keyword', '关键词不能为空|关键词最大限20字符'],
        ['search_num', 'require|number', '关键词搜索次数不能为空|关键词搜索次数值非法'],
    ];

    protected $scene = [
        'create' => ['keyword', 'search_num'],
        'update' => ['keyword', 'search_num', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
             case 'keyword':
                if ($this->currentScene == 'create') {
                    $goods_keyword = model('goods_keywords')->findOne(['keyword' => $value]);
                } elseif ($this->currentScene == 'update') {
                    $goods_keyword = model('goods_keywords')->findOne(['keyword' => $value, 'id' => ['neq', $id]]);
                }

                if ($goods_keyword) {
                    return '关键词已存在';
                } else {
                    return true;
                }
                break;
            case 'id':
                $goods_keyword = model('goods_keywords')->getOne($value);
                if ($goods_keyword) {
                    return true;
                } else {
                    return '关键词数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
