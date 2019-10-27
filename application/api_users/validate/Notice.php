<?php
namespace app\api_users\validate;

use think\Validate;

class Notice extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '通知ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['title', 'require|max:255', '通知标题不能为空|通知标题限255字符'],
        ['status', 'require|in:1,2', '通知状态不能为空|通知状态值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'title', 'status'],
        'update' => ['user_id', 'title', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员不存在';
                }
                break;
            case 'id':
                $notice = model('notices')->getOne($value);
                if ($notice) {
                    return true;
                } else {
                    return '通知数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
