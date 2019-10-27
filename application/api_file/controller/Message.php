<?php
namespace app\api_file\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Message extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in'],
        'checkUser'  => ['only' => 'complete_user_info,sign_in'],
    ];

    /**
     * 【admin】查询公告
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 文章标题
                if ($key == 'messageTitle') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 文章内容
                if ($key == 'content') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('welfare')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('message')->getAllCount($map);
        $lists = model('message')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    /**
     * 【admin】新建公告
     */
    public function save(Request $request)
    {
        $data        = $request->param();
        $data['uid'] = $this->unique_id;
        $validate    = Loader::validate('message');
        if ($validate->scene('create')->check($data)) {
            // 注册会员
            $result = model('message')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '添加公告成功';
                $this->data['data'] = $result;
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
     * 【public】更新公告
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'message') {
            $data['id'] = $this->unique_id;
        }

        $result = model('message')->editOne($data);
        if ($result['code']) {
            $this->data['msg']  = '更新公告成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除公告
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('message')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除公告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
