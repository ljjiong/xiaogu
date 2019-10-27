<?php
/**
 *  分红系统类
 **/
class Bonus
{
    //是否开启分红系统
    private $is_open;

    // 分红计算方式：分红价bonus_price，销售价sell_price，市场价market_price，成本价cost_price
    private $bonus_way;

    // 是否开启内购
    private $is_open_self;

    // 是否开启代理分红
    private $is_agent;

    // 代理分红是否开启极差
    private $is_open_range_agent;

    // 是否开启区域分红
    private $is_region;

    // 区域分红是否开启极差
    private $is_open_range_region;

    // 区域分红省级默认比例
    private $region_province_rate;

    // 区域分红市级默认比例
    private $region_city_rate;

    // 区域分红县级默认比例
    private $region_area_rate;

    // 是否开启全球分红
    private $is_global;

    // 全球分红比例
    private $global_rate;

    // 成为分红商的条件:无条件no，申请apply，订单数order_num，订单金额order_money，购买产品goods
    private $become_bonus_condition;

    // 成为分红商的值
    private $become_bonus_value;

    // 分红商升级条件: 佣金bonus_money, 自购订单金额order_money，自购订单数量order_num，团队人数team_user_num
    private $up_level_condition;

    // 分红商升级值
    private $up_level_value;

    // 是否需要完善信息
    private $is_need_complete_user_info;

    // 分红商最小提现额
    private $min_drawcash_money;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data = include 'application/api_bonus/config-bonus.php';

