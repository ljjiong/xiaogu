<?php
namespace app\api_query\validate;

use think\Validate;

class Transport extends Validate
{
    protected $rule = [
        ['express_type', 'require', '物流类型不能为空'],
        ['express_no', 'require', '物流单号不能为空'],
    ];

    protected $scene = [
        'read' => ['express_type', 'express_no'],
    ];
}
