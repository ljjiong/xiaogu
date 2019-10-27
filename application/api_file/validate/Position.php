<?php
namespace app\api_file\validate;

use think\Validate;

class Position  extends Validate
{
    protected $rule = [
        // ['states', 'require', '必须选择状态'],
    ];
}
