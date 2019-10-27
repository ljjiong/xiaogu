<?php
namespace app\api_users\validate;

use think\Validate;

class UserLevel extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员等级ID不能为空'],
        ['name', 'require|checkValue:name', '等级名称不能为空'],
        ['min_score', 'require|number', '达到等级最小积分不能为空|达到等级最小积分数值非法'],
        ['status', 'require|in:1,2', '等级状态不能为空|等级状态值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'min_score', 'status'],
        'update' => ['user_id', 'min_score', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'name':
                if ($this->currentScene == 'create') {
                    $user_level = model('user_levels')->findOne(['name' => $value]);
                } elseif ($this->currentScene == 'update') {
                    $user_level = model('user_levels')->findOne(['name' => $value, 'id' => ['neq', $id]]);
                }

                if ($user_level) {
                    return '会员等级名称已存在';
                } else {
                    return true;
                }
                break;
            case 'id':
                $user_level = model('user_levels')->getOne($value);
                if ($user_level) {
                    return true;
                } else {
                    return '会员等级数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
