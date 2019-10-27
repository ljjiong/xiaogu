<?php
namespace app\job\task;

use think\Db;

/*
 * 团购自动退款
 */
class GroupBuyReturnMoney extends BaseTimedHandler
{
    protected function doJob($data)
    {
        // 结束订单
        $order_ids = Db::name('orders')->where(['data_state' => 1, 'type' => ['in', '3,4'], 'is_pay' => 1, 'group_buy_status' => 2])->column('id');

        foreach ($order_ids as $key => $value) {
            $order = Db::name('orders')->where(['id' => $value, 'data_state' => 1])->find();
            if ($order) {
                $order_goods = Db::name('order_goods')->where(['order_id' => $order['id'], 'data_state' => 1])->find();
                if ($order['group_buy_status'] == 2) {
                    $data = [
                        'type'            => 2, // 拼团到期退款
                        'user_id'         => $order['user_id'],
                        'order_id'        => $order['id'],
                        'order_goods_id'  => $order_goods['id'],
                        'return_order_no' => make_order_no('G'),
                        'return_money'    => $order['total_money'],
                        'return_type'     => 9,
                        'return_reason'   => '拼团失败，系统自动退款',
                        'imgs'            => [],
                        'status'          => 3,
                        'deal_time'       => date('Y-m-d H:i:s'),
                        'create_time'     => date('Y-m-d H:i:s'),
                        'update_time'     => date('Y-m-d H:i:s'),
                    ];
                    Db::name('return_goods')->insert($data);

                    $order_data = [
                        'group_buy_status' => 4, // 进入退款订单
                        'update_time'      => date('Y-m-d H:i:s'),
                    ];
                    Db::name('orders')->where(['id' => $value])->update($order_data);
                }
            }
        }

        return true;
    }
}
