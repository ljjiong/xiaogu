<?php
namespace app\api_users\validate;

use think\Validate;

class UserRecharge extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员充值ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['asset_type', 'require|in:money,score', '充值资产类型不能为空'],
        ['type', 'require|in:1,9', '充值类别不能为空|充值类别值非法'],
        ['money', 'require|number|>=:0.01', '充值金额不能为空|充值金额值非法|充值金额最小为0.01元'],
    ];

    protected $scene = [
        'create' => ['user_id', 'asset_type', 'type', 'money'],
        'update' => ['user_id', 'asset_type', 'type', 'money', 'id'],
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
                $user_recharge = model('user_recharges')->getOne($value);
                if ($user_recharge) {
                    return true;
                } else {
                    return '会员充值数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
