<?php
namespace app\api_project\validate;

use think\Validate;

class Project extends Validate
{
    protected $rule = [
        ['project_name', 'require', '项目名称不能为空'],
        ['project_manager', 'require', '未选择项目经理'],
        ['department', 'require', '未选择所属部门'],
        ['end_time', 'require', '结束时间不能为空'],
    ];
    protected $scene = [
        'create' => ['project_name', 'project_manager', 'department', 'end_time'],
        'update' => ['project_name', 'project_manager', 'department', 'end_time'],
    ];

}
