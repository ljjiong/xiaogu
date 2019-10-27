<?php
namespace app\api_orders\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class TipDeliver extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkUser',
    ];

    /**
     * 【user】提醒发货
     */
    public function tip(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('tip_deliver');

        if ($validate->scene('user')->check($data)) {

            $result = model('tip_deliver')->tip($data['order_id']);
            if ($result['code']) {
                $this->data['msg']  = '提醒发货成功';
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
