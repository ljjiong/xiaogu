<?php
namespace app\api_users\validate;

use think\Validate;

class UserThirdAccount extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['client_type', 'require|in:pc,wap,app,wechat,applet', '客户端类型不能为空|客户端类型值非法'],
        ['type', 'require|in:ali,wechat', '类型值不能为空|类型值非法'],
        ['name', 'require', '账号名称不能为空'],
        ['account', 'require', '账号值不能为空'],
    ];

    protected $scene = [
        'update' => ['user_id', 'client_type', 'type', 'name', 'account'],
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
            default:
                # code...
                break;
        }
    }
}
