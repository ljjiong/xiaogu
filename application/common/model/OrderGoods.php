<?php
namespace app\common\model;

/*
 *  【订单商品商品模型】
 */
class OrderGoods extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_order_goods';

    //类型转换
    protected $type = [
        'id'                  => 'integer',
        'order_id'            => 'integer',
        'goods_id'            => 'integer',
        'user_id'             => 'integer',
        'sell_price'          => 'float',
        'score'               => 'float',
        'real_price'          => 'float',
        'weight'              => 'float',
        'num'                 => 'integer',
        'is_comment'          => 'integer',
        'return_goods_status' => 'integer',
        'is_return_goods'     => 'integer',
        'is_return_money'     => 'integer',
        'data_state'          => 'integer',
    ];

    // 获取器【thum】
    public function getThumAttr($value, $data)
    {
        return show_upload_img($value);
    }

    // 获取器【commission_info】
    public function getCommissionInfoAttr($value, $data)
    {
        $commission = model('user_commission_logs', 'drp_model')->getAllBasicInfo(['order_goods_id' => $data['id']]);
        return $commission ? $commission : [];
    }

    // 获取器【bonus_info】
    public function getBonusInfoAttr($value, $data)
    {
        $bonus = model('user_bonus_logs', 'bonus_model')->getAllBasicInfo(['order_goods_id' => $data['id']]);
        return $bonus ? $bonus : [];
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
            $data[$key]['commission_info'] = '';
            $data[$key]['bonus_info']      = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['commission_info'] = '';
            $data['bonus_info']      = '';
        }

        return $data;
    }
}
