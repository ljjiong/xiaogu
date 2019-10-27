<?php
namespace app\api_orders\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class DeliverGoods extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部发货订单列表
     */
    public function index(Request $request)
    {
        $map = $request->param();

        // 待发货订单
        $map['status'] = 2;

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
     * 【admin】添加发货信息
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('deliver_goods');
        if ($validate->scene('create')->check($data)) {

            $result = model('deliver_goods')->addDeliver($data);
            if ($result['code']) {
                $this->data['msg']  = '发货成功';
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
     * 【admin】更新发货信息
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('deliver_goods');
        if ($validate->scene('update')->check($data)) {

            $result = model('deliver_goods')->editDeliver($data);
            if ($result['code']) {
                $this->data['msg']  = '更新发货成功';
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
