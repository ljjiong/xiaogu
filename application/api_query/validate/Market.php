<?php
namespace app\api_query\validate;

use think\Validate;

class Market extends Validate
{
    protected $rule = [
        ['money', 'require|number', '商品总价不能为空|商品总价格式错误'],
        ['goods_ids', 'require|array', '商品信息不能为空|商品信息值非法'],
    ];

    protected $scene = [
        'check' => ['money', 'goods_ids'],
    ];
}
