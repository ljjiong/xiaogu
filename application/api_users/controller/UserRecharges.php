<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserRecharges extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index,save_by_admin'],
    ];

    /**
     * 【admin】查询全部会员充值
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

        $map['status'] = 3;

        $count = model('user_recharges')->getAllCount($map);
        $lists = model('user_recharges')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员充值
     */
    public function read($id)
    {
        $this->data['data'] = model('user_recharges')->getOne($id);

        return $this->data;
    }

    /**
     * 【address】新建会员充值
     */
    public function save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('user_recharge');
        if ($validate->scene('create')->check($data)) {

            $result = model('user_recharges')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增会员充值成功';
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
     * 【public】更新会员充值
     */
    public function update(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('user_recharge');
        if ($validate->scene('update')->check($data)) {

            $result = model('user_recharges')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员充值成功';
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
     * 【admin】删除会员充值
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('user_recharges')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员充值成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员充值
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_recharges')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员充值成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】批量拒绝充值
     */
    public function batch_not_agree(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_recharges')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拒绝充值成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】批量同意充值
     */
    public function batch_agree(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_recharges')->batchUpdate(['status' => 3], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量同意充值成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【address】管理员给会员充值
     */
    public function save_by_admin(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('user_recharge');
        if ($validate->scene('create')->check($data)) {

            $data['type']     = 9;
            $data['is_pay']   = 1;
            $data['pay_type'] = 9;
            $data['pay_time'] = date('Y-m-d H:i:s');
            $data['status']   = 3;

            $result = model('user_recharges')->addOne($data);
            if ($result['code']) {
                model('user_assets')->moneyRechargeByAdmin($data['user_id'], $data['money']);

                $this->data['msg']  = '管理员充值余额成功';
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
