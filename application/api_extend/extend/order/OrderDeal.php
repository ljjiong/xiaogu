<?php
/**
 *  订单处理独立类
 **/
class OrderDeal
{
    /**
     * 【订单预览】
     */
    public function view($user_id, $address_id, $goods_info)
    {
        // 校验地址
        $result = $this->checkAddress($user_id, $address_id);
        if (!$result['code']) {
            return $result;
        }

        // 校验商品信息
        $result = $this->checkGoodsInfo($goods_info);
        if (!$result['code']) {
            return $result;
        }

        // 计算商品价格
        return $this->countOrderPrice($goods_info, $address_id);
    }

    /**
     * 【订单创建】
     */
    public function create($user_id, $address_id, $goods_info, $market_activity_type, $market_activity_id, $memo = '')
    {
        // 校验地址
        $result = $this->checkAddress($user_id, $address_id);
        if (!$result['code']) {
            return $result;
        }

        // 校验商品信息
        $result = $this->checkGoodsInfo($goods_info);
        if (!$result['code']) {
            return $result;
        }

        // 校验营销活动
        $result = $this->checkMarketActivity($market_activity_type, $market_activity_id, $user_id, $goods_info);
        if (!$result['code']) {
            return $result;
        }

        // 计算商品金额
        $result = $this->countOrderPrice($goods_info, $address_id);
        if ($result['code']) {
            $money_info = $result['data'];
        } else {
            return $result;
        }

        // 处理营销活动
        $result = $this->dealMarketActivity($user_id, $money_info, $market_activity_type, $market_activity_id, $goods_info);
        if ($result['code']) {
            $money_info['market_reduce_money'] = $result['data'];
            $money_info['total_money']         = $money_info['goods_money'] + $money_info['freight_money'] - $money_info['market_reduce_money'];
        } else {
            return $result;
        }

        // 创建订单
        $result = $this->createOrder($user_id, $address_id, $market_activity_type, $market_activity_id, $money_info, $memo);
        if ($result['code']) {
            $order = $result['data'];
        } else {
            return $result;
        }

        // 写入订单商品信息
        $result = $this->updateOrderGoods($user_id, $order['id'], $goods_info, $money_info);
        if (!$result['code']) {
            return $result;
        }

        // 获取订单的基础信息
        $order = model('orders')->getOneBasic($order['id']);

        // 无需支付的订单，立即扣减库存&增加销量
        if ($order && $order['total_money'] == 0) {
            $this->update_goods_info($order['order_no']);
        }

        return ['code' => 1, 'msg' => '创建订单成功', 'data' => $order];
    }

    /**
     * 【校验地址】
     */
    private function checkAddress($user_id, $address_id)
    {
        $address = model('addresses')->getOne($address_id);
        if ($address) {
            if ($address['user_id'] == $user_id) {
                return ['code' => 1, 'msg' => '地址校验通过'];
            } else {
                return ['code' => 0, 'msg' => '地址值非法'];
            }
        } else {
            return ['code' => 0, 'msg' => '地址不存在'];
        }
    }

    /**
     * 【校验商品信息】
     */
    private function checkGoodsInfo($goods_info)
    {
        foreach ($goods_info as $key => $value) {
            $goods = model('goods')->getOne($value['goods_id']);
            if ($goods) {
                // 商品是否上架
                if ($goods['status'] != 1 || $goods['data_state'] != 1) {
                    return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】已下架'];
                    break;
                }

                // 商品是否含有规格
                $is_has_spec_group = model('goods_spec_groups')->findOne(['goods_id' => $value['goods_id']]);
                if ($is_has_spec_group) {
                    if (!$value['spec_group_id_str']) {
                        return ['code' => 0, 'msg' => '请选择商品【' . $goods['name'] . '】的具体规格'];
                        break;
                    }
                } else {
                    if ($value['spec_group_id_str']) {
                        return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】无规格组合信息'];
                        break;
                    }
                }

                if (!is_numeric($value['num'])) {
                    return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】数量必须为整数'];
                    break;
                }

                if ($value['num'] < 1) {
                    return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】数量不能小于1'];
                    break;
                }

                // 校验规格与库存
                if ($value['spec_group_id_str']) {
                    $spec_group = model('goods_spec_groups')->findOne(['goods_id' => $value['goods_id'], 'id_str' => $value['spec_group_id_str']]);
                    if ($spec_group) {
                        if (intval($spec_group['stock']) < intval($value['num'])) {
                            return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】库存已不足'];
                            break;
                        }
                    } else {
                        return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】规格已发生变化，请重新下单'];
                        break;
                    }
                } else {
                    if (intval($goods['stock']) < intval($value['num'])) {
                        return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】库存已不足'];
                        break;
                    }
                }
            } else {
                return ['code' => 0, 'msg' => '部分商品已下架，请重新下单'];
                break;
            }
        }

        return ['code' => 1, 'msg' => '商品信息校验通过'];
    }

