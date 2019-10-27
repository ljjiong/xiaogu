<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class BankCards extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['only' => 'lists'],
    ];

    /**
     * 【admin】查询全部银行卡
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
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

        $count = model('bank_cards')->getAllCount($map);
        $lists = model('bank_cards')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个银行卡
     */
    public function read($id)
    {
        $bank_card = model('bank_cards')->getOne($id);
        if ($this->account_type == 'admin' || $bank_card['user_id'] == $this->unique_id) {
            $this->data['data'] = $bank_card;
        } else {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
        }

        return $this->data;
    }

    /**
     * 【address】新建银行卡
     */
    public function save(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['user_id'] = $this->unique_id;
        }

        $validate = Loader::validate('bank_card');
        if ($validate->scene('create')->check($data)) {

            $result = model('bank_cards')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增银行卡成功';
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
     * 【public】更新银行卡
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['user_id'] = $this->unique_id;
        }

        $validate = Loader::validate('bank_card');
        if ($validate->scene('update')->check($data)) {

            $result = model('bank_cards')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新银行卡成功';
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
     * 【admin】删除银行卡
     */
    public function delete()
    {
        $id = input('id/d', 0);
        // 校验删除权限
        $data = model('bank_cards')->getOne($id);
        if ($this->account_type == 'user' && $data['user_id'] != $this->unique_id) {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
            return $this->data;
        }

        $result = model('bank_cards')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除银行卡成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除银行卡
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];
        // 校验权限
        if ($this->account_type == 'user') {
            foreach ($ids as $id) {
                // 校验删除权限
                $data = model('bank_cards')->getOne($id);
                if ($data['user_id'] != $this->unique_id) {
                    $this->data['code'] = 400100;
                    $this->data['msg']  = '非法操作';
                    return $this->data;
                    break;
                }
            }
        }

        $result = model('bank_cards')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除银行卡成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】查询全部银行卡
     */
    public function lists(Request $request)
    {
        $map['user_id'] = $this->unique_id;

        $count = model('bank_cards')->getAllCount($map);
        $lists = model('bank_cards')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
