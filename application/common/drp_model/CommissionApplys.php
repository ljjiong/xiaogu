<?php
namespace app\common\drp_model;

use app\common\model\BaseModel;
use think\Db;

/*
 *  【分销商佣金提现模型】
 */
class CommissionApplys extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_commission_applys';


    //类型转换
    protected $type = [
        'id'                      =>  'integer',
        'user_id'                 =>  'integer',
        'user_commission_log_ids' =>  'json',
        'money'                   =>  'float',
        'already_pay_money'       =>  'float',
        'is_pay'                  =>  'integer',
        'status'                  =>  'integer',
        'data_state'              =>  'integer',
    ];

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 初始化
    protected static function init()
    {
        // 新增前写入信息
        self::beforeInsert(function ($model) {
            $model->apply_no = make_order_no('F');

            $log_ids    = model('user_commission_logs', 'drp_model')->getColumn(['order_status' => 3, 'status' => 0, 'user_id' => $model->user_id], 'id');
            $real_money = model('user_commission_logs', 'drp_model')->getRealMoney(['order_status' => 3, 'status' => 0, 'user_id' => $model->user_id]);

            $model->user_commission_log_ids = $log_ids;
            $model->money                   = $real_money;
            $model->intro                   = '申请佣金提现';
            $model->desc                    = '申请佣金提现：' . $real_money . '￥，申请时间：' . date('Y-m-d H:i:s');
            $model->status                  = 1;
        });

        // 新增后写入信息
        self::afterInsert(function ($model) {
            $update_data = [];
            foreach ($model->user_commission_log_ids as $key => $value) {
                $update_data[] = [
                    'id'                  => $value,
                    'status'              => 1,
                    'commission_apply_id' => $model->id,
                    'apply_no'            => $model->apply_no,
                ];
            }
            model('user_commission_logs', 'drp_model')->batchEdit($update_data);

            model('user_info')->updateCommission($model->user_id);
        });
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('update_time desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('update_time desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_info'] = '';
        }

        return $data;
    }

    // 查询指定条件的预计分佣统计
    public function getMoney($where)
    {
        return $this->where($where)->sum('money');
    }

    // 获取申请提现的详情
    public function detail($id, $page_num, $page_limit)
    {
        $data           = [];
        $total_data_num = 0;

        $result = $this->getOne($id);
        if ($result) {
            $sql_str      = '';
            $array_length = count($result['user_commission_log_ids']) - 1;
            foreach ($result['user_commission_log_ids'] as $key => $value) {
                if ($key == $array_length) {
                    $sql_str .= 'id = ' . $value;
                } else {
                    $sql_str .= 'id = ' . $value . ' OR ';
                }
            }

            $start = ($page_num - 1) * $page_limit;
            $limit = $page_limit == 0 ? 5 : $page_limit;

            $lists = Db::query('
            SELECT id,order_id,order_status,order_goods_id,user_id,source_user_id,level,status FROM wancll_user_commission_logs
            WHERE (' . $sql_str . ') AND data_state = 1
            GROUP BY order_id  ORDER BY order_id
            DESC LIMIT :data_start,:page_limit',
                ['data_start' => $start, 'page_limit' => $limit]);

            foreach ($lists as $key => $value) {

                $find_map = [
                    'order_id' => $value['order_id'],
                    'user_id'  => $value['user_id'],
                ];

                $logs = model('user_commission_logs', 'drp_model')->getAll($find_map);

                $lists[$key]['source_user_info'] = model('users')->getUserBasicInfo($value['source_user_id']);
                $lists[$key]['order_info']       = model('orders')->where('id', $value['order_id'])->field('order_no,create_time,total_money')->find();
                $lists[$key]['order_goods_info'] = $logs;

                $data[] = $lists[$key];
            }

            $result['commission_info'] = $data;
            $total_data_num            = count($result);
        }

        return ['data' => $result, 'total_data_num' => $total_data_num];
    }

}