    /**
     * 【计算订单价格】
     */
    private function countOrderPrice($goods_info, $address_id)
    {
        $goods_money        = 0;
        $freight_money      = 0;
        $freight_money_info = [];

        $address   = model('addresses')->getOne($address_id);
        $area_code = $address['area_code'];

        // 计算商品总价与运费组合信息
        foreach ($goods_info as $key => $value) {
            $num      = $value['num'];
            $goods_id = $value['goods_id'];
            $goods    = model('goods')->getOne($goods_id);

            // 计算商品价格 && 商品重量
            if ($value['spec_group_id_str']) {
                $spec_group_info = model('goods_spec_groups')->findOne(['goods_id' => $goods_id, 'id_str' => $value['spec_group_id_str']]);
                $goods_money += $spec_group_info['sell_price'] * $num;
                $goods['weight'] = $spec_group_info['weight'];
            } else {
                $goods_money += $goods['sell_price'] * $num;
            }

            // 计算商品运费
            $freight_template_id = $goods['freight_template_id'];
            if ($freight_template_id) {
                if (array_key_exists($freight_template_id, $freight_money_info)) {
                    $freight_money_info[$freight_template_id] = [
                        'num'    => $freight_money_info[$freight_template_id]['num'] + $num,
                        'weight' => $freight_money_info[$freight_template_id]['weight'] + $goods['weight'] * $num,
                    ];
                } else {
                    $freight_money_info[$freight_template_id] = [
                        'num'    => $num,
                        'weight' => $goods['weight'] * $num,
                    ];
                }
            }
        }

        // 根据运费组合信息计算运费
        foreach ($freight_money_info as $key => $value) {
            $freight_template = model('freight_templates')->getOne($key);
            if ($freight_template) {

                // 取运费模板默认参数
                $basic_value = $freight_template['basic_value'];
                $basic_price = $freight_template['basic_price'];
                $add_value   = $freight_template['add_value'];
                $add_price   = $freight_template['add_price'];

                // 如当前地址属于特殊地区，则取特殊地区的运费参数
                foreach ($freight_template['content'] as $v) {
                    if (in_array($area_code, $v['area_codes'])) {
                        $basic_value = $v['basic_value'];
                        $basic_price = $v['basic_price'];
                        $add_value   = $v['add_value'];
                        $add_price   = $v['add_price'];
                        break;
                    }
                }

                // 根据计费方式核算运费
                switch ($freight_template['type']) {
                    case 1:
                        # 按重量计费
                        $basic_value = $basic_value * 1000;
                        if ($basic_value >= $value['weight']) {
                            $freight_money += $basic_price;
                        } else {
                            $freight_money += $basic_price + ($value['weight'] - $basic_value) / ($add_value * 1000) * $add_price;
                        }
                        break;
                    case 2:
                        # 按数量计费
                        if ($basic_value >= $value['num']) {
                            $freight_money += $basic_price;
                        } else {
                            $freight_money += $basic_price + ($value['num'] - $basic_value) / $add_value * $add_price;
                        }
                        break;
                    default:
                        return ['code' => 0, 'msg' => '运费模板计费方式值非法'];
                        break 2;
                }
            } else {
                return ['code' => 0, 'msg' => '商品运费模板存在异常，请联系管理员解决'];
                break;
            }
        }

        $goods_money   = round(floatval($goods_money), 2);
        $freight_money = round(floatval($freight_money), 2);

        $data = [
            'goods_money'   => $goods_money,
            'freight_money' => $freight_money,
            'total_money'   => $goods_money + $freight_money,
        ];

        return ['code' => 1, 'msg' => 'Success', 'data' => $data];
    }

