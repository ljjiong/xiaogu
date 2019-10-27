<?php
namespace app\api_drp\validate;

use think\Validate;

class DistributorLevel extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '分销商等级ID不能为空'],
        ['rank_weight', 'require|number|checkValue:rank_weight', '等级权重不能为空|等级权重必须为数字'],
        ['level_name', 'require|checkValue:level_name', '分销商等级名称不能为空'],
        ['commission_1', 'require|number|<:100', '一级分佣比例不能为空|一级分佣比例必须为数字|一级分佣比例必须小于100'],
        ['commission_2', 'require|number|<:100', '二级分佣比例不能为空|二级分佣比例必须为数字|二级分佣比例必须小于100'],
        ['commission_3', 'require|number|<:100', '三级分佣比例不能为空|三级分佣比例必须为数字|三级分佣比例必须小于100'],
        ['status', 'require|in:1,2', '分销商等级状态值不能为空|分销商等级状态值非法'],
    ];

    protected $scene = [
        'create' => ['rank_weight', 'level_name', 'commission_1', 'commission_2', 'commission_3', 'status'],
        'update' => ['rank_weight', 'level_name', 'commission_1', 'commission_2', 'commission_3', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'rank_weight':
                if ($this->currentScene == 'create') {
                    $distributor_level = model('distributor_levels', 'drp_model')->findOne(['rank_weight' => $value]);
                } elseif ($this->currentScene == 'update') {
                    $distributor_level = model('distributor_levels', 'drp_model')->findOne(['rank_weight' => $value, 'id' => ['neq', $id]]);
                } else {
                    return '验证场景不存在';
                }

                if ($distributor_level) {
                    return '等级权重已存在';
                } else {
                    return true;
                }
                break;
            case 'level_name':
                if ($this->currentScene == 'create') {
                    $distributor_level_name = model('distributor_levels', 'drp_model')->findOne(['level_name' => $value]);
                } elseif ($this->currentScene == 'update') {
                    $distributor_level_name = model('distributor_levels', 'drp_model')->findOne(['level_name' => $value, 'id' => ['neq', $id]]);
                } else {
                    return '验证场景不存在';
                }

                if ($distributor_level_name) {
                    return '分销商等级名称已存在';
                } else {
                    return true;
                }
                break;
            case 'id':
                $distributor_level = model('distributor_levels', 'drp_model')->getOne($value);
                if ($distributor_level) {
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
