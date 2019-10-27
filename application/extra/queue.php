<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: yunwuxin <448901948@qq.com>
// +----------------------------------------------------------------------

return [
    'connector'         => 'database', //驱动类型，可选择 sync(默认):同步执行，database:数据库驱动,redis:Redis驱动,topthink:Topthink驱动
    'timed_tasks_queue' => 'TimedTasksQueue', // 定时任务使用的队列名
    'prefix'            => 'app\job\task\\', // 队列handler前缀
];
