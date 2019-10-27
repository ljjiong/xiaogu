<?php
namespace app\api_drp\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GoodsCommission extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部商品分佣信息列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 商品分佣信息类别模糊查询
                if ($key == 'goods_name') {
                    $ids = model('goods')->where(['name'=>['like','%'.$value.'%']])->column('id');
                    $map['goods_id'] = ['in', $ids];
                    unset($map['goods_name']);
                }

                // 商品分佣信息标题模糊查询
                // if ($key == 'title') {
                //     $map[$key] = ['like', '%' . $value . '%'];
                // }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods_commission', 'drp_model')->getAllCount($map);
        $lists = model('goods_commission', 'drp_model')->getAll($map, $this->page_num, $this->page_limit);
        foreach ($lists as $key => $value) {
            $lists[$key]['commission_info'] = model('commission_goods_levels', 'drp_model')->getAll(['goods_id' => $value['goods_id']]);
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
     * 【public】查询单个商品分佣信息详情
     */
    public function read($goods_id)
    {
        $data = model('goods_commission', 'drp_model')->getOne($goods_id);
        if ($data) {
            $data['commission_info'] = model('commission_goods_levels', 'drp_model')->getAll(['goods_id' => $goods_id]);
        }

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】删除商品分佣信息
     */
    public function delete()
    {
        $id     = input('goods_id/d', 0);
        $result = model('goods_commission', 'drp_model')->delOneTrue($id);
        if ($result['code']) {
            $this->data['msg'] = '删除商品分佣信息成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除分佣信息
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['goods_id'];

        $result = model('goods_commission', 'drp_model')->delAllTrue($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除商品分佣信息成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】更新商品分佣信息
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('goods_commission');
        if ($validate->scene('update')->check($data)) {
            $goods_commission = model('goods_commission', 'drp_model')->getOne($data['goods_id']);
            if ($goods_commission) {
                $result = model('goods_commission', 'drp_model')->editOne($data);
            } else {
                $result = model('goods_commission', 'drp_model')->addOne($data);
            }

            if ($result['code']) {
                if ($data['commission_type'] == 2) {
                    foreach ($data['commission_info'] as $key => $value) {
                        if (isset($value['id'])) {
                            model('commission_goods_levels', 'drp_model')->batchEdit($data['commission_info']);
                        } else {
                            model('commission_goods_levels', 'drp_model')->batchAdd($data['commission_info']);
                        }
                        break;
                    }
                } else {
                    model('commission_goods_levels', 'drp_model')->batchDelByGoodsId($data['goods_id']);
                }

                $this->data['msg']  = '更新商品分佣信息成功';
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
