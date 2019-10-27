<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GoodsCollections extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['except' => 'index'],
    ];

    /**
     * 【admin】查询全部商品收藏列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 商品名称模糊查询
                if ($key == 'name') {
                    $goods_ids       = model('goods')->getColumn(['name' => ['like', '%' . $value . '%']], 'id');
                    $map['goods_id'] = ['in', $goods_ids];
                    unset($map['name']);
                }
                
                // 会员手机号模糊查询
                if ($key == 'mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['mobile']);
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

        $count = model('goods_collections')->getAllCount($map);
        $lists = model('goods_collections')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个商品收藏详情
     */
    public function read($id)
    {
        $data               = model('goods_collections')->getOne($id);
        $data['user_info']  = model('users')->getOne($data['user_id']);
        $data['goods_info'] = model('goods')->getOne($data['goods_id']);

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】新建商品收藏
     */
    public function save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('goods_collection');
        if ($validate->scene('create')->check($data)) {
            $goods_collection = model('goods_collections')->findOne($data);
            if ($goods_collection) {
                $this->data['msg']  = '收藏成功';
                $this->data['data'] = $goods_collection;
            } else {
                $result = model('goods_collections')->addOne($data);
                if ($result['code']) {
                    $this->data['msg']  = '收藏成功';
                    $this->data['data'] = $result['data'];
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】批量商品收藏
     */
    public function batch_save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('goods_collection');
        if ($validate->scene('batch_create')->check($data)) {
            $result = model('goods_collections')->batchAddByGoodsIds($data);
            if ($result['code']) {
                $this->data['msg']  = '商品收藏成功';
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
     * 【admin】删除商品收藏
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('goods_collections')->delOneTrue($id);
        if ($result['code']) {
            $this->data['msg'] = '删除商品收藏成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除商品收藏
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods_collections')->delAllTrue($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除商品收藏成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询会员的商品收藏列表
     */
    public function lists(Request $request)
    {
        $map['user_id'] = $this->unique_id;

        $count = model('goods_collections')->getAllCount($map);
        $lists = model('goods_collections')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】取消商品收藏
     */
    public function cancel(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('goods_collection');
        if ($validate->scene('cancel')->check($data)) {
            $goods_collection = model('goods_collections')->findOne($data);

            $result = model('goods_collections')->delOneTrue($goods_collection['id']);
            if ($result['code']) {
                $this->data['msg']  = '取消商品收藏成功';
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

}
