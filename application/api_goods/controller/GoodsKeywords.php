<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GoodsKeywords extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'lists'],
        'checkAdmin' => ['only' => 'index'],
    ];

    /**
     * 【admin】查询全部商品搜索关键词
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 商品搜索关键词名称模糊查询
                if ($key == 'keyword') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods_keywords')->getAllCount($map);
        $lists = model('goods_keywords')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条商品搜索关键词详情
     */
    public function read($id)
    {
        $this->data['data'] = model('goods_keywords')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建商品搜索关键词
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('goods_keyword');
        if ($validate->scene('create')->check($data)) {

            $result = model('goods_keywords')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增商品搜索关键词成功';
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
     * 【admin】更新商品搜索关键词
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('goods_keyword');
        if ($validate->scene('update')->check($data)) {

            $result = model('goods_keywords')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新商品搜索关键词成功';
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
     * 【admin】删除商品搜索关键词
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('goods_keywords')->delOneTrue($id);
        if ($result['code']) {
            $this->data['msg'] = '删除商品搜索关键词成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除商品搜索关键词
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods_keywords')->delAllTrue($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除商品搜索关键词成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询全部商品搜索关键词
     */
    public function lists(Request $request)
    {
        $lists = model('goods_keywords')->getAll([], 1, 10);

        $this->data['data'] = $lists;

        return $this->data;
    }
}
