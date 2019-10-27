<?php
namespace app\common\model;

/*
 *  【会员优惠券模型】
 */
class UserCoupons extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_coupons';

    //类型转换
    protected $type = [
        'id'                 => 'integer',
        'user_id'            => 'integer',
        'activity_coupon_id' => 'integer',
        'market_activity_id' => 'integer',
        'reach_money'        => 'float',
        'change_value'       => 'float',
        'status'             => 'integer',
        'data_state'         => 'integer',
    ];

    // 获取器【is_expiry】
    public function getIsExpiryAttr($value, $data)
    {
        return (strtotime($data['expiry_time']) <= time()) ? true : false;
    }

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 获取器【activity_name】
    public function getActivityNameAttr($value, $data)
    {
        $activity = model('market_activities')->getOne($data['market_activity_id']);
        if ($activity) {
            $activity_name = $activity['name'];
        } else {
            $activity_name = '';
        }

        return $activity_name;
    }

    // 初始化
    protected static function init()
    {
        self::beforeInsert(function ($model) {
            if (isset($model->activity_coupon_id)) {
                $activity_coupon = model('activity_coupons')->getOne($model->activity_coupon_id);

                if ($activity_coupon) {
                    $model->market_activity_id = $activity_coupon['market_activity_id'];
                    $model->coupon_no          = make_order_no('U');;
                    $model->coupon_type        = $activity_coupon['coupon_type'];
                    $model->expiry_time        = $activity_coupon['expiry_time'];
                    $model->reach_money        = $activity_coupon['reach_money'];
                    $model->change_value       = $activity_coupon['change_value'];

                    model('activity_coupons')->updateUseNum($model->activity_coupon_id, 1);
                }
            }
        });
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
            $data[$key]['is_expiry']     = '';
            $data[$key]['user_info']     = '';
            $data[$key]['activity_name'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['is_expiry']     = '';
            $data['user_info']     = '';
            $data['activity_name'] = '';
        }

        return $data;
    }
}
