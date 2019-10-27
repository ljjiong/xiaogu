<?php
namespace app\common\model;

/*
 *  【商品属性模型】
 */
class GoodsAttrs extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_goods_attrs';

    // 删除数据（批量假删除）
    public function delAllTrueByGoodsId($goods_id)
    {
        $result = $this->where(['goods_id' => $goods_id])->delete();
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除数据成功'];
        }
    }
}
