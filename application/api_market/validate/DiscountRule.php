<?php
namespace app\api_market\validate;

use think\Validate;

class DiscountRule extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '营销活动ID不能为空'],
        ['market_activity_id', 'require|checkValue:market_activity_id', '活动不能为空'],
        ['goods_id', 'require|checkValue:goods_id', '商品不能为空'],
        ['discount_price', 'require|number|>=:0', '限时折扣价不能为空|限时折扣价必须为数值|限时折扣价不能小于0'],
        ['user_level_ids', 'require|array|checkValue:user_level_ids', '会员级别不能为空|会员级别值非法'],
        ['user_limit_buy_num', 'require|number|>=:1', '单个会员限购数量不能为空|单个会员限购数量必须为数值|单个会员限购数量不能小于1'],
        ['total_goods_num', 'require|number|>=:1', '总共可售出的商品数量不能为空|总共可售出的商品数量必须为数值|总共可售出的商品数量不能小于1'],
        ['status', 'require|in:1,2', '规则状态不能为空|活动状态值非法'],
    ];

    protected $scene = [
        'create' => ['market_activity_id', 'goods_id', 'discount_price', 'user_level_ids', 'user_limit_buy_num', 'total_goods_num', 'status'],
        'update' => ['market_activity_id', 'goods_id', 'discount_price', 'user_level_ids', 'user_limit_buy_num', 'total_goods_num', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $market_activity_id = input('market_activity_id');
        $id                 = input('id');

        switch ($rule) {
            case 'market_activity_id':
                $market_activity = model('market_activities')->findOne(['id' => $value, 'type' => 'discount']);
                if ($market_activity) {
                    return true;
                } else {
                    return '活动不存在';
                }
                break;
            case 'goods_id':
                $goods = model('goods')->getOne($value);
                if ($goods) {
                    if ($this->currentScene == 'create') {
                        $discount_rule = model('activity_discount_rules')->findOne(['market_activity_id' => $market_activity_id, 'goods_id' => $value]);
                        if ($discount_rule) {
                            return '当前商品在选中活动的规则已设定';
                        } else {
                            return true;
                        }
                    } elseif ($this->currentScene == 'update') {
                        $discount_rule = model('activity_discount_rules')->findOne(['id' => ['neq', $id], 'market_activity_id' => $market_activity_id, 'goods_id' => $value]);
                        if ($discount_rule) {
                            return '当前商品在选中活动的规则已设定';
                        } else {
                            return true;
                        }
                    }else{
                        return true;
                    }
                } else {
                    return '商品不存在';
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
            case 'id':
                $discount_rule = model('activity_discount_rules')->getOne($value);
                if ($discount_rule) {
                    return true;
                } else {
                    return '限时折扣规则不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
