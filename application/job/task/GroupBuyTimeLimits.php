<?php
namespace app\job\task;

use think\Db;

/*
 * 团购处理时限
 */
class GroupBuyTimeLimits extends BaseTimedHandler
{
    protected function doJob($data)
    {
        // 结束订单
        $order_ids = Db::name('orders')->where(['data_state' => 1, 'type' => ['in', '3,4'], 'is_pay' => 1, 'group_buy_end_timestamp' => ['<=', time()]])->column('id');
        if ($order_ids) {
            $update_data = [
                'group_buy_status' => 2,
                'update_time'      => date('Y-m-d H:i:s'),
            ];
            Db::name('orders')->where(['id' => ['in', $order_ids]])->update($update_data);
        }

        // 结束团队
        $team_ids = Db::name('group_buy_teams')->where(['data_state' => 1, 'status' => 1, 'end_time' => ['<= time', date('Y-m-d H:i:s')]])->column('id');
        if ($team_ids) {
            $update_data = [
                'status'        => 2,
                'end_team_type' => 2,
                'end_team_time' => date('Y-m-d H:i:s'),
                'update_time'   => date('Y-m-d H:i:s'),
            ];
            Db::name('group_buy_teams')->where(['id' => ['in', $team_ids]])->update($update_data);
        }

        return true;
    }
}
