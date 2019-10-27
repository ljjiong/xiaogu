<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class FriendlyLinks extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部友情链接列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 友情链接名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 友情链接类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('friendly_links')->getAllCount($map);
        $lists = model('friendly_links')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个友情链接详情
     */
    public function read($id)
    {
        $this->data['data'] = model('friendly_links')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建友情链接
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('friendly_link');
        if ($validate->scene('create')->check($data)) {

            $result = model('friendly_links')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增友情链接成功';
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
     * 【admin】更新友情链接
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('friendly_link');
        if ($validate->scene('update')->check($data)) {

            $result = model('friendly_links')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新友情链接成功';
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
     * 【admin】删除友情链接
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('friendly_links')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除友情链接成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除友情链接
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('friendly_links')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除友情链接成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线友情链接
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('friendly_links')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线友情链接成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线友情链接
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('friendly_links')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线友情链接成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询会员友情链接列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('friendly_links')->getAllCount($map);
        $lists = model('friendly_links')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
