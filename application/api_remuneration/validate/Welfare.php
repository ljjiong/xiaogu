<?php
namespace app\api_remuneration\validate;

use think\Validate;

class Welfare extends Validate
{
    protected $rule = [
        ['weal', 'require', '福利不能为空'],
        ['particulars', 'require', '福利详情不能为空'],
        ['title', 'require', '标题不能为空'],
        ['states', 'require', '必须选择状态'],
    ];
}