        $this->is_open                    = $data['is_open'];
        $this->bonus_way                  = $data['bonus_way'];
        $this->is_open_self               = $data['is_open_self'];
        $this->is_agent                   = $data['is_agent'];
        $this->is_open_range_agent        = $data['is_open_range_agent'];
        $this->is_region                  = $data['is_region'];
        $this->is_open_range_region       = $data['is_open_range_region'];
        $this->region_province_rate       = $data['region_province_rate'];
        $this->region_city_rate           = $data['region_city_rate'];
        $this->region_area_rate           = $data['region_area_rate'];
        $this->is_global                  = $data['is_global'];
        $this->global_rate                = $data['global_rate'];
        $this->become_bonus_condition     = $data['become_bonus_condition'];
        $this->become_bonus_value         = $data['become_bonus_value'];
        $this->up_level_condition         = $data['up_level_condition'];
        $this->up_level_value             = $data['up_level_value'];
        $this->is_need_complete_user_info = $data['is_need_complete_user_info'];
        $this->min_drawcash_money         = $data['min_drawcash_money'];
    }

    /**
     * 【查询基本参数】
     */
    public function basic_info()
    {
        return [
            'is_open'            => $this->is_open,
            'bonus_way'          => $this->bonus_way,
            'is_open_self'       => $this->is_open_self,
            'up_level_condition' => $this->up_level_condition,
            'min_drawcash_money' => $this->min_drawcash_money,
        ];
    }

    /**
     * 【查询成为分红商的条件】
     */
    public function become_bonus_info()
    {
        return [
            'become_bonus_condition'     => $this->become_bonus_condition,
            'become_bonus_value'         => $this->become_bonus_value,
            'is_need_complete_user_info' => $this->is_need_complete_user_info,
        ];
    }

    /**
     * 【查询成为分红商需要购买的商品】
     */
    public function become_bonus_goods()
    {
        if ($this->become_bonus_condition == 'goods') {
            return array_values($this->become_bonus_value);
        } else {
            return [];
        }
    }

    /**
     * 【分红商升级条件信息】
     */
    public function bonus_up_level_info()
    {
        return [
            'up_level_condition' => $this->up_level_condition,
            'up_level_value'     => model('bonus_levels', 'bonus_model')->getAll(),
        ];
    }

    /**
     * 【代理分红参数信息】
     */
    public function agent_bonus_info()
    {
        return [
            'is_agent'            => $this->is_agent,
            'is_open_range_agent' => $this->is_open_range_agent,
        ];
    }

    /**
     * 【地区分红参数信息】
     */
    public function region_bonus_info()
    {
        return [
            'is_region'            => $this->is_region,
            'is_open_range_region' => $this->is_open_range_region,
            'region_province_rate' => $this->region_province_rate,
            'region_city_rate'     => $this->region_city_rate,
            'region_area_rate'     => $this->region_area_rate,
        ];
    }

    /**
     * 【全球分红参数信息】
     */
    public function global_bonus_info()
    {
        return [
            'is_global'   => $this->is_global,
            'global_rate' => $this->global_rate,
        ];
    }

    // =================================================
    // =============成为分红商begin=====================
    // =================================================

    /**
     * 【成为分红商】
     */
    public function become_bonus($user_id, $parent_mobile = '')
    {
        if ($this->is_open == false) {
            return false;
        }

        $user = model('users')->getOne($user_id);
        if (!$user) {
            return false;
        }

        // 已经是分红商中断执行
        if ($user['is_bonus'] == true) {
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

        switch ($this->become_bonus_condition) {
            case 'no':
                # 默认向下执行
                break;
            case 'apply':
                # 判断申请是否通过，不通过阻断执行
                $user_apply_bonus = model('user_apply_bonus', 'bonus_model')->findOne(['user_id' => $user_id, 'status' => 3]);
                if (!$user_apply_bonus) {
                    return false;
                }
                break;
            case 'order_num':
                # 判断订单数是否达到要求，未达到阻断执行
                $user_info = model('user_info')->getOne($user_id);
                if ($user_info) {
                    if (intval($user_info['order_num']) < $this->become_bonus_value) {
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
                    if (intval($user_info['order_money']) < $this->become_bonus_value) {
                        return false;
                    }
                } else {
                    return false;
                }
                break;
            case 'goods':
                # 判断是否购买指定商品，未购买阻断执行
                $goods     = array_values($this->become_bonus_value);
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

        // 获取初始等级最低的分红商等级ID
        $bonus_level_id = model('bonus_levels', 'bonus_model')->nextLevel(0);
        if ($bonus_level_id) {
            $data = [
                'id'                => $user_id,
                'is_bonus'          => 1,
                'bonus_level_id'    => $bonus_level_id,
                'become_bonus_time' => date('Y-m-d H:i:s'),
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
    // =============成为分红商end=======================
    // =================================================

    // =================================================
    // =============下单写入理论分红信息begin===========
    // =================================================

    /**
     * 【计算订单的理论分红金额】
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

        foreach ($order_goods as $key => $value) {
            $goods_id       = $value['goods_id'];
            $user_id        = $value['user_id'];
            $order_goods_id = $value['id'];

            // 核实当前商品是否分红
            $result = $this->check_goods($goods_id);
            // 计算分红
            if ($result['code']) {

                // 获取分红的金额
                $bonus_money = $this->get_bonus_money($order_goods_id);
                if ($bonus_money['code']) {
                    $bonus_money = $bonus_money['money'];
                } else {
                    continue; // 当前产品不计算分红
                }

                // (1)计算代理分红
                if ($this->is_agent == true) {
                    // 是否开启内购
                    if ($this->is_open_self == false) {
                        $real_user_id = model('users')->getOneParent($user_id);
                    } else {
                        $real_user_id = $user_id;
                    }

                    $this->count_agent_bonus_money($goods_id, $real_user_id, $bonus_money, $order_id, $order_goods_id, $source_user_id, 'expect_money');
                }

                // (2)计算区域分红
                if ($this->is_region == true) {
                    $this->count_region_bonus_money($goods_id, $bonus_money, $order_id, $order_goods_id, $source_user_id, 'expect_money');
                }

                // (3)计算全球分红
                if ($this->is_global == true) {
                    $this->count_global_bonus_money($goods_id, $bonus_money, $order_id, $order_goods_id, $source_user_id, 'expect_money');
                }
            } else {
                continue; // 当前产品不计算分红
            }
        }
    }

    /**
     * 【计算订单的实际分红金额】
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

        foreach ($order_goods as $key => $value) {
            $goods_id       = $value['goods_id'];
            $user_id        = $value['user_id'];
            $order_goods_id = $value['id'];

            // 核实当前商品是否分红
            $result = $this->check_goods($goods_id);
            // 计算分红
            if ($result['code']) {

                // 获取分红的金额
                $bonus_money = $this->get_bonus_money($order_goods_id);
                if ($bonus_money['code']) {
                    $bonus_money = $bonus_money['money'];
                } else {
                    continue; // 当前产品不计算分红
                }

                // (1)计算代理分红
                if ($this->is_agent == true) {
                    // 是否开启内购
                    if ($this->is_open_self == false) {
                        $real_user_id = model('users')->getOneParent($user_id);
                    } else {
                        $real_user_id = $user_id;
                    }
                    $this->count_agent_bonus_money($goods_id, $real_user_id, $bonus_money, $order_id, $order_goods_id, $source_user_id, 'real_money');
                }

                // (2)计算区域分红
                if ($this->is_region == true) {
                    $this->count_region_bonus_money($goods_id, $bonus_money, $order_id, $order_goods_id, $source_user_id, 'real_money');
                }

                // (3)计算全球分红
                if ($this->is_global == true) {
                    $this->count_global_bonus_money($goods_id, $bonus_money, $order_id, $order_goods_id, $source_user_id, 'real_money');
                }
            } else {
                continue; // 当前产品不计算分红
            }
        }

        return true;
    }

    /**
     * 【核实商品是否分红】
     */
    public function check_goods($goods_id)
    {
        $goods_bonus = model('goods_bonus', 'bonus_model')->getOne($goods_id);
        if ($goods_bonus) {
            // 未开启分红，中断执行
            if ($goods_bonus['is_open_bonus'] == false) {
                return ['code' => 0];
            } else {
                return ['code' => 1];
            }
        } else {
            return ['code' => 1];
        }
    }

    /**
     * 【获取商品分红金额】
     */
    public function get_bonus_money($order_goods_id)
    {
        $order_goods = model('order_goods')->getOne($order_goods_id);
        if ($order_goods) {
            // 通过当前分红方式计算分红金额
            $money = 0;

            if ($order_goods['return_goods_status'] == 3) {
                return ['code' => 1, 'money' => $money];
            }

            switch ($this->bonus_way) {
                case 'bonus_price':
                    # 分红价bonus_price
                    return ['code' => 0];
                    break;
                case 'sell_price':
                    # 销售价sell_price
                    // $money = $order_goods['sell_price'] * $order_goods['num'];
                    $money = $order_goods['real_price'];
                    break;
                case 'market_price':
                    # 市场价market_price
                    return ['code' => 0];
                    break;
                case 'cost_price':
                    # 成本价cost_price
                    return ['code' => 0];
                    break;
                default:
                    return ['code' => 0];
                    break;
            }

            if ($money > 0) {
                return ['code' => 1, 'money' => $money];
            } else {
                return ['code' => 0];
            }
        } else {
            return ['code' => 0];
        }
    }

    /**
     * 【核算代理分红信息】
     */
    public function count_agent_bonus_money($goods_id, $user_id, $money, $order_id, $order_goods_id, $source_user_id, $field)
    {
        if ($field == 'expect_money') {

            $update_data    = [];
            $count_user_ids = [];

            // 不开启代理分红极差
            if ($this->is_open_range_agent == false) {
                $current_user_id = $user_id;
                $last_user_id    = 0;
                while ($current_user_id) {
                    $result = $this->get_no_range_agent_bonus($goods_id, $current_user_id, $money, $last_user_id);
                    if ($result['code']) {
                        if ($result['data']['real_bonus_money'] >= 0.01) {
                            $update_data[] = [
                                'user_id'                  => $current_user_id,
                                'order_id'                 => $order_id,
                                'goods_id'                 => $goods_id,
                                'order_goods_id'           => $order_goods_id,
                                'bonus_type'               => 1,
                                'current_bonus_level_name' => $result['data']['bonus_level_name'],
                                'real_bonus_rate'          => $result['data']['bonus_rate'],
                                'expect_money'             => $result['data']['real_bonus_money'],
                                'source_user_id'           => $source_user_id,
                                'order_status'             => 1,
                            ];
                            $count_user_ids[] = $current_user_id;
                        }

                        $last_user_id = $result['data']['next_last_user_id'];
                    }

                    // 当前会员已经是最高级别，则中断循环
                    $is_break = $this->is_top_level($current_user_id);
                    if (!$is_break['code']) {
                        break;
                    }

                    // 取父级的会员ID
                    $current_user_id = model('users')->getOneParent($current_user_id);
                }
            }

            // 开启代理分红极差
            if ($this->is_open_range_agent == true) {
                $current_user_id = $user_id;
                $last_user_id    = 0;
                $last_used_rate  = 0;
                while ($current_user_id) {
                    $result = $this->get_range_agent_bonus($goods_id, $current_user_id, $money, $last_user_id, $last_used_rate);
                    if ($result['code']) {
                        if ($result['data']['real_bonus_money'] >= 0.01) {
                            $update_data[] = [
                                'user_id'                  => $current_user_id,
                                'order_id'                 => $order_id,
                                'goods_id'                 => $goods_id,
                                'order_goods_id'           => $order_goods_id,
                                'bonus_type'               => 1,
                                'current_bonus_level_name' => $result['data']['bonus_level_name'],
                                'real_bonus_rate'          => $result['data']['bonus_rate'],
                                'expect_money'             => $result['data']['real_bonus_money'],
                                'source_user_id'           => $source_user_id,
                                'order_status'             => 1,
                            ];
                            $count_user_ids[] = $current_user_id;
                        }

                        $last_user_id   = $result['data']['next_last_user_id'];
                        $last_used_rate = $result['data']['last_used_rate'];
                    }

                    // 当前会员已经是最高级别，则中断循环
                    $is_break = $this->is_top_level($current_user_id);
                    if (!$is_break['code']) {
                        break;
                    }

                    // 取父级的会员ID
                    $current_user_id = model('users')->getOneParent($current_user_id);
                }
            }

            // 写入理论分红金额（下单之后计算）
            model('user_bonus_logs', 'bonus_model')->batchAdd($update_data);
            model('user_info')->updateBonusByUserIds($count_user_ids);
        }

        // 计算实际分红金额（订单完成之后计算）
        if ($field == 'real_money') {
            $order_goods_data = model('order_goods')->getOne($order_goods_id);
            if ($order_goods_data && $order_goods_data['return_goods_status'] == 3) {
                $is_return_goods = 1;
            } else {
                $is_return_goods = 0;
            }

            $update_data    = [];
            $count_user_ids = [];

            $map = [
                'order_id'       => $order_id,
                'goods_id'       => $goods_id,
                'order_goods_id' => $order_goods_id,
                'bonus_type'     => 1,
                'source_user_id' => $source_user_id,
            ];

            $logs = model('user_bonus_logs', 'bonus_model')->getAll($map);
            foreach ($logs as $key => $value) {
                if ($is_return_goods) {
                    $update_data[] = [
                        'id'               => $value['id'],
                        'real_bonus_money' => 0,
                        'real_money'       => 0,
                        'order_status'     => 3,
                    ];
                } else {
                    $update_data[] = [
                        'id'               => $value['id'],
                        'real_bonus_money' => $money,
                        'real_money'       => $money * $value['real_bonus_rate'] * 0.01,
                        'order_status'     => 3,
                    ];
                }

                $count_user_ids[] = $value['user_id'];
            }

            // 写入理论分红金额（下单之后计算）
            model('user_bonus_logs', 'bonus_model')->batchEdit($update_data);
            model('user_info')->updateBonusByUserIds($count_user_ids);
        }
    }

    /**
     * 【核算区域分红信息】
     */
    public function count_region_bonus_money($goods_id, $money, $order_id, $order_goods_id, $source_user_id, $field)
    {
        if ($field == 'expect_money') {

            $update_data    = [];
            $count_user_ids = [];

            // 不开启区域分红极差
            if ($this->is_open_range_region == false) {
                $order = model('orders')->getOne($order_id);
                if ($order) {
                    // 县级代理
                    if ($order['area_code']) {
                        $result = $this->get_no_range_region_bonus($order['area_code'], $money, 3);
                        if ($result['code']) {
                            if ($result['data']['real_bonus_money'] >= 0.01) {
                                $update_data[] = [
                                    'user_id'         => $result['data']['user_id'],
                                    'order_id'        => $order_id,
                                    'goods_id'        => $goods_id,
                                    'order_goods_id'  => $order_goods_id,
                                    'bonus_type'      => 2,
                                    'region_type'     => 'area',
                                    'real_bonus_rate' => $result['data']['bonus_rate'],
                                    'expect_money'    => $result['data']['real_bonus_money'],
                                    'source_user_id'  => $source_user_id,
                                    'order_status'    => 1,
                                ];
                                $count_user_ids[] = $result['data']['user_id'];
                            }
                        }
                    }

                    // 市级代理
                    if ($order['city_code']) {
                        $result = $this->get_no_range_region_bonus($order['city_code'], $money, 2);
                        if ($result['code']) {
                            if ($result['data']['real_bonus_money'] >= 0.01) {
                                $update_data[] = [
                                    'user_id'         => $result['data']['user_id'],
                                    'order_id'        => $order_id,
                                    'goods_id'        => $goods_id,
                                    'order_goods_id'  => $order_goods_id,
                                    'bonus_type'      => 2,
                                    'region_type'     => 'city',
                                    'real_bonus_rate' => $result['data']['bonus_rate'],
                                    'expect_money'    => $result['data']['real_bonus_money'],
                                    'source_user_id'  => $source_user_id,
                                    'order_status'    => 1,
                                ];
                                $count_user_ids[] = $result['data']['user_id'];
                            }
                        }
                    }

                    // 省级代理
                    if ($order['province_code']) {
                        $result = $this->get_no_range_region_bonus($order['province_code'], $money, 1);
                        if ($result['code']) {
                            if ($result['data']['real_bonus_money'] >= 0.01) {
                                $update_data[] = [
                                    'user_id'         => $result['data']['user_id'],
                                    'order_id'        => $order_id,
                                    'goods_id'        => $goods_id,
                                    'order_goods_id'  => $order_goods_id,
                                    'bonus_type'      => 2,
                                    'region_type'     => 'province',
                                    'real_bonus_rate' => $result['data']['bonus_rate'],
                                    'expect_money'    => $result['data']['real_bonus_money'],
                                    'source_user_id'  => $source_user_id,
                                    'order_status'    => 1,
                                ];
                                $count_user_ids[] = $result['data']['user_id'];
                            }
                        }
                    }
                }
            }

            // 开启区域分红极差
            if ($this->is_open_range_region == true) {
                $last_used_rate = 0; // 最近的分红比例
                $order          = model('orders')->getOne($order_id);
                if ($order) {
                    // 县级代理
                    if ($order['area_code']) {
                        $result = $this->get_range_region_bonus($order['area_code'], $money, 3, $last_used_rate);
                        if ($result['code']) {
                            if ($result['data']['real_bonus_money'] >= 0.01) {
                                $update_data[] = [
                                    'user_id'         => $result['data']['user_id'],
                                    'order_id'        => $order_id,
                                    'goods_id'        => $goods_id,
                                    'order_goods_id'  => $order_goods_id,
                                    'bonus_type'      => 2,
                                    'region_type'     => 'area',
                                    'real_bonus_rate' => $result['data']['bonus_rate'],
                                    'expect_money'    => $result['data']['real_bonus_money'],
                                    'source_user_id'  => $source_user_id,
                                    'order_status'    => 1,
                                ];
                                $count_user_ids[] = $result['data']['user_id'];
                            }
                            $last_used_rate = $result['data']['last_used_rate'];
                        }
                    }

                    // 市级代理
                    if ($order['city_code']) {
                        $result = $this->get_range_region_bonus($order['city_code'], $money, 2, $last_used_rate);
                        if ($result['code']) {
                            if ($result['data']['real_bonus_money'] >= 0.01) {
                                $update_data[] = [
                                    'user_id'         => $result['data']['user_id'],
                                    'order_id'        => $order_id,
                                    'goods_id'        => $goods_id,
                                    'order_goods_id'  => $order_goods_id,
                                    'bonus_type'      => 2,
                                    'region_type'     => 'city',
                                    'real_bonus_rate' => $result['data']['bonus_rate'],
                                    'expect_money'    => $result['data']['real_bonus_money'],
                                    'source_user_id'  => $source_user_id,
                                    'order_status'    => 1,
                                ];
                                $count_user_ids[] = $result['data']['user_id'];
                            }

                            $last_used_rate = $result['data']['last_used_rate'];
                        }
                    }

                    // 省级代理
                    if ($order['province_code']) {
                        $result = $this->get_range_region_bonus($order['province_code'], $money, 1, $last_used_rate);
                        if ($result['code']) {
                            if ($result['data']['real_bonus_money'] >= 0.01) {
                                $update_data[] = [
                                    'user_id'         => $result['data']['user_id'],
                                    'order_id'        => $order_id,
                                    'goods_id'        => $goods_id,
                                    'order_goods_id'  => $order_goods_id,
                                    'bonus_type'      => 2,
                                    'region_type'     => 'province',
                                    'real_bonus_rate' => $result['data']['bonus_rate'],
                                    'expect_money'    => $result['data']['real_bonus_money'],
                                    'source_user_id'  => $source_user_id,
                                    'order_status'    => 1,
                                ];
                                $count_user_ids[] = $result['data']['user_id'];
                            }
                        }
                    }
                }
            }

            // 写入理论分红金额（下单之后计算）
            model('user_bonus_logs', 'bonus_model')->batchAdd($update_data);
            model('user_info')->updateBonusByUserIds($count_user_ids);
        }

        // 计算实际分红金额（订单完成之后计算）
        if ($field == 'real_money') {
            $order_goods_data = model('order_goods')->getOne($order_goods_id);
            if ($order_goods_data && $order_goods_data['return_goods_status'] == 3) {
                $is_return_goods = 1;
            } else {
                $is_return_goods = 0;
            }

            $update_data    = [];
            $count_user_ids = [];

            $map = [
                'order_id'       => $order_id,
                'goods_id'       => $goods_id,
                'order_goods_id' => $order_goods_id,
                'bonus_type'     => 2,
                'source_user_id' => $source_user_id,
            ];

            $logs = model('user_bonus_logs', 'bonus_model')->getAll($map);
            foreach ($logs as $key => $value) {
                if ($is_return_goods) {
                    $update_data[] = [
                        'id'               => $value['id'],
                        'real_bonus_money' => 0,
                        'real_money'       => 0,
                        'order_status'     => 3,
                    ];
                } else {
                    $update_data[] = [
                        'id'               => $value['id'],
                        'real_bonus_money' => $money,
                        'real_money'       => $money * $value['real_bonus_rate'] * 0.01,
                        'order_status'     => 3,
                    ];
                }

                $count_user_ids[] = $value['user_id'];
            }

            // 写入理论分红金额（下单之后计算）
            model('user_bonus_logs', 'bonus_model')->batchEdit($update_data);
            model('user_info')->updateBonusByUserIds($count_user_ids);
        }
    }

    /**
     * 【核算全球分红信息】
     */
    public function count_global_bonus_money($goods_id, $money, $order_id, $order_goods_id, $source_user_id, $field)
    {
        if ($field == 'expect_money') {

            $update_data    = [];
            $count_user_ids = [];

            $global_users = model('global_bonus', 'bonus_model')->getAll();
            foreach ($global_users as $key => $value) {
                $user_id = $value['user_id'];
                $result  = $this->get_global_bonus($goods_id, $user_id, $money);
                if ($result['code']) {
                    if ($result['data']['real_bonus_money'] >= 0.01) {
                        $update_data[] = [
                            'user_id'         => $user_id,
                            'order_id'        => $order_id,
                            'goods_id'        => $goods_id,
                            'order_goods_id'  => $order_goods_id,
                            'bonus_type'      => 3,
                            'real_bonus_rate' => $result['data']['bonus_rate'],
                            'expect_money'    => $result['data']['real_bonus_money'],
                            'source_user_id'  => $source_user_id,
                            'order_status'    => 1,
                        ];
                        $count_user_ids[] = $user_id;
                    }
                }
            }

            // 写入理论分红金额（下单之后计算）
            model('user_bonus_logs', 'bonus_model')->batchAdd($update_data);
            model('user_info')->updateBonusByUserIds($count_user_ids);
        }

        // 计算实际分红金额（订单完成之后计算）
        if ($field == 'real_money') {
            $order_goods_data = model('order_goods')->getOne($order_goods_id);
            if ($order_goods_data && $order_goods_data['return_goods_status'] == 3) {
                $is_return_goods = 1;
            } else {
                $is_return_goods = 0;
            }

            $update_data    = [];
            $count_user_ids = [];

            $map = [
                'order_id'       => $order_id,
                'goods_id'       => $goods_id,
                'order_goods_id' => $order_goods_id,
                'bonus_type'     => 3,
                'source_user_id' => $source_user_id,
            ];

            $logs = model('user_bonus_logs', 'bonus_model')->getAll($map);
            foreach ($logs as $key => $value) {
                if ($is_return_goods) {
                    $update_data[] = [
                        'id'               => $value['id'],
                        'real_bonus_money' => 0,
                        'real_money'       => 0,
                        'order_status'     => 3,
                    ];
                }else{
                    $update_data[] = [
                        'id'               => $value['id'],
                        'real_bonus_money' => $money,
                        'real_money'       => $money * $value['real_bonus_rate'] * 0.01,
                        'order_status'     => 3,
                    ];
                }


                $count_user_ids[] = $value['user_id'];
            }

            // 写入理论分红金额（下单之后计算）
            model('user_bonus_logs', 'bonus_model')->batchEdit($update_data);
            model('user_info')->updateBonusByUserIds($count_user_ids);
        }
    }

    /**
     * 【获取指定商品的代理分红信息(无极差)】
     */
    public function get_no_range_agent_bonus($goods_id, $user_id, $money, $last_user_id)
    {
        // 核实分红商身份，未通过中断执行
        $bonus_info = $this->get_bonus_info($user_id, $last_user_id);
        if ($bonus_info['code']) {
            if ($bonus_info['data']['is_count']) {
                $user_info         = $bonus_info['data']['bonus_info'];
                $next_last_user_id = $bonus_info['data']['last_user_id'];
            } else {
                return ['code' => 0];
            }
        } else {
            return ['code' => 0];
        }

        $goods_bonus = model('goods_bonus', 'bonus_model')->getOne($goods_id);
        switch ($goods_bonus['bonus_type']) {
            case 0:
                # 不开启独立分红
                $result = [
                    'bonus_money'       => $money,
                    'bonus_rate'        => $user_info['rate'],
                    'real_bonus_money'  => $money * floatval($user_info['rate']) * 0.01,
                    'bonus_level_name'  => $user_info['level_name'],
                    'next_last_user_id' => $next_last_user_id,
                ];
                return ['code' => 1, 'data' => $result];
                break;
            case 1:
                # 开启单产品等级分红
                $bonus_goods_levels = model('bonus_goods_levels', 'bonus_model')->findOne(['bonus_level_id' => $user_info['id'], 'goods_id' => $goods_id]);
                if ($bonus_goods_levels) {
                    $result = [
                        'bonus_money'       => $money,
                        'bonus_rate'        => $bonus_goods_levels['rate'],
                        'real_bonus_money'  => $money * $bonus_goods_levels['rate'] * 0.01,
                        'bonus_level_name'  => $user_info['level_name'],
                        'next_last_user_id' => $next_last_user_id,
                    ];
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
     * 【获取指定商品的代理分红信息(有极差)】
     */
    public function get_range_agent_bonus($goods_id, $user_id, $money, $last_user_id, $last_used_rate)
    {
        // 核实分红商身份，未通过中断执行
        $bonus_info = $this->get_bonus_info($user_id, $last_user_id);
        if ($bonus_info['code']) {
            if ($bonus_info['data']['is_count']) {
                $user_info         = $bonus_info['data']['bonus_info'];
                $next_last_user_id = $bonus_info['data']['last_user_id'];
            } else {
                return ['code' => 0];
            }
        } else {
            return ['code' => 0];
        }

        $goods_bonus = model('goods_bonus', 'bonus_model')->getOne($goods_id);
        switch ($goods_bonus['bonus_type']) {
            case 0:
                # 不开启独立分红
                $rate = $user_info['rate'] - $last_used_rate;
                if ($rate > 0) {
                    $result = [
                        'bonus_money'       => $money,
                        'bonus_rate'        => $rate,
                        'real_bonus_money'  => $money * $rate * 0.01,
                        'last_used_rate'    => $user_info['rate'],
                        'bonus_level_name'  => $user_info['level_name'],
                        'next_last_user_id' => $next_last_user_id,
                    ];
                    return ['code' => 1, 'data' => $result];
                } else {
                    return ['code' => 0];
                }
                break;
            case 1:
                # 开启单产品等级分红
                $bonus_goods_levels = model('bonus_goods_levels', 'bonus_model')->findOne(['bonus_level_id' => $user_info['id'], 'goods_id' => $goods_id]);
                if ($bonus_goods_levels) {
                    $rate = $bonus_goods_levels['rate'] - $last_used_rate;
                    if ($rate > 0) {
                        $result = [
                            'bonus_money'       => $money,
                            'bonus_rate'        => $rate,
                            'real_bonus_money'  => $money * $rate * 0.01,
                            'last_used_rate'    => $bonus_goods_levels['rate'],
                            'bonus_level_name'  => $user_info['level_name'],
                            'next_last_user_id' => $next_last_user_id,
                        ];
                        return ['code' => 1, 'data' => $result];
                    } else {
                        return ['code' => 0];
                    }
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
     * 【获取指定区域分红商的区域分红信息(无极差)】
     */
    public function get_no_range_region_bonus($region_code, $money, $region_type)
    {
        $default_region_rate = 0;
        switch ($region_type) {
            // 省级代理
            case '1':
                $map = [
                    'type'          => 1,
                    'province_code' => $region_code,
                    'status'        => 1,
                ];
                $default_region_rate = floatval($this->region_province_rate);
                break;
            // 市级代理
            case '2':
                $map = [
                    'type'      => 2,
                    'city_code' => $region_code,
                    'status'    => 1,
                ];
                $default_region_rate = floatval($this->region_city_rate);
                break;
            // 县级代理
            case '3':
                $map = [
                    'type'      => 3,
                    'area_code' => $region_code,
                    'status'    => 1,
                ];
                $default_region_rate = floatval($this->region_area_rate);
                break;
            default:
                return ['code' => 0];
                break;
        }

        $region_bonus = model('region_bonus', 'bonus_model')->findOne($map);
        if ($region_bonus) {
            switch ($region_bonus['is_open_own_rate']) {
                case 0:
                    # 不开启独立区域比例
                    $result = [
                        'bonus_money'      => $money,
                        'bonus_rate'       => $default_region_rate,
                        'real_bonus_money' => $money * $default_region_rate * 0.01,
                        'user_id'          => $region_bonus['user_id'],
                    ];
                    return ['code' => 1, 'data' => $result];
                    break;
                case 1:
                    # 开启独立区域比例
                    $result = [
                        'bonus_money'      => $money,
                        'bonus_rate'       => floatval($region_bonus['region_rate']),
                        'real_bonus_money' => $money * floatval($region_bonus['region_rate']) * 0.01,
                        'user_id'          => $region_bonus['user_id'],
                    ];
                    return ['code' => 1, 'data' => $result];
                    break;
                default:
                    return ['code' => 0];
                    break;
            }
        }
    }

    /**
     * 【获取指定区域分红商的区域分红信息(有极差)】
     */
    public function get_range_region_bonus($region_code, $money, $region_type, $last_used_rate)
    {
        $default_region_rate = 0;
        switch ($region_type) {
            // 省级代理
            case '1':
                $map = [
                    'type'          => 1,
                    'province_code' => $region_code,
                    'status'        => 1,
                ];
                $default_region_rate = floatval($this->region_province_rate);
                break;
            // 市级代理
            case '2':
                $map = [
                    'type'      => 2,
                    'city_code' => $region_code,
                    'status'    => 1,
                ];
                $default_region_rate = floatval($this->region_city_rate);
                break;
            // 县级代理
            case '3':
                $map = [
                    'type'      => 3,
                    'area_code' => $region_code,
                    'status'    => 1,
                ];
                $default_region_rate = floatval($this->region_area_rate);
                break;
            default:
                return ['code' => 0];
                break;
        }

        $region_bonus = model('region_bonus', 'bonus_model')->findOne($map);
        if ($region_bonus) {
            switch ($region_bonus['is_open_own_rate']) {
                case 0:
                    # 不开启独立区域比例
                    $rate = $default_region_rate - $last_used_rate;
                    if ($rate > 0) {
                        $result = [
                            'bonus_money'      => $money,
                            'bonus_rate'       => $rate,
                            'real_bonus_money' => $money * $rate * 0.01,
                            'user_id'          => $region_bonus['user_id'],
                            'last_used_rate'   => $default_region_rate,
                        ];
                        return ['code' => 1, 'data' => $result];
                    } else {
                        return ['code' => 0];
                    }
                    break;
                case 1:
                    # 开启独立区域比例
                    $region_rate = floatval($region_bonus['region_rate']);
                    $rate        = $region_rate - $last_used_rate;
                    if ($rate > 0) {
                        $result = [
                            'bonus_money'      => $money,
                            'bonus_rate'       => $rate,
                            'real_bonus_money' => $money * $rate * 0.01,
                            'user_id'          => $region_bonus['user_id'],
                            'last_used_rate'   => $region_rate,
                        ];
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
    }

    /**
     * 【获取指定分红商的全球分红信息】
     */
    public function get_global_bonus($goods_id, $user_id, $money)
    {
        // 判断商品是否设置单独的配置
        $goods_bonus = model('goods_bonus', 'bonus_model')->getOne($goods_id);
        if ($goods_bonus) {
            // (1)首先启用商品的全球分红设置
            if ($goods_bonus['is_open_global'] == true) {
                // 是否开启独立商品全球分红比例
                if ($goods_bonus['is_open_own_global_rate'] == true) {   
                    $result = [
                        'bonus_money'      => $money,
                        'bonus_rate'       => $goods_bonus['global_rate'],
                        'real_bonus_money' => $money * $goods_bonus['global_rate'] * 0.01,
                    ];
                    return ['code' => 1, 'data' => $result];
                } else {
                    // (2) 其次启用会员的全球分红设置
                    $global_bonus = model('global_bonus', 'bonus_model')->getOne($user_id);
                    if ($global_bonus) {
                        if ($global_bonus['is_open_own_global_rate'] == true) {
                            $result = [
                                'bonus_money'      => $money,
                                'bonus_rate'       => $global_bonus['global_rate'],
                                'real_bonus_money' => $money * $global_bonus['global_rate'] * 0.01,
                            ];
                            return ['code' => 1, 'data' => $result];
                        } else {
                            // (3) 最后启用系统的默认全球分红设置
                            $rate   = floatval($this->global_rate);
                            $result = [
                                'bonus_money'      => $money,
                                'bonus_rate'       => $rate,
                                'real_bonus_money' => $money * $rate * 0.01,
                            ];
                            return ['code' => 1, 'data' => $result];
                        }
                    } else {
                        return ['code' => 0]; //若会员全球分红表中无该会员信息，表示当前会员无全球分红资格
                    }
                }
            } else {
                return ['code' => 0];
            }
        } else {
            // (2) 其次启用会员的全球分红设置
            $global_bonus = model('global_bonus', 'bonus_model')->getOne($user_id);
            if ($global_bonus) {
                if ($global_bonus['is_open_own_global_rate'] == true) {
                    $result = [
                        'bonus_money'      => $money,
                        'bonus_rate'       => $global_bonus['global_rate'],
                        'real_bonus_money' => $money * $global_bonus['global_rate'] * 0.01,
                    ];
                    return ['code' => 1, 'data' => $result];
                } else {
                    // (3) 最后启用系统的默认全球分红设置
                    $rate   = floatval($this->global_rate);
                    $result = [
                        'bonus_money'      => $money,
                        'bonus_rate'       => $rate,
                        'real_bonus_money' => $money * $rate * 0.01,
                    ];
                    return ['code' => 1, 'data' => $result];
                }
            } else {
                return ['code' => 0]; //若会员全球分红表中无该会员信息，表示当前会员无全球分红资格
            }
        }
    }

    /**
     * 【获取指定用户的身份是否是分红商】
     */
    public function get_bonus_status($user_id)
    {
        $user = model('users')->getOne($user_id);
        if ($user) {
            // 未开启分红，中断执行
            if ($user['is_bonus'] == true) {
                return ['code' => 1];
            } else {
                return ['code' => 0];
            }
        } else {
            return ['code' => 0];
        }
    }

    /**
     * 【判断会员是否是最高级别】
     */
    public function is_top_level($user_id)
    {
        $user = model('users')->getOne($user_id);
        if ($user) {
            if ($user['is_bonus'] == true) {
                $top_level = model('bonus_levels', 'bonus_model')->order('rank_weight desc')->find();
                if ($top_level) {
                    if ($top_level['id'] == $user['bonus_level_id']) {
                        return ['code' => 0];
                    } else {
                        return ['code' => 1];
                    }
                } else {
                    return ['code' => 1];
                }
            } else {
                return ['code' => 1];
            }
        } else {
            return ['code' => 0];
        }
    }

    /**
     * 【获取指定用户的身份】
     */
    public function get_bonus_info($user_id, $last_user_id)
    {
        $user = model('users')->getOne($user_id);
        if ($user) {
            // 当前会员未开启分红，中断执行
            if ($user['is_bonus'] == false) {
                $data = [
                    'is_count'     => 0,
                    'last_user_id' => $last_user_id,
                ];
                return ['code' => 1, 'data' => $data];
            } else {
                $bonus_level = model('bonus_levels', 'bonus_model')->getOne($user['bonus_level_id']);
                if ($bonus_level) {
                    if ($last_user_id) {
                        $last_user = model('users')->getOne($last_user_id);
                        if ($last_user) {
                            if ($last_user['is_bonus']) {
                                $last_bonus_level = model('bonus_levels', 'bonus_model')->getOne($last_user['bonus_level_id']);
                                if ($last_bonus_level) {
                                    if ($bonus_level['rank_weight'] > $last_bonus_level['rank_weight']) {
                                        $data = [
                                            'is_count'     => 1,
                                            'last_user_id' => $user_id,
                                            'bonus_info'   => $bonus_level,
                                        ];
                                        return ['code' => 1, 'data' => $data];
                                    } else {
                                        $data = [
                                            'is_count'     => 0,
                                            'last_user_id' => $last_user_id,
                                        ];
                                        return ['code' => 1, 'data' => $data];
                                    }
                                } else {
                                    $data = [
                                        'is_count'     => 0,
                                        'last_user_id' => $user_id,
                                    ];
                                    return ['code' => 1, 'data' => $data];
                                }
                            } else {
                                // 最近的会员非分红商，中断执行
                                $data = [
                                    'is_count'     => 0,
                                    'last_user_id' => $user_id,
                                ];
                                return ['code' => 1, 'data' => $data];
                            }
                        } else {
                            // 最近的会员不存在，中断执行
                            $data = [
                                'is_count'     => 0,
                                'last_user_id' => $user_id,
                            ];
                            return ['code' => 1, 'data' => $data];
                        }
                    } else {
                        // 无比较的会员，继续执行
                        $data = [
                            'is_count'     => 1,
                            'last_user_id' => $user_id,
                            'bonus_info'   => $bonus_level,
                        ];
                        return ['code' => 1, 'data' => $data];
                    }
                } else {
                    // 分红商等级不存在，中断执行
                    $data = [
                        'is_count'     => 0,
                        'last_user_id' => $last_user_id,
                    ];
                    return ['code' => 1, 'data' => $data];
                }
            }
        } else {
            // 当前会员不存在，中断执行
            return ['code' => 0];
        }
    }

    /**
     * 【改变分红的订单状态】
     */
    public function change_order_status($order_id, $status)
    {
        $user_bonus_logs = model('user_bonus_logs', 'bonus_model')->getAll(['order_id' => $order_id]);
        $data            = [];
        foreach ($user_bonus_logs as $key => $value) {
            $data[] = [
                'id'           => $value['id'],
                'order_status' => $status,
            ];
        }

        model('user_bonus_logs', 'bonus_model')->batchEdit($data);
    }

    // =================================================
    // =============下单写入理论分红信息end=============
    // =================================================

    // =================================================
    // =============查询团队信息begin===================
    // =================================================
    public function team_info($user_id, $page_num, $page_limit)
    {
        $map_1 = [
            'parent_ids' => ['like', '%#' . $user_id . '#%'],
            'is_bonus'   => 1,
        ];
        $count = model('users')->getAllCount($map_1);

        $lists = model('users')->getAll($map_1, $page_num, $page_limit);
        foreach ($lists as $key => $value) {
            $lists[$key]['user_info'] = model('user_info')->getOne($value['id']);
            $current_team_info        = self::team_info($value['id'], '', '');
            $lists[$key]['team_num']  = $current_team_info['data']['data_info']['team_info']['total_num'];
        }

        $page_info = [
            'page_num'   => $page_num,
            'page_limit' => $page_limit,
            'data_count' => $count,
        ];

        $data_info = [
            'team_info'  => [
                'total_num' => $count,
            ],
            'team_users' => $lists,
        ];

        return ['code' => 1, 'msg' => 'success', 'data' => ['page_info' => $page_info, 'data_info' => $data_info]];
    }

    public function team_user_nums($user_id)
    {
        $map_1 = [
            'parent_ids' => ['like', '%#' . $user_id . '#%'],
            'is_bonus'   => 1,
        ];
        $count_1 = model('users')->getAllCount($map_1);

        $team_info = [
            'total_num' => $count_1,
        ];

        return ['code' => 1, 'msg' => 'success', 'data' => $team_info];
    }
    // =================================================
    // =============查询团队信息end=====================
    // =================================================

    // =================================================
    // =============分红商升级begin=====================
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

        // 非分红商身份中断执行
        if ($user['is_bonus'] == false) {
            return false;
        }

        // 已达最高级别中断执行
        $current_level  = model('bonus_levels', 'bonus_model')->getOne($user['bonus_level_id']);
        $has_next_level = model('bonus_levels', 'bonus_model')->findOne(['rank_weight' => ['>', $current_level['rank_weight']]]);
        if (!$has_next_level) {
            return false;
        }

        // 获取当前用户购物信息
        $user_info = model('user_info')->getOne($user_id);

        // (1)购买特定商品成为指定等级的分红商（获取这类商品的ID集）
        $goods_ids          = model('goods_bonus', 'bonus_model')->getColumn(['bonus_level_id' => ['neq', 0]], 'goods_id');
        $user_buy_goods_ids = $user_info['shop_goods'] ? $user_info['shop_goods'] : [];
        $up_level_goods_ids = array_intersect($goods_ids, $user_buy_goods_ids);
        $rank_weight        = $current_level['rank_weight'];
        $bonus_level_id     = $user['bonus_level_id'];
        foreach ($up_level_goods_ids as $goods_id) {
            $goods_bonus = model('goods_bonus', 'bonus_model')->getOne($goods_id);
            $level       = model('bonus_levels', 'bonus_model')->getOne($goods_bonus['bonus_level_id']);
            if ($level) {
                if ($level['rank_weight'] > $rank_weight) {
                    $rank_weight    = $level['rank_weight'];
                    $bonus_level_id = $level['id'];
                }
            }
        }
        model('users')->editOne(['id' => $user_id, 'bonus_level_id' => $bonus_level_id]);

        // (2)升级条件
        switch ($this->up_level_condition) {
            case 'bonus_money':
                $levels = model('bonus_levels', 'bonus_model')->getAll(['rank_weight' => ['>', $rank_weight], 'up_level_value' => ['<=', $user_info['total_real_bonus_money']]]);
                break;
            case 'order_money':
                $levels = model('bonus_levels', 'bonus_model')->getAll(['rank_weight' => ['>', $rank_weight], 'up_level_value' => ['<=', $user_info['order_money']]]);
                break;
            case 'order_num':
                $levels = model('bonus_levels', 'bonus_model')->getAll(['rank_weight' => ['>', $rank_weight], 'up_level_value' => ['<=', $user_info['order_num']]]);
                break;
            case 'team_user_num':
                $child_team_info = $this->team_user_nums($user_id);
                $team_user_num   = $child_team_info['data']['total_num'];
                $levels          = model('bonus_levels', 'bonus_model')->getAll(['rank_weight' => ['>', $rank_weight], 'up_level_value' => ['<=', $team_user_num]]);
                break;
            default:
                $levels = [];
                break;
        }

        if (count($levels) > 0) {
            $level          = $levels[count($levels) - 1];
            $rank_weight    = $level['rank_weight'];
            $bonus_level_id = $level['id'];
            model('users')->editOne(['id' => $user_id, 'bonus_level_id' => $bonus_level_id]);
        }
    }
    // =================================================
    // =============分红商升级 end =====================
    // =================================================
}
