<?php
namespace app\common\model;

/*
 *  【商品标签映射模型】
 */
class GoodsTagMaps extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_goods_tag_maps';

    //类型转换
    protected $type = [
        'id'           => 'integer',
        'goods_id'     => 'integer',
        'goods_tag_id' => 'integer',
        'data_state'   => 'integer',
    ];
}
