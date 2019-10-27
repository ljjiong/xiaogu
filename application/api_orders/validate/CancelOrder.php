<?php
namespace app\api_orders\validate;

use think\Validate;

class CancelOrder extends Validate
{
    protected $rule = [
        ['order_id', 'require|checkValue:order_id', '订单ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['cancel_reason', 'require', '订单取消原因不能为空'],
    ];

    protected $scene = [
        'user' => ['order_id', 'user_id', 'cancel_reason'],
    ];

    protected function checkValue($value, $rule)
    {
        $order_id = input('order_id');

        switch ($rule) {
            case 'order_id':
                $order = model('orders')->getOne($value);
                if ($order) {
                    if ($order['status'] == 1) {
                        return true;
                    } else {
                        return '订单状态错误，不可取消';
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
