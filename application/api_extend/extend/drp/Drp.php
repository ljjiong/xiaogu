<?php
/**
 *  分销系统类
 **/
class Drp
{
    //是否开启分销系统
    private $is_open;

    //分销的层级
    private $level;

    // 是否开启内购
    private $is_open_self;

    // 成为分销商的条件:无条件no，申请apply，订单数order_num，订单金额order_money，购买产品goods
    private $become_distributor_condition;

    // 成为分销商的值
    private $become_distributor_value;

    // 是否需要完善信息
    private $is_need_complete_user_info;

    // 分销商升级条件: 佣金commission_money, 自购订单金额order_money，自购订单数量order_num，团队人数team_user_num
    private $up_level_condition;

    // 分销商最小提现额
    private $min_drawcash_money;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data = include 'application/api_drp/config-drp.php';

        $this->is_open                      = $data['is_open'];
        $this->level                        = $data['level'];
        $this->is_open_self                 = $data['is_open_self'];
        $this->become_distributor_condition = $data['become_distributor_condition'];
        $this->become_distributor_value     = $data['become_distributor_value'];
        $this->is_need_complete_user_info   = $data['is_need_complete_user_info'];
        $this->up_level_condition           = $data['up_level_condition'];
        $this->min_drawcash_money           = $data['min_drawcash_money'];
    }

    /**
     * 【查询基本参数】
     */
    public function basic_info()
    {
        return [
            'is_open'            => $this->is_open,
            'level'              => $this->level,
            'is_open_self'       => $this->is_open_self,
            'up_level_condition' => $this->up_level_condition,
            'min_drawcash_money' => $this->min_drawcash_money,
        ];
    }

    /**
     * 【查询成为分销商的条件】
     */
    public function become_distributor_info()
    {
        return [
            'become_distributor_condition' => $this->become_distributor_condition,
            'become_distributor_value'     => $this->become_distributor_value,
            'is_need_complete_user_info'   => $this->is_need_complete_user_info,
        ];
    }

    /**
     * 【查询成为分销商需要购买的商品】
     */
    public function become_distributor_goods()
    {
        if ($this->become_distributor_condition == 'goods') {
            return array_values($this->become_distributor_value);
        } else {
            return [];
        }
    }

    /**
     * 【分销商升级条件信息】
     */
    public function distributor_up_level_info()
    {
        return [
            'up_level_condition' => $this->up_level_condition,
            'up_level_value'     => model('distributor_levels', 'drp_model')->getAll(),
        ];
    }

    // =================================================
    // =============成为分销商begin=====================
    // =================================================

    /**
     * 【成为分销商】
     */
    public function become_distributor($user_id, $parent_mobile = '')
    {
        if ($this->is_open == false) {
            return false;
        }

        $user = model('users')->getOne($user_id);
        if (!$user) {
            return false;
        }

        // 已经是分销商中断执行
        if ($user['is_distributor'] == true) {
            return false;
        }

        // 写入父子关系
        if ($parent_mobile) {
            $parent = model('users')->findOne(['mobile' => $parent_mobile]);
            if ($parent) {
                $parent_id = $parent['id'];
                if ($parent['parent_ids']) {
                    $parent_ids = $parent['parent_ids'] . $parent_id . '#';
                } else {
                    $parent_ids = '#' . $parent_id . '#';
                }

                if (!$user['parent_id']) {
                    $data = [
                        'id'         => $user_id,
                        'parent_id'  => $parent_id,
                        'parent_ids' => $parent_ids,
                    ];
                    model('users')->editOne($data);
                }
            }
        }

        switch ($this->become_distributor_condition) {
            case 'no':
                # 默认向下执行
                break;
            case 'apply':
                # 判断申请是否通过，不通过阻断执行
                $user_apply_distributor = model('user_apply_distributor', 'drp_model')->findOne(['user_id' => $user_id, 'status' => 3]);
                if (!$user_apply_distributor) {
                    return false;
                }
                break;
            case 'order_num':
                # 判断订单数是否达到要求，未达到阻断执行
                $user_info = model('user_info')->getOne($user_id);
                if ($user_info) {
                    if (intval($user_info['order_num']) < $this->become_distributor_value) {
                        return false;
                    }
                } else {
                    return false;
                }
                break;
            case 'order_money':
                # 判断订单金额是否达到要求，未达到阻断执行
                $user_info = model('user_info')->getOne($user_id);
                if ($user_info) {
                    if (intval($user_info['order_money']) < $this->become_distributor_value) {
                        return false;
                    }
                } else {
                    return false;
                }
                break;
            case 'goods':
                # 判断是否购买指定商品，未购买阻断执行
                $goods     = array_values($this->become_distributor_value);
                $user_info = model('user_info')->getOne($user_id);
                if ($user_info) {
                    $user_shop_goods = $user_info['shop_goods'] ? $user_info['shop_goods'] : [];
                    $result          = array_intersect($goods, $user_shop_goods);
                    if (count($result) == 0) {
                        return false;
                    }
                } else {
                    return false;
                }
                break;
            default:
                # code...
                break;
        }

        // 获取初始等级最低的分销商等级ID
        $distributor_level_id = model('distributor_levels', 'drp_model')->nextLevel(0);
        if ($distributor_level_id) {
            $data = [
                'id'                      => $user_id,
                'is_distributor'          => 1,
                'distributor_level_id'    => $distributor_level_id,
                'become_distributor_time' => date('Y-m-d H:i:s'),
            ];
            model('users')->editOne($data);

            // 触发父级的团队人数升级条件
            $user      = model('users')->getOne($user_id);
            $parent_id = $user['parent_id'];
            while ($parent_id) {
                $this->auto_up_level($parent_id);
                $user      = model('users')->getOne($parent_id);
                $parent_id = $user['parent_id'];
            }
        }

        return true;
    }

    // =================================================
    // =============成为分销商end=======================
    // =================================================

    // =================================================
    // =============下单写入理论分佣信息begin===========
    // =================================================

    /**
     * 【计算订单的理论分佣金额】
     */
    public function count_expect_money($order_id)
    {
        if ($this->is_open == false) {
            return false;
        }

        $order = model('orders')->getOneBasic($order_id);
        if (!$order) {
            return false;
        }

        $source_user_id = $order['user_id'];
        $order_goods    = model('order_goods')->getAll(['order_id' => $order_id]);

        // 开启内购
        if ($this->is_open_self == true) {
            foreach ($order_goods as $key => $value) {
                $goods_id = $value['goods_id'];
                $user_id  = $value['user_id'];
                $money    = $value['real_price'];
                $num      = $value['num'];

                $is_distributor = model('users')->findOne(['id' => $user_id, 'is_distributor' => 1]);
                if ($is_distributor) {
                    $real_user_id = $user_id;
                } else {
                    $real_user_id = model('users')->getOneParent($user_id);
                }

                // 核实当前商品是否分销
                $result = $this->check_goods($goods_id);
                // 计算分佣
                if ($result['code']) {
                    $this->level_commisson_info($goods_id, $real_user_id, $money, $num, $order_id, $value['id'], $source_user_id, 'expect_money');
                } else {
                    continue; // 当前产品不计算分佣
                }
            }
        }

        // 不开启内购
        if ($this->is_open_self == false) {
            foreach ($order_goods as $key => $value) {
                $goods_id     = $value['goods_id'];
                $user_id      = $value['user_id'];
                $money        = $value['real_price'];
                $num          = $value['num'];
                $real_user_id = model('users')->getOneParent($user_id);
                if ($real_user_id) {
                    // 核实当前商品是否分销
                    $result = $this->check_goods($goods_id);
                    // 计算分佣
                    if ($result['code']) {
                        $this->level_commisson_info($goods_id, $real_user_id, $money, $num, $order_id, $value['id'], $source_user_id, 'expect_money');
                    } else {
                        continue; // 当前产品不计算分佣
                    }
                } else {
                    break;
                }
            }
        }
    }

    /**
     * 【计算订单的实际分佣金额】
     */
    public function count_real_money($order_id)
    {
        if ($this->is_open == false) {
            return false;
        }

        $order = model('orders')->getOneBasic($order_id);
        if (!$order) {
            return false;
        }

        $source_user_id = $order['user_id'];
        $order_goods    = model('order_goods')->getAll(['order_id' => $order_id]);

        // 开启内购
        if ($this->is_open_self == true) {
            foreach ($order_goods as $key => $value) {
                $goods_id = $value['goods_id'];
                $user_id  = $value['user_id'];
                $money    = $value['real_price'];
                $num      = $value['num'];

                $is_distributor = model('users')->findOne(['id' => $user_id, 'is_distributor' => 1]);
                if ($is_distributor) {
                    $real_user_id = $user_id;
                } else {
                    $real_user_id = model('users')->getOneParent($user_id);
                }

                // 核实当前商品是否分销
                $result = $this->check_goods($goods_id);
                // 计算分佣
                if ($result['code']) {
                    $this->level_commisson_info($goods_id, $real_user_id, $money, $num, $order_id, $value['id'], $source_user_id, 'real_money');
                } else {
                    continue; // 当前产品不计算分佣
                }
            }
        }

        // 不开启内购
        if ($this->is_open_self == false) {
            foreach ($order_goods as $key => $value) {
                $goods_id     = $value['goods_id'];
                $user_id      = $value['user_id'];
                $money        = $value['real_price'];
                $num          = $value['num'];
                $real_user_id = model('users')->getOneParent($user_id);
                if ($real_user_id) {
                    // 核实当前商品是否分销
                    $result = $this->check_goods($goods_id);
                    // 计算分佣
                    if ($result['code']) {
                        $this->level_commisson_info($goods_id, $real_user_id, $money, $num, $order_id, $value['id'], $source_user_id, 'real_money');
                    } else {
                        continue; // 当前产品不计算分佣
                    }
                } else {
                    break;
                }
            }
        }

        return true;
    }

    /**
     * 【核实商品是否分销】
     */
    public function check_goods($goods_id)
    {
        $goods_commission = model('goods_commission', 'drp_model')->getOne($goods_id);
        if ($goods_commission) {
            // 未开启分销，中断执行
            if ($goods_commission['is_open_commission'] == 0) {
                return ['code' => 0];
            } else {
                return ['code' => 1];
            }
        } else {
            return ['code' => 1];
        }
    }

    /**
     * 【核算一二三级分销信息】
     */
    public function level_commisson_info($goods_id, $user_id, $money, $num, $order_id, $order_goods_id, $source_user_id, $field)
    {
        if ($this->level == 1 || $this->level == 2 || $this->level == 3) {
            $user_id_1    = $user_id;
            $user_1_money = $this->get_goods_commission($goods_id, $user_id_1, 1, $money, $num);
        }

        if ($this->level == 2 || $this->level == 3) {
            $user_id_2    = model('users')->getOneParent($user_id_1);
            $user_2_money = $this->get_goods_commission($goods_id, $user_id_2, 2, $money, $num);
        }

        if ($this->level == 3) {
            $user_id_3    = model('users')->getOneParent($user_id_2);
            $user_3_money = $this->get_goods_commission($goods_id, $user_id_3, 3, $money, $num);
        }

        // 计算理论分佣金额（下单之后计算）
        if ($field == 'expect_money') {
            $data = [];
            if ($this->level == 1 || $this->level == 2 || $this->level == 3) {
                if ($user_1_money['code']) {
                    if ($user_1_money['data']['real_commission_money'] >= 0.01) {
                        $data[] = [
                            'user_id'              => $user_id_1,
                            'order_id'             => $order_id,
                            'goods_id'             => $goods_id,
                            'order_goods_id'       => $order_goods_id,
                            'level'                => 1,
                            'expect_money'         => $user_1_money['data']['real_commission_money'],
                            'real_commission_rate' => $user_1_money['data']['commission_rate'],
                            'source_user_id'       => $source_user_id,
                            'order_status'         => 1,
                        ];
                    }
                }
            }

            if ($this->level == 2 || $this->level == 3) {
                if ($user_2_money['code']) {
                    if ($user_2_money['data']['real_commission_money'] >= 0.01) {
                        $data[] = [
                            'user_id'              => $user_id_2,
                            'order_id'             => $order_id,
                            'goods_id'             => $goods_id,
                            'order_goods_id'       => $order_goods_id,
                            'level'                => 2,
                            'expect_money'         => $user_2_money['data']['real_commission_money'],
                            'real_commission_rate' => $user_2_money['data']['commission_rate'],
                            'source_user_id'       => $source_user_id,
                            'order_status'         => 1,
                        ];
                    }
                }
            }

            if ($this->level == 3) {
                if ($user_3_money['code']) {
                    if ($user_3_money['data']['real_commission_money'] >= 0.01) {
                        $data[] = [
                            'user_id'              => $user_id_3,
                            'order_id'             => $order_id,
                            'goods_id'             => $goods_id,
                            'order_goods_id'       => $order_goods_id,
                            'level'                => 3,
                            'expect_money'         => $user_3_money['data']['real_commission_money'],
                            'real_commission_rate' => $user_3_money['data']['commission_rate'],
                            'source_user_id'       => $source_user_id,
                            'order_status'         => 1,
                        ];
                    }
                }
            }

            model('user_commission_logs', 'drp_model')->batchAdd($data);

            if ($this->level == 1 || $this->level == 2 || $this->level == 3) {
                model('user_info')->updateCommission($user_id_1);
            }

            if ($this->level == 2 || $this->level == 3) {
                model('user_info')->updateCommission($user_id_2);
            }

            if ($this->level == 3) {
                model('user_info')->updateCommission($user_id_3);
            }
        }

        // 计算实际分佣金额（订单完成之后计算）
        if ($field == 'real_money') {
            $order_goods_data = model('order_goods')->getOne($order_goods_id);
            if ($order_goods_data && $order_goods_data['return_goods_status'] == 3) {
                $is_return_goods = 1;
            } else {
                $is_return_goods = 0;
            }

            $data = [];
            if ($this->level == 1 || $this->level == 2 || $this->level == 3) {
                if ($user_1_money['code']) {
                    $map = [
                        'user_id'        => $user_id_1,
                        'order_id'       => $order_id,
                        'goods_id'       => $goods_id,
                        'order_goods_id' => $order_goods_id,
                        'level'          => 1,
                        'source_user_id' => $source_user_id,
                    ];

                    $log = model('user_commission_logs', 'drp_model')->findOne($map);
                    if ($log) {
                        if ($is_return_goods) {
                            $data[] = [
                                'id'                   => $log['id'],
                                'real_commisson_money' => 0,
                                'real_money'           => 0,
                                'order_status'         => 3,
                            ];
                        } else {
                            $data[] = [
                                'id'                   => $log['id'],
                                'real_commisson_money' => $user_1_money['data']['commission_money'],
                                'real_money'           => $user_1_money['data']['commission_money'] * 0.01 * $log['real_commission_rate'],
                                'order_status'         => 3,
                            ];
                        }
                    }
                }
            }

            if ($this->level == 2 || $this->level == 3) {
                if ($user_2_money['code']) {
                    $map = [
                        'user_id'        => $user_id_2,
                        'order_id'       => $order_id,
                        'goods_id'       => $goods_id,
                        'order_goods_id' => $order_goods_id,
                        'level'          => 2,
                        'source_user_id' => $source_user_id,
                    ];

                    $log = model('user_commission_logs', 'drp_model')->findOne($map);
                    if ($log) {

                        if ($is_return_goods) {
                            $data[] = [
                                'id'                   => $log['id'],
                                'real_commisson_money' => 0,
                                'real_money'           => 0,
                                'order_status'         => 3,
                            ];
                        } else {
                            $data[] = [
                                'id'                   => $log['id'],
                                'real_commisson_money' => $user_2_money['data']['commission_money'],
                                'real_money'           => $user_2_money['data']['commission_money'] * 0.01 * $log['real_commission_rate'],
                                'order_status'         => 3,
                            ];
                        }
                    }
                }
            }

            if ($this->level == 3) {
                if ($user_3_money['code']) {
                    $map = [
                        'user_id'        => $user_id_3,
                        'order_id'       => $order_id,
                        'goods_id'       => $goods_id,
                        'order_goods_id' => $order_goods_id,
                        'level'          => 3,
                        'source_user_id' => $source_user_id,
                    ];

                    $log = model('user_commission_logs', 'drp_model')->findOne($map);
                    if ($log) {
                        if ($is_return_goods) {
                            $data[] = [
                                'id'                   => $log['id'],
                                'real_commisson_money' => 0,
                                'real_money'           => 0,
                                'order_status'         => 3,
                            ];
                        } else {
                            $data[] = [
                                'id'                   => $log['id'],
                                'real_commisson_money' => $user_3_money['data']['commission_money'],
                                'real_money'           => $user_3_money['data']['commission_money'] * 0.01 * $log['real_commission_rate'],
                                'order_status'         => 3,
                            ];
                        }
                    }
                }
            }

            model('user_commission_logs', 'drp_model')->batchEdit($data);

            if ($this->level == 1 || $this->level == 2 || $this->level == 3) {
                model('user_info')->updateCommission($user_id_1);
            }

            if ($this->level == 2 || $this->level == 3) {
                model('user_info')->updateCommission($user_id_2);
            }

            if ($this->level == 3) {
                model('user_info')->updateCommission($user_id_3);
            }
        }
    }

    /**
     * 【获取指定商品的分佣信息】
     */
    public function get_goods_commission($goods_id, $user_id, $level, $money, $num)
    {
        // 核实分销商身份，未通过中断执行
        $distributor_info = $this->get_distributor_info($user_id);
        if ($distributor_info['code']) {
            $user_info = $distributor_info['data'];
        } else {
            return ['code' => 0];
        }

        $goods_commission = model('goods_commission', 'drp_model')->getOne($goods_id);
        switch ($goods_commission['commission_type']) {
            case 0:
                # 不开启独立分佣
                $result = [
                    'commission_money'      => $money,
                    'commission_rate'       => $user_info['commission_' . $level],
                    'real_commission_money' => $money * floatval($user_info['commission_' . $level]) * 0.01,
                ];
                return ['code' => 1, 'data' => $result];
                break;
            case 1:
                # 启用独立分佣比例
                if ($goods_commission['commission_' . $level . '_use_type'] == 'rate') {
                    $result = [
                        'commission_money'      => $money,
                        'commission_rate'       => $goods_commission['commission_' . $level . '_value'],
                        'real_commission_money' => $money * $goods_commission['commission_' . $level . '_value'] * 0.01,
                    ];
                } elseif ($goods_commission['commission_' . $level . '_use_type'] == 'money') {
                    $result = [
                        'commission_money'      => $goods_commission['commission_' . $level . '_value'] * $num,
                        'commission_rate'       => 100,
                        'real_commission_money' => $goods_commission['commission_' . $level . '_value'] * $num,
                    ];
                } else {
                    return ['code' => 0];
                }
                return ['code' => 1, 'data' => $result];
                break;
            case 2:
                # 启用分销等级分佣比例
                $commission_goods_levels = model('commission_goods_levels', 'drp_model')->findOne(['distributor_level_id' => $user_info['id'], 'goods_id' => $goods_id]);
                if ($commission_goods_levels) {
                    if ($commission_goods_levels['commission_' . $level . '_use_type'] == 'rate') {
                        $result = [
                            'commission_money'      => $money,
                            'commission_rate'       => $commission_goods_levels['commission_' . $level . '_value'],
                            'real_commission_money' => $money * $commission_goods_levels['commission_' . $level . '_value'] * 0.01,
                        ];
                    } elseif ($commission_goods_levels['commission_' . $level . '_use_type'] == 'money') {
                        $result = [
                            'commission_money'      => $commission_goods_levels['commission_' . $level . '_value'] * $num,
                            'commission_rate'       => 100,
                            'real_commission_money' => $commission_goods_levels['commission_' . $level . '_value'] * $num,
                        ];
                    } else {
                        return ['code' => 0];
                    }

                    return ['code' => 1, 'data' => $result];
                } else {
                    return ['code' => 0];
                }
                break;
            default:
                return ['code' => 0];
                break;
        }
    }

    /**
     * 【获取指定用户的身份】
     */
    public function get_distributor_info($user_id)
    {
        $user = model('users')->getOne($user_id);
        if ($user) {
            // 未开启分销，中断执行
            if ($user['is_distributor'] == false) {
                return ['code' => 0];
            } else {
                $distributor_level = model('distributor_levels', 'drp_model')->getOne($user['distributor_level_id']);
                if ($distributor_level) {
                    return ['code' => 1, 'data' => $distributor_level];
                } else {
                    return ['code' => 0];
                }
            }
        } else {
            return ['code' => 0];
        }
    }

    /**
     * 【改变分佣的订单状态】
     */
    public function change_order_status($order_id, $status)
    {
        $user_commission_logs = model('user_commission_logs', 'drp_model')->getAll(['order_id' => $order_id]);
        $data                 = [];
        foreach ($user_commission_logs as $key => $value) {
            $data[] = [
                'id'           => $value['id'],
                'order_status' => $status,
            ];
        }

        model('user_commission_logs', 'drp_model')->batchEdit($data);
    }

    // =================================================
    // =============下单写入理论分佣信息end=============
    // =================================================

    // =================================================
    // =============查询团队信息begin===================
    // =================================================
    public function team_info($user_id, $page_num, $page_limit, $team_type = 1)
    {
        // 一级团队
        if ($this->level == 1 || $this->level == 2 || $this->level == 3) {
            $map_1 = [
                'parent_id'      => $user_id,
                'is_distributor' => 1,
            ];
            $count_1    = model('users')->getAllCount($map_1);
            $user_1_ids = model('users')->getColumn($map_1, 'id');
        } else {
            $map_1      = ['id' => 0];
            $count_1    = 0;
            $user_1_ids = [0];
        }

        // 二级团队
        if ($this->level == 2 || $this->level == 3) {
            $map_2 = [
                'parent_id'      => ['in', $user_1_ids],
                'is_distributor' => 1,
            ];
            $count_2    = model('users')->getAllCount($map_2);
            $user_2_ids = model('users')->getColumn($map_2, 'id');
        } else {
            $map_2      = ['id' => 0];
            $count_2    = 0;
            $user_2_ids = [0];
        }

        // 三级团队
        if ($this->level == 3) {
            $map_3 = [
                'parent_id'      => ['in', $user_2_ids],
                'is_distributor' => 1,
            ];
            $count_3 = model('users')->getAllCount($map_3);
        } else {
            $map_3   = ['id' => 0];
            $count_3 = 0;
        }

        switch ($team_type) {
            case 1:
                $count = $count_1;
                $lists = model('users')->getAll($map_1, $page_num, $page_limit);
                foreach ($lists as $key => $value) {
                    $lists[$key]['user_info'] = model('user_info')->getOne($value['id']);
                    $current_team_info        = self::team_info($value['id'], '', '', $this->level);
                    $lists[$key]['team_num']  = $current_team_info['data']['data_info']['team_info']['total_num'];
                }
                break;
            case 2:
                $count = $count_2;
                $lists = model('users')->getAll($map_2, $page_num, $page_limit);
                foreach ($lists as $key => $value) {
                    $lists[$key]['user_info'] = model('user_info')->getOne($value['id']);
                    $current_team_info        = self::team_info($value['id'], '', '', $this->level);
                    $lists[$key]['team_num']  = $current_team_info['data']['data_info']['team_info']['total_num'];
                }
                break;
            case 3:
                $count = $count_3;
                $lists = model('users')->getAll($map_3, $page_num, $page_limit);
                foreach ($lists as $key => $value) {
                    $lists[$key]['user_info'] = model('user_info')->getOne($value['id']);
                    $current_team_info        = self::team_info($value['id'], '', '', $this->level);
                    $lists[$key]['team_num']  = $current_team_info['data']['data_info']['team_info']['total_num'];
                }
                break;
            default:
                return ['code' => 0, 'msg' => '参数错误'];
                break;
        }

        $page_info = [
            'page_num'   => $page_num,
            'page_limit' => $page_limit,
            'data_count' => $count,
        ];

        $data_info = [
            'team_info'  => [
                'total_num'   => $count_1 + $count_2 + $count_3,
                'level_1_num' => $count_1,
                'level_2_num' => $count_2,
                'level_3_num' => $count_3,
            ],
            'team_users' => $lists,
        ];

        return ['code' => 1, 'msg' => 'success', 'data' => ['page_info' => $page_info, 'data_info' => $data_info]];
    }

    public function team_user_nums($user_id)
    {
        // 一级团队
        if ($this->level == 1 || $this->level == 2 || $this->level == 3) {
            $map_1 = [
                'parent_id'      => $user_id,
                'is_distributor' => 1,
            ];
            $count_1    = model('users')->getAllCount($map_1);
            $user_1_ids = model('users')->getColumn($map_1, 'id');
        } else {
            $count_1    = 0;
            $user_1_ids = [0];
        }

        // 二级团队
        if ($this->level == 2 || $this->level == 3) {
            $map_2 = [
                'parent_id'      => ['in', $user_1_ids],
                'is_distributor' => 1,
            ];
            $count_2    = model('users')->getAllCount($map_2);
            $user_2_ids = model('users')->getColumn($map_2, 'id');
        } else {
            $count_2    = 0;
            $user_2_ids = [0];
        }

        // 三级团队
        if ($this->level == 3) {
            $map_3 = [
                'parent_id'      => ['in', $user_2_ids],
                'is_distributor' => 1,
            ];
            $count_3 = model('users')->getAllCount($map_3);
        } else {
            $count_3 = 0;
        }

        $team_info = [
            'total_num'   => $count_1 + $count_2 + $count_3,
            'level_1_num' => $count_1,
            'level_2_num' => $count_2,
            'level_3_num' => $count_3,
        ];

        return ['code' => 1, 'msg' => 'success', 'data' => $team_info];
    }
    // =================================================
    // =============查询团队信息end=====================
    // =================================================

    // =================================================
    // =============分销商升级begin=====================
    // =================================================
    // 自动升级（含购买指定商品升级 或 达到升级条件后升级）
    public function auto_up_level($user_id)
    {
        if ($this->is_open == false) {
            return false;
        }

        $user = model('users')->getOne($user_id);

        // 会员不存在中断执行
        if (!$user) {
            return false;
        }

        // 非分销商身份中断执行
        if ($user['is_distributor'] == false) {
            return false;
        }

        // 已达最高级别中断执行
        $current_level  = model('distributor_levels', 'drp_model')->getOne($user['distributor_level_id']);
        $has_next_level = model('distributor_levels', 'drp_model')->findOne(['rank_weight' => ['>', $current_level['rank_weight']]]);
        if (!$has_next_level) {
            return false;
        }

        // 获取当前用户购物信息
        $user_info = model('user_info')->getOne($user_id);

        // (1)购买特定商品成为指定等级的分销商（获取这类商品的ID集）
        $goods_ids            = model('goods_commission', 'drp_model')->getColumn(['distributor_level_id' => ['neq', 0]], 'goods_id');
        $user_buy_goods_ids   = $user_info['shop_goods'] ? $user_info['shop_goods'] : [];
        $up_level_goods_ids   = array_intersect($goods_ids, $user_buy_goods_ids);
        $rank_weight          = $current_level['rank_weight'];
        $distributor_level_id = $user['distributor_level_id'];
        foreach ($up_level_goods_ids as $goods_id) {
            $goods_commission = model('goods_commission', 'drp_model')->getOne($goods_id);
            $level            = model('distributor_levels', 'drp_model')->getOne($goods_commission['distributor_level_id']);
            if ($level) {
                if ($level['rank_weight'] > $rank_weight) {
                    $rank_weight          = $level['rank_weight'];
                    $distributor_level_id = $level['id'];
                }
            }
        }
        model('users')->editOne(['id' => $user_id, 'distributor_level_id' => $distributor_level_id]);

        // (2)升级条件
        switch ($this->up_level_condition) {
            case 'commission_money':
                $levels = model('distributor_levels', 'drp_model')->getAll(['rank_weight' => ['>', $rank_weight], 'up_level_value' => ['<=', $user_info['total_real_commission_money']]]);
                break;
            case 'order_money':
                $levels = model('distributor_levels', 'drp_model')->getAll(['rank_weight' => ['>', $rank_weight], 'up_level_value' => ['<=', $user_info['order_money']]]);
                break;
            case 'order_num':
                $levels = model('distributor_levels', 'drp_model')->getAll(['rank_weight' => ['>', $rank_weight], 'up_level_value' => ['<=', $user_info['order_num']]]);
                break;
            case 'team_user_num':
                $child_team_info = $this->team_user_nums($user_id);
                $team_user_num   = $child_team_info['data']['total_num'];
                $levels          = model('distributor_levels', 'drp_model')->getAll(['rank_weight' => ['>', $rank_weight], 'up_level_value' => ['<=', $team_user_num]]);
                break;
            default:
                $levels = [];
                break;
        }

        if (count($levels) > 0) {
            $level                = $levels[count($levels) - 1];
            $rank_weight          = $level['rank_weight'];
            $distributor_level_id = $level['id'];
            model('users')->editOne(['id' => $user_id, 'distributor_level_id' => $distributor_level_id]);
        }
    }
    // =================================================
    // =============分销商升级 end =====================
    // =================================================
}
