<?php
namespace app\api_drp\validate;

use think\Validate;

class Rule extends Validate
{
    protected $rule = [
        ['is_open', 'require|boolean', '是否开启分销系统不能为空|开启分销系统值非法'],
        ['level', 'require|in:1,2,3', '分销层级不能为空|分销层级值非法'],
        ['is_open_self', 'require|boolean', '是否开启内购不能为空|是否开启内购值非法'],

    ];

    protected $scene = [
        'update' => ['is_open', 'level', 'is_open_self'],
    ];
}
