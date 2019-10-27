<?php

namespace app\api_orders\validate;

use think\Validate;

class Eorder extends Validate
{
    protected $rule = [
        ['order_id', 'require|checkValue:order_id', '订单ID不能为空'],
        ['order_ids', 'require|array|checkValue:order_ids', '订单IDs不能为空|订单IDs值非法'],
    ];

    protected $scene = [
        'eorder'       => ['order_id'],
        'batch_eorder' => ['order_ids'],
        'print'        => ['order_id'],
        'batch_print'  => ['order_ids'],

    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'order_id':
                $order = model('orders')->getOne($value);
                if ($order) {
                    if ($order['is_pay'] == 1) {
                        if ($this->currentScene == 'eorder') {
                            if ($order['status'] == 3) {
                                if ($order['is_submit_eorder'] == 1) {
                                    return '当前订单已创建电子面单';
                                } else {
                                    return true;
                                }
                            } else {
                                return '订单状态错误，暂不可操作';
                            }
                        } elseif ($this->currentScene == 'print') {
                            if ($order['is_submit_eorder'] == 1) {
                                return true;
                            } else {
                                return '当前订单未创建电子面单';
                            }
                        }
                    } else {
                        return '订单状态错误，暂不可操作';
                    }
                } else {
                    return '订单不存在';
                }
                break;
            case 'order_ids':
                foreach ($value as $key => $order_id) {
                    $order = model('orders')->getOne($order_id);
                    if ($order) {
                        if ($order['is_pay'] == 1) {
                            if ($this->currentScene == 'eorder') {
                                if ($order['status'] !== 3) {
                                    return 'ID为' . $order_id . '的订单状态错误，暂不可打印电子发单';
                                    break;
                                }

                                if ($order['is_submit_eorder'] == 1) {
                                    return 'ID为' . $order_id . '的订单已创建电子发单';
                                    break;
                                }
                            } elseif ($this->currentScene == 'print') {
                                if ($order['is_submit_eorder'] == 0) {
                                    return 'ID为' . $order_id . '的订单暂未创建电子发单';
                                    break;
                                }
                            }
                        } else {
                            return 'ID为' . $order_id . '的订单状态错误，暂不可操作';
                            break;
                        }
                    } else {
                        return 'ID为' . $order_id . '的订单数据不存在';
                        break;
                    }
                }
                return true;
                break;
            default:
                # code...
                break;
        }
    }

}
