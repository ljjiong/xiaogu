<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Annoncements extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        // 'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部公告列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 公告标题模糊查询
                if ($key == 'title') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 公告类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('annoncements')->getAllCount($map);
        $lists = model('annoncements')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个公告详情
     */
    public function read($id)
    {
        $this->data['data'] = model('annoncements')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建公告
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('annoncement');
        if ($validate->scene('create')->check($data)) {

            $result = model('annoncements')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增公告成功';
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
     * 【admin】更新公告
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);
        $validate = Loader::validate('annoncement');
        if ($validate->scene('update')->check($data)) {

            $result = model('annoncements')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新公告成功';
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
     * 【admin】删除公告
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('annoncements')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除公告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除公告
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('annoncements')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除公告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线公告
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('annoncements')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线公告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线公告
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('annoncements')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线公告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询公告列表
     */
    public function lists(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                if ($key == 'uid') {
                    $map['project_member'] = ['like', '%' . $value . '%'];
                    unset($map['uid']);
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['status'] = 1;

        $count = model('annoncements')->getAllCount($map);
        $lists = model('annoncements')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }


}