    /**
     * 【校验营销活动】
     */
    public function checkMarketActivity($market_activity_type, $market_activity_id, $user_id, $goods_info)
    {
        switch ($market_activity_type) {
            case '0':
                # 不使用营销活动
                return ['code' => 1];
                break;
            case 'discount':
                # 限时折扣活动
                // 限时折扣活动商品仅限单独购买
                if (count($goods_info) !== 1) {
                    return ['code' => 0, 'msg' => '限时折扣活动商品仅限单独购买'];
                }
                $discount = model('activity_discount_rules')->getOne($market_activity_id);
                if ($discount) {
                    if ($discount['use_num'] >= $discount['total_goods_num']) {
                        return ['code' => 0, 'msg' => '限时折扣活动已结束'];
                    } else {
                        $buy_num = 0;
                        $use_num = 0;

                        $is_discount_goods = 0;
                        foreach ($goods_info as $k => $v) {
                            if ($v['goods_id'] == $discount['goods_id']) {
                                $buy_num           = $v['num'];
                                $is_discount_goods = 1;
                                break;
                            }
                        }

                        if ($is_discount_goods == 0) {
                            return ['code' => 0, 'msg' => '当前商品不可享受限时折扣活动'];
                        }

                        $use_num        = model('user_discounts')->getUseNum(['user_id' => $user_id, 'activity_discount_rule_id' => $market_activity_id]);
                        $can_num        = $discount['user_limit_buy_num'] - $use_num;
                        $market_can_num = $discount['total_goods_num'] - $discount['use_num'];
                        if ($buy_num > $can_num) {
                            if ($can_num > 0) {
                                // 判断活动剩余数量 与 个人剩余数量
                                if ($market_can_num < $can_num) {
                                    return ['code' => 0, 'msg' => '当前活动下本商品可购买数量为' . $market_can_num . '件'];
                                } else {
                                    return ['code' => 0, 'msg' => '您在当前活动下本商品的剩余购买数量为' . $can_num . '件'];
                                }
                            } else {
                                return ['code' => 0, 'msg' => '已达到当前限时折扣活动限购数量'];
                            }
                        } else {
                            return ['code' => 1];
                        }
                    }
                } else {
                    return ['code' => 0, 'msg' => '限时折扣活动不可用'];
                }
                break;
            case 'full':
                # 满减活动
                $full = model('activity_full_rules')->getOne($market_activity_id);
                if ($full) {
                    return ['code' => 1];
                } else {
                    return ['code' => 0, 'msg' => '满减促销活动不可用'];
                }
                break;
            case 'coupon':
                # 优惠券活动
                $now = date('Y-m-d H:i:s');
                $map = [
                    'id'          => $market_activity_id,
                    'expiry_time' => ['> time', $now],
                    'status'      => 1,
                    'user_id'     => $user_id,
                ];
                $coupon = model('user_coupons')->findOne($map);
                if ($coupon) {
                    return ['code' => 1];
                } else {
                    return ['code' => 0, 'msg' => '优惠券不可用'];
                }
                break;
            default:
                return ['code' => 0, 'msg' => '营销活动类别值非法'];
                break;
        }
    }

    /**
     * 【创建订单】
     */
    private function createOrder($user_id, $address_id, $market_activity_type, $market_activity_id, $money_info, $memo)
    {
        $params = [
            'type'                 => 1,
            'user_id'              => $user_id,
            'address_id'           => $address_id,
            'market_activity_type' => $market_activity_type,
            'market_activity_id'   => $market_activity_id,
            'market_reduce_money'  => $money_info['market_reduce_money'],
            'goods_money'          => $money_info['goods_money'],
            'freight_money'        => $money_info['freight_money'],
            'total_money'          => $money_info['total_money'],
            'memo'                 => $memo,
        ];

        if ($money_info['total_money'] == 0) {
            $params['status']     = 2;
            $params['is_pay']     = 1;
            $params['is_app_pay'] = 0;
            $params['pay_type']   = 3; // 钱包支付
            $params['pay_time']   = date('Y-m-d H:i:s');
        }

        return model('orders')->addOne($params);
    }

