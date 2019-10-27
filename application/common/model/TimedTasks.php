<?php
namespace app\common\model;

use think\Config;
use think\Queue;

/*
 *  【定时任务模型】
 */
class TimedTasks extends BaseModel
{
    // 指定数据表
    protected $table = 'work_timed_tasks';

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            $model->token = uniqid();
        });

        // 新增或更新时处理图片
        self::afterWrite(function ($model) {
            if (isset($model->id)) {
                model('timed_tasks')->addOneToQueue($model->id);
            }
        });
    }

    /*
     * 添加一个任务进队列
     * */
    public function addOneToQueue($task_id)
    {
        $task = model('timed_tasks')->getOne($task_id);
        if (!$task) {
            return ['code' => 0, 'msg' => '任务不存在'];
        }

        if ($task['status'] !== 1) {
            return ['code' => 1, 'msg' => '关闭任务不予处理'];
        }

        $config = Config::get('queue');

        $handler   = $config['prefix'] . $task['handler'];
        $time_wait = strtotime($task['next_time']) - strtotime('now');
        $data      = [
            'token' => $task['token'],
        ];

        $isPushed = Queue::later($time_wait, $handler, $data, $config['timed_tasks_queue']);
        if ($isPushed !== false) {
            return ['code' => 1, 'msg' => '成功添加进队列'];
        } else {
            return ['code' => 0, 'msg' => '添加任务进队列失败'];
        }
    }

    public function updateDoTask($timed_task_id)
    {
        $timed_task = $this->findOne(['id' => $timed_task_id, 'status' => 1]);
        if ($timed_task) {
            $update_data = [
                'id'         => $timed_task['id'],
                'next_time'  => date('Y-m-d H:i:s', strtotime($timed_task['next_time'] . '+' . $timed_task['interval_value'] . ' ' . $timed_task['interval_type'])),
                'action_num' => $timed_task['action_num'] + 1,
            ];

            return $this->editOne($update_data);
        } else {
            return ['code' => 0, 'msg' => '数据不存在'];
        }
    }
}
