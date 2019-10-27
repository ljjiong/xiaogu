<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserThirdAccounts extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index,batch_delete'],
    ];

    /**
     * 【admin】查询全部会员第三方账号
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

        $count = model('user_third_accounts')->getAllCount($map);
        $lists = model('user_third_accounts')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员第三方账号
     */
    public function read($id)
    {
        $this->data['data'] = model('user_third_accounts')->getOne($id);

        return $this->data;
    }

    /**
     * 【public】更新会员第三方账号
     */
    public function update(Request $request)
    {
        $data                = $request->param();
        $data['user_id']     = $this->unique_id;
        $data['client_type'] = $this->client_type;

        $validate = Loader::validate('user_third_account');
        if ($validate->scene('update')->check($data)) {
            $map = [
                'user_id'     => $this->unique_id,
                'client_type' => $this->client_type,
                'type'        => $data['type'],
            ];

            $user_third_account = model('user_third_accounts')->findOne($map);
            if ($user_third_account) {
                $data['id'] = $user_third_account['id'];
                $result     = model('user_third_accounts')->editOne($data);
            } else {
                $result = model('user_third_accounts')->addOne($data);
            }
            if ($result['code']) {
                $this->data['msg']  = '第三方账号绑定成功';
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
     * 【admin】删除会员第三方账号
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('user_third_accounts')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员第三方账号成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员第三方账号
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_third_accounts')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员第三方账号成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询会员地址列表
     */
    public function lists(Request $request)
    {
        $map['user_id'] = $this->unique_id;

        $count = model('user_third_accounts')->getAllCount($map);
        $lists = model('user_third_accounts')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