    /**
     * 【处理使用的营销活动】
     */
    private function dealMarketActivity($user_id, $money_info, $market_activity_type, $market_activity_id, $goods_info)
    {
        // 营销活动减免的金额
        $reduce_money = 0;

        switch ($market_activity_type) {
            case '0':
                # 未使用营销活动
                break;
            case 'discount':
                # 限时折扣活动
                $discount_rule = model('activity_discount_rules')->getOne($market_activity_id);

                // 更新活动规则中的已使用数量
                $buy_num    = 0;
                $sell_price = 0;
                foreach ($goods_info as $k => $v) {
                    if ($v['goods_id'] == $discount_rule['goods_id']) {
                        // 获取商品（或规格商品）的销售价
                        $goods      = model('goods')->getOne($v['goods_id']);
                        $sell_price = $goods['sell_price'];
                        if ($v['spec_group_id_str']) {
                            $spec_group_info = model('goods_spec_groups')->findOne(['goods_id' => $v['goods_id'], 'id_str' => $v['spec_group_id_str']]);
                            $sell_price      = $spec_group_info['sell_price'];
                        }

                        // 购买数量
                        $buy_num = $v['num'];
                        break;
                    }
                }
                model('activity_discount_rules')->editOne(['id' => $market_activity_id, 'use_num' => ($discount_rule['use_num'] + $buy_num)]);

                // 更新个人活动中的已使用数量
                $update_discount_data = [
                    'user_id'                   => $user_id,
                    'activity_discount_rule_id' => $market_activity_id,
                    'use_num'                   => $buy_num,
                ];
                model('user_discounts')->addOne($update_discount_data);

                // 计算优惠金额
                $reduce_money = ($sell_price - $discount_rule['discount_price']) * $buy_num;
                break;
            case 'full':
                # 满减活动
                $full_rule    = model('activity_full_rules')->getOne($market_activity_id);
                $reduce_money = $full_rule['reduce_money'];
                break;
            case 'coupon':
                # 优惠券活动

                // 修改优惠券状态为已使用(不管是什么类型的券都改变状态)
                model('user_coupons')->editOne(['id' => $market_activity_id, 'status' => 2]);

                $user_coupon = model('user_coupons')->getOne($market_activity_id);
                if ($user_coupon['coupon_type'] == 'full') {
                    $reduce_money = $user_coupon['change_value'];
                } elseif ($user_coupon['coupon_type'] == 'discount') {
                    $reduce_money = $money_info['total_money'] * (1.00 - 0.1 * $user_coupon['change_value']);
                }
                break;
            default:
                # code
                break;
        }

        $reduce_money = round(floatval($reduce_money), 2);

        return ['code' => 1, 'msg' => 'Success', 'data' => $reduce_money];
    }

    /**
     * 【写入订单商品信息】
     */
    private function updateOrderGoods($user_id, $order_id, $goods_info, $money_info)
    {
        // 商品实际金额占商品总金额的比例
        if (($money_info['total_money'] - $money_info['freight_money'] + $money_info['market_reduce_money']) > 0) {
            $rate = ($money_info['total_money'] - $money_info['freight_money']) / ($money_info['total_money'] - $money_info['freight_money'] + $money_info['market_reduce_money']);
        } else {
            $rate = 0;
        }

        $params = [];
        foreach ($goods_info as $key => $value) {
            $goods = model('goods')->getOne($value['goods_id']);

            $spec_group_info = '';
            $thum            = base64_to_img([$goods['thum']])[0];

            if ($value['spec_group_id_str']) {
                $goods_spec_group = model('goods_spec_groups')->findOne(['goods_id' => $value['goods_id'], 'id_str' => $value['spec_group_id_str']]);
                if ($goods_spec_group['thum']) {
                    $thum = base64_to_img([$goods_spec_group['thum']])[0];
                }
                $goods['sell_price'] = $goods_spec_group['sell_price'];
                $goods['weight']     = $goods_spec_group['weight'];
                $spec_group_info     = $goods_spec_group['spec_option_group'];
            }

            $params[] = [
                'order_id'          => $order_id,
                'goods_id'          => $value['goods_id'],
                'user_id'           => $user_id,
                'spec_group_id_str' => $value['spec_group_id_str'],
                'num'               => $value['num'],
                'name'              => $goods['name'],
                'thum'              => $thum,
                'intro'             => $goods['intro'],
                'standard'          => $goods['standard'],
                'spec_group_info'   => $spec_group_info,
                'sell_price'        => $goods['sell_price'],
                'real_price'        => $goods['sell_price'] * $value['num'] * $rate,
                'weight'            => $goods['weight'],
            ];

            // 清除购物车
            model('carts')->cleanUserCartTrue(['user_id' => $user_id, 'goods_id' => $value['goods_id'], 'spec_group_id_str' => $value['spec_group_id_str']]);
        }

        return model('order_goods')->batchAdd($params);
    }

