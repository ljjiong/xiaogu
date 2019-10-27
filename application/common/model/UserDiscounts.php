<?php
namespace app\common\model;

/*
 *  【会员使用限时折扣信息模型】
 */
class UserDiscounts extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_discounts';

    //类型转换
    protected $type = [
        'id'                        => 'integer',
        'user_id'                   => 'integer',
        'activity_discount_rule_id' => 'integer',
        'use_num'                   => 'integer',
        'data_state'                => 'integer',
    ];

    // 获取指定会员的已购买限时折扣商品数量
    public function getUseNum($where = [])
    {
        return $this->where($where)->sum('use_num');
    }
}
