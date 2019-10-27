<?php
namespace app\api_performance\validate;

use think\Validate;

class Performance extends Validate
{
    protected $rule = [
        ['uid', 'require', '未选择员工'],
        ['grade', 'require', '评分不能为空'],
        ['aid', 'require', '没有操作权限'],
        ['month', 'require', '未选择月份'],
    ];


}
