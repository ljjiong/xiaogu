<?php
namespace app\api_query\validate;

use think\Validate;

class Collect extends Validate
{
    protected $rule = [
        ['goods_id', 'require|checkValue:goods_id', '商品ID不能为空'],
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
