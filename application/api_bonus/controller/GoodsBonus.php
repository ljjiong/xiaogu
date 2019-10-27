<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GoodsBonus extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部商品分红信息列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 商品名称模糊查询
                if ($key == 'goods_name') {
                    $ids = model('goods')->where(['name'=>['like','%'.$value.'%']])->column('id');
                    $map['goods_id'] = ['in', $ids];
                    unset($map['goods_name']);
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods_bonus', 'bonus_model')->getAllCount($map);
        $lists = model('goods_bonus', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);
        foreach ($lists as $key => $value) {
            $lists[$key]['bonus_info'] = model('bonus_goods_levels', 'bonus_model')->getAll(['goods_id' => $value['goods_id']]);
        }

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个商品分红信息详情
     */
    public function read($goods_id)
    {
        $data = model('goods_bonus', 'bonus_model')->getOne($goods_id);
        if ($data) {
            $data['bonus_info'] = model('bonus_goods_levels', 'bonus_model')->getAll(['goods_id' => $goods_id]);
        }

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】删除商品分红信息
     */
    public function delete()
    {
        $id     = input('goods_id/d', 0);
        $result = model('goods_bonus', 'bonus_model')->delOneTrue($id);
        if ($result['code']) {
            $this->data['msg'] = '删除商品分红信息成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除分红信息
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['goods_id'];

        $result = model('goods_bonus', 'bonus_model')->delAllTrue($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除商品分红信息成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】更新商品分红信息
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('goods_bonus');
        if ($validate->scene('update')->check($data)) {
            $goods_bonus = model('goods_bonus', 'bonus_model')->getOne($data['goods_id']);
            if ($goods_bonus) {
                $result = model('goods_bonus', 'bonus_model')->editOne($data);
            } else {
                $result = model('goods_bonus', 'bonus_model')->addOne($data);
            }

            if ($result['code']) {
                if ($data['bonus_type'] == 1) {
                    foreach ($data['bonus_info'] as $key => $value) {
                        if (isset($value['id'])) {
                            model('bonus_goods_levels', 'bonus_model')->batchEdit($data['bonus_info']);
                        } else {
                            model('bonus_goods_levels', 'bonus_model')->batchAdd($data['bonus_info']);
                        }
                        break;
                    }
                } else {
                    model('bonus_goods_levels', 'bonus_model')->batchDelByGoodsId($data['goods_id']);
                }

                $this->data['msg']  = '更新商品分红信息成功';
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
