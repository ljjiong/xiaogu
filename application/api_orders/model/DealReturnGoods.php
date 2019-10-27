<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

import('app.api_extend.extend.ali.AliPay');
import('app.api_extend.extend.wechat.WechatPay');

/*
 *  【处理退货模型】
 */
class DealReturnGoods extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_return_goods';

    //类型转换
    protected $type = [
        'id'              => 'integer',
        'type'            => 'integer',
        'user_id'         => 'integer',
        'order_id'        => 'integer',
        'order_goods_id'  => 'integer',
        'return_money'    => 'float',
        'imgs'            => 'json',
        'is_return_money' => 'integer',
        'status'          => 'integer',
        'data_state'      => 'integer',
    ];
    // 拒绝退货
    public function notAgree($id)
    {
        $return_goods = model('return_goods')->getOne($id);
        if ($return_goods) {
            if ($return_goods['status'] == 1) {
                $param = [
                    'status'    => 2,
                    'deal_time' => date('Y-m-d H:i:s'),
                ];

                $result = $this->save($param, ['id' => $id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    model('order_goods')->editOne(['id' => $return_goods['order_goods_id'], 'return_goods_status' => 2]);
                    $wait_deal_return_goods_count = model('order_goods')->getAllCount(['order_id' => $return_goods['order_id'], 'return_goods_status' => 1]);
                    if ($wait_deal_return_goods_count == 0) {
                        model('orders')->editOne(['id' => $return_goods['order_id'], 'is_deal_return_goods' => 1]);
                    }

                    return ['code' => 1, 'data' => [], 'msg' => '拒绝退货处理成功'];
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '当前退货订单已处理'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '退货订单数据不存在'];
        }
    }

    // 同意退货
    public function agree($id)
    {
        $return_goods = model('return_goods')->getOne($id);
        if ($return_goods) {
            if ($return_goods['status'] == 1) {
                $param = [
                    'status'    => 3,
                    'deal_time' => date('Y-m-d H:i:s'),
                ];

                $result = $this->save($param, ['id' => $id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    // 更新订单商品的状态信息
                    model('order_goods')->editOne(['id' => $return_goods['order_goods_id'], 'return_goods_status' => 3, 'is_return_goods' => 1]);
                    // 查询订单中是否含有正常物流（未提交退货的订单）
                    $no_return_goods_num = model('order_goods')->getAllCount(['order_id' => $return_goods['order_id'], 'is_return_goods' => 0]);
                    if ($no_return_goods_num == 0) {
                        model('orders')->editOne(['id' => $return_goods['order_id'], 'is_all_return_goods' => 1, 'status' => 4]);
                    }

                    $wait_deal_return_goods_count = model('order_goods')->getAllCount(['order_id' => $return_goods['order_id'], 'return_goods_status' => 1]);
                    if ($wait_deal_return_goods_count == 0) {
                        model('orders')->editOne(['id' => $return_goods['order_id'], 'is_deal_return_goods' => 1]);
                    }

                    // 写入订单中的退货金额
                    $order = model('orders')->getOne($return_goods['order_id']);
                    model('orders')->editOne(['return_goods_money' => ($order['return_goods_money'] + $return_goods['return_money']), 'id' => $order['id']]);

                    return ['code' => 1, 'data' => [], 'msg' => '同意退货处理成功'];
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '当前退货订单已处理'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '退货订单数据不存在'];
        }
    }

    // 确认退款
    public function returnMoney($id)
    {
        $return_goods = model('return_goods')->getOne($id);
        if ($return_goods) {
            if ($return_goods['status'] == 3) {

                if ($return_goods['is_return_money'] == 1) {
                    return ['code' => 0, 'data' => [], 'msg' => '当前退货订单已退款'];
                }

                $param = [
                    'is_return_money'   => 1,
                    'return_money_time' => date('Y-m-d H:i:s'),
                ];

                $result = $this->save($param, ['id' => $id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    model('order_goods')->editOne(['id' => $return_goods['order_goods_id'], 'is_return_money' => 1]);

                    // 退款
                    $order = model('orders')->getOne($return_goods['order_id']);
                    // 钱包退款
                    if ($order['pay_type'] == 3) {
                        $result = model('user_assets')->where(['user_id' => $order['user_id']])->setInc('money', $return_goods['return_money']);
                        if (false === $result) {
                            return ['code' => 0, 'data' => [], 'msg' => '会员钱包退款返还失败'];
                        } else {
                            $asset_log_data = [
                                'user_id'      => $order['user_id'],
                                'asset_type'   => 'money',
                                'change_type'  => 'user_pay_return',
                                'change_money' => $return_goods['return_money'],
                                'intro'        => '订单退款【' . $return_goods['return_order_no'] . '】',
                                'desc'         => '会员申请订单退款，退款订单号：' . $return_goods['return_order_no'],
                            ];
                            model('user_asset_logs')->addOne($asset_log_data);

                            if (($order['type'] == 3 || $order['type'] == 4) && $order['group_buy_status'] == 4) {
                                model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 5]);
                            }

                            return ['code' => 1, 'data' => [], 'msg' => '钱包退款返还成功'];
                        }

                        // 支付宝退款
                    } elseif ($order['pay_type'] == 1) {
                        $ali_pay = new \AliPay();
                        $result  = $ali_pay->refund($order['order_no'], $return_goods['return_order_no'], $return_goods['return_money'], '申请退款');

                        if ($result['code']) {
                            if (($order['type'] == 3 || $order['type'] == 4) && $order['group_buy_status'] == 4) {
                                model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 5]);
                            }
                        }

                        return ['code' => $result['code'], 'data' => [], 'msg' => $result['msg']];

                        // 微信退款
                    } elseif ($order['pay_type'] == 2) {
                        $wechat_pay = new \WechatPay();
                        if ($order['is_app_pay']) {
                            $result = $wechat_pay->app_refund($order['order_no'], $return_goods['return_order_no'], $return_goods['return_money'], '申请退款');
                        } else {
                            $result = $wechat_pay->refund($order['order_no'], $return_goods['return_order_no'], $return_goods['return_money'], '申请退款');
                        }

                        if ($result['code']) {
                            if (($order['type'] == 3 || $order['type'] == 4) && $order['group_buy_status'] == 4) {
                                model('orders')->editOne(['id' => $order['id'], 'group_buy_status' => 5]);
                            }
                        }

                        return ['code' => $result['code'], 'data' => [], 'msg' => $result['msg']];
                    }

                    return ['code' => 1, 'data' => [], 'msg' => '同意退货处理成功'];
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '当前退货订单审核未通过，不可退款'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '退货订单数据不存在'];
        }
    }
}
