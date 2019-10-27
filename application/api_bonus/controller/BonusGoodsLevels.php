<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class BonusGoodsLevels extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部单产品等级佣金列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        // foreach ($map as $key => $value) {
        //     if ($value) {
        //         // 单产品等级佣金类别模糊查询
        //     } else {
        //         unset($map[$key]);
        //     }
        // }

        $count = model('bonus_goods_levels')->getAllCount($map);
        $lists = model('bonus_goods_levels')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个单产品等级佣金详情
     */
    public function read($id)
    {
        $this->data['data'] = model('bonus_goods_levels')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建单产品等级佣金
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('distributor_level');
        if ($validate->scene('create')->check($data)) {

            $result = model('bonus_goods_levels')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增单产品等级佣金成功';
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
     * 【admin】更新单产品等级佣金
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('distributor_level');
        if ($validate->scene('update')->check($data)) {

            $result = model('bonus_goods_levels')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新单产品等级佣金成功';
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
     * 【admin】删除单产品等级佣金
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('bonus_goods_levels')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除单产品等级佣金成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
