<?php
namespace app\api_goods\validate;

use think\Validate;

class GoodsCollection extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['goods_id', 'require|checkValue:goods_id', '商品ID不能为空'],
        ['goods_ids', 'require|array|checkValue:goods_ids', '商品IDs不能为空|商品IDs值非法'],
    ];

    protected $scene = [
        'create'       => ['user_id', 'goods_id'],
        'cancel'       => ['user_id', 'goods_id'],
        'batch_create' => ['user_id', 'goods_ids'],
    ];

    protected function checkValue($value, $rule)
    {
        $goods_id  = input('goods_id');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员ID不存在';
                }
                break;
            case 'goods_id':
                $goods = model('goods')->getOne($value);
                if ($goods) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            case 'goods_ids':
                foreach ($value as $current_goods_id) {
                    $goods = model('goods')->getOne($current_goods_id);
                    if (!$goods) {
                        return '商品【' . $goods['name'] . '】已下架';
                        break;
                    }
                }
                return true;
                break;
            default:
                # code...
                break;
        }
    }
}
