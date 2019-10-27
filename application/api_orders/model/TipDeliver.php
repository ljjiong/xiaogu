<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

/*
 *  【订单确认签收模型】
 */
class TipDeliver extends BaseModel
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

    // 签收订单
    public function tip($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order) {
            if ($order['status'] == 2) {
                $param = [
                    'deliver_tip_num'       => $order['deliver_tip_num'] + 1,
                    'last_deliver_tip_time' => date('Y-m-d H:i:s'),
                ];

                $result = $this->save($param, ['id' => $order_id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    return ['code' => 1, 'data' => [], 'msg' => '提醒发货成功'];
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可提醒发货'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单数据不存在'];
        }
    }
}
