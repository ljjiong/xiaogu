<?php
namespace app\api_file\validate;

use think\Validate;

class CommonalityApply extends Validate
{
    protected $rule = [
        ['uid', 'require', '未登录'],
        ['comid', 'require', '未选择公共资源'],
        ['start_time', 'require', '未选择开始时间'],
        ['end_time', 'require', '未选择结束时间'],
    ];
}
