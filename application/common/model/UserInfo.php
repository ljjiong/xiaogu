<?php
namespace app\common\model;

/*
 *  【会员信息统计模型】
 */
class UserInfo extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_info';

    // 设置主键
    protected $pk = 'user_id';

    //类型转换
    protected $type = [
        'user_id'                           => 'integer',
        'order_num'                         => 'integer',
        'order_money'                       => 'float',
        'shop_goods'                        => 'json',
        'total_expect_commission_money'     => 'float',
        'total_real_commission_money'       => 'float',
        'already_drawcash_commission_money' => 'float',
        'wait_pay_commission_money'         => 'float',
        'total_expect_bonus_money'          => 'float',
        'total_real_bonus_money'            => 'float',
        'already_drawcash_bonus_money'      => 'float',
        'wait_pay_bonus_money'              => 'float',
        'data_state'                        => 'integer',
    ];

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['user_id', 'create_time'];

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('create_time desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('create_time desc')->select();
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        return $this->where('user_id', $id)->find();
    }

    // 新增数据
    public function addOne($param)
    {
        $result = $this->save($param);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($this->user_id), 'msg' => '添加数据成功'];
        }
    }

    // 更新数据
    public function editOne($param)
    {
        $result = $this->save($param, ['user_id' => $param['user_id']]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($param['user_id']), 'msg' => '更新数据成功'];
        }
    }

    // 批量新增数据
    public function batchEdit($param)
    {
        $result = $this->saveAll($param);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $result, 'msg' => '批量更新数据成功'];
        }
    }

    // // 更新购物数据(消费的订单总金额)
    // public function updateOrderMoney($order_id)
    // {
    //     $order = model('orders')->getOne($order_id);
    //     if ($order) {
    //         $user_consume_count = $this->getOne($order['user_id']);
    //         if ($user_consume_count) {
    //             $this->where('user_id', $order['user_id'])->setInc('order_money', ($order['total_money'] - $order['return_goods_money']));
    //         } else {
    //             $data = [
    //                 'user_id'     => $order['user_id'],
    //                 'order_money' => $order['total_money'] - $order['return_goods_money'],
    //             ];
    //             $this->save($data);
    //         }
    //     }
    // }

    // // 更新购物数据（订单数量）
    // public function updateOrderNum($order_id)
    // {
    //     $order = model('orders')->getOne($order_id);
    //     if ($order) {
    //         $user_consume_count = $this->getOne($order['user_id']);
    //         if ($user_consume_count) {
    //             $this->where('user_id', $order['user_id'])->setInc('order_num', 1);
    //         } else {
    //             $data = [
    //                 'user_id'   => $order['user_id'],
    //                 'order_num' => 1,
    //             ];
    //             $this->save($data);
    //         }
    //     }
    // }

    // // 更新购物数据（已购买的商品）
    // public function updateShopGoods($order_id)
    // {
    //     $order = model('orders')->getOne($order_id);
    //     if ($order) {
    //         $order_goods        = model('order_goods')->getAll(['order_id' => $order_id, 'return_goods_status' => ['in', '0,2']]);
    //         $user_consume_count = $this->getOne($order['user_id']);
    //         if ($user_consume_count) {
    //             $shop_goods = $user_consume_count['shop_goods'] ? $user_consume_count['shop_goods'] : [];
    //             foreach ($order_goods as $key => $value) {
    //                 if (!in_array($value['goods_id'], $shop_goods)) {
    //                     array_push($shop_goods, $value['goods_id']);
    //                 }
    //             }
    //             $this->save(['shop_goods' => $shop_goods], ['user_id' => $order['user_id']]);
    //         } else {
    //             $shop_goods = [];
    //             foreach ($order_goods as $key => $value) {
    //                 array_push($shop_goods, $value['goods_id']);
    //             }

    //             $data = [
    //                 'user_id'    => $order['user_id'],
    //                 'shop_goods' => $shop_goods,
    //             ];

    //             $this->save($data);
    //         }
    //     }
    // }

    // 更新购物数据（已购买的商品）
    public function updateOrderCount($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order) {
            $order_goods        = model('order_goods')->getAll(['order_id' => $order_id, 'return_goods_status' => ['in', '0,2']]);
            $user_consume_count = $this->getOne($order['user_id']);
            // Db::name('test')->insert(['tag' => 103]);
            if ($user_consume_count) {
                $shop_goods = $user_consume_count['shop_goods'] ? $user_consume_count['shop_goods'] : [];
                foreach ($order_goods as $key => $value) {
                    if (!in_array($value['goods_id'], $shop_goods)) {
                        array_push($shop_goods, $value['goods_id']);
                    }
                }

                $update_data = [
                    'user_id'     => $order['user_id'],
                    'shop_goods'  => $shop_goods,
                    'order_money' => $user_consume_count['order_money'] + $order['total_money'] - $order['return_goods_money'],
                    'order_num'   => $user_consume_count['order_num'] + 1,
                ];
                $this->save($update_data, ['user_id' => $order['user_id']]);
            } else {
                $shop_goods = [];
                foreach ($order_goods as $key => $value) {
                    array_push($shop_goods, $value['goods_id']);
                }
                $update_data = [
                    'user_id'     => $order['user_id'],
                    'shop_goods'  => $shop_goods,
                    'order_money' => $order['total_money'] - $order['return_goods_money'],
                    'order_num'   => 1,
                ];
                $this->save($update_data);
            }
        }
    }

    // 更新分佣金额信息
    public function updateCommission($user_id)
    {
        $user_info = $this->getOne($user_id);
        if ($user_info) {
            $total_expect_commission_money     = model('user_commission_logs', 'drp_model')->where(['user_id' => $user_id])->sum('expect_money');
            $total_real_commission_money       = model('user_commission_logs', 'drp_model')->where(['user_id' => $user_id])->sum('real_money');
            $already_drawcash_commission_money = model('user_commission_logs', 'drp_model')->where(['user_id' => $user_id, 'status' => 3])->sum('already_drawcash_money');
            $wait_pay_commission_money         = model('user_commission_logs', 'drp_model')->where(['user_id' => $user_id, 'status' => 1])->sum('real_money');

            $data = [
                'user_id'                           => $user_id,
                'total_expect_commission_money'     => $total_expect_commission_money,
                'total_real_commission_money'       => $total_real_commission_money,
                'already_drawcash_commission_money' => $already_drawcash_commission_money,
                'wait_pay_commission_money'         => $wait_pay_commission_money,
            ];

            $this->editOne($data);
        }

    }

    // 更新分销分佣金额信息
    public function updateCommissionByLogIds($log_ids = [])
    {
        $user_ids = model('user_commission_logs', 'drp_model')->where(['id' => ['in', $log_ids]])->column('user_id');

        $update_data = [];
        foreach ($user_ids as $user_id) {
            $total_expect_commission_money     = model('user_commission_logs', 'drp_model')->where(['user_id' => $user_id])->sum('expect_money');
            $total_real_commission_money       = model('user_commission_logs', 'drp_model')->where(['user_id' => $user_id])->sum('real_money');
            $already_drawcash_commission_money = model('user_commission_logs', 'drp_model')->where(['user_id' => $user_id, 'status' => 3])->sum('already_drawcash_money');
            $wait_pay_commission_money         = model('user_commission_logs', 'drp_model')->where(['user_id' => $user_id, 'status' => 1])->sum('real_money');

            $update_data[] = [
                'user_id'                           => $user_id,
                'total_expect_commission_money'     => $total_expect_commission_money,
                'total_real_commission_money'       => $total_real_commission_money,
                'already_drawcash_commission_money' => $already_drawcash_commission_money,
                'wait_pay_commission_money'         => $wait_pay_commission_money,
            ];
        }

        $this->batchEdit($update_data);
    }

    // 更新分红金额信息
    public function updateBonus($user_id)
    {
        $user_info = $this->getOne($user_id);
        if ($user_info) {
            $total_expect_bonus_money     = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id])->sum('expect_money');
            $total_real_bonus_money       = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id])->sum('real_money');
            $already_drawcash_bonus_money = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id, 'status' => 3])->sum('already_drawcash_money');
            $wait_pay_bonus_money         = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id, 'status' => 1])->sum('real_money');

            $data = [
                'user_id'                      => $user_id,
                'total_expect_bonus_money'     => $total_expect_bonus_money,
                'total_real_bonus_money'       => $total_real_bonus_money,
                'already_drawcash_bonus_money' => $already_drawcash_bonus_money,
                'wait_pay_bonus_money'         => $wait_pay_bonus_money,
            ];

            $this->editOne($data);
        }
    }

    // 更新分红金额信息
    public function updateBonusByUserIds($user_ids = [])
    {
        $user_ids = array_unique($user_ids);

        $update_data = [];
        foreach ($user_ids as $user_id) {
            $total_expect_bonus_money     = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id])->sum('expect_money');
            $total_real_bonus_money       = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id])->sum('real_money');
            $already_drawcash_bonus_money = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id, 'status' => 3])->sum('already_drawcash_money');
            $wait_pay_bonus_money         = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id, 'status' => 1])->sum('real_money');

            $update_data[] = [
                'user_id'                      => $user_id,
                'total_expect_bonus_money'     => $total_expect_bonus_money,
                'total_real_bonus_money'       => $total_real_bonus_money,
                'already_drawcash_bonus_money' => $already_drawcash_bonus_money,
                'wait_pay_bonus_money'         => $wait_pay_bonus_money,
            ];
        }

        $this->batchEdit($update_data);
    }

    // 更新分红分佣金额信息
    public function updateBonusByLogIds($log_ids = [])
    {
        $user_ids = model('user_bonus_logs', 'bonus_model')->where(['id' => ['in', $log_ids]])->column('user_id');

        $update_data = [];
        foreach ($user_ids as $user_id) {
            $total_expect_bonus_money     = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id])->sum('expect_money');
            $total_real_bonus_money       = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id])->sum('real_money');
            $already_drawcash_bonus_money = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id, 'status' => 3])->sum('already_drawcash_money');
            $wait_pay_bonus_money         = model('user_bonus_logs', 'bonus_model')->where(['user_id' => $user_id, 'status' => 1])->sum('real_money');

            $update_data[] = [
                'user_id'                      => $user_id,
                'total_expect_bonus_money'     => $total_expect_bonus_money,
                'total_real_bonus_money'       => $total_real_bonus_money,
                'already_drawcash_bonus_money' => $already_drawcash_bonus_money,
                'wait_pay_bonus_money'         => $wait_pay_bonus_money,
            ];
        }

        $this->batchEdit($update_data);
    }
}
