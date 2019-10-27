<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Goods extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'is_collect'],
        'checkUser'  => ['only' => 'is_collect'],
    ];

    /**
     * 【admin】查询商品是否被收藏
     */
    public function is_collect(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;
        $validate        = Loader::validate('collect');
        if ($validate->check($data)) {
            $goods_collect = model('goods_collections')->findOne($data);
            if ($goods_collect) {
                $data['is_collect'] = 1;
            } else {
                $data['is_collect'] = 0;
            }

            $this->data['data'] = $data;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询商品评论
     */
    public function comments(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('goods_comment');
        if ($validate->check($data)) {
            $map = [
                'goods_id' => $data['goods_id'],
                'status'   => 3,
            ];

            $count = model('goods_comments')->getAllCount($map);
            $lists = model('goods_comments')->getAll($map, $this->page_num, $this->page_limit);

            $this->data['page'] = [
                'page_num'   => $this->page_num,
                'page_limit' => $this->page_limit,
                'data_count' => $count,
            ];

            $this->data['data'] = $lists;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
}
