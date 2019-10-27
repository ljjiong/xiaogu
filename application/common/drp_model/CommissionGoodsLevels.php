<?php
namespace app\common\drp_model;

use app\common\model\BaseModel;

/*
 *  【分销商佣金提现模型】
 */
class CommissionGoodsLevels extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_commission_goods_levels';

    //类型转换
    protected $type = [
		'id'                   =>  'integer',
		'distributor_level_id' =>  'integer',
		'goods_id'             =>  'integer',
		'commission_1_value'   =>  'float',
		'commission_2_value'   =>  'float',
		'commission_3_value'   =>  'float',
		'data_state'           =>  'integer',
    ];

    // 删除指定商品的分享信息
    public function batchDelByGoodsId($goods_id)
    {
        $this->where(['goods_id' => $goods_id])->delete();
    }
}
