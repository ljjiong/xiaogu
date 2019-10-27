<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class Test extends Rest
{
    // protected $beforeActionList = [
    //     'checkClientType',
    //     'checkAuth',
    // ];

    /**
     * 【user】查询PC端推荐商品配置
     */
    public function index()
    {
        $goods = model('goods_commission', 'drp_model')->getColumn(['distributor_level_id' => ['neq', 0]], 'goods_id');

        $user_info  = model('user_info')->getOne(4);
        $user_goods = $user_info['shop_goods'] ? $user_info['shop_goods'] : [];

        // if ($user_info && $user_goods) {
        //     $this->data['beta'] = 001;
        // } else {
        //     $this->data['BETA2'] = 002;
        // }

        $this->data['res'] = array_intersect($goods, $user_goods);

        $this->data['goods']      = $goods;
        $this->data['user_goods'] = $user_goods;

        return $this->data;
    }
}
