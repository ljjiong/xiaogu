<?php
namespace app\api_orders\validate;

use think\Validate;

class SignOrder extends Validate
{
    protected $rule = [
        ['order_id', 'require|checkValue:order_id', '订单ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
    ];

    protected $scene = [
        'user'  => ['order_id', 'user_id'],
        'admin' => ['order_id'],
    ];

    protected function checkValue($value, $rule)
    {
        $order_id = input('order_id');

        switch ($rule) {
            case 'order_id':
                $order = model('orders')->getOne($value);
                if ($order) {
                    if ($order['status'] == 3) {
                        $wait_deal_return_goods_count = model('order_goods')->getAllCount(['order_id' => $value, 'return_goods_status' => 1]);
                        if ($wait_deal_return_goods_count > 0) {
                            return '当前订单含有待处理退货的商品，暂不可签收';
                        } else {
                            return true;
                        }
                    } else {
                        return '订单状态错误，不可签收';
                    }
                } else {
                    return '订单不存在';
                }
                break;
            case 'user_id':
                $order = model('orders')->getOne($order_id);
                if ($order) {
                    if ($order['user_id'] == $value) {
                        return true;
                    } else {
                        return '非法操作';
                    }
                } else {
                    return '订单不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
