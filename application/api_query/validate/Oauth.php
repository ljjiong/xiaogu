<?php
namespace app\api_query\validate;

use think\Validate;

class Oauth extends Validate
{
    protected $rule = [
        ['type', 'require|in:qq,wechat', 'openid类别不能为空|openid类别值非法'],
        ['openid', 'require', 'openid不能为空'],
    ];

    protected $scene = [
        'openid' => ['type', 'openid'],
    ];
}
