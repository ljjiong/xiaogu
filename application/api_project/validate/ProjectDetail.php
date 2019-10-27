<?php
namespace app\api_project\validate;

use think\Validate;

class ProjectDetail extends Validate
{
    protected $rule = [
        // ['pid', 'require', '未选择项目'],
        // ['task', 'require', '任务详情不能为空'],
        // ['performer', 'require', '未选择用户'],
        // ['end_time', 'require', '结束时间不能为空'],
    ];
    protected $scene = [
        'create' => ['pid', 'task', 'performer', 'end_time'],
        'update' => ['pid', 'task', 'performer', 'end_time'],
    ];
}
