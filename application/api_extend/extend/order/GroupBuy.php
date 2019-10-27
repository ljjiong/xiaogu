<?php
/**
 *  团购活动
 **/

use think\Db;

class GroupBuy
{
    // 是否开启团购活动
    private $is_open;

    // 团购活动模式：1系统自动拼团 2会员相互拼团
    private $group_buy_type;

    /**
     * 【init】初始化参数
     */
    public function __construct()
    {
        $data = include 'application/api_group_buy/config-group-buy.php';

        $this->is_open        = $data['is_open'];
        $this->group_buy_type = $data['type'];
    }

    /**
     * 【读取团购活动基础信息】
     */
    public function rule()
    {
        return [
            'is_open' => boolval($this->is_open),
            'type'    => $this->group_buy_type,
        ];
    }

    /**
    ===============添加或更新系统团购商品begin======================
     */

    /**
     * 【添加或更新系统团购商品】
     */
    public function update_group_buy_system_goods($type, $goods_id, $begin_time, $end_time, $person_num, $money, $stock, $person_buy_num, $sort, $status, $spec_group_info = [])
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '团购活动关闭中'];
        }

        if ($this->group_buy_type == 2) {
            return ['code' => 0, 'msg' => '当前团购模式为会员拼团，暂不可编辑系统团购商品'];
        }

        // 校验是否已设置为系统团购商品
        $result = $this->check_group_buy_system_goods($goods_id);
        switch ($type) {
            case 1:
                # 新增系统团购商品
                if ($result['code'] == 1) {
                    return ['code' => 0, 'msg' => '当前商品已设置为系统团购商品'];
                }
                break;
            case 2:
                # 更新系统团购商品
                if ($result['code'] == 0) {
                    return ['code' => 0, 'msg' => '当前商品暂未设置为系统团购商品'];
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

        // 活动结束时间必须大于开始时间
        if (strtotime($end_time) <= strtotime($begin_time)) {
            return ['code' => 0, 'msg' => '活动结束时间必须大于开始时间'];
        }

        // 团购人数必须为数值型
        if (!is_numeric($person_num)) {
            return ['code' => 0, 'msg' => '团购人数必须为整数'];
        }

        // 团购人数不能小于2
        if ($person_num < 2) {
            return ['code' => 0, 'msg' => '团购人数不能小于2'];
        }

        // 团购价必须为数值型
        if (!is_numeric($money)) {
            return ['code' => 0, 'msg' => '团购价必须为整数或小数'];
        }

        // 团购价不能小于0
        if ($money < 0) {
            return ['code' => 0, 'msg' => '团购价不能小于0'];
        }

        // 库存必须为数值型
        if (!is_numeric($stock)) {
            return ['code' => 0, 'msg' => '库存必须为整数'];
        }

        // 库存不能小于0
        if ($stock < 0) {
            return ['code' => 0, 'msg' => '库存不能小于0'];
        }

        // 是否大于当前库存
        if ($stock > $goods['stock']) {
            return ['code' => 0, 'msg' => '当前商品库存不足'];
        }

        // 单人单笔订单限购买数量必须为数值型
        if (!is_numeric($person_buy_num)) {
            return ['code' => 0, 'msg' => '单人单笔订单限购买数量必须为整数'];
        }

        // 单人单笔订单限购买数量不能小于0
        if ($person_buy_num < 0) {
            return ['code' => 0, 'msg' => '单人单笔订单限购买数量不能小于0'];
        }

        // 判断是否设置了商品的所有规格信息
        $goods_spec_group_num = model('goods_spec_groups')->getAllCount(['goods_id' => $goods_id]);
        if (count($spec_group_info) !== $goods_spec_group_num) {
            return ['code' => 0, 'msg' => '请设置完整当前商品所有的规格组合信息'];
        }

        $spec_group_id_strs = [];
        $total_stock        = 0;
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

            if (!is_numeric($v['person_num'])) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】团购人数必须为整数'];
                break;
            }

            if ($v['person_num'] < 2) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】团购人数不能小于2'];
                break;
            }

            if (!is_numeric($v['money'])) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】团购价必须为整数或小数'];
                break;
            }

            if ($v['money'] < 0) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】团购价不能小于0'];
                break;
            }

            if (!is_numeric($v['stock'])) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】库存必须为整数'];
                break;
            }

            if ($v['stock'] < 0) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】库存不能小于0'];
                break;
            }

            if ($v['stock'] > $spec_group['stock']) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】库存不足'];
                break;
            }

            $total_stock += $v['stock'];
        }

        if (count($spec_group_info) > 0) {
            $stock = $total_stock;
        }

        $update_data = [
            'goods_id'        => $goods_id,
            'begin_time'      => $begin_time,
            'end_time'        => $end_time,
            'person_num'      => $person_num,
            'money'           => $money,
            'stock'           => $stock,
            'person_buy_num'  => $person_buy_num,
            'spec_group_info' => $spec_group_info,
            'sort'            => $sort,
            'status'          => $status,
        ];

        if ($type == 1) {
            $result = model('group_buy_system_goods')->addOne($update_data);

            // 扣除库存
            model('goods')->updateNum($goods_id, '-', 'stock', $stock);
            if (count($spec_group_info) > 0) {
                $update_stock_data = [];
                foreach ($spec_group_info as $k => $v) {
                    $spec_group = model('goods_spec_groups')->findOne(['goods_id' => $goods_id, 'id_str' => $v['spec_group_id_str']]);
                    if ($spec_group) {
                        $update_stock_data[] = [
                            'id'    => $spec_group['id'],
                            'stock' => intval($spec_group['stock'] - $v['stock']),
                        ];
                    }
                }
                model('goods_spec_groups')->batchEdit($update_stock_data);
            }
        } elseif ($type == 2) {
            $update_data['id'] = $id;
            $result            = model('group_buy_system_goods')->editOne($update_data);
        } else {
            $result = ['code' => 0, 'msg' => '操作类型错误'];
        }

        return $result;
    }

    /**
     * 【校验是否为团购商品】
     */
    private function check_group_buy_system_goods($goods_id)
    {
        $group_buy_system_goods = model('group_buy_system_goods')->findOne(['goods_id' => $goods_id]);
        if ($group_buy_system_goods) {
            return ['code' => 1, 'data' => $group_buy_system_goods['id']];
        } else {
            return ['code' => 0];
        }
    }

    /**
    ===============添加或更新系统团购商品end======================
     */

    /**
    ===============添加或更新会员团购商品begin======================
     */

    /**
     * 【添加或更新系统团购商品】
     */
    public function update_group_buy_user_goods($type, $goods_id, $time_length, $person_num, $money, $stock, $person_buy_num, $sort, $status, $spec_group_info = [])
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '团购活动关闭中'];
        }

        if ($this->group_buy_type == 1) {
            return ['code' => 0, 'msg' => '当前团购模式为系统拼团，暂不可编辑会员团购商品'];
        }

        // 校验是否已设置为系统团购商品
        $result = $this->check_group_buy_user_goods($goods_id);
        switch ($type) {
            case 1:
                # 新增系统团购商品
                if ($result['code'] == 1) {
                    return ['code' => 0, 'msg' => '当前商品已设置为会员团购商品'];
                }
                break;
            case 2:
                # 更新系统团购商品
                if ($result['code'] == 0) {
                    return ['code' => 0, 'msg' => '当前商品暂未设置为会员团购商品'];
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

        // 拼团时长必须为数值型
        if (!is_numeric($time_length)) {
            return ['code' => 0, 'msg' => '拼团时长必须为数值型'];
        }

        // 拼团时长不能小于0
        if ($time_length <= 0) {
            return ['code' => 0, 'msg' => '拼团时长必须大于0'];
        }

        // 团购人数必须为数值型
        if (!is_numeric($person_num)) {
            return ['code' => 0, 'msg' => '团购人数必须为整数'];
        }

        // 团购人数不能小于2
        if ($person_num < 2) {
            return ['code' => 0, 'msg' => '团购人数不能小于2'];
        }

        // 团购价必须为数值型
        if (!is_numeric($money)) {
            return ['code' => 0, 'msg' => '团购价必须为整数或小数'];
        }

        // 团购价不能小于0
        if ($money < 0) {
            return ['code' => 0, 'msg' => '团购价不能小于0'];
        }

        // 库存必须为数值型
        if (!is_numeric($stock)) {
            return ['code' => 0, 'msg' => '库存必须为整数'];
        }

        // 库存不能小于0
        if ($stock < 0) {
            return ['code' => 0, 'msg' => '库存不能小于0'];
        }

        // 是否大于当前库存
        if ($stock > $goods['stock']) {
            return ['code' => 0, 'msg' => '当前商品库存不足'];
        }

        // 单人单笔订单限购买数量必须为数值型
        if (!is_numeric($person_buy_num)) {
            return ['code' => 0, 'msg' => '单人单笔订单限购买数量必须为整数'];
        }

        // 单人单笔订单限购买数量不能小于0
        if ($person_buy_num < 0) {
            return ['code' => 0, 'msg' => '单人单笔订单限购买数量不能小于0'];
        }

        // 判断是否设置了商品的所有规格信息
        $goods_spec_group_num = model('goods_spec_groups')->getAllCount(['goods_id' => $goods_id]);
        if (count($spec_group_info) !== $goods_spec_group_num) {
            return ['code' => 0, 'msg' => '请设置完整当前商品所有的规格组合信息'];
        }

        $spec_group_id_strs = [];
        $total_stock        = 0;
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

            if (!is_numeric($v['person_num'])) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】团购人数必须为整数'];
                break;
            }

            if ($v['person_num'] < 2) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】团购人数不能小于2'];
                break;
            }

            if (!is_numeric($v['money'])) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】团购价必须为整数或小数'];
                break;
            }

            if ($v['money'] < 0) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】团购价不能小于0'];
                break;
            }

            if (!is_numeric($v['stock'])) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】库存必须为整数'];
                break;
            }

            if ($v['stock'] < 0) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】库存不能小于0'];
                break;
            }

            if ($v['stock'] > $spec_group['stock']) {
                return ['code' => 0, 'msg' => '商品规格组合项【' . $spec_group['spec_option_group'] . '】库存不足'];
                break;
            }

            $total_stock += $v['stock'];
        }

        if (count($spec_group_info) > 0) {
            $stock = $total_stock;
        }

        $update_data = [
            'goods_id'        => $goods_id,
            'time_length'     => $time_length,
            'person_num'      => $person_num,
            'money'           => $money,
            'stock'           => $stock,
            'person_buy_num'  => $person_buy_num,
            'spec_group_info' => $spec_group_info,
            'sort'            => $sort,
            'status'          => $status,
        ];

        if ($type == 1) {
            $result = model('group_buy_user_goods')->addOne($update_data);

            // 扣除库存
            model('goods')->updateNum($goods_id, '-', 'stock', $stock);
            if (count($spec_group_info) > 0) {
                $update_stock_data = [];
                foreach ($spec_group_info as $k => $v) {
                    $spec_group = model('goods_spec_groups')->findOne(['goods_id' => $goods_id, 'id_str' => $v['spec_group_id_str']]);
                    if ($spec_group) {
                        $update_stock_data[] = [
                            'id'    => $spec_group['id'],
                            'stock' => intval($spec_group['stock'] - $v['stock']),
                        ];
                    }
                }
                model('goods_spec_groups')->batchEdit($update_stock_data);
            }
        } elseif ($type == 2) {
            $update_data['id'] = $id;
            $result            = model('group_buy_user_goods')->editOne($update_data);
        } else {
            $result = ['code' => 0, 'msg' => '操作类型错误'];
        }

        return $result;
    }

    /**
     * 【校验是否为团购商品】
     */
    private function check_group_buy_user_goods($goods_id)
    {
        $group_buy_user_goods = model('group_buy_user_goods')->findOne(['goods_id' => $goods_id]);
        if ($group_buy_user_goods) {
            return ['code' => 1, 'data' => $group_buy_user_goods['id']];
        } else {
            return ['code' => 0];
        }
    }

    /**
    ===============添加或更新会员团购商品end======================
     */

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
            return ['code' => 0, 'msg' => '团购活动关闭中'];
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

        // 创建订单
        $result = $this->createOrder($user_id, $address_id, $goods_id, $memo, $money_info);
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

        return ['code' => 1, 'msg' => '创建订单成功', 'data' => $order];
    }

    /**
     * 【会员拼团加入拼团】
     */
    public function join($order_pid, $user_id, $address_id, $goods_id, $num, $spec_group_id_str, $memo)
    {
        if ($this->is_open == 0) {
            return ['code' => 0, 'msg' => '团购活动关闭中'];
        }

        if ($this->group_buy_type == 1) {
            return ['code' => 0, 'msg' => '会员拼团关闭中'];
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

        // 校验父订单
        $result = $this->checkParentOrder($order_pid, $user_id);
        if (!$result['code']) {
            return $result;
        }

        // 创建订单
        $result = $this->createOrder($user_id, $address_id, $goods_id, $memo, $money_info, $order_pid);
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
        }

        $num = intval($num);
        if ($num < 1) {
            return ['code' => 0, 'msg' => '商品数量不能小于1'];
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

        // 校验商品规格
        $is_has_spec_group = model('goods_spec_groups')->findOne(['goods_id' => $goods_id]);
        if ($is_has_spec_group) {
            if ($spec_group_id_str) {
                $spec_group = model('goods_spec_groups')->findOne(['goods_id' => $goods_id, 'id_str' => $spec_group_id_str]);
                if (!$spec_group) {
                    return ['code' => 0, 'msg' => '商品【' . $goods['name'] . '】规格已发生变化，请重新下单'];
                }
            } else {
                return ['code' => 0, 'msg' => '请选择商品【' . $goods['name'] . '】的具体规格'];
            }
        } else {
            if ($spec_group_id_str) {
                return ['code' => 0, 'msg' => '当前商品【' . $goods['name'] . '】无规格组合信息'];
            }
        }

        // 校验团购商品
        if ($this->group_buy_type == 1) {
            $group_buy_goods = model('group_buy_system_goods')->findOne(['goods_id' => $goods_id]);
            if ($group_buy_goods) {
                if ($group_buy_goods['status'] != 1) {
                    return ['code' => 0, 'msg' => '当前团购商品已下架，请刷新重试'];
                }

                // 不随规格变化的参数
                $begin_time     = $group_buy_goods['begin_time'];
                $end_time       = $group_buy_goods['end_time'];
                $person_buy_num = $group_buy_goods['person_buy_num'];

                // 随规格变化的参数
                $person_num = $group_buy_goods['person_num'];
                $money      = $group_buy_goods['money'];
                $stock      = $group_buy_goods['stock'];

                if ($is_has_spec_group) {
                    $is_flag = 0;
                    foreach ($group_buy_goods['spec_group_info'] as $key => $value) {
                        if ($value['spec_group_id_str'] == $spec_group_id_str) {
                            $person_num = $value['person_num'];
                            $money      = $value['money'];
                            $stock      = $value['stock'];
                            $is_flag    = 1;
                            break;
                        }
                    }

                    if ($is_flag == 0) {
                        return ['code' => 0, 'msg' => '团购商品规格信息未同步商品信息，请联系管理员'];
                    }
                }
            } else {
                return ['code' => 0, 'msg' => '当前团购商品已下架，请刷新下单'];
            }

            if (time() >= strtotime($end_time)) {
                return ['code' => 0, 'msg' => '当前商品拼团活动已结束'];
            }

            if ($num > $stock) {
                return ['code' => 0, 'msg' => '当前团购商品库存已不足'];
            }

            if ($num > $person_buy_num) {
                return ['code' => 0, 'msg' => '当前团购商品限购' . $person_buy_num . '件'];
            }

            $data = [
                'begin_time'      => $begin_time,
                'begin_timestamp' => strtotime($begin_time),
                'end_time'        => $end_time,
                'end_timestamp'   => strtotime($end_time),
                'person_buy_num'  => $person_buy_num,
                'person_num'      => $person_num,
                'stock'           => $stock,
                'sell_price'      => $money,
                'goods_money'     => $money * $num,
                'freight_money'   => 0,
                'total_money'     => $money * $num,
            ];

        } elseif ($this->group_buy_type == 2) {
            $group_buy_goods = model('group_buy_user_goods')->findOne(['goods_id' => $goods_id]);
            if ($group_buy_goods) {
                if ($group_buy_goods['status'] != 1) {
                    return ['code' => 0, 'msg' => '当前团购商品已下架，请刷新重试'];
                }

                // 不随规格变化的参数
                $time_length    = $group_buy_goods['time_length'];
                $person_buy_num = $group_buy_goods['person_buy_num'];

                // 随规格变化的参数
                $person_num = $group_buy_goods['person_num'];
                $money      = $group_buy_goods['money'];
                $stock      = $group_buy_goods['stock'];

                if ($is_has_spec_group) {
                    $is_flag = 0;
                    foreach ($group_buy_goods['spec_group_info'] as $key => $value) {
                        if ($value['spec_group_id_str'] == $spec_group_id_str) {
                            $person_num = $value['person_num'];
                            $money      = $value['money'];
                            $stock      = $value['stock'];
                            $is_flag    = 1;
                            break;
                        }
                    }

                    if ($is_flag == 0) {
                        return ['code' => 0, 'msg' => '团购商品规格信息未同步商品信息，请联系管理员'];
                    }
                }
            } else {
                return ['code' => 0, 'msg' => '当前团购商品已下架，请刷新下单'];
            }

            if ($num > $stock) {
                return ['code' => 0, 'msg' => '当前团购商品库存已不足'];
            }

            if ($num > $person_buy_num) {
                return ['code' => 0, 'msg' => '当前团购商品限购' . $person_buy_num . '件'];
            }

            $data = [
                'time_length'    => $time_length,
                'person_buy_num' => $person_buy_num,
                'person_num'     => $person_num,
                'stock'          => $stock,
                'sell_price'     => $money,
                'goods_money'    => $money * $num,
                'freight_money'  => 0,
                'total_money'    => $money * $num,
            ];
        } else {
            return ['code' => 0, 'msg' => '团购模式值非法'];
        }

        return ['code' => 1, 'msg' => 'Success', 'data' => $data];
    }

    /**
     * 【校验父订单】
     */
    private function checkParentOrder($order_pid, $user_id)
    {
        $parent_order = model('orders')->getOne($order_pid);
        if ($parent_order) {
            // 当前拼团类别是否正确
            if ($parent_order['type'] !== 3) {
                return ['code' => 0, 'msg' => '当前拼团团队不可使用'];
            }

            // 当前拼团是否是发起的团
            if ($parent_order['is_group_buy_first'] !== 1) {
                return ['code' => 0, 'msg' => '当前拼团团队不可使用'];
            }

            // 校验是否加入自己发起的团
            if ($parent_order['user_id'] == $user_id) {
                return ['code' => 0, 'msg' => '您不可加入自己发起的团'];
            }

            // 校验是否已入团
            $is_join = model('orders')->findOne(['user_id' => $user_id, 'group_buy_order_pid' => $order_pid, 'status' => 2]);
            if ($is_join) {
                return ['code' => 0, 'msg' => '您已加入当前拼团，不可重复入团'];
            }

            // 当前拼团是否已支付
            if ($parent_order['is_pay'] == 0) {
                return ['code' => 0, 'msg' => '当前拼团团队暂不可加入'];
            }

            // 当前拼团是否在等待拼团状态
            if ($parent_order['group_buy_status'] !== 1) {
                return ['code' => 0, 'msg' => '当前拼团团队已不可加入'];
            }

            // 当前拼团人数是否已满
            $order_count = model('orders')->getAllCount(['group_buy_order_pid' => $order_pid, 'status' => 2, 'group_buy_status' => 1]);
            if (++$order_count >= $parent_order['group_buy_person_num']) {
                return ['code' => 0, 'msg' => '当前拼团人数已满'];
            }

            // 当前拼团是否已超时
            $end_time = strtotime($parent_order['pay_time']) + 3600 * $parent_order['group_buy_time_length'];
            if (time() >= $end_time) {
                return ['code' => 0, 'msg' => '当前团队拼团已结束'];
            }
        } else {
            return ['code' => 0, 'msg' => '所参加的拼团团队不存在'];
        }

        return ['code' => 1];
    }

    /**
     * 【创建订单】
     */
    private function createOrder($user_id, $address_id, $goods_id, $memo, $money_info, $order_pid = 0)
    {
        $params = [
            'type'                  => 3, // 会员相互拼团订单
            'user_id'               => $user_id,
            'address_id'            => $address_id,
            'market_activity_type'  => 0,
            'market_activity_id'    => 0,
            'market_reduce_money'   => 0,
            'total_score'           => 0,
            'goods_money'           => $money_info['goods_money'],
            'freight_money'         => $money_info['freight_money'],
            'total_money'           => $money_info['total_money'],
            'memo'                  => $memo,
            'is_group_buy_first'    => $order_pid == 0 ? 1 : 0,
            'group_buy_order_pid'   => $order_pid,
            'group_buy_time_length' => isset($money_info['time_length']) ? $money_info['time_length'] : 0,
            'group_buy_person_num'  => $money_info['person_num'],
            'group_buy_goods_id'    => $goods_id,
            'group_buy_status'      => 1,
            'status'                => 1,
        ];

        if ($this->group_buy_type == 1) {
            $params['type']                    = 4; // 系统自动拼团订单
            $params['is_group_buy_first']      = 0;
            $params['group_buy_end_timestamp'] = $money_info['end_timestamp'];
        } else {
            // 会员相互拼团
            if ($order_pid != 0) {
                $order                             = model('orders')->getOne($order_pid);
                $params['group_buy_end_timestamp'] = $order['group_buy_end_timestamp'];
            }
        }

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
            'sell_price'        => $money_info['sell_price'],
            'real_price'        => $money_info['goods_money'],
            'weight'            => $goods['weight'],
        ];

        return model('order_goods')->addOne($params);
    }

    /**
     * 【处理拼团时限】
     */
    public function deal_group_buy_limit()
    {
        // 结束订单
        $order_ids = Db::name('orders')->where(['data_state' => 1, 'type' => ['in', '3,4'], 'is_pay' => 1, 'group_buy_status' => 1, 'group_buy_end_timestamp' => ['<=', time()]])->column('id');
        if ($order_ids) {
            $update_data = [
                'group_buy_status' => 2,
                'update_time'      => date('Y-m-d H:i:s'),
            ];
            Db::name('orders')->where(['id' => ['in', $order_ids]])->update($update_data);
        }

        // 结束团队
        $team_ids = Db::name('group_buy_teams')->where(['data_state' => 1, 'status' => 1, 'end_time' => ['<= time', date('Y-m-d H:i:s')]])->column('id');
        if ($team_ids) {
            $update_data = [
                'status'        => 2,
                'end_team_type' => 2,
                'end_team_time' => date('Y-m-d H:i:s'),
                'update_time'   => date('Y-m-d H:i:s'),
            ];
            Db::name('group_buy_teams')->where(['id' => ['in', $team_ids]])->update($update_data);
        }
    }

    /**
     * 【处理拼团退款】
     */
    public function deal_group_buy_return_money()
    {
        // 结束订单
        $order_ids = Db::name('orders')->where(['data_state' => 1, 'type' => ['in', '3,4'], 'is_pay' => 1, 'group_buy_status' => 2])->column('id');

        foreach ($order_ids as $key => $value) {
            $order = Db::name('orders')->where(['id' => $value, 'data_state' => 1])->find();
            if ($order) {
                $order_goods = Db::name('order_goods')->where(['order_id' => $order['id'], 'data_state' => 1])->find();
                if ($order['group_buy_status'] == 2) {
                    $data = [
                        'type'            => 2, // 拼团到期退款
                        'user_id'         => $order['user_id'],
                        'order_id'        => $order['id'],
                        'order_goods_id'  => $order_goods['id'],
                        'return_order_no' => make_order_no('G'),
                        'return_money'    => $order['total_money'],
                        'return_type'     => 9,
                        'return_reason'   => '拼团失败，系统自动退款',
                        'imgs'            => json_encode([], true),
                        'status'          => 3,
                        'deal_time'       => date('Y-m-d H:i:s'),
                        'create_time'     => date('Y-m-d H:i:s'),
                        'update_time'     => date('Y-m-d H:i:s'),
                    ];
                    Db::name('return_goods')->insert($data);

                    $order_data = [
                        'group_buy_status' => 4, // 进入退款订单
                        'update_time'      => date('Y-m-d H:i:s'),
                    ];
                    Db::name('orders')->where(['id' => $value])->update($order_data);
                }
            }
        }
    }
}
