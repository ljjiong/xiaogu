<?php
namespace app\job\task;

use think\Db;

/*
 * 自动删除订单
 */
class DeleteOrders extends BaseTimedHandler
{
    protected function doJob($data)
    {
        $config = get_config_file('order')['auto_delete'];
        $time   = time() - (int) $config * 86400;

        $order_ids = Db::name('orders')->where(['data_state' => 1, 'status' => 9, 'cancel_time' => ['<= time', date('Y-m-d H:i:s', $time)]])->column('id');

        if ($order_ids) {
            $update_data = [
                'data_state'  => 0,
                'update_time' => date('Y-m-d H:i:s'),
            ];
            Db::name('orders')->where(['id' => ['in', $order_ids]])->update($update_data);
        }

        return true;
    }
}
