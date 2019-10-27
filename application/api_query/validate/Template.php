<?php
namespace app\api_query\validate;

use think\Validate;

class Template extends Validate
{
    protected $rule = [
        ['goods_cate_id', 'require|checkValue:goods_cate_id', '商品分类ID不能为空'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'goods_cate_id':
                $goods_cate = model('goods_cates')->getOne($value);
                if ($goods_cate) {
                    return true;
                } else {
                    return '商品分类不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
