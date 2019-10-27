<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserCoupons extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
    ];

    /**
     * 【admin】查询全部会员优惠券
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['mobile']);
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

        $count = model('user_coupons')->getAllCount($map);
        $lists = model('user_coupons')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员优惠券
     */
    public function read($id)
    {
        $this->data['data'] = model('user_coupons')->getOne($id);

        return $this->data;
    }

    /**
     * 【address】新建会员优惠券
     */
    public function save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('user_coupon');
        if ($validate->scene('create')->check($data)) {

            $result = model('user_coupons')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '领取优惠券成功';
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
     * 【address】领取会员优惠券
     */
    public function receive(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('user_coupon');
        if ($validate->scene('receive')->check($data)) {
            $activity_coupon            = model('activity_coupons')->findOne(['coupon_no' => $data['coupon_no']]);
            $data['activity_coupon_id'] = $activity_coupon['id'];

            $result = model('user_coupons')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '领取优惠券成功';
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
     * 【admin】删除会员优惠券
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('user_coupons')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员优惠券成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员优惠券
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_coupons')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员优惠券成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】查询全部会员优惠券
     */
    public function lists(Request $request)
    {
        $map = $request->param();
        $now = date('Y-m-d H:i:s');
        if (isset($map['expiry_time'])) {
            $map['expiry_time'] = ['<= time', $now];
        }else{
            $map['expiry_time'] = ['>= time', $now];
        }

        $map['user_id'] = $this->unique_id;

        $count = model('user_coupons')->getAllCount($map);
        $lists = model('user_coupons')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
