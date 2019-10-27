<?php
namespace app\api_orders\validate;

use think\Validate;

class PrePay extends Validate
{
    protected $rule = [
        ['order_id', 'require|checkValue:order_id', '订单ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
    ];

    protected $scene = [
        'check' => ['order_id', 'user_id'],
    ];

    protected function checkValue($value, $rule)
    {
        $order_id = input('order_id');

        switch ($rule) {
            case 'order_id':
                $order = model('orders')->getOne($value);
                if ($order) {
                    if ($order['is_pay'] == 1 || $order['status'] != 1) {
                        return '订单状态错误，不可支付';
                    } else {
                        $order_goods_info = $order['order_goods_info'];
                        // 检查商品是否非法
                        foreach ($order_goods_info as $key1 => $value1) {
                            $goods = model('goods')->getOne($value1['goods_id']);
                            if ($goods) {
                                if ($goods['status'] != 1) {
                                    return '商品【' . $goods['name'] . '】已下架';
                                    break;
                                }

                                if ($value1['spec_group_id_str']) {
                                    $spec = model('goods_spec_groups')->findOne(['goods_id' => $value1['goods_id'], 'id_str' => $value1['spec_group_id_str']]);
                                    if ($spec) {
                                        if (intval($spec['stock']) < intval($value1['num'])) {
                                            return '商品【' . $goods['name'] . '】库存已不足';
                                            break;
                                        }
                                    } else {
                                        return '部分规格商品已下架，请重新下单';
                                        break;
                                    }
                                } else {
                                    if (intval($goods['stock']) < intval($value1['num'])) {
                                        return '商品【' . $goods['name'] . '】库存已不足';
                                        break;
                                    }
                                }
                            } else {
                                return '部分商品已下架，请重新下单';
                                break;
                            }
                        }

                        return true;
                    }
                } else {
                    return '订单不存在';
                }
                break;
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    $order = model('orders')->findOne(['id' => $order_id, 'user_id' => $value]);
                    if ($order) {
                        return true;
                    } else {
                        return '订单不存在';
                    }
                } else {
                    return '会员不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
