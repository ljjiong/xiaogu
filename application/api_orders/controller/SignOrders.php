<?php
namespace app\api_orders\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class SignOrders extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'user_sign'],
        'checkUser'  => ['only' => 'user_sign'],
    ];

    /**
     * 【admin】查询全部待签收订单列表
     */
    public function index(Request $request)
    {
        $map = $request->param();

        // 待签收订单
        $map['status'] = 3;

        foreach ($map as $key => $value) {
            if ($value) {
                // 会员手机号模糊查询
                if ($key == 'user_mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['user_mobile']);
                }

                // 会员昵称模糊查询
                if ($key == 'nick_name') {
                    $user_ids       = model('users')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['nick_name']);
                }

                // 订单号模糊查询
                if ($key == 'order_no') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $map['type'] = 1;

        $count = model('orders')->getAllCount($map);
        $lists = model('orders')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【user】会员签收订单
     */
    public function user_sign(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('sign_order');

        if ($validate->scene('user')->check($data)) {

            $result = model('sign_order')->sign($data['order_id']);
            if ($result['code']) {
                $this->data['msg']  = '签收成功';
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

    /**
     * 【admin】管理员签收订单
     */
    public function admin_sign(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('sign_order');
        if ($validate->scene('admin')->check($data)) {

            $result = model('sign_order')->sign($data['order_id']);
            if ($result['code']) {
                $this->data['msg']  = '签收成功';
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
