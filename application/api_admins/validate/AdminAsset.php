<?php
namespace app\api_admins\validate;

use think\Validate;

class AdminAsset extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '管理员资产ID不能为空'],
        ['admin_id', 'require|checkValue:admin_id', '管理员ID不能为空'],
        ['money', 'require|numValue', '管理员钱包不能为空|管理员钱包值非法'],
        ['score', 'require|numValue', '管理员积分不能为空|管理员积分值非法'],
    ];

    protected $regex = [
        'numValue' => '/^[0-9]+([.]{1}[0-9]+){0,1}$/',
    ];

    protected $scene = [
        'create' => ['admin_id', 'money', 'score'],
        'update' => ['admin_id', 'money', 'score', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'admin_id':
                $admin = model('admins')->getOne($value);
                if ($admin) {
                    return true;
                } else {
                    return '管理员不存在';
                }
                break;
            case 'id':
                $admin_asset = model('admin_assets')->getOne($value);
                if ($admin_asset) {
                    return true;
                } else {
                    return '管理员资产数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
