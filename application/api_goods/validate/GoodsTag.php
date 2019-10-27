<?php
namespace app\api_goods\validate;

use think\Validate;

class GoodsTag extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '商品标签ID不能为空'],
        ['name', 'require|max:30|checkValue:name', '商品标签名称不能为空|商品标签名称最大限30字符'],
        ['sort', 'number|>=:0', '商品标签排序值非法|商品标签排序值不能小于0'],
    ];

    protected $scene = [
        'create' => ['name', 'sort'],
        'update' => ['name', 'sort', 'id'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'name':
                if ($this->currentScene == 'create') {
                    $goods_tag = model('goods_tags')->findOne(['name' => $value]);
                    if ($goods_tag) {
                        return '商品标签已存在';
                    }
                } elseif ($this->currentScene == 'update') {
                    $goods_tag = model('goods_tags')->findOne(['name' => $value, 'id' => ['neq', $data['id']]]);
                    if ($goods_tag) {
                        return '商品标签已存在';
                    }
                }
                break;
            case 'id':
                $goods_tag = model('goods_tags')->getOne($value);
                if (!$goods_tag) {
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
