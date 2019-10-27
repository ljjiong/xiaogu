<?php
namespace app\api_orders\validate;

use think\Validate;

class DealReturnGoods extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '退款订单ID不能为空'],
    ];

    protected $scene = [
        'agree'        => ['id'],
        'not_agree'    => ['id'],
        'return_money' => ['id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $return_goods = model('return_goods')->getOne($value);
                if ($return_goods) {
                    if ($this->currentScene == 'agree' || $this->currentScene == 'not_agree') {
                        if ($return_goods['status'] == 1) {
                            return true;
                        } else {
                            return '当前退货订单已处理';
                        }
                    } elseif ($this->currentScene == 'return_money') {
                        if ($return_goods['status'] == 3) {
                            if ($return_goods['is_return_money'] == 0) {
                                return true;
                            } else {
                                return '当前退货订单已退款';
                            }
                        } else {
                            return '当前退货订单审核未通过，不可退款';
                        }
                    }
                } else {
                    return '退货订单不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
