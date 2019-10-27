<?php
namespace app\job\task;

use think\Config;
use think\Db;
use think\Queue;
use think\queue\Job;

/*
根目录下执行命令：php think queue:work --queue TimedTasksQueue --daemon
 */

abstract class BaseTimedHandler
{
    protected $queue; // 队列名
    protected $handler; // 队列任务处理类名
    protected $task_id = 0; //定时任务ID

    abstract protected function doJob($data);

    // 初始化
    public function __construct()
    {
        $do_class = basename(str_replace('\\', '/', get_called_class()));

        $config        = Config::get('queue');
        $this->queue   = $config['timed_tasks_queue'];
        $this->handler = $config['prefix'] . $do_class;

        $task          = Db::name('timed_tasks')->where(['handler' => $do_class])->find();
        $this->task_id = $task ? $task['id'] : 0;
    }

    /**
     * fire方法是消息队列默认调用的方法
     * @param Job            $job      当前的任务对象
     * @param array|mixed    $data     发布任务时自定义的数据
     */
    public function fire(Job $job, $data)
    {
        try {
            // 校验任务
            $task = Db::name('timed_tasks')->where(['id' => $this->task_id, 'data_state' => 1])->find();

            if ($task) {
                if ($task['token'] !== $data['token']) {
                    $job->delete();
                    return;
                }
            } else {
                $job->delete();
                return;
            }

            // 执行任务
            if ($this->doJob($data)) {
                $result = $this->updateDoTask();
                if ($result['code']) {
                    $this->writeDoLog(1, 'Success');
                }

                //如果任务执行成功，删除任务
                $job->delete();
            } else {
                if ($job->attempts() > 3) {
                    $job->delete();
                    throw new Exception('尝试执行3次仍执行失败', 1);
                }
            }
        } catch (Exception $e) {
            $this->writeDoLog($e->getCode(), $e->getMessage());
        }
    }

    // 更新当前执行的任务
    private function updateDoTask()
    {
        $task = Db::name('timed_tasks')->where(['id' => $this->task_id, 'data_state' => 1])->find();
        if ($task) {

            // 任务已关闭或删除终止执行
            if ($task['status'] !== 1 || $task['data_state'] == 0) {
                return $this->writeDoLog(0, '任务已关闭');
            }

            $token     = uniqid();
            $next_time = strtotime($task['next_time'] . '+' . $task['interval_value'] . ' ' . $task['interval_type']);

            $update_data = [
                'id'          => $this->task_id,
                'token'       => $token,
                'next_time'   => date('Y-m-d H:i:s', $next_time),
                'action_num'  => $task['action_num'] + 1,
                'update_time' => date('Y-m-d H:i:s'),
            ];

            $result = Db::name('timed_tasks')->where('id', $this->task_id)->update($update_data);
            if ($result !== false) {

                $time_wait = $next_time - time();
                $data      = [
                    'token' => $token,
                ];

                $isPushed = Queue::later($time_wait, $this->handler, $data, $this->queue);
                if ($isPushed !== false) {
                    return ['code' => 1, 'msg' => '任务入队成功'];
                } else {
                    return $this->writeDoLog(0, '任务入队失败');
                }
            } else {
                return $this->writeDoLog(0, '任务更新失败');
            }
        } else {
            return $this->writeDoLog(0, '任务已删除');
        }
    }

    // 写入执行日志
    private function writeDoLog($code, $msg)
    {
        $data = [
            'task_id'     => $this->task_id,
            'desc'        => $msg,
            'warn_code'   => $code,
            'create_time' => date('Y-m-d H:i:s'),
            'update_time' => date('Y-m-d H:i:s'),
        ];

        Db::name('timed_task_logs')->insert($data);
    }
}
