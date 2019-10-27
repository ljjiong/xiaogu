<?php
namespace app\job\validate;

use think\Config;
use think\Validate;

class TimedTask extends Validate
{
    protected $rule = [
        ['name', 'require|max:100', '任务名称不能为空|任务名称不得超过100字符'],
        ['handler', 'require|checkValue:handler', '任务处理类名不能为空'],
        ['next_time', 'require|checkValue:next_time', '任务下次执行时间不能为空'],
        ['interval_type', 'require|in:second,minute,hour,day,week,month,year', '任务间隔类型不能为空|任务间隔类型值非法'],
        ['interval_value', 'require|number|>:0', '任务间隔值不能为空|任务间隔值必须为数字|任务间隔值必须大于0'],
        ['status', 'require|in:1,2', '任务状态值不得为空|任务状态值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'handler', 'next_time', 'interval_type', 'interval_value', 'status'],
        'update' => ['name', 'handler', 'next_time', 'interval_type', 'interval_value', 'status', 'id'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'handler':
                $config  = Config::get('queue');
                $handler = $config['prefix'] . $value;
                if (!class_exists($handler)) {
                    return '任务处理类不存在';
                }

                if ($this->currentScene == 'create') {
                    $task = model('timed_tasks')->findOne(['handler' => $value]);
                } else if ($this->currentScene == 'update') {
                    $task = model('timed_tasks')->findOne(['id' => ['neq', $data['id']], 'handler' => $value]);
                } else {
                    return '验证场景不存在';
                }

                if ($task) {
                    return '任务处理类已被使用';
                }
                break;
            case 'next_time':
                if (strtotime($value) <= time()) {
                    return '任务下次执行时间不得小于当前时间';
                }
                break;
        }

        return true;
    }
}
