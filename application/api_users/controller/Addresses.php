<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Addresses extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['only' => 'lists,set_default'],
    ];

    /**
     * 【admin】查询全部会员地址
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 收货人模糊查询
                if ($key == 'consignee_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 收货手机号模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

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

        $count = model('addresses')->getAllCount($map);
        $lists = model('addresses')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员地址
     */
    public function read($id)
    {
        $address = model('addresses')->getOne($id);
        if ($this->account_type == 'admin' || $address['user_id'] == $this->unique_id) {
            $this->data['data'] = $address;
        } else {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
        }

        return $this->data;
    }

    /**
     * 【public】新建会员地址
     */
    public function save(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['user_id'] = $this->unique_id;
        }

        $validate = Loader::validate('address');
        if ($validate->scene('create')->check($data)) {

            $result = model('addresses')->addOne($data);
            if ($result['code']) {
                model('addresses')->deal_default($result['data']['id']);

                $this->data['msg']  = '新增会员地址成功';
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
     * 【public】更新会员地址
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['user_id'] = $this->unique_id;
        }

        $validate = Loader::validate('address');
        if ($validate->scene('update')->check($data)) {

            $result = model('addresses')->editOne($data);
            if ($result['code']) {
                model('addresses')->deal_default($data['id']);

                $this->data['msg']  = '更新会员地址成功';
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
     * 【public】删除会员地址
     */
    public function delete()
    {
        $id = input('id/d', 0);

        // 校验删除权限
        $data = model('addresses')->getOne($id);
        if ($this->account_type == 'user' && $data['user_id'] != $this->unique_id) {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
            return $this->data;
        }

        $result = model('addresses')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员地址成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【public】批量删除会员地址
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        // 校验权限
        if ($this->account_type == 'user') {
            foreach ($ids as $id) {
                // 校验删除权限
                $data = model('addresses')->getOne($id);
                if ($data['user_id'] != $this->unique_id) {
                    $this->data['code'] = 400100;
                    $this->data['msg']  = '非法操作';
                    return $this->data;
                    break;
                }
            }
        }

        $result = model('addresses')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员地址成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】设置会员默认地址
     */
    public function set_default(Request $request)
    {
        $data = $request->param();
        // 校验操作权限
        $address = model('addresses')->getOne($data['id']);
        if ($this->account_type == 'user' && $address['user_id'] != $this->unique_id) {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
            return $this->data;
        }

        $validate = Loader::validate('address');
        if ($validate->scene('set_default')->check($data)) {

            $result = model('addresses')->editOne($data);
            if ($result['code']) {
                model('addresses')->deal_default($data['id']);

                $this->data['msg']  = '设置会员默认地址成功';
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
     * 【user】查询会员地址列表
     */
    public function lists(Request $request)
    {
        $map['user_id'] = $this->unique_id;

        $count = model('addresses')->getAllCount($map);
        $lists = model('addresses')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
