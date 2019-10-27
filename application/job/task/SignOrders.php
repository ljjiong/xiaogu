<?php
namespace app\job\task;

use think\Db;

/*
 * 自动签收订单
 */
class SignOrders extends BaseTimedHandler
{
    protected function doJob($data)
    {
        $config = get_config_file('order')['auto_receipt'];
        $time   = time() - (int) $config * 86400;

        $order_ids = Db::name('orders')->where(['data_state' => 1, 'status' => 3, 'deliver_time' => ['<= time', date('Y-m-d H:i:s', $time)]])->column('id');

        if ($order_ids) {
            $update_data = [
                'status'               => 4,
                'confirm_receipt_time' => date('Y-m-d H:i:s'),
                'update_time'          => date('Y-m-d H:i:s'),
            ];
            Db::name('orders')->where(['id' => ['in', $order_ids]])->update($update_data);
        }

        return true;
    }
}
