<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Loader;
use think\Request;

class BonusOrders extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'logs'],
    ];

    /**
     * 【admin】查询全部商品分佣信息列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // // 商品分佣信息类别模糊查询
                // if ($key == 'type') {
                //     $map[$key] = ['like', '%' . $value . '%'];
                // }

                // // 商品分佣信息标题模糊查询
                // if ($key == 'title') {
                //     $map[$key] = ['like', '%' . $value . '%'];
                // }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods_bonus', 'bonus_model')->getAllCount($map);
        $lists = model('goods_bonus', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

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
        $data = model('goods_bonus', 'bonus_model')->getOne($goods_id);
        if ($data) {
            $data['bonus_info'] = model('bonus_goods_levels', 'bonus_model')->getAll(['goods_id' => $goods_id]);
        }

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】更新商品分佣信息
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
                if ($data['bonus_type'] == 2) {
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

    /**
     * 【admin】查询全部商品分佣信息列表
     */
    public function lists(Request $request)
    {
        $map = $request->param();
        if ($this->account_type == 'user') {
            $map['user_id'] = $this->unique_id;
        } else {
            if (!$map['user_id']) {
                $this->data['code'] = 0;
                $this->data['msg']  = '会员ID参数缺失';
                return $this->data;
            }
        }

        if ($this->page_num == '') {
            $this->page_num = 1;
        }

        if ($this->page_limit == '') {
            $this->page_limit = 10;
        }

        $start = ($this->page_num - 1) * $this->page_limit;
        $limit = $this->page_limit;

        if (isset($map['order_status'])) {
            $result = Db::query('
            SELECT order_id,order_status,order_goods_id,user_id,source_user_id,bonus_type,region_type FROM wancll_user_bonus_logs
            WHERE user_id = :user_id AND order_status = :order_status AND data_state = 1
            GROUP BY order_id  ORDER BY order_id
            DESC LIMIT :data_start,:page_limit',
                ['user_id' => $map['user_id'], 'order_status' => $map['order_status'], 'data_start' => $start, 'page_limit' => $limit]);

            $total_orders = Db::query('
            SELECT order_id,order_status,order_goods_id,user_id,source_user_id,bonus_type,region_type,expect_money,real_money FROM wancll_user_bonus_logs
            WHERE user_id = :user_id AND order_status = :order_status AND data_state = 1
            GROUP BY order_id  ORDER BY order_id DESC',
                ['user_id' => $map['user_id'], 'order_status' => $map['order_status']]);
        } elseif (isset($map['order_no']) && $map['order_no']) {
            $order_no        = $map['order_no'];
            $order_ids       = model('orders')->getColumn(['order_no' => ['like', '%' . $order_no . '%']], 'id');
            $order_ids_num   = count($order_ids);
            $find_orders_str = '';
            if ($order_ids_num == 0) {
                $find_orders_str = 'order_id = 0';
            } elseif ($order_ids_num == 1) {
                $find_orders_str = 'order_id = ' . $order_ids[0];
            } else {
                foreach ($order_ids as $key => $value) {
                    if ($key == 0) {
                        $find_orders_str .= '(order_id=' . $value;
                    } elseif ($key == ($order_ids_num - 1)) {
                        $find_orders_str .= ' or order_id=' . $value . ')';
                    } else {
                        $find_orders_str .= ' or order_id=' . $value;
                    }
                }
            }

            $result = Db::query('
            SELECT order_id,order_status,order_goods_id,user_id,source_user_id,bonus_type,region_type FROM wancll_user_bonus_logs
            WHERE ' . $find_orders_str . ' AND user_id = :user_id AND data_state = 1
            GROUP BY order_id  ORDER BY order_id
            DESC LIMIT :data_start,:page_limit',
                ['user_id' => $map['user_id'], 'data_start' => $start, 'page_limit' => $limit]);

            $total_orders = Db::query('
            SELECT order_id,order_status,order_goods_id,user_id,source_user_id,bonus_type,region_type,expect_money,real_money FROM wancll_user_bonus_logs
            WHERE ' . $find_orders_str . ' AND user_id = :user_id AND data_state = 1
            GROUP BY order_id  ORDER BY order_id DESC',
                ['user_id' => $map['user_id']]);
        } else {
            $result = Db::query('
            SELECT order_id,order_status,order_goods_id,user_id,source_user_id,bonus_type,region_type FROM wancll_user_bonus_logs
            WHERE user_id = :user_id AND data_state = 1
            GROUP BY order_id  ORDER BY order_id
            DESC LIMIT :data_start,:page_limit',
                ['user_id' => $map['user_id'], 'data_start' => $start, 'page_limit' => $limit]);

            $total_orders = Db::query('
            SELECT order_id,order_status,order_goods_id,user_id,source_user_id,bonus_type,region_type,expect_money,real_money FROM wancll_user_bonus_logs
            WHERE user_id = :user_id AND data_state = 1
            GROUP BY order_id  ORDER BY order_id DESC',
                ['user_id' => $map['user_id']]);
        }

        $data = [];
        foreach ($result as $key => $value) {

            $find_map = [
                'order_id' => $value['order_id'],
                'user_id'  => $map['user_id'],
            ];

            if (isset($map['order_status'])) {
                $find_map['order_status'] = $map['order_status'];
            }

            $logs = model('user_bonus_logs', 'bonus_model')->getAll($find_map);

            $result[$key]['source_user_info'] = model('users')->getUserBasicInfo($value['source_user_id']);
            $result[$key]['order_info']       = model('orders')->where('id', $value['order_id'])->field('order_no,create_time,total_money')->find();
            $result[$key]['order_goods_info'] = $logs;

            $data[] = $result[$key];
        }

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => count($total_orders),
        ];

        // 订单统计金额
        // $total_except_money = model('user_bonus_logs', 'bonus_model')->getExceptMoney(['user_id' => $this->unique_id]);
        $total_except_money = 0.00;
        foreach ($total_orders as $key => $value) {
            if ($value['order_status'] == 3) {
                $total_except_money += $value['real_money'];
            } else {
                $total_except_money += $value['expect_money'];
            }
        }

        $this->data['data'] = [
            'total_order_num'    => count($total_orders),
            'total_except_money' => round(floatval($total_except_money), 2),
            'orders'             => $data,
        ];

        return $this->data;
    }

    /**
     * 【admin】查询会员的分红日志列表
     */
    public function logs(Request $request)
    {
        $map                 = $request->param();
        $map['order_status'] = 3;

        foreach ($map as $key => $value) {
            if ($value) {
                // 订单号模糊查询
                if ($key == 'order_no') {
                    $order_ids       = model('orders')->getColumn(['order_no' => ['like', '%' . $value . '%']], 'id');
                    $map['order_id'] = ['in', $order_ids];
                    unset($map['order_no']);
                }

                // 来源会员手机号模糊查询
                if ($key == 'mobile') {
                    $user_ids              = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['source_user_id'] = ['in', $user_ids];
                    unset($map['mobile']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('user_bonus_logs', 'bonus_model')->getAllCount($map);
        $lists = model('user_bonus_logs', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
