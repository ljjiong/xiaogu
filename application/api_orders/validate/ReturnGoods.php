<?php
namespace app\api_orders\validate;

use think\Validate;

class ReturnGoods extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '退货ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['order_id', 'require', '订单ID不能为空'],
        ['order_goods_id', 'require', '订单商品ID不能为空'],
        ['return_type', 'require|max:255', '退货类型不能为空|退货类型限255字符'],
        ['return_reason', 'require', '退货理由不能为空'],
        ['imgs', 'array', '图集数据格式错误'],
    ];

    protected $scene = [
        'create' => ['user_id', 'order_id', 'order_goods_id', 'return_type', 'return_reason', 'imgs'],
        'update' => ['user_id', 'order_id', 'order_goods_id', 'return_type', 'return_reason', 'imgs', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $order_id       = input('order_id');
        $order_goods_id = input('order_goods_id');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    $order = model('orders')->findOne(['id' => $order_id, 'user_id' => $value]);
                    if ($order) {
                        // 已付款待发货（状态 2） && 已发货待确认收货（状态 3）可退货
                        if ($order['status'] == 2 || $order['status'] == 3) {
                            $order_goods = model('order_goods')->findOne(['id' => $order_goods_id, 'order_id' => $order_id]);
                            if ($order_goods) {
                                // 商品未发起退货（状态 0）或退货已拒绝（状态 2）的订单商品可重新发起退货
                                if ($order_goods['return_goods_status'] == 0 || $order_goods['return_goods_status'] == 2) {
                                    if ($order['type'] == 1) {
                                        return true;
                                    } elseif ($order['type'] == 2) {
                                        return '积分订单不可退货';
                                    } elseif ($order['type'] == 3 && $order['type'] == 4) {
                                        return '团购订单不可退货';
                                    }
                                } else {
                                    return '订单商品状态错误，不可退货';
                                }
                            } else {
                                return '订单商品不存在';
                            }
                        } else {
                            return '订单状态错误，不可退货';
                        }
                    } else {
                        return '订单不存在';
                    }
                } else {
                    return '会员不存在';
                }
                break;
            case 'id':
                $order = model('return_goods')->getOne($value);
                if ($order) {
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
