<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

/*
 *  【余额支付模型】
 */
class MoneyPay extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_orders';

    //类型转换
    protected $type = [
        'id'                      => 'integer',
        'user_id'                 => 'integer',
        'type'                    => 'integer',
        'market_activity_id'      => 'integer',
        'market_reduce_money'     => 'float',
        'goods_money'             => 'float',
        'freight_money'           => 'float',
        'total_money'             => 'float',
        'total_score'             => 'float',
        'is_pay'                  => 'integer',
        'pay_type'                => 'integer',
        'is_app_pay'              => 'integer',
        'deliver_tip_num'         => 'integer',
        'is_open_eorder'          => 'integer',
        'is_submit_eorder'        => 'integer',
        'is_comment'              => 'integer',
        'is_has_return_goods'     => 'integer',
        'is_all_return_goods'     => 'integer',
        'is_deal_return_goods'    => 'integer',
        'return_goods_money'      => 'float',
        'is_group_buy_first'      => 'integer',
        'group_buy_order_pid'     => 'integer',
        'group_buy_time_length'   => 'float',
        'group_buy_end_timestamp' => 'integer',
        'group_buy_person_num'    => 'integer',
        'group_buy_goods_id'      => 'integer',
        'group_buy_status'        => 'integer',
        'status'                  => 'integer',
        'data_state'              => 'integer',
    ];

    // 余额支付
    public function pay($order_no, $user_id)
    {
        $order = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            $order_id   = $order['id'];
            $user_asset = model('user_assets')->findOne(['user_id' => $user_id]);
            if ($user_asset) {
                if ($order['is_pay'] !== 0 && $order['status'] !== 1) {
                    return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可支付'];
                }

                if ($order['user_id'] !== $user_id) {
                    return ['code' => 0, 'data' => [], 'msg' => '非法操作'];
                }

                if ($order['total_money'] > $user_asset['money']) {
                    return ['code' => 0, 'data' => [], 'msg' => '钱包余额不足'];
                }

                $pay_data = [
                    'is_pay'   => 1,
                    'pay_time' => date('Y-m-d H:i:s'),
                    'pay_type' => 3,
                    'status'   => 2,
                ];

                $result = $this->save($pay_data, ['id' => $order_id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    $result = model('user_assets')->where(['user_id' => $user_id])->setDec('money', $order['total_money']);
                    if (false === $result) {
                        return ['code' => 0, 'data' => [], 'msg' => '会员钱包扣款失败'];
                    } else {
                        $asset_log_data = [
                            'user_id'      => $user_id,
                            'asset_type'   => 'money',
                            'change_type'  => 'user_pay',
                            'change_money' => $order['total_money'],
                            'intro'        => '购物支付【' . $order['order_no'] . '】',
                            'desc'         => '会员购物扣款，订单号：' . $order['order_no'],
                        ];
                        model('user_asset_logs')->addOne($asset_log_data);

                        return ['code' => 1, 'data' => [], 'msg' => '钱包支付成功'];
                    }
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '会员资产数据不存在'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单不存在'];
        }
    }
}
