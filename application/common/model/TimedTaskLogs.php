<?php
namespace app\common\model;

/*
 *  【定时任务日志模型】
 */
class TimedTaskLogs extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_timed_task_logs';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'task_id'    => 'integer',
        'warn_code'  => 'integer',
        'data_state' => 'integer',
    ];

    public function writeDoLog($timed_task_id, $code, $msg)
    {
        $data = [
            'task_id'   => $timed_task_id,
            'desc'      => $msg,
            'warn_code' => $code,
        ];

        return $this->addOne($data);
    }
}
