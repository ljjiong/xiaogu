<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class Pay extends Rest
{
    /**
     * 【user】订单统计
     */
    public function is_pay()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') === 0) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
        } elseif (strpos($order_no, 'R') === 0) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
        }

        if ($order) {
            $this->data['data'] = [
                'order_no' => $order_no,
                'is_pay'   => $order['is_pay'],
            ];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }
}
