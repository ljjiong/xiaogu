<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

import('app.api_extend.extend.kdapi.Eorder');
import('app.api_extend.extend.kdapi.Eprint');

/*
 *  【电子面单模型】
 */
class Eorder extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_orders';

    //类型转换
    protected $type = [
        'id'                      => 'integer',
        'user_id'                 => 'integer',
        'type'                    => 'integer',
        'market_activity_id'      => 'integer',
        'market_reduce_money'     => 'float',
        'goods_money'             => 'float',
        'freight_money'           => 'float',
        'total_money'             => 'float',
        'total_score'             => 'float',
        'is_pay'                  => 'integer',
        'pay_type'                => 'integer',
        'is_app_pay'              => 'integer',
        'deliver_tip_num'         => 'integer',
        'is_open_eorder'          => 'integer',
        'is_submit_eorder'        => 'integer',
        'is_comment'              => 'integer',
        'is_has_return_goods'     => 'integer',
        'is_all_return_goods'     => 'integer',
        'is_deal_return_goods'    => 'integer',
        'return_goods_money'      => 'float',
        'is_group_buy_first'      => 'integer',
        'group_buy_order_pid'     => 'integer',
        'group_buy_time_length'   => 'float',
        'group_buy_end_timestamp' => 'integer',
        'group_buy_person_num'    => 'integer',
        'group_buy_goods_id'      => 'integer',
        'group_buy_status'        => 'integer',
        'status'                  => 'integer',
        'data_state'              => 'integer',
    ];

    // 创建电子面单
    public function submitEorder($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order['status'] == 3 && $order['is_submit_eorder'] == 0) {
            $eorder = new \Eorder();
            $result = $eorder->create($order_id);

            if ($result['code']) {
                $param = [
                    'is_submit_eorder'   => 1,
                    'submit_eorder_time' => date('Y-m-d H:i:s'),
                ];
                $this->save($param, ['id' => $order_id]);

                return ['code' => 1, 'data' => $result['data'], 'msg' => '创建电子面单成功'];
            } else {
                return ['code' => 0, 'data' => [], 'msg' => $result['msg']];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可创建电子面单'];
        }
    }

    // 创建电子面单
    public function batchSubmitEorder($order_ids)
    {
        $orders = model('orders')->getAll(['id' => ['in', $order_ids]]);
        foreach ($orders as $key => $order) {
            if ($order['status'] !== 3) {
                return ['code' => 0, 'data' => [], 'msg' => 'ID为' . $order['id'] . '的订单状态错误，暂不可创建电子发单'];
                break;
            }

            if ($order['is_submit_eorder'] == 1) {
                return ['code' => 0, 'data' => [], 'msg' => 'ID为' . $order['id'] . '的订单已创建电子发单'];
                break;
            }
        }

        foreach ($orders as $key => $order) {
            $eorder = new \Eorder();
            $result = $eorder->create($order['id']);
            if ($result['code']) {
                $param = [
                    'is_submit_eorder'   => 1,
                    'submit_eorder_time' => date('Y-m-d H:i:s'),
                ];
                $this->save($param, ['id' => $order['id']]);
            } else {
                return ['code' => 0, 'data' => [], 'msg' => 'ID为' . $order['id'] . '的订单创建电子发单失败，失败原因：' . $result['msg']];
                break;
            }
        }

        return ['code' => 1, 'data' => [], 'msg' => '批量创建电子面单成功'];
    }

    // 打印电子面单
    public function printEorder($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order['is_submit_eorder'] == 1) {
            $eprint = new \Eprint();
            $result = $eprint->create($order_id);

            return ['code' => 1, 'data' => $result, 'msg' => '打印电子面单提交成功'];
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可打印电子面单'];
        }
    }

    // 批量打印电子面单
    public function batchPrintEorder($order_ids)
    {
        $orders = model('orders')->getAll(['id' => ['in', $order_ids]]);
        foreach ($orders as $key => $order) {
            if ($order['is_submit_eorder'] == 0) {
                return ['code' => 0, 'data' => [], 'msg' => 'ID为' . $order['id'] . '的订单暂未创建电子发单'];
                break;
            }
        }

        $eprint = new \Eprint();
        $eprint->batch_create($order_ids);
    }
}
