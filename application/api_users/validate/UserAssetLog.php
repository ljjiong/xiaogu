<?php
namespace app\api_users\validate;

use think\Validate;

class UserAssetLog extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员资产日志ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['asset_type', 'require|in:money,score', '资产类别不能为空|资产类别值非法'],
        ['change_type', 'require', '资产变动类别不能为空'],
        ['change_money', 'require|number', '资产变动金额不能为空|资产变动金额值非法'],
        ['intro', 'require', '资产日志简介不能为空'],
        ['desc', 'require', '资产日志描述不能为空'],
    ];

    protected $scene = [
        'create' => ['user_id', 'asset_type', 'change_type', 'change_money', 'intro', 'desc'],
        'update' => ['user_id', 'asset_type', 'change_type', 'change_money', 'intro', 'desc', 'id'],
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
                $user_asset_log = model('user_asset_logs')->getOne($value);
                if ($user_asset_log) {
                    return true;
                } else {
                    return '会员资产日志数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
