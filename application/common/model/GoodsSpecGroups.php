<?php
namespace app\common\model;

/*
 *  【商品规格组合项模型】
 */
class GoodsSpecGroups extends BaseModel
{
    // 指定数据表
    protected $table = 'work_goods_spec_groups';

    //类型转换
    protected $type = [
        'id'           => 'integer',
        'goods_id'     => 'integer',
        'sell_price'   => 'float',
        'market_price' => 'float',
        'cost_price'   => 'float',
        'red_price'    => 'float',
        'stock'        => 'integer',
        'weight'       => 'float',
        'sort'         => 'integer',
        'is_virtual'   => 'integer',
        'data_state'   => 'integer',
    ];

    // 获取器【thum】
    public function getThumAttr($value, $data)
    {
        return show_upload_img($value);
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['thum'])) {
                $model->thum = base64_to_img([$model->data['thum']], 200, 200)[0];
            }
        });
    }

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

    // 更新字段
    public function updateNum($id_str, $type, $field, $num)
    {
        switch ($type) {
            case '+':
                $this->where(['id_str' => $id_str])->setInc($field, $num);
                break;
            case '-':
                $this->where(['id_str' => $id_str])->setDec($field, $num);
                break;
            default:
                # code...
                break;
        }
    }
}
