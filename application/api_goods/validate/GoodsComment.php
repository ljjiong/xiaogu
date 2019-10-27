<?php
namespace app\api_goods\validate;

use think\Validate;

class GoodsComment extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '商品评论ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['order_id', 'require', '订单ID不能为空'],
        ['goods_id', 'require', '商品ID不能为空'],
        ['imgs', 'array', '评论图片格式错误'],
        ['score', 'require|in:1,2,3,4,5', '商品评分不能为空|商品评分值非法'],
        ['status', 'require|in:1,2,3', '商品评论状态不能为空|商品评论状态值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'order_id', 'goods_id', 'imgs', 'score', 'status'],
        'update' => ['user_id', 'order_id', 'goods_id', 'imgs', 'score', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $order_id = input('order_id');
        $goods_id = input('goods_id');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    $order = model('orders')->findOne(['id' => $order_id, 'user_id' => $value]);
                    if ($order) {
                        $order_goods = model('order_goods')->findOne(['order_id' => $order_id, 'goods_id' => $goods_id]);
                        if ($order_goods) {
                            if ($order_goods['is_comment'] == 1) {
                                return '当前订单商品已评论';
                            } else {
                                return true;
                            }
                        } else {
                            return '订单商品ID不存在';
                        }
                    } else {
                        return '订单ID不存在';
                    }
                } else {
                    return '会员ID不存在';
                }
                break;
            case 'id':
                $goods_comment = model('goods_comments')->getOne($value);
                if ($goods_comment) {
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