    // 校验订单（订单预支付时调用）
    public function checkOrder($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if (!$order) {
            return ['code' => 0, 'data' => [], 'msg' => '订单不存在'];
        }

        if ($order['status'] !== 1 || $order['is_pay'] == 1) {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可支付'];
        }

        $order_type  = $order['type'];
        $order_goods = $order['order_goods_info'];
        foreach ($order_goods as $key => $value) {
            $goods = model('goods')->getOne($value['goods_id']);
            if (!$goods) {
                return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】已下架，请重新下单'];
                break;
            }

            if ($goods['status'] != 1) {
                return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】已下架，请重新下单'];
                break;
            }

            // 判断规格是否正常
            if ($value['spec_group_id_str']) {
                $spec = model('goods_spec_groups')->findOne(['goods_id' => $goods['id'], 'id_str' => $value['spec_group_id_str']]);
                if (!$spec) {
                    return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】数据已更新，请重新下单'];
                    break;
                }
            }

            if ($order_type == 1 || $order_type == 2) {
                # 普通订单 与 积分商城订单（走正常库存校验）
                if ($value['spec_group_id_str']) {
                    if (intval($spec['stock']) < intval($value['num'])) {
                        return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】库存已不足，请重新下单'];
                        break;
                    }
                } else {
                    if (intval($goods['stock']) < intval($value['num'])) {
                        return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】库存已不足，请重新下单'];
                        break;
                    }
                }
            } elseif ($order_type == 3) {
                # 会员拼团库存校验
                $group_buy_user_goods = model('group_buy_user_goods')->findOne(['goods_id' => $value['goods_id']]);
                if (!$group_buy_user_goods) {
                    return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】拼团数据不存在，请联系管理员'];
                }

                if ($group_buy_user_goods['status'] != 1) {
                    return ['code' => 0, 'msg' => '当前团购商品已下架'];
                }

                if ($order['group_buy_order_pid']) {
                    $parent_order = model('orders')->getOne($order['group_buy_order_pid']);
                    if ($parent_order) {
                        // 当前拼团是否已超时
                        $end_time = strtotime($parent_order['pay_time']) + 3600 * $parent_order['group_buy_time_length'];
                        if (time() >= $end_time) {
                            return ['code' => 0, 'msg' => '当前团队拼团已结束'];
                        }
                    } else {
                        return ['code' => 0, 'msg' => '当前团队拼团已结束'];
                    }
                }

                if ($value['spec_group_id_str']) {
                    $is_flag = 0;
                    foreach ($group_buy_user_goods['spec_group_info'] as $k => $v) {
                        if ($v['spec_group_id_str'] == $value['spec_group_id_str']) {
                            if (intval($v['stock']) < intval($value['num'])) {
                                return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】库存已不足，请重新下单'];
                                break 2;
                            }
                            $is_flag = 1;
                        }
                    }

                    if ($is_flag == 0) {
                        return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】拼团数据未同步商品数据，请联系管理员'];
                    }
                } else {
                    if (intval($group_buy_user_goods['stock']) < intval($value['num'])) {
                        return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】库存已不足，请重新下单'];
                        break;
                    }
                }

            } elseif ($order_type == 4) {
                # 系统拼团库存校验
                $group_buy_system_goods = model('group_buy_system_goods')->findOne(['goods_id' => $value['goods_id']]);
                if (!$group_buy_system_goods) {
                    return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】拼团数据不存在，请联系管理员'];
                }

                if ($group_buy_system_goods['status'] != 1) {
                    return ['code' => 0, 'msg' => '当前团购商品已下架'];
                }

                if (time() >= strtotime($group_buy_system_goods['end_time'])) {
                    return ['code' => 0, 'msg' => '当前团购或动已结束'];
                }

                if ($value['spec_group_id_str']) {
                    $is_flag = 0;
                    foreach ($group_buy_system_goods['spec_group_info'] as $k => $v) {
                        if ($v['spec_group_id_str'] == $value['spec_group_id_str']) {
                            if (intval($v['stock']) < intval($value['num'])) {
                                return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】库存已不足，请重新下单'];
                                break 2;
                            }
                            $is_flag = 1;
                        }
                    }

                    if ($is_flag == 0) {
                        return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】拼团数据未同步商品数据，请联系管理员'];
                    }
                } else {
                    if (intval($group_buy_system_goods['stock']) < intval($value['num'])) {
                        return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】库存已不足，请重新下单'];
                        break;
                    }
                }

            } else {
                return ['code' => 0, 'data' => [], 'msg' => '订单类别错误'];
                break;
            }

        }

        return ['code' => 1, 'data' => [], 'msg' => '订单校验成功'];
    }

