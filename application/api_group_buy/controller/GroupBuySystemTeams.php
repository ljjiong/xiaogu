<?php
namespace app\api_group_buy\controller;

use app\api_init\controller\Rest;
use think\Request;

class GroupBuySystemTeams extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【admin】查询全部团队
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

        $map['group_buy_type'] = 1;

        $count = model('group_buy_teams')->getAllCount($map);
        $lists = model('group_buy_teams')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【user】查询待拼团团队
     */
    public function lists(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 会员手机号模糊查询
                if ($key == 'goods_name') {
                    $goods_ids       = model('goods')->getColumn(['name' => ['like', '%' . $value . '%']], 'id');
                    $map['goods_id'] = ['in', $goods_ids];
                    unset($map['goods_name']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $map['group_buy_type'] = 1;
        $map['status']         = 1;

        $count = model('group_buy_teams')->getAllCount($map);
        $lists = model('group_buy_teams')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
