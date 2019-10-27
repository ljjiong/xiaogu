<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GoodsComments extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index,batch_pass,batch_no_pass'],
        'checkUser'  => ['only' => 'lists'],
    ];

    /**
     * 【admin】查询全部商品评论列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
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

                // 商品名称模糊搜索
                if ($key == 'name') {
                    $goods_ids       = model('goods')->getColumn(['name' => ['like', '%' . $value . '%']], 'id');
                    $map['goods_id'] = ['in', $goods_ids];
                    unset($map['name']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods_comments')->getAllCount($map);
        $lists = model('goods_comments')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个商品评论详情
     */
    public function read($id)
    {
        $data = model('goods_comments')->getOne($id);
        if ($data) {
            $data['user_info']  = model('users')->getOne($data['user_id']);
            $data['goods_info'] = model('goods')->getOne($data['goods_id']);
        }

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】新建商品评论
     */
    public function save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('goods_comment');
        if ($validate->scene('create')->check($data)) {

            $result = model('goods_comments')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增商品评论成功';
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
     * 【admin】更新商品评论
     */
    public function update(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('goods_comment');
        if ($validate->scene('update')->check($data)) {

            $result = model('goods_comments')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新商品评论成功';
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
     * 【admin】删除商品评论
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('goods_comments')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除商品评论成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除商品评论
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods_comments')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除商品评论成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量审核评论通过
     */
    public function batch_pass(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods_comments')->batchUpdate(['status' => 3], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量审核通过评论成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量审核评论不通过
     */
    public function batch_no_pass(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods_comments')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量审核不通过评论成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】查询会员商品评论列表
     */
    public function lists(Request $request)
    {
        $map['user_id'] = $this->unique_id;

        $count = model('goods_comments')->getAllCount($map);
        $lists = model('goods_comments')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
