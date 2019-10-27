<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class Orders extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkUser',
    ];

    /**
     * 【user】正常订单统计
     */
    public function type()
    {
        $order_no = input('order_no');
        $order    = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            if ($order['user_id'] == $this->unique_id) {
                $this->data['data'] = [
                    'type' => $order['type'],
                ];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单不存在';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【user】正常订单统计
     */
    public function count()
    {
        $map['type']    = 1;
        $map['user_id'] = $this->unique_id;

        $order_goods      = model('order_goods')->getAll(['user_id' => $this->unique_id, 'return_goods_status' => 1]);
        $order_ids        = [];
        $return_goods_num = 0;
        foreach ($order_goods as $key => $value) {
            if (!in_array($value['order_id'], $order_ids)) {
                ++$return_goods_num;
                array_push($order_ids, $value['order_id']);
            }
        }

        $map['status']              = 1;
        $wait_pay_num               = model('orders')->getAllCount($map);
        $map['status']              = 2;
        $wait_ship_num              = model('orders')->getAllCount($map);
        $map['status']              = 3;
        $wait_finish_num            = model('orders')->getAllCount($map);
        $map['status']              = 4;
        $map['is_comment']          = 0;
        $map['is_all_return_goods'] = 0;
        $wait_comment_num           = model('orders')->getAllCount($map);

        $data = [
            'wait_pay_num'     => $wait_pay_num,
            'wait_ship_num'    => $wait_ship_num,
            'wait_finish_num'  => $wait_finish_num,
            'wait_comment_num' => $wait_comment_num,
            'return_goods_num' => $return_goods_num,
        ];
        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【user】积分商城订单统计
     */
    public function score_shop_count()
    {
        $map['type']    = 2;
        $map['user_id'] = $this->unique_id;

        $order_goods      = model('order_goods')->getAll(['user_id' => $this->unique_id, 'return_goods_status' => 1]);
        $order_ids        = [];
        $return_goods_num = 0;
        foreach ($order_goods as $key => $value) {
            if (!in_array($value['order_id'], $order_ids)) {
                ++$return_goods_num;
                array_push($order_ids, $value['order_id']);
            }
        }

        $map['status']              = 1;
        $wait_pay_num               = model('orders')->getAllCount($map);
        $map['status']              = 2;
        $wait_ship_num              = model('orders')->getAllCount($map);
        $map['status']              = 3;
        $wait_finish_num            = model('orders')->getAllCount($map);
        $map['status']              = 4;
        $map['is_comment']          = 0;
        $map['is_all_return_goods'] = 0;
        $wait_comment_num           = model('orders')->getAllCount($map);

        $data = [
            'wait_pay_num'     => $wait_pay_num,
            'wait_ship_num'    => $wait_ship_num,
            'wait_finish_num'  => $wait_finish_num,
            'wait_comment_num' => $wait_comment_num,
            'return_goods_num' => $return_goods_num,
        ];
        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【user】团购订单统计
     */
    public function group_shop_count()
    {
        $map['type']    = ['in', '3,4'];
        $map['user_id'] = $this->unique_id;

        $order_goods      = model('order_goods')->getAll(['user_id' => $this->unique_id, 'return_goods_status' => 1]);
        $order_ids        = [];
        $return_goods_num = 0;
        foreach ($order_goods as $key => $value) {
            if (!in_array($value['order_id'], $order_ids)) {
                ++$return_goods_num;
                array_push($order_ids, $value['order_id']);
            }
        }

        $map['status']              = 1;
        $wait_pay_num               = model('orders')->getAllCount($map);
        $map['status']              = 2;
        $map['group_buy_status']    = 1;
        $wait_team_num              = model('orders')->getAllCount($map);
        $map['group_buy_status']    = 3;
        $wait_ship_num              = model('orders')->getAllCount($map);
        $map['status']              = 3;
        $wait_finish_num            = model('orders')->getAllCount($map);
        $map['status']              = 4;
        $map['is_comment']          = 0;
        $map['is_all_return_goods'] = 0;
        $wait_comment_num           = model('orders')->getAllCount($map);

        $data = [
            'wait_pay_num'     => $wait_pay_num,
            'wait_team_num'    => $wait_team_num,
            'wait_ship_num'    => $wait_ship_num,
            'wait_finish_num'  => $wait_finish_num,
            'wait_comment_num' => $wait_comment_num,
            'return_goods_num' => $return_goods_num,
        ];
        $this->data['data'] = $data;

        return $this->data;
    }
}
