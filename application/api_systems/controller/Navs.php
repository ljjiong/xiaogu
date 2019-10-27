<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Navs extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【admin】查询全部菜单
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 菜单名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('navs')->getAllCount($map);
        $lists = model('navs')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询全部菜单列表（tree）
     */
    public function index_tree(Request $request)
    {
        $data               = model('navs')->getAllTree();
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }

    /**
     * 【public】查询单条菜单详情
     */
    public function read($id)
    {
        $this->data['data'] = model('navs')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建菜单
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('nav');
        if ($validate->scene('create')->check($data)) {

            $result = model('navs')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增菜单成功';
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
     * 【admin】更新菜单
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('nav');
        if ($validate->scene('update')->check($data)) {

            $result = model('navs')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新菜单成功';
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
     * 【admin】删除菜单
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('navs')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除菜单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除菜单
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('navs')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除菜单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量显示菜单
     */
    public function batch_show(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('navs')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量显示菜单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量隐藏菜单
     */
    public function batch_hide(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('navs')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量隐藏菜单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
