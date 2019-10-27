<?php
namespace app\api_orders\validate;

use think\Validate;

class Order extends Validate
{
    protected $rule = [
        ['user_id', 'require', '会员ID不能为空'],
        ['address_id', 'require', '地址不能为空'],
        ['goods_info', 'require|array', '商品信息不能为空|商品信息值非法'],
        ['market_activity_type', 'require|in:0,discount,full,coupon', '营销活动类别不能为空|营销活动类别值非法'],
        ['market_activity_id', 'require', '营销活动ID不能为空'],
    ];

    protected $scene = [
        'create' => ['user_id', 'address_id', 'goods_info', 'market_activity_type', 'market_activity_id'],
        'view'   => ['user_id', 'address_id', 'goods_info'],
    ];
}
