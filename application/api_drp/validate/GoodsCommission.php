<?php
namespace app\api_drp\validate;

use think\Validate;

class GoodsCommission extends Validate
{
    protected $rule = [
        ['goods_id', 'require|checkValue:goods_id', '商品ID不能为空'],
        ['commission_1_use_type', 'in:rate,money', '一级分佣使用类型值非法'],
        ['commission_2_use_type', 'in:rate,money', '二级分佣使用类型值非法'],
        ['commission_3_use_type', 'in:rate,money', '三级分佣使用类型值非法'],
    ];

    protected $scene = [
        'update' => ['goods_id', 'commission_1_use_type', 'commission_2_use_type', 'commission_3_use_type'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'goods_id':
                $goods = model('goods')->getOne($value);
                if ($goods) {
                    return true;
                } else {
                    return '商品不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
