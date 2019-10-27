<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Banners extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部轮播图列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 轮播图名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 轮播图类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('banners')->getAllCount($map);
        $lists = model('banners')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个轮播图详情
     */
    public function read($id)
    {
        $this->data['data'] = model('banners')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建轮播图
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('banner');
        if ($validate->scene('create')->check($data)) {

            $result = model('banners')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增轮播图成功';
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
     * 【admin】更新轮播图
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('banner');
        if ($validate->scene('update')->check($data)) {

            $result = model('banners')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新轮播图成功';
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
     * 【admin】删除轮播图
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('banners')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除轮播图成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除轮播图
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('banners')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除轮播图成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线轮播图
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('banners')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线轮播图成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线轮播图
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('banners')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线轮播图成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询会员轮播图列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('banners')->getAllCount($map);
        $lists = model('banners')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
