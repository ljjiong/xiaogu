<?php
namespace app\api_market\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Coupons extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read'],
    ];

    /**
     * 【admin】查询全部优惠券列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // // 优惠券类别模糊查询
                // if ($key == 'type') {
                //     $map[$key] = ['like', '%' . $value . '%'];
                // }

                // // 优惠券名称模糊查询
                // if ($key == 'name') {
                //     $map[$key] = ['like', '%' . $value . '%'];
                // }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('activity_coupons')->getAllCount($map);
        $lists = model('activity_coupons')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个优惠券详情
     */
    public function read($id)
    {
        $this->data['data'] = model('activity_coupons')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建优惠券
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('coupon');
        if ($validate->scene('create')->check($data)) {

            $result = model('activity_coupons')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增优惠券成功';
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
     * 【admin】更新优惠券
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('coupon');
        if ($validate->scene('update')->check($data)) {

            $result = model('activity_coupons')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新优惠券成功';
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
     * 【admin】删除优惠券
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('activity_coupons')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除优惠券成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除优惠券
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('activity_coupons')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除优惠券成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线优惠券
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('activity_coupons')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线优惠券成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线优惠券
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('activity_coupons')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线优惠券成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
