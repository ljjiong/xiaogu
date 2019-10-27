<?php
namespace app\api_users\validate;

use think\Validate;

class UserAsset extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员资产ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['money', 'require|number', '会员钱包不能为空|会员钱包值非法'],
        ['score', 'require|number', '会员积分不能为空|会员积分值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'money', 'score'],
        'update' => ['user_id', 'money', 'score', 'id'],
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
                $user_asset = model('user_assets')->getOne($value);
                if ($user_asset) {
                    return true;
                } else {
                    return '会员资产数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
