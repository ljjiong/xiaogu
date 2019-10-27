<?php
namespace app\api_market\validate;

use think\Validate;

class FullRule extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '营销活动ID不能为空'],
        ['market_activity_id', 'require|checkValue:market_activity_id', '活动不能为空'],
        ['user_level_ids', 'require|array|checkValue:user_level_ids', '会员级别不能为空|会员级别值非法'],
        ['full_money', 'require|number|>=:1|checkValue:full_money', '满减额不能为空|满金额必须为数值|满金额不能小于1'],
        ['reduce_money', 'require|number|<=:full_money', '减金额不能为空|减金额必须为数值|减金额不能大于满金额'],
        ['status', 'require|in:1,2', '规则状态不能为空|活动状态值非法'],
    ];

    protected $scene = [
        'create' => ['market_activity_id', 'user_level_ids', 'full_money', 'reduce_money', 'status'],
        'update' => ['market_activity_id', 'user_level_ids', 'full_money', 'reduce_money', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $market_activity_id = input('market_activity_id');
        $id                 = input('id');

        switch ($rule) {
            case 'market_activity_id':
                $market_activity = model('market_activities')->findOne(['id' => $value, 'type' => 'full']);
                if ($market_activity) {
                    return true;
                } else {
                    return '活动不存在';
                }
                break;
            case 'user_level_ids':
                foreach ($value as $level_id) {
                    $user_level = model('user_levels')->getOne($level_id);
                    if (!$user_level) {
                        return '会员等级ID' . $level_id . '不存在';
                        break;
                    }
                }
                return true;
                break;
            case 'full_money':
                if ($this->currentScene == 'create') {
                    $full_rule = model('activity_full_rules')->findOne(['market_activity_id' => $market_activity_id, 'full_money' => $value]);
                    if ($full_rule) {
                        return '当前金额在选中活动的规则已设定';
                    } else {
                        return true;
                    }
                } elseif ($this->currentScene == 'update') {
                    $full_rule = model('activity_full_rules')->findOne(['id' => ['neq', $id], 'market_activity_id' => $market_activity_id, 'full_money' => $value]);
                    if ($full_rule) {
                        return '当前金额在选中活动的规则已设定';
                    } else {
                        return true;
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $full_rule = model('activity_full_rules')->getOne($value);
                if ($full_rule) {
                    return true;
                } else {
                    return '满减规则不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
