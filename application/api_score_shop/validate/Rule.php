<?php
namespace app\api_score_shop\validate;

use think\Validate;

class Rule extends Validate
{
    protected $rule = [
        ['is_open', 'require|boolean', '是否开启积分商城不能为空|开启积分商城值非法'],
        ['type', 'require|in:1,2', '积分商城模式不能为空|积分商城模式值非法'],
    ];

    protected $scene = [
        'update' => ['is_open', 'type'],
    ];
}
