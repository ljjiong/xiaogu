<?php
namespace app\api_orders\validate;

use think\Validate;

class DeliverGoods extends Validate
{
    protected $rule = [
        ['order_id', 'require|checkValue:order_id', '订单ID不能为空'],
        ['is_open_eorder', 'require|in:0,1', '是否启用电子面单不能为空|是否启用电子面单值非法'],
        ['eorder_express_type', 'checkValue:eorder_express_type'],
        ['express_type', 'checkValue:express_type'],
        ['express_no', 'checkValue:express_no'],
    ];

    protected $scene = [
        'create' => ['order_id', 'is_open_eorder', 'eorder_express_type', 'express_type', 'express_no'],
        'update' => ['order_id', 'is_open_eorder', 'eorder_express_type', 'express_type', 'express_no'],
    ];

    protected function checkValue($value, $rule)
    {
        $is_open_eorder = input('is_open_eorder');

        switch ($rule) {
            case 'order_id':
                $order = model('orders')->getOne($value);
                if ($order) {
                    if ($this->currentScene == 'create') {

                        if ($order['status'] == 2) {
                            if ($order['type'] == 1 || $order['type'] == 2) {
                                return true;
                            } elseif ($order['type'] == 3 || $order['type'] == 4) {
                                if ($order['group_buy_status'] == 3) {
                                    return true;
                                } else {
                                    return '订单状态错误，不可创建发货';
                                }
                            } else {
                                return '订单类别错误，请联系管理员';
                            }

                        } else {
                            return '订单状态错误，不可创建发货';
                        }

                    } elseif ($this->currentScene == 'update') {
                        if ($order['status'] == 3) {
                            if ($order['type'] == 1 || $order['type'] == 2) {
                                return true;
                            } elseif ($order['type'] == 3 || $order['type'] == 4) {
                                if ($order['group_buy_status'] == 3) {
                                    return true;
                                } else {
                                    return '订单状态错误，不可更新发货';
                                }
                            } else {
                                return '订单类别错误，请联系管理员';
                            }
                        } else {
                            return '订单状态错误，不可更新发货';
                        }
                    }
                } else {
                    return '订单不存在';
                }
                break;
            case 'eorder_express_type':
                if ($is_open_eorder == 1) {
                    if ($value) {
                        return true;
                    } else {
                        return '请选择电子面单的物流公司';
                    }
                } else {
                    return true;
                }
                break;
            case 'express_type':
                if ($is_open_eorder == 0) {
                    if ($value) {
                        return true;
                    } else {
                        return '请选择物流公司';
                    }
                } else {
                    return true;
                }
                break;
            case 'express_no':
                if ($is_open_eorder == 0) {
                    if ($value) {
                        return true;
                    } else {
                        return '请输入物流单号';
                    }
                } else {
                    return true;
                }
                break;
            default:
                # code...
                break;
        }
    }
}
