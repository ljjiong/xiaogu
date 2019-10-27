<?php
/**
 *  积分商城
 **/
class ScoreShop
{
    // 是否开启积分商城
    private $is_open;

    // 积分商城模式：1积分2积分+钱
    private $score_shop_type;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data = include 'application/api_score_shop/config-score-shop.php';

        $this->is_open         = $data['is_open'];
        $this->score_shop_type = $data['type'];
    }

    /**
     * 【读取积分商城基础信息】
     */
    public function rule()
    {
        return [
            'is_open' => boolval($this->is_open),
            'type'    => $this->score_shop_type,
        ];
    }

    /**
     * 【添加或更新积分商品】
     */
    public function update_score_goods($type, $goods_id, $score, $money, $sort, $status, $spec_group_info = [])
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '积分商城关闭中'];
        }

        // 校验是否已设置为积分商品
        $result = $this->check_score_goods($goods_id);
        switch ($type) {
            case 1:
                # 新增积分商品
                if ($result['code'] == 1) {
                    return ['code' => 0, 'msg' => '当前商品已设置为积分商品'];
                }
                break;
            case 2:
                # 更新积分商品
                if ($result['code'] == 0) {
                    return ['code' => 0, 'msg' => '当前商品暂未设置为积分商品'];
                } else {
                    $id = $result['data'];
                }
                break;
            default:
                return ['code' => 0, 'msg' => '操作类型错误'];
                break;
        }

        $goods = model('goods')->getOne($goods_id);
        if (!$goods) {
            return ['code' => 0, 'msg' => '商品不存在'];
        }

        // 积分值必须为数值型
        if (!is_numeric($score)) {
            return ['code' => 0, 'msg' => '积分值必须为整数或小数'];
        }

        // 积分值必须大于0
        if ($score <= 0) {
            return ['code' => 0, 'msg' => '积分值必须大于0'];
        }

        // 金额值必须为数值型
        if (!is_numeric($money)) {
            return ['code' => 0, 'msg' => '金额值必须为整数或小数'];
        }

        // 金额值不能小于0
        if ($money < 0) {
            return ['code' => 0, 'msg' => '金额值不能小于0'];
        }

        // 积分商城启用1（完全积分模式时），金额值必须为 0
        if ($this->score_shop_type == 1 && $money !== 0) {
            return ['code' => 0, 'msg' => '金额值必须为0'];
        }

        // 判断是否设置了商品的所有规格信息
        $goods_spec_group_num = model('goods_spec_groups')->getAllCount(['goods_id' => $goods_id]);
        if (count($spec_group_info) !== $goods_spec_group_num) {
            return ['code' => 0, 'msg' => '请设置完整当前商品所有的规格组合信息'];
        }

        $spec_group_id_strs = [];
        foreach ($spec_group_info as $k => $v) {
            $spec_group = model('goods_spec_groups')->findOne(['goods_id' => $goods_id, 'id_str' => $v['spec_group_id_str']]);
            if (!$spec_group) {
                return ['code' => 0, 'msg' => '部分商品规格组合项不存在，请刷新重试'];
                break;
            }

            if (in_array($v['spec_group_id_str'], $spec_group_id_strs)) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】被重复设置'];
                break;
            } else {
                array_push($spec_group_id_strs, $v['spec_group_id_str']);
            }

            if (!is_numeric($v['score'])) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】积分值必须为整数或小数'];
                break;
            }

            if ($v['score'] <= 0) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】积分值必须大于0'];
                break;
            }

            if (!is_numeric($v['money'])) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】金额值必须为整数或小数'];
                break;
            }

            if ($v['money'] < 0) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】金额值不能小于0'];
                break;
            }

            // 积分商城启用1（完全积分模式时），金额值必须为 0
            if ($this->score_shop_type == 1 && $v['money'] !== 0) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】金额值必须为0'];
                break;
            }
        }

        $update_data = [
            'goods_id'        => $goods_id,
            'score'           => $score,
            'money'           => $money,
            'sort'            => $sort,
            'status'          => $status,
            'spec_group_info' => $spec_group_info,
        ];

        if ($type == 1) {
            $result = model('score_goods')->addOne($update_data);
        } elseif ($type == 2) {
            $update_data['id'] = $id;
            $result            = model('score_goods')->editOne($update_data);
        } else {
            $result = ['code' => 0, 'msg' => '操作类型错误'];
        }

        return $result;
    }

    /**
     * 【校验是否为积分商品】
     */
    public function check_score_goods($goods_id)
    {
        $score_goods = model('score_goods')->findOne(['goods_id' => $goods_id]);
        if ($score_goods) {
            return ['code' => 1, 'data' => $score_goods['id']];
        } else {
            return ['code' => 0];
        }
    }

    /**
    ============================================================================================================================================
    ============================================================================================================================================
    ============================================================================================================================================
    ==========================================================会员端订单处理=====================================================================
    ============================================================================================================================================
    ============================================================================================================================================
    ============================================================================================================================================
     */

    /**
     * 【订单预览】
     */
    public function view($user_id, $address_id, $goods_id, $num, $spec_group_id_str = '')
    {
        // 校验地址
        $result = $this->checkAddress($user_id, $address_id);
        if (!$result['code']) {
            return $result;
        }

        // 校验商品信息
        $result = $this->checkGoods($goods_id, $num, $spec_group_id_str);

        // 返回商品信息
        return $result;
    }

    /**
     * 【订单创建】
     */
    public function create($user_id, $address_id, $goods_id, $num, $spec_group_id_str, $memo)
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '积分商城关闭中'];
        }

        // 校验地址
        $result = $this->checkAddress($user_id, $address_id);
        if (!$result['code']) {
            return $result;
        }

        // 校验商品信息
        $result = $this->checkGoods($goods_id, $num, $spec_group_id_str);
        if ($result['code']) {
            $money_info = $result['data'];
        } else {
            return $result;
        }

        // 校验会员当前积分
        $result = $this->checkUserScore($user_id, $money_info['total_score']);
        if (!$result['code']) {
            return $result;
        }

        // 创建订单
        $result = $this->createOrder($user_id, $address_id, $memo, $money_info);
        if ($result['code']) {
            $order = $result['data'];
        } else {
            return $result;
        }

        // 写入订单商品信息
        $result = $this->updateOrderGoods($user_id, $order['id'], $goods_id, $num, $spec_group_id_str, $money_info);
        if (!$result['code']) {
            return $result;
        }

        // 获取订单的基础信息
        $order = model('orders')->getOneBasic($order['id']);

        // 无需支付的订单，立即扣减库存&增加销量
        if ($order && $order['total_money'] == 0) {
            import('app.api_extend.extend.order.OrderDeal');
            $OrderDeal = new \OrderDeal();
            $OrderDeal->update_goods_info($order['order_no']);
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
    private function checkGoods($goods_id, $num, $spec_group_id_str)
    {

        if (!is_numeric($num)) {
            return ['code' => 0, 'msg' => '商品数量必须为整数'];
            break;
        }

        $num = intval($num);
        if ($num < 1) {
            return ['code' => 0, 'msg' => '商品数量不能小于1'];
            break;
        }

        // 校验商品
        $goods = model('goods')->getOne($goods_id);
        if (!$goods) {
            return ['code' => 0, 'msg' => '当前商品已下架'];
        }

        // 校验商品状态
        if ($goods['status'] != 1) {
            return ['code' => 0, 'msg' => '当前商品已下架'];
        }

        // 校验商品规格与库存
        $is_has_spec_group = model('goods_spec_groups')->findOne(['goods_id' => $goods_id]);
        if ($is_has_spec_group) {
            if ($spec_group_id_str) {
                $spec_group = model('goods_spec_groups')->findOne(['goods_id' => $goods_id, 'id_str' => $spec_group_id_str]);
                if ($spec_group) {
                    if (intval($spec_group['stock']) < $num) {
                        return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】库存已不足'];
                    }
                } else {
                    return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】规格已发生变化，请重新下单'];
                }
            } else {
                return ['code' => 0, 'msg' => '请选择商品【' . $goods['name'] . '】的具体规格'];
            }
        } else {
            if ($spec_group_id_str) {
                return ['code' => 0, 'msg' => '当前商品【' . $goods['name'] . '】无规格组合信息'];
            }

            if (intval($goods['stock']) < $num) {
                return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】库存已不足'];
            }
        }

        // 校验积分商品
        $score_goods = model('score_goods')->findOne(['goods_id' => $goods_id]);
        if ($score_goods) {
            if ($score_goods['status'] != 1) {
                return ['code' => 0, 'msg' => '当前积分商品已下架，请刷新重试'];
            }

            $score = $score_goods['score'];
            $money = $score_goods['money'];

            if ($is_has_spec_group) {
                $is_flag = 0;
                foreach ($score_goods['spec_group_info'] as $key => $value) {
                    if ($value['spec_group_id_str'] == $spec_group_id_str) {
                        $score   = $value['score'];
                        $money   = $value['money'];
                        $is_flag = 1;
                        break;
                    }
                }

                if ($is_flag == 0) {
                    return ['code' => 0, 'msg' => '积分商品规格信息未同步商品信息，请联系管理员'];
                }
            }
        } else {
            return ['code' => 0, 'msg' => '当前积分商品已下架，请刷新下单'];
        }

        $data = [
            'score'         => $score,
            'sell_price'    => $money,
            'total_score'   => $score * $num,
            'goods_money'   => $money * $num,
            'freight_money' => 0,
            'total_money'   => $money * $num,
        ];

        return ['code' => 1, 'msg' => 'Success', 'data' => $data];
    }

    /**
     * 【校验会员积分】
     */
    private function checkUserScore($user_id, $need_score)
    {
        $user_asset = model('user_assets')->findOne(['user_id' => $user_id]);
        if ($user_asset) {
            if ($user_asset['score'] >= $need_score) {
                return ['code' => 1];
            } else {
                return ['code' => 0, 'msg' => '积分不足，不可下单'];
            }
        } else {
            return ['code' => 0, 'msg' => '当前会员资产信息异常'];
        }
    }

    /**
     * 【创建订单】
     */
    private function createOrder($user_id, $address_id, $memo, $money_info)
    {
        $result = model('score_logs')->ScoreShop($user_id, $money_info['total_score']);
        if (!$result['code']) {
            return ['code' => 0, 'msg' => $result['msg']];
        }

        $params = [
            'type'                 => 2,
            'user_id'              => $user_id,
            'address_id'           => $address_id,
            'market_activity_type' => 0,
            'market_activity_id'   => 0,
            'market_reduce_money'  => 0,
            'total_score'          => $money_info['total_score'],
            'goods_money'          => $money_info['goods_money'],
            'freight_money'        => $money_info['freight_money'],
            'total_money'          => $money_info['total_money'],
            'memo'                 => $memo,
            'status'               => 1,
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
     * 【写入订单商品信息】
     */
    private function updateOrderGoods($user_id, $order_id, $goods_id, $num, $spec_group_id_str, $money_info)
    {

        $goods = model('goods')->getOne($goods_id);

        $spec_group_info = '';
        $thum            = base64_to_img([$goods['thum']])[0];

        if ($spec_group_id_str) {
            $goods_spec_group = model('goods_spec_groups')->findOne(['goods_id' => $goods_id, 'id_str' => $spec_group_id_str]);
            if ($goods_spec_group['thum']) {
                $thum = base64_to_img([$goods_spec_group['thum']])[0];
            }
            $goods['sell_price'] = $goods_spec_group['sell_price'];
            $goods['weight']     = $goods_spec_group['weight'];
            $spec_group_info     = $goods_spec_group['spec_option_group'];
        }

        $params = [
            'order_id'          => $order_id,
            'goods_id'          => $goods_id,
            'user_id'           => $user_id,
            'spec_group_id_str' => $spec_group_id_str,
            'num'               => $num,
            'name'              => $goods['name'],
            'thum'              => $thum,
            'intro'             => $goods['intro'],
            'standard'          => $goods['standard'],
            'spec_group_info'   => $spec_group_info,
            'score'             => $money_info['score'],
            'sell_price'        => $money_info['sell_price'],
            'real_price'        => $money_info['goods_money'],
            'weight'            => $goods['weight'],
        ];

        return model('order_goods')->addOne($params);
    }
}
