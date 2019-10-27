<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class DataCounts extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询数据板信息
     */
    public function index()
    {
        $admin = model('admins')->getOne($this->unique_id);
        // { 一 } echart
        $begin_time = strtotime('-1 month');
        $end_time   = time();

        $chart        = [];
        $current_time = $begin_time;
        while ($current_time <= $end_time) {
            $current_time_str = date('Y-m-d', $current_time);

            // 查询当日成交订单数
            $map = [
                'confirm_receipt_time'     => ['like', $current_time_str . '%'],
                'status'          => 4,
                'is_has_return_goods' => 0,
            ];
            // 某个校区
            if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
            $order_money = model('orders')->getAllCount($map);

            // 查询当日总订单数
            $map = [
                'create_time' => ['like', $current_time_str . '%'],
                // 'is_pay'      => 1,
            ];
            // 某个校区
            if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
            $order_num = model('orders')->getAllCount($map);

            $chart[] = [
                'date'        => $current_time_str,
                'order_money' => $order_money,
                'order_num'   => $order_num,
            ];

            $current_time += 3600 * 24;
        }

        $today_time_str     = date('Y-m-d', time());
        $yesterday_time_str = date('Y-m-d', strtotime('-1 day'));

        // { 二 } 订单总额
        //  [1] 今日订单总额
        $map = [
            'pay_time' => ['like', $today_time_str . '%'],
            'status'      => [['neq',9], ['neq', 1]],
            'data_state'  => 1,
        ];
        $today_order_money = 0;
        $today_orders = model('orders')->getAll($map);
        foreach($today_orders as $key => $value){
          $today_order_money += $value['total_money'];
        }
        
        //  [2] 昨日订单总额
        $map = [
            'pay_time' => ['like', $yesterday_time_str . '%'],
            'status'      => [['neq',9], ['neq', 1]],
            'data_state'  => 1,
        ];
        $yesterday_order_money = 0;
        $yesterday_orders = model('orders')->getAll($map);
        foreach($yesterday_orders as $key => $value){
          $yesterday_order_money += $value['total_money'];
        }

        // { 三 } 支付订单数
        //  [1] 今日支付订单数
        $map = [
            'create_time' => ['like', $today_time_str . '%'],
            'is_pay'      => 1,
            'data_state'  => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $today_pay_num = model('orders')->getAllCount($map);
        //  [2] 昨日支付订单数
        $map = [
            'create_time' => ['like', $yesterday_time_str . '%'],
            'is_pay'      => 1,
            'data_state'  => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $yesterday_pay_num = model('orders')->getAllCount($map);

        // { 四 } 支付订单数
        //  [1] 今日支付订单数
        $map = [
            'pay_time' => ['like', $today_time_str . '%'],
            'is_pay'      => 1,
            'data_state'  => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $today_pay_num = model('orders')->getAllCount($map);
        //  [2] 昨日支付订单数
        $map = [
            'pay_time' => ['like', $yesterday_time_str . '%'],
            'is_pay'      => 1,
            'data_state'  => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $yesterday_pay_num = model('orders')->getAllCount($map);

        // { 五 } 会员数
        //  [1] 今日新增会员数
        $map = [
            'create_time' => ['like', $today_time_str . '%'],
            'data_state'  => 1,
        ];
        $today_user_num = model('users')->getAllCount($map);
        //  [2] 总会员数
        $map = [
            'data_state' => 1,
        ];
        $total_user_num = model('users')->getAllCount($map);

        // { 六 } 浏览量
        //  [1] 今日浏览量
        $map = [
            'create_time' => ['like', $today_time_str . '%'],
        ];
        $today_view_num = model('user_tokens')->getAllCount($map);
        //  [2] 昨日浏览量
        $map = [
            'create_time' => ['between time', [$yesterday_time_str, $today_time_str]],
        ];
        $yesterday_view_num = model('user_tokens')->getAllCount($map);

        // { 七 } 其他统计量
        //  [1] 今日订单数
        $map = [
            'create_time' => ['like', $today_time_str . '%'],
            'status'      => ['neq', 1],
            'data_state'  => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $today_order_num = model('orders')->getAllCount($map);
        //  [2] 未付款订单数
        $map = [
            'status'     => 1,
            'data_state' => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $wait_pay_num = model('orders')->getAllCount($map);
        //  [3] 待发货订单数
        $map = [
            'status'     => 2,
            'data_state' => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $wait_deliver_num = model('orders')->getAllCount($map);
        //  [4] 待收货订单数
        $map = [
            'status'     => 3,
            'data_state' => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $wait_receipt_num = model('orders')->getAllCount($map);
        //  [4] 退货/售后订单数
        $map = [
            'is_has_return_goods' => ['neq', 0],
            'data_state'          => 1,
        ];
        // 某个校区
        if($admin['role_ids'][0] == 6){$map['shool_id'] = $admin['id'];}
        $wait_return_num = model('orders')->getAllCount($map);

        $data = [
            'chart'       => $chart,
            'order_money' => [
                'today_order_money'     => $today_order_money,
                'yesterday_order_money' => $yesterday_order_money,
            ],
            'pay_num'     => [
                'today_pay_num'     => $today_pay_num,
                'yesterday_pay_num' => $yesterday_pay_num,
            ],
            'user_num'    => [
                'today_user_num' => $today_user_num,
                'total_user_num' => $total_user_num,
            ],
            'view_num'    => [
                'today_view_num'     => $today_view_num,
                'yesterday_view_num' => $yesterday_view_num,
            ],
            'other'       => [
                'today_order_num'  => $today_order_num,
                'wait_pay_num'     => $wait_pay_num,
                'wait_deliver_num' => $wait_deliver_num,
                'wait_receipt_num' => $wait_receipt_num,
                'wait_return_num'  => $wait_return_num,
            ],
        ];

        $this->data['data'] = $data;

        return $this->data;
    }
}
