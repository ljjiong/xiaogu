<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

/*
 *  【订单确认签收模型】
 */
class SignOrder extends BaseModel
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
    public function sign($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order) {
            if ($order['status'] == 3) {
                $param = [
                    'status'               => 4,
                    'confirm_receipt_time' => date('Y-m-d H:i:s'),
                ];

                $result = $this->save($param, ['id' => $order_id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    import('app.api_extend.extend.drp.Drp');
                    $Drp = new \Drp();
                    // ============【分销】计算实际佣金begin==============
                    $Drp->count_real_money($order_id);
                    // ============【分销】计算实际佣金end================

                    import('app.api_extend.extend.drp.Bonus');
                    $Bonus = new \Bonus();
                    // ============【分红】计算实际分红begin==============
                    $Bonus->count_real_money($order_id);
                    // ============【分红】计算实际分红end================

                    // 更新个人信息统计
                    $this->orderCount($order_id);

                    // ============【分销商】订单金额或购买指定商品成为分销商begin==============
                    $Drp->become_distributor($order['user_id']);
                    // ============【分销商】订单金额或购买指定商品成为分销商end================
                    // ============【分销】分销商自动升级begin==============
                    $Drp->auto_up_level($order['user_id']);
                    // ============【分销】分销商自动升级end================

                    // ============【分红商】订单金额或购买指定商品成为分红商begin==============
                    $Bonus->become_bonus($order['user_id']);
                    // ============【分红商】订单金额或购买指定商品成为分红商end================
                    // ============【分红】分红商自动升级begin==============
                    $Bonus->auto_up_level($order['user_id']);
                    // ============【分红】分红商自动升级end================

                    // 增加购物积分与日志
                    model('score_logs')->addScoreByShop($order['id']);

                    return ['code' => 1, 'data' => [], 'msg' => '确认签收成功'];
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可签收'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单数据不存在'];
        }
    }

    private function orderCount($order_id)
    {
        model('user_info')->updateOrderCount($order_id);
    }
}
