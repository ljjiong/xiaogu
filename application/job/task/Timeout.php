<?php
namespace app\job\task;

use think\Db;

/*
 * 自动取消订单
 */
class Timeout extends BaseTimedHandler
{
    protected function doJob($data)
    {
        $nowTime = date('Y-m-d h-i-s');
        $map     = [
            'end_time' => ['<', $nowTime],
            'is_ot'    => 0,
        ];
        Db::table('work_project_detail')->where($map)->update(['is_ot' => 1]);

        return true;
    }
}
