<?php
namespace app\workerman\controller;

use think\Db;
use Workerman\Lib\Timer;
use Workerman\Worker;

/**
请把定时任务写在下面类中
 */
class timedTask
{
    public function run()
    {
        Db::name('test')->where(['id' => 1])->setInc('content', 1);

        
        $nowTime = date('Y-m-d h-i-s');
        $map     = [
            'end_time' => ['<', $nowTime],
            'is_ot'    => 0,
        ];
        Db::table('work_project_detail')->where($map)->update(['is_ot' => 1]);
    }
}

$task        = new Worker();
$task->count = 1;

$task->onWorkerStart = function ($task) {
    $timedTask = new timedTask();
    // 每0.1秒运行一次，最后一个参数传递false，表示只运行一次
    Timer::add(0.9, array($timedTask, 'run'), [], true);
};

// 运行worker
Worker::runAll();
