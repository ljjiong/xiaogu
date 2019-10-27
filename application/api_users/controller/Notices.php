<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Notices extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['only' => 'lists'],
    ];

    /**
     * 【admin】查询全部通知
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

        $count = model('notices')->getAllCount($map);
        $lists = model('notices')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个通知
     */
    public function read($id)
    {
        $this->data['data'] = model('notices')->getOne($id);

        return $this->data;
    }

    /**
     * 【address】新建通知
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        //查询用户id
        $user_info = model('users')->getOneByGuid($data['mobile']);

        if(!$user_info){
            $this->data['code'] = 0;
            $this->data['msg']  = '用户不存在';
            return $this->data;
        }

        $data['user_id'] = $user_info['id'];
        $validate = Loader::validate('notice');
        if ($validate->scene('create')->check($data)) {

            $result = model('notices')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增通知成功';
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
     * 【public】更新通知
     */
    public function update(Request $request)
    {
        $data = $request->param();
        $validate = Loader::validate('notice');
        if ($validate->scene('update')->check($data)) {

            $result = model('notices')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新通知成功';
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
     * 【admin】删除通知
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('notices')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除通知成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除通知
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('notices')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除通知成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量显示通知
     */
    public function batch_show(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('notices')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量显示通知成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量隐藏通知
     */
    public function batch_hide(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('notices')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量隐藏通知成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询全部通知
     */
    public function lists(Request $request)
    {
        $map            = $request->param();
        $map['user_id'] = $this->unique_id;

        $count = model('notices')->getAllCount($map);
        $lists = model('notices')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
