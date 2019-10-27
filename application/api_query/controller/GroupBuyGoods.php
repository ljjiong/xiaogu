<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class GroupBuyGoods extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【admin】查询拼团商品信息
     */
    public function goods_info()
    {
        $group_buy_type = input('group_buy_type/d');
        $goods_id       = input('goods_id/d');
        if ($group_buy_type == 1) {
            $group_buy_goods = model('group_buy_system_goods')->findOne(['goods_id' => $goods_id]);
        } elseif ($group_buy_type == 2) {
            $group_buy_goods = model('group_buy_user_goods')->findOne(['goods_id' => $goods_id]);
        } else {
            $group_buy_goods = [];
        }

        if ($group_buy_goods) {
            $this->data['data'] = $group_buy_goods;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '当前团购商品已下架';
        }

        return $this->data;
    }
}
