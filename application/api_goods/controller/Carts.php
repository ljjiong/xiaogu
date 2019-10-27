<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Carts extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['only' => 'lists'],
    ];

    /**
     * 【admin】查询全部购物车列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 会员手机号模糊查询
                if ($key == 'user_mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['user_mobile']);
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

        $count = model('carts')->getAllCount($map);
        $lists = model('carts')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个购物车详情
     */
    public function read($id)
    {
        $this->data['data'] = model('carts')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建购物车
     */
    public function save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('cart');
        if ($validate->scene('create')->check($data)) {
            if ($data['spec_group_id_str']) {
                $cart = model('carts')->findOne(['user_id' => $data['user_id'], 'goods_id' => $data['goods_id'], 'spec_group_id_str' => $data['spec_group_id_str']]);
            } else {
                $cart = model('carts')->findOne(['user_id' => $data['user_id'], 'goods_id' => $data['goods_id'], 'spec_group_id_str' => '']);
            }
            if ($cart) {
                $data['num'] = $cart['num'] + 1;
                $data['id']  = $cart['id'];
                $result      = model('carts')->editOne($data);
                if ($result['code']) {
                    $this->data['msg']  = '添加购物车成功';
                    $this->data['data'] = $result['data'];
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
            } else {
                $result = model('carts')->addOne($data);
                if ($result['code']) {
                    $this->data['msg']  = '添加购物车成功';
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
     * 【admin】更新购物车
     */
    public function update(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('cart');
        if ($validate->scene('update')->check($data)) {
            $result = model('carts')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新购物车成功';
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
     * 【admin】删除购物车
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('carts')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除购物车成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除购物车
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('carts')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除购物车成功';
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

        $count = model('carts')->getAllCount($map);
        $lists = model('carts')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
