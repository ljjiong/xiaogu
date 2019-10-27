<?php
namespace app\api_group_buy\validate;

use think\Validate;

class GroupBuyUserGoods extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '团购会员商品ID不能为空'],
        ['goods_id', 'require', '商品ID不能为空'],
        ['time_length', 'require|number|>:0', '拼团限时不能为空|拼团限时值非法|拼团限时值必须大于0'],
        ['person_num', 'require|number|>=:2', '拼团人数不能为空|拼团人数必须为整数|拼团人数不能小于2'],
        ['money', 'require|number|>=:0', '拼团价不能为空|拼团价非法|拼团价不能小于0'],
        ['stock', 'require|number|>=:0', '商品库存不能为空|商品库存值必须为整数|商品库存不能小于0'],
        ['person_buy_num', 'require|number|>=:0', '单人单笔订单限购买数量不能为空|单人单笔订单限购买数量必须为整数|单人单笔订单限购买数量不能小于0'],
        ['spec_group_info', 'array', '规格组合信息值非法'],
        ['sort', 'require|number|>=:0', '排序值不能为空|排序值必须为整数|排序值不能小于0'],
        ['status', 'require|in:1,2', '状态值不能为空|状态值非法'],
    ];

    protected $scene = [
        'create' => ['goods_id', 'time_length', 'person_num', 'money', 'stock', 'person_buy_num', 'spec_group_info', 'sort', 'status'],
        'update' => ['goods_id', 'sort', 'status'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $group_buy_user_goods = model('group_buy_user_goods')->getOne($value);
                if ($group_buy_user_goods) {
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
