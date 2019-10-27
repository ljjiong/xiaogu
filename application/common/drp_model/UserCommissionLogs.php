<?php
namespace app\common\drp_model;

use app\common\model\BaseModel;
use think\Db;

/*
 *  【分销商佣金日志模型】
 */
class UserCommissionLogs extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_user_commission_logs';

    //类型转换
    protected $type = [
        'id'                     => 'integer',
        'user_id'                => 'integer',
        'order_id'               => 'integer',
        'goods_id'               => 'integer',
        'order_goods_id'         => 'integer',
        'level'                  => 'integer',
        'expect_money'           => 'float',
        'real_commisson_money'   => 'float',
        'real_commission_rate'   => 'float',
        'real_money'             => 'float',
        'already_drawcash_money' => 'float',
        'source_user_id'         => 'integer',
        'order_status'           => 'integer',
        'status'                 => 'integer',
        'commission_apply_id'    => 'integer',
        'data_state'             => 'integer',
    ];

    // 获取器【order_info】
    public function getOrderInfoAttr($value, $data)
    {
        return model('orders')->where('id', $data['order_id'])->field('order_no,create_time,total_money')->find();
    }

    // 获取器【source_user_info】
    public function getSourceUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['source_user_id']);
    }

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 获取器【order_goods_info】
    public function getOrderGoodsInfoAttr($value, $data)
    {
        return model('order_goods')->where('id', $data['order_goods_id'])->field('name,thum,num,real_price')->find();
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['order_info']       = '';
            $data[$key]['source_user_info'] = '';
            $data[$key]['order_goods_info'] = '';
        }

        return $data;
    }

    // 查询全部(含分页)
    public function getAllBasicInfo($where = [])
    {
        $data = $this->where($where)->order('id desc')->select();
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
            $data['order_info']       = '';
            $data['source_user_info'] = '';
            $data['order_goods_info'] = '';
        }

        return $data;
    }

    // 查询指定条件的订单ID索引
    public function getOrderIndex($where)
    {
        // 拿到指定键名
        $order_index = $this->where($where)->column('order_id');
        return array_unique($order_index);
    }

    // 查询指定条件的预计分佣统计
    public function getExceptMoney($where)
    {
        return $this->where($where)->sum('expect_money');
    }

    // 查询指定条件的预计分佣统计
    public function getRealMoney($where)
    {
        return $this->where($where)->sum('real_money');
    }

    // 查询分佣订单数
    public function getOrderNum($user_id)
    {
        $lists = Db::query('
            SELECT id,order_id,order_status,user_id FROM wancll_user_commission_logs
            WHERE user_id = :user_id AND data_state = 1
            GROUP BY order_id  ORDER BY order_id',
            ['user_id' => $user_id]);

        return count($lists);
    }

}
