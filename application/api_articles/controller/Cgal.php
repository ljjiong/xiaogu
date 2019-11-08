<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Cgal extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部案例列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 案例类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                if ($key == 'type_id') {
                    $map[$key] = $value;
                }

                // 案例标题模糊查询
                if ($key == 'title') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('cgal')->getAllCount($map);
        $lists = model('cgal')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个案例详情
     */
    public function read($id)
    {
        $this->data['data'] = model('cgal')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建案例
     */
    public function save(Request $request)
    {
        $data = $request->post();

        $validate = Loader::validate('article');
        if ($validate->scene('create')->check($data)) {

            $result = model('cgal')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增案例成功';
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
     * 【admin】更新案例
     */
    public function update(Request $request)
    {
        $data = $request->param();
        // unset($data['click_num']);

        $validate = Loader::validate('article');
        if ($validate->scene('update')->check($data)) {

            $result = model('cgal')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新案例成功';
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
     * 【admin】删除案例
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('cgal')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除案例成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除案例
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('cgal')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除案例成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线案例
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('cgal')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线案例成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线案例
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('cgal')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线案例成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】会员案例列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('cgal')->getAllCount($map);
        $lists = model('cgal')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
