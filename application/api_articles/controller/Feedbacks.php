<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Feedbacks extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'save'],
    ];

    /**
     * 【admin】查询全部反馈列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 反馈标题模糊查询
                if ($key == 'title') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 反馈会员联系方式模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 反馈会员邮箱模糊查询
                if ($key == 'email') {
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

        $count = model('feedbacks')->getAllCount($map);
        $lists = model('feedbacks')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个反馈详情
     */
    public function read($id)
    {
        $this->data['data'] = model('feedbacks')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建反馈
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('feedback');
        if ($validate->scene('create')->check($data)) {

            $result = model('feedbacks')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增反馈成功';
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
     * 【admin】更新反馈
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('feedback');
        if ($validate->scene('update')->check($data)) {

            $result = model('feedbacks')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新反馈成功';
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
     * 【admin】删除反馈
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('feedbacks')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除反馈成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除反馈
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('feedbacks')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除反馈成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量确认处理反馈
     */
    public function batch_deal(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('feedbacks')->batchUpdate(['is_deal' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量确认处理反馈成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
