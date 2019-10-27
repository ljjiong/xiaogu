<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Categories extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【admin】查询全部分类树
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 分类树名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('categories')->getAllCount($map);
        $lists = model('categories')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询全部分类树列表（tree）
     */
    public function index_tree()
    {
        $data               = model('categories')->getAllTree();
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }

    /*
     * 【admin】查询一个分类树（tree）
     * */
    public function read_tree($id)
    {
        $data = model('categories')->getAllTree();
        $tree = list_to_tree($data);

        $this->data['data'] = get_one_tree($tree, $id);

        return $this->data;
    }
    /*
     * 【public】查看一个分类树(tree) 给普通用户看
     * */
    public function read_tree_user($id)
    {
        $map['status'] = 1;
        $data          = model('categories')->getAllTree($map);
        $tree          = list_to_tree($data);

        $this->data['data'] = get_one_tree($tree, $id);

        return $this->data;
    }
    /*
     * 【public】查看单条分类树详情 给普通用户看
     * */
    public function read_user($id)
    {
        $this->data['data'] = model('categories')->findOne(['id' => $id, 'status' => 1]);
        return $this->data;
    }

    /**
     * 【admin】查询单条分类树详情
     */
    public function read($id)
    {
        $this->data['data'] = model('categories')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建分类树
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('category');
        if ($validate->scene('create')->check($data)) {

            $result = model('categories')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增分类树成功';
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
     * 【admin】更新分类树
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('category');
        if ($validate->scene('update')->check($data)) {

            $result = model('categories')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新分类树成功';
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
     * 【admin】删除分类树
     */
    public function delete(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('category');
        if ($validate->scene('delete')->check($data)) {
            $result = model('categories')->delOne($data['id']);
            if ($result['code']) {
                $this->data['msg'] = '删除分类树成功';
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
     * 【admin】批量删除分类树
     */
    public function batch_delete(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('category');
        if ($validate->scene('batch_delete')->check($data)) {

            $result = model('categories')->delAll($data['id']);
            if ($result['code']) {
                $this->data['msg'] = '批量删除分类树成功';
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
     * 【admin】批量显示分类树
     */
    public function batch_show(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('categories')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量显示分类树成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量隐藏分类树
     */
    public function batch_hide(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('categories')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量隐藏分类树成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
