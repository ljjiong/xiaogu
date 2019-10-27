<?php
namespace app\api_group_buy\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GroupBuySystemGoods extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部系统团购商品
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

        $count = model('group_buy_system_goods')->getAllCount($map);
        $lists = model('group_buy_system_goods')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条系统团购商品详情
     */
    public function read($id)
    {
        $this->data['data'] = model('group_buy_system_goods')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建系统团购商品
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('group_buy_system_goods');
        if ($validate->scene('create')->check($data)) {

            import('app.api_extend.extend.order.GroupBuy');
            $GroupBuy = new \GroupBuy();
            $result   = $GroupBuy->update_group_buy_system_goods(1, $data['goods_id'], $data['begin_time'], $data['end_time'], $data['person_num'], $data['money'], $data['stock'], $data['person_buy_num'], $data['sort'], $data['status'], $data['spec_group_info']);
            if ($result['code']) {
                $this->data['msg']  = '新增系统团购商品成功';
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
     * 【admin】更新系统团购商品
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('group_buy_system_goods');
        if ($validate->scene('update')->check($data)) {
            $update_data = [
                'id'     => $data['id'],
                'sort'   => $data['sort'],
                'status' => $data['status'],
            ];

            $result = model('group_buy_system_goods')->editOne($update_data);
            if ($result['code']) {
                $this->data['msg']  = '更新系统团购商品成功';
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
     * 【admin】删除系统团购商品
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('group_buy_system_goods')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除系统团购商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除系统团购商品
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('group_buy_system_goods')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除系统团购商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线系统团购商品
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('group_buy_system_goods')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线系统团购商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线系统团购商品
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('group_buy_system_goods')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线系统团购商品成功';
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

        $count = model('group_buy_system_goods')->getAllCount($map);
        $lists = model('group_buy_system_goods')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
