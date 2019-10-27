<?php
namespace app\api_score_shop\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class ScoreGoods extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部积分商品
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 商品名称模糊查询
                if ($key == 'goods_name') {
                    $goods_ids       = model('goods')->getColumn(['name' => ['like', '%' . $value . '%']], 'id');
                    $map['goods_id'] = ['in', $goods_ids];
                    unset($map['goods_name']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('score_goods')->getAllCount($map);
        $lists = model('score_goods')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条积分商品详情
     */
    public function read($id)
    {
        $this->data['data'] = model('score_goods')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建积分商品
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('score_goods');
        if ($validate->scene('create')->check($data)) {

            import('app.api_extend.extend.order.ScoreShop');
            $ScoreShop = new \ScoreShop();
            $result    = $ScoreShop->update_score_goods(1, $data['goods_id'], $data['score'], $data['money'], $data['sort'], $data['status'], $data['spec_group_info']);
            if ($result['code']) {
                $this->data['msg']  = '新增积分商品成功';
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
     * 【admin】更新积分商品
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('score_goods');
        if ($validate->scene('update')->check($data)) {

            import('app.api_extend.extend.order.ScoreShop');
            $ScoreShop = new \ScoreShop();
            $result    = $ScoreShop->update_score_goods(2, $data['goods_id'], $data['score'], $data['money'], $data['sort'], $data['status'], $data['spec_group_info']);
            if ($result['code']) {
                $this->data['msg']  = '更新积分商品成功';
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
     * 【admin】删除积分商品
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('score_goods')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除积分商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除积分商品
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('score_goods')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除积分商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线积分商品
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('score_goods')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线积分商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线积分商品
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('score_goods')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线积分商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询全部商品列表
     */
    public function lists(Request $request)
    {
        $map = $request->param();

        $map['status'] = 1;

        $count = model('score_goods')->getAllCount($map);
        $lists = model('score_goods')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
