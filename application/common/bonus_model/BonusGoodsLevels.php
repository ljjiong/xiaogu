<?php
namespace app\common\bonus_model;

use app\common\model\BaseModel;

/*
 *  【分红系统独立商品等级分红模型】
 */
class BonusGoodsLevels extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_bonus_goods_levels';

    //类型转换
    protected $type = [
		'id'             =>  'integer',
		'bonus_level_id' =>  'integer',
		'goods_id'       =>  'integer',
		'rate'           =>  'float',
		'data_state'     =>  'integer',
    ];

    // 删除指定商品的分享信息
    public function batchDelByGoodsId($goods_id)
    {
        $this->where(['goods_id' => $goods_id])->delete();
    }
}
