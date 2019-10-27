<?php
namespace app\api_goods\validate;

use think\Validate;

class Cart extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '购物车ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['goods_id', 'require|checkValue:goods_id', '商品ID不能为空'],
        ['spec_group_id_str', 'require|checkValue:spec_group_id_str', '商品组合id_str不能为空'],
        ['num', 'require|number|min:1', '商品数量不能为空|商品数量必须为整数|商品数量最小为1'],
        ['status', 'in:1,2', '购物车状态值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'goods_id', 'spec_group_id_str', 'num', 'status'],
        'update' => ['user_id', 'goods_id', 'spec_group_id_str', 'num', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $goods_id = input('goods_id');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员ID不存在';
                }
                break;
            case 'goods_id':
                $goods = model('goods')->getOne($value);
                if ($goods) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            case 'spec_group_id_str':
                if ($value) {
                    $goods_spec_group = model('goods_spec_groups')->findOne(['id_str' => $value, 'goods_id' => $goods_id]);
                    if ($goods_spec_group) {
                        return true;
                    } else {
                        return '商品组合id_str不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $cart = model('carts')->getOne($value);
                if ($cart) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
