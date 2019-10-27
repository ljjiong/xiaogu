<?php
namespace app\api_group_buy\validate;

use think\Validate;

class Order extends Validate
{
    protected $rule = [
        ['user_id', 'require', '会员ID不能为空'],
        ['address_id', 'require', '地址不能为空'],
        ['goods_id', 'require', '商品ID不能为空'],
        ['num', 'require|number|>=:1', '商品数量不能为空|商品数量值非法|商品数量不能小于1'],
        ['order_pid', 'require', '参加团队ID不能为空'],
    ];

    protected $scene = [
        'create' => ['user_id', 'address_id', 'goods_id', 'num'],
        'view'   => ['user_id', 'address_id', 'goods_id', 'num'],
        'join'   => ['order_pid', 'user_id', 'address_id', 'goods_id', 'num'],
    ];
}