    /**
     * 【order】支付成功后处理库存与收藏量
     */
    public function update_goods_info($order_no)
    {
        $order = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            $order_type  = $order['type'];
            $order_goods = model('order_goods')->getAll(['order_id' => $order['id']]);
            foreach ($order_goods as $key => $value) {
                $goods_id = $value['goods_id'];
                $num      = $value['num'];
                model('goods')->updateNum($goods_id, '+', 'sell_num', $num);

                // 扣减库存
                if ($order_type == 1 || $order_type == 2) {
                    # 普通订单 与 积分商城订单
                    model('goods')->updateNum($goods_id, '-', 'stock', $num);
                    if ($value['spec_group_id_str']) {
                        model('goods_spec_groups')->updateNum($value['spec_group_id_str'], '-', 'stock', $num);
                    }
                } elseif ($order_type == 3) {
                    # 会员拼团订单
                    $group_buy_user_goods = model('group_buy_user_goods')->findOne(['goods_id' => $goods_id])->toArray();
                    if ($group_buy_user_goods) {
                        foreach ($group_buy_user_goods['spec_group_info'] as $k => $v) {
                            if ($v['spec_group_id_str'] == $value['spec_group_id_str']) {
                                $group_buy_user_goods['spec_group_info'][$k]['stock'] -= $num;
                            }
                        }

                        $update_data = [
                            'id'              => $group_buy_user_goods['id'],
                            'stock'           => $group_buy_user_goods['stock'] - $num,
                            'spec_group_info' => $group_buy_user_goods['spec_group_info'],
                        ];

                        model('group_buy_user_goods')->editOne($update_data);
                    }
                } elseif ($order_type == 4) {
                    # 系统拼团订单
                    $group_buy_system_goods = model('group_buy_system_goods')->findOne(['goods_id' => $goods_id])->toArray();
                    if ($group_buy_system_goods) {
                        foreach ($group_buy_system_goods['spec_group_info'] as $k => $v) {
                            if ($v['spec_group_id_str'] == $value['spec_group_id_str']) {
                                $group_buy_system_goods['spec_group_info'][$k]['stock'] -= $num;
                            }
                        }

                        $update_data = [
                            'id'              => $group_buy_system_goods['id'],
                            'stock'           => $group_buy_system_goods['stock'] - $num,
                            'spec_group_info' => $group_buy_system_goods['spec_group_info'],
                        ];

                        model('group_buy_system_goods')->editOne($update_data);
                    }
                }
            }

            // 普通订单走分销分红的处理
            if ($order_type == 1) {
                // 分销逻辑
                import('app.api_extend.extend.drp.Drp');
                $Drp = new \Drp();
                // ============【分销系统】改变分佣的订单状态begin==============
                $Drp->change_order_status($order['id'], 2);
                // ============【分销系统】改变分佣的订单状态end================

                // 分红逻辑
                import('app.api_extend.extend.drp.Bonus');
                $Bonus = new \Bonus();
                // ============【分销系统】改变分佣的订单状态begin==============
                $Bonus->change_order_status($order['id'], 2);
                // ============【分销系统】改变分佣的订单状态end================
            }

            if ($order_type == 3 || $order_type == 4) {
                $this->update_group_buy($order_no);
            }
        }
    }

    /**
     * 【order】更新拼团信息
     */
    private function update_group_buy($order_no)
    {
        $order = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            $order_type = $order['type'];

            // 如果是普通订单或积分订单走正常物流
            if ($order_type == 1 || $order_type == 2) {
                return;
            }

            // 会员拼团订单
            if ($order_type == 3) {
                if ($order['is_group_buy_first'] == 1) {
                    // 如为发起的拼团, 更新拼团的结束时间
                    $end_time = strtotime($order['pay_time']) + 3600 * $order['group_buy_time_length'];
                    model('orders')->editOne(['id' => $order['id'], 'group_buy_end_timestamp' => $end_time]);

                    // 团状态
                    $status = 1; // 待拼团

                    // 创建团
                    $data = [
                        'group_buy_type'      => 2,
                        'goods_id'            => $order['group_buy_goods_id'],
                        'group_buy_order_pid' => $order['id'],
                        'begin_time'          => $order['pay_time'],
                        'end_time'            => date("Y-m-d H:i:s", $end_time),
                        'person_num'          => $order['group_buy_person_num'],
                        'info'                => [
                            [
                                'user_id'  => $order['user_id'],
                                'order_id' => $order['id'],
                            ],
                        ],
                        'sort'                => 0,
                        'status'              => $status, // 待拼团
                        'end_team_type'       => 1, // 拼团未结束
                    ];

                    // 达到拼团人数, 关闭拼团
                    if ($order['group_buy_person_num'] == 1) {
                        $status                = 3;
                        $data['status']        = 3;
                        $data['end_team_type'] = 3;
                        $data['end_team_time'] = date('Y-m-d H:i:s');
                        // 处理订单拼团状态
                        model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 3]);
                        $wait_orders = model('orders')->getAll(['group_buy_order_pid' => $order['id']]);
                        $update_data = [];
                        foreach ($wait_orders as $key => $value) {
                            $update_data[] = [
                                'id'               => $value['id'],
                                'group_buy_status' => 3,
                            ];
                        }
                        model('orders')->batchEdit($update_data);
                    }

                    // 达到限时, 关闭拼团
                    if ($status == 1 && time() >= $end_time) {
                        $status                = 2;
                        $data['status']        = 2;
                        $data['end_team_type'] = 2;
                        $data['end_team_time'] = date('Y-m-d H:i:s');
                        // 处理订单拼团状态
                        model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 2]);
                        $wait_orders = model('orders')->getAll(['group_buy_order_pid' => $order['id']]);
                        $update_data = [];
                        foreach ($wait_orders as $key => $value) {
                            $update_data[] = [
                                'id'               => $value['id'],
                                'group_buy_status' => 2,
                            ];
                        }
                        model('orders')->batchEdit($update_data);
                    }

                    model('group_buy_teams')->addOne($data);
                } else {
                    // 加入团
                    $team = model('group_buy_teams')->findOne(['group_buy_type' => 2, 'group_buy_order_pid' => $order['group_buy_order_pid']]);
                    if ($team) {
                        // 存在团
                        if ($team['status'] == 1) {

                            // 当前团未结束
                            $in_team  = 0;
                            $old_info = [];
                            foreach ($team['info'] as $key => $value) {
                                if ($order['user_id'] == $value['user_id']) {
                                    $in_team = 1;
                                    break;
                                }

                                $old_info[] = [
                                    'user_id'  => $value['user_id'],
                                    'order_id' => $value['order_id'],
                                ];
                            }

                            if ($in_team) {
                                // 当前会员已在团中 => 触发进入待退款状态
                                model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 2]);
                            } else {
                                // 当前会员未在团中,执行拼团
                                $info = array_merge($old_info, [['user_id' => $order['user_id'], 'order_id' => $order['id']]]);

                                // 团状态
                                $status = 1; // 待拼团

                                $data = [
                                    'id'   => $team['id'],
                                    'info' => $info,
                                ];

                                // 达到拼团人数, 关闭拼团
                                if (count($info) >= $team['person_num']) {
                                    $status                = 3;
                                    $data['status']        = 3;
                                    $data['end_team_type'] = 3;
                                    $data['end_team_time'] = date('Y-m-d H:i:s');
                                    // 处理订单拼团状态
                                    model('orders')->editOne(['id' => $order['group_buy_order_pid'], 'group_buy_status' => 3]);
                                    $wait_orders = model('orders')->getAll(['group_buy_order_pid' => $order['group_buy_order_pid']]);
                                    $update_data = [];
                                    foreach ($wait_orders as $key => $value) {
                                        $update_data[] = [
                                            'id'               => $value['id'],
                                            'group_buy_status' => 3,
                                        ];
                                    }
                                    model('orders')->batchEdit($update_data);
                                }

                                // 达到限时, 关闭拼团
                                if ($status == 1 && time() >= strtotime($team['end_time'])) {
                                    $status                = 2;
                                    $data['status']        = 2;
                                    $data['end_team_type'] = 2;
                                    $data['end_team_time'] = date('Y-m-d H:i:s');
                                    // 处理订单拼团状态
                                    model('orders')->editOne(['id' => $order['group_buy_order_pid'], 'group_buy_status' => 2]);
                                    $wait_orders = model('orders')->getAll(['group_buy_order_pid' => $order['group_buy_order_pid']]);
                                    $update_data = [];
                                    foreach ($wait_orders as $key => $value) {
                                        $update_data[] = [
                                            'id'               => $value['id'],
                                            'group_buy_status' => 2,
                                        ];
                                    }
                                    model('orders')->batchEdit($update_data);
                                }

                                model('group_buy_teams')->editOne($data);
                            }
                        } else {
                            // 当前团已完成拼团 或 当前团已到期结束 => 触发进入待退款状态
                            model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 2]);
                        }
                    } else {
                        // 团已不存在 => 触发进入待退款状态
                        model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 2]);
                    }
                }
            }

            // 系统拼团订单
            if ($order_type == 4) {

                $wait_teams     = model('group_buy_teams')->getAll(['group_buy_type' => 1, 'end_time' => ['<= time', date('Y-m-d H:i:s')]]);
                $wait_team_data = [];
                foreach ($wait_teams as $key => $value) {
                    $wait_team_data[] = [
                        'id'            => $value['id'],
                        'status'        => 2,
                        'end_team_type' => 2,
                        'end_team_time' => date('Y-m-d H:i:s'),
                    ];
                }
                model('group_buy_teams')->batchEdit($wait_team_data);

                // 创建团或入团
                $teams         = model('group_buy_teams')->getTeam(['group_buy_type' => 1, 'goods_id' => $order['group_buy_goods_id'], 'status' => 1]);
                $can_join_team = 0;
                foreach ($teams as $key => $value) {
                    $in_team  = 0;
                    $old_info = [];

                    foreach ($value['info'] as $k => $v) {
                        if ($order['user_id'] == $v['user_id']) {
                            $in_team = 1;
                            break;
                        }

                        $old_info[] = [
                            'user_id'  => $v['user_id'],
                            'order_id' => $v['order_id'],
                        ];
                    }

                    if ($in_team == 0) {
                        $can_join_team = 1; // 有可加入的团，终止执行
                        $team          = $value;
                        break;
                    }
                }

                if ($can_join_team == 1) {
                    // 当前会员未在团中,执行拼团
                    $info = array_merge($old_info, [['user_id' => $order['user_id'], 'order_id' => $order['id']]]);

                    // 团状态
                    $status = 1; // 待拼团

                    $data = [
                        'id'   => $team['id'],
                        'info' => $info,
                    ];

                    // 达到拼团人数, 关闭拼团
                    if (count($info) >= $team['person_num']) {
                        $status                = 3;
                        $data['status']        = 3;
                        $data['end_team_type'] = 3;
                        $data['end_team_time'] = date('Y-m-d H:i:s');
                        // 处理订单拼团状态
                        $update_data = [];
                        foreach ($info as $key => $value) {
                            $update_data[] = [
                                'id'               => $value['order_id'],
                                'group_buy_status' => 3,
                            ];
                        }
                        model('orders')->batchEdit($update_data);
                    }

                    // 达到限时, 关闭拼团
                    if ($status == 1 && time() >= strtotime($team['end_time'])) {
                        $status                = 2;
                        $data['status']        = 2;
                        $data['end_team_type'] = 2;
                        $data['end_team_time'] = date('Y-m-d H:i:s');
                        // 处理订单拼团状态
                        $update_data = [];
                        foreach ($info as $key => $value) {
                            $update_data[] = [
                                'id'               => $value['order_id'],
                                'group_buy_status' => 2,
                            ];
                        }
                        model('orders')->batchEdit($update_data);
                    }

                    model('group_buy_teams')->editOne($data);

                } else {
                    // 新建团

                    // 团状态
                    $status = 1; // 待拼团

                    // 创建团
                    $group_buy_system_goods = model('group_buy_system_goods')->findOne(['goods_id' => $order['group_buy_goods_id']]);
                    if ($group_buy_system_goods) {
                        $begin_time = $group_buy_system_goods['begin_time'];
                    } else {
                        $begin_time = '';
                    }

                    $data = [
                        'group_buy_type'      => 1,
                        'goods_id'            => $order['group_buy_goods_id'],
                        'group_buy_order_pid' => 0,
                        'begin_time'          => $begin_time,
                        'end_time'            => date('Y-m-d H:i:s', $order['group_buy_end_timestamp']),
                        'person_num'          => $order['group_buy_person_num'],
                        'info'                => [
                            [
                                'user_id'  => $order['user_id'],
                                'order_id' => $order['id'],
                            ],
                        ],
                        'sort'                => 0,
                        'status'              => $status, // 待拼团
                        'end_team_type'       => 1, // 拼团未结束
                    ];

                    // 达到拼团人数, 关闭拼团
                    if ($order['group_buy_person_num'] == 1) {
                        $status                = 3;
                        $data['status']        = 3;
                        $data['end_team_type'] = 3;
                        $data['end_team_time'] = date('Y-m-d H:i:s');
                        // 处理订单拼团状态
                        model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 3]);
                    }

                    // 达到限时, 关闭拼团
                    if ($status == 1 && time() >= $order['group_buy_end_timestamp']) {
                        $status                = 2;
                        $data['status']        = 2;
                        $data['end_team_type'] = 2;
                        $data['end_team_time'] = date('Y-m-d H:i:s');
                        // 处理订单拼团状态
                        model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 2]);
                    }

                    model('group_buy_teams')->addOne($data);
                }
            }
        }
    }
}
