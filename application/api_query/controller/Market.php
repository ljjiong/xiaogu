<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Market extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'user'],
    ];

    /**
     * 【user】查询营销活动（限时折扣 && 满减促销）
     */
    public function activity()
    {
        $now = date('Y-m-d H:i:s');
        $map = [
            'type'       => ['in', 'discount,full'],
            'begin_time' => ['<= time', $now],
            'end_time'   => ['> time', $now],
            'status'     => 1,
        ];
        $activities = model('market_activities')->getAll($map);

        $data = [];
        foreach ($activities as $key => $value) {
            switch ($value['type']) {
                case 'discount':
                    $data['discount'][] = $value;
                    break;
                case 'full':
                    $data['full'][] = $value;
                    break;
                default:
                    # code...
                    break;
            }
        }

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【user】查询营销活动（优惠券）
     */
    public function coupon()
    {
        $now = date('Y-m-d H:i:s');
        $map = [
            'type'       => 'coupon',
            'begin_time' => ['<= time', $now],
            'end_time'   => ['> time', $now],
            'status'     => 1,
        ];
        $activity_ids = model('market_activities')->getColumn($map, 'id');

        $map = [
            'market_activity_id' => ['in', $activity_ids],
            'expiry_time'        => ['> time', $now],
            'status'             => 1,
        ];

        $count = model('activity_coupons')->getAllCount($map);
        $lists = model('activity_coupons')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【user】查询会员可享受的活动
     */
    public function user(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('market');
        if ($validate->scene('check')->check($data)) {
            $data               = model('market_activities')->getActivityInfo($this->unique_id, $data['money'], $data['goods_ids']);
            $this->data['data'] = $data;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
}
