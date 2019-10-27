<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserGoodsKeywords extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
    ];

    /**
     * 【admin】查询全部会员历史搜索关键词
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
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

        $count = model('user_goods_keywords')->getAllCount($map);
        $lists = model('user_goods_keywords')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员历史搜索关键词
     */
    public function read()
    {
        if ($this->account_type == 'user') {
            $user_id = $this->unique_id;
        } else {
            $user_id = input('user_id');
        }

        $this->data['data'] = model('user_goods_keywords')->getOne($user_id);

        return $this->data;
    }

    /**
     * 【address】新建会员历史搜索关键词
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('user_goods_keyword');
        if ($validate->scene('create')->check($data)) {

            // 去除重复关键词
            $data['keywords'] = array_unique($data['keywords']);

            $result = model('user_goods_keywords')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增会员历史搜索关键词成功';
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
     * 【public】更新会员历史搜索关键词
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('user_goods_keyword');
        if ($validate->scene('update')->check($data)) {

            // 去除重复关键词
            $data['keywords'] = array_unique($data['keywords']);

            $result = model('user_goods_keywords')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员历史搜索关键词成功';
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
     * 【admin】删除会员历史搜索关键词
     */
    public function delete()
    {
        if ($this->account_type == 'user') {
            $user_id = $this->unique_id;
        } else {
            $user_id = input('user_id/d', 0);
        }
        $result = model('user_goods_keywords')->delOneTrue($user_id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员历史搜索关键词成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员历史搜索关键词
     */
    public function batch_delete(Request $request)
    {
        $user_ids = $request->param()['user_id'];

        $result = model('user_goods_keywords')->delAllTrue($user_ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员历史搜索关键词成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
