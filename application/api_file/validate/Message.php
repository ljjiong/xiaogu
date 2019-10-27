<?php
namespace app\api_file\validate;

use think\Validate;

class Message extends Validate
{
    protected $rule = [
    	['uid', 'require', '未登录'],
        ['messageTitle', 'require', '公告标题不能为空'],
        ['content', 'require', '公告内容不能为空'],
    ];
}
