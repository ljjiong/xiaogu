<?php
namespace app\common\model;

/*
 *  【订单模型】
 */
class Orders extends BaseModel
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

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 获取器【order_goods_info】
    public function getOrderGoodsInfoAttr($value, $data)
    {
        return model('order_goods')->getAll(['order_id' => $data['id']]);
    }

    // 初始化
    protected static function init()
    {
        // 订单创建时写入相应参数
        self::beforeInsert(function ($model) {
            $model->order_no = make_order_no('N');

            $address               = model('addresses')->getOne($model->address_id);
            $model->consignee_name = $address['consignee_name'];
            $model->mobile         = $address['mobile'];
            $model->province       = $address['province'];
            $model->province_code  = $address['province_code'];
            $model->city           = $address['city'];
            $model->city_code      = $address['city_code'];
            $model->area           = $address['area'];
            $model->area_code      = $address['area_code'];
            $model->address        = $address['address'];
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
            $data[$key]['order_goods_info'] = '';
            $data[$key]['user_info']        = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['order_goods_info'] = '';
            $data['user_info']        = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOneBasic($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOrderBasicInfo($id)
    {
        $data = $this->where('id', $id)->field('id,order_no,create_time')->find();
        return $data ? $data : [];
    }
}
