<?php
namespace app\api_bonus\validate;

use think\Validate;

class BonusLevel extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '分红等级ID不能为空'],
        ['rank_weight', 'require|number|checkValue:rank_weight', '等级权重不能为空|等级权重必须为数字'],
        ['level_name', 'require|checkValue:level_name', '分红等级名称不能为空'],
        ['rate', 'require|number|<=:100', '分红比例不能为空|分红比例必须为数字|分红比例不能大于100'],
        ['up_level_value', 'require', '升级条件值不能为空'],
        ['status', 'require|in:1,2', '分红等级状态值不能为空|分红等级状态值非法'],
    ];

    protected $scene = [
        'create' => ['rank_weight', 'level_name', 'rate', 'up_level_value', 'status'],
        'update' => ['rank_weight', 'level_name', 'rate', 'up_level_value', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'rank_weight':
                if ($this->currentScene == 'create') {
                    $bonus_level = model('bonus_levels', 'bonus_model')->findOne(['rank_weight' => $value]);
                } elseif ($this->currentScene == 'update') {
                    $bonus_level = model('bonus_levels', 'bonus_model')->findOne(['rank_weight' => $value, 'id' => ['neq', $id]]);
                } else {
                    return '验证场景不存在';
                }

                if ($bonus_level) {
                    return '等级权重已存在';
                } else {
                    return true;
                }
                break;
            case 'level_name':
                if ($this->currentScene == 'create') {
                    $bonus_level_name = model('bonus_levels', 'bonus_model')->findOne(['level_name' => $value]);
                } elseif ($this->currentScene == 'update') {
                    $bonus_level_name = model('bonus_levels', 'bonus_model')->findOne(['level_name' => $value, 'id' => ['neq', $id]]);
                } else {
                    return '验证场景不存在';
                }

                if ($bonus_level_name) {
                    return '分红等级名称已存在';
                } else {
                    return true;
                }
                break;
            case 'id':
                $bonus_level = model('bonus_levels', 'bonus_model')->getOne($value);
                if ($bonus_level) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
