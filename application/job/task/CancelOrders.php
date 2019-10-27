<?php
namespace app\job\task;

use think\Db;

/*
 * 自动取消订单
 */
class CancelOrders extends BaseTimedHandler
{
    protected function doJob($data)
    {
        $config = get_config_file('order')['auto_cancel'];
        $time   = time() - (int) $config * 86400;

        $order_ids = Db::name('orders')->where(['data_state' => 1, 'is_pay' => 0, 'create_time' => ['<= time', date('Y-m-d H:i:s', $time)]])->column('id');

        if ($order_ids) {
            $update_data = [
                'status'        => 9,
                'cancel_time'   => date('Y-m-d H:i:s'),
                'cancel_reason' => '订单未支付，系统自动取消',
                'update_time'   => date('Y-m-d H:i:s'),
            ];
            Db::name('orders')->where(['id' => ['in', $order_ids]])->update($update_data);
        }

        return true;
    }
}
