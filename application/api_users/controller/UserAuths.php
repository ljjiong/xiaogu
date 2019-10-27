<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserAuths extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index,batch_pass_auth,batch_no_pass_auth'],
    ];

    /**
     * 【admin】查询全部会员认证
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 身份证号模糊查询
                if ($key == 'id_card') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 会员真实姓名模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

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

        $count = model('user_auths')->getAllCount($map);
        $lists = model('user_auths')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员认证
     */
    public function read($id)
    {
        $user_auth = model('user_auths')->getOne($id);
        if ($this->account_type == 'admin' || $user_auth['user_id'] == $this->unique_id) {
            $this->data['data'] = $user_auth;
        } else {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
        }

        return $this->data;
    }

    /**
     * 【address】新建会员认证
     */
    public function save(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['user_id'] = $this->unique_id;
        }

        $validate = Loader::validate('user_auth');
        if ($validate->scene('create')->check($data)) {

            $result = model('user_auths')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增会员认证成功';
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
     * 【public】更新会员认证
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['user_id'] = $this->unique_id;
        }

        $validate = Loader::validate('user_auth');
        if ($validate->scene('update')->check($data)) {

            $result = model('user_auths')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员认证成功';
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
     * 【admin】删除会员认证
     */
    public function delete()
    {
        $id = input('id/d', 0);
        // 校验删除权限
        $data = model('user_auths')->getOne($id);
        if ($this->account_type == 'user' && $data['user_id'] != $this->unique_id) {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
            return $this->data;
        }

        $result = model('user_auths')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员认证成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员认证
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];
        // 校验权限
        if ($this->account_type == 'user') {
            foreach ($ids as $id) {
                // 校验删除权限
                $data = model('user_auths')->getOne($id);
                if ($data['user_id'] != $this->unique_id) {
                    $this->data['code'] = 400100;
                    $this->data['msg']  = '非法操作';
                    return $this->data;
                    break;
                }
            }
        }

        $result = model('user_auths')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员认证成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量通过会员认证
     */
    public function batch_pass_auth(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_auths')->where(['id' => ['in', $ids]])->update(['status' => 3]);

        $this->data['msg'] = '批量通过会员认证成功';

        return $this->data;
    }

    /**
     * 【admin】批量不通过会员认证
     */
    public function batch_no_pass_auth(Request $request)
    {
        $ids = $request->param()['id'];

        $result            = model('user_auths')->where(['id' => ['in', $ids]])->update(['status' => 2]);
        $this->data['msg'] = '批量不通过会员认证成功';

        return $this->data;
    }
}
