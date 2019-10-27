<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GoodsCates extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists,lists_tree'],
        'checkAdmin' => ['except' => 'read,lists,lists_tree'],
    ];

    /**
     * 【admin】查询全部商品分类列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 商品分类名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods_cates')->getAllCount($map);
        $lists = model('goods_cates')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询全部商品分类列表
     */
    public function index_tree(Request $request)
    {
        $data               = model('goods_cates')->getAllTree();
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }

    /**
     * 【admin】查询全部商品分类列表
     */
    public function lists_tree(Request $request)
    {
        $data               = model('goods_cates')->getAllTreeUser();
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }

    /**
     * 【public】查询单个商品分类详情
     */
    public function read($id)
    {
        $this->data['data'] = model('goods_cates')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建商品分类
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('goods_cate');
        if ($validate->scene('create')->check($data)) {

            $result = model('goods_cates')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增商品分类成功';
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
     * 【admin】更新商品分类
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('goods_cate');
        if ($validate->scene('update')->check($data)) {

            $result = model('goods_cates')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新商品分类成功';
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
     * 【admin】删除商品分类
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $goods = model('goods')->findOne(['goods_cate_id'=>$id]);
        if ($goods) {
            $this->data['code'] = 0;
            $this->data['msg']  = '当前商品分类下含有商品, 不可删除';
            return $this->data;
        }
        $result = model('goods_cates')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除商品分类成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除商品分类
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];
        foreach ($ids as $id) {
            $goods = model('goods')->findOne(['goods_cate_id'=>$id]);
            if ($goods) {
                $this->data['code'] = 0;
                $this->data['msg']  = 'ID为'.$id.'的商品分类下含有商品, 不可删除';
                return $this->data;
                break;
            }
        }
        
        $result = model('goods_cates')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除商品分类成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线商品分类
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods_cates')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线商品分类成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线商品分类
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods_cates')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线商品分类成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
