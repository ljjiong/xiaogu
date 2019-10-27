<?php
namespace app\api_orders\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class CancelOrders extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkUser',
    ];

    /**
     * 【user】会员取消订单
     */
    public function user_cancel(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('cancel_order');

        if ($validate->scene('user')->check($data)) {

            $result = model('cancel_order')->cancel($data['order_id'], $data['cancel_reason']);
            if ($result['code']) {
                $this->data['msg']  = '取消订单成功';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
}
