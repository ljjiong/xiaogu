<?php
namespace app\api_bonus\validate;

use think\Validate;

class GlobalBonus extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkValue:user_id', '商品ID不能为空'],
        ['is_open_own_global_rate', 'require|boolean', '是否开启独立全球分红比例不能为空|是否开启独立全球分红比例值非法'],
        ['global_rate', 'number|<=:100', '全球分红比例不能为空|全球分红比例必须为数字|全球分红比例不能大于100'],
    ];

    protected $scene = [
        'update' => ['user_id', 'is_open_own_global_rate', 'global_rate'],
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
