<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Advertisements extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部广告列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 广告名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 广告类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('advertisements')->getAllCount($map);
        $lists = model('advertisements')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个广告详情
     */
    public function read($id)
    {
        $this->data['data'] = model('advertisements')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建广告
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('advertisement');
        if ($validate->scene('create')->check($data)) {

            $result = model('advertisements')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增广告成功';
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
     * 【admin】更新广告
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('advertisement');
        if ($validate->scene('update')->check($data)) {

            $result = model('advertisements')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新广告成功';
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
     * 【admin】删除广告
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('advertisements')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除广告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除广告
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('advertisements')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除广告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线广告
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('advertisements')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线广告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线广告
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('advertisements')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线广告成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询广告列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('advertisements')->getAllCount($map);
        $lists = model('advertisements')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
