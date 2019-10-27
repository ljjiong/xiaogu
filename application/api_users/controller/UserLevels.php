<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserLevels extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'lists'],
    ];

    /**
     * 【admin】查询全部会员等级
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

        $count = model('user_levels')->getAllCount($map);
        $lists = model('user_levels')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员等级
     */
    public function read($id)
    {
        $this->data['data'] = model('user_levels')->getOne($id);

        return $this->data;
    }

    /**
     * 【address】新建会员等级
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('user_level');
        if ($validate->scene('create')->check($data)) {

            $result = model('user_levels')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增会员等级成功';
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
     * 【public】更新会员等级
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('user_level');
        if ($validate->scene('update')->check($data)) {

            $result = model('user_levels')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员等级成功';
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
     * 【admin】删除会员等级
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('user_levels')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员等级
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_levels')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】批量上线会员等级
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_levels')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线会员等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】批量下线会员等级
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_levels')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线会员等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】查询全部会员等级
     */
    public function lists()
    {
        $map['status'] = 1;

        $count = model('user_levels')->getAllCount($map);
        $lists = model('user_levels')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
