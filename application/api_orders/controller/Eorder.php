<?php
namespace app\api_orders\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Eorder extends Rest
{
    protected $beforeActionList = [
        'checkClientType' => ['only' => 'index,submit_eorder,batch_submit_eorder'],
        'checkAuth'       => ['only' => 'index,submit_eorder,batch_submit_eorder'],
        'checkToken'      => ['only' => 'index,submit_eorder,batch_submit_eorder'],
        'checkAdmin'      => ['only' => 'index,submit_eorder,batch_submit_eorder'],
    ];

    /**
     * 【admin】查询全部可创建电子面单的订单列表
     */
    public function index(Request $request)
    {
        $map = $request->param();

        // 已发货订单可以创建电子面单
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
            } else {
                unset($map[$key]);
            }
        }

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
     * 【admin】提交单个电子面单
     */
    public function submit_eorder(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('eorder');
        if ($validate->scene('eorder')->check($data)) {

            $result = model('eorder')->submitEorder($data['order_id']);
            if ($result['code']) {
                $this->data['msg']  = '提交电子面单成功';
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
     * 【admin】批量面单
     */
    public function batch_submit_eorder(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('eorder');
        if ($validate->scene('batch_eorder')->check($data)) {
            $result = model('eorder')->batchSubmitEorder($data['order_ids']);
            if ($result['code']) {
                $this->data['msg'] = '批量提交电子面单成功';
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
     * 【admin】提交单个电子面单打印
     */
    public function print_eorder(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('eorder');
        if ($validate->scene('print')->check($data)) {

            $result = model('eorder')->printEorder($data['order_id']);
            if ($result['code']) {
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
     * 【admin】批量打印面单
     */
    public function batch_print_eorder(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('eorder');
        if ($validate->scene('batch_print')->check($data)) {

            $result = model('eorder')->batchPrintEorder($data['order_ids']);
            if ($result['code']) {
                $this->data['msg'] = '批量打印电子面单成功';
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
