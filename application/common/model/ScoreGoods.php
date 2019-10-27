<?php
namespace app\common\model;

/*
 *  【积分商品模型】
 */
class ScoreGoods extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_score_goods';

    //类型转换
    protected $type = [
        'id'              => 'integer',
        'goods_id'        => 'integer',
        'spec_group_info' => 'json',
        'score'           => 'float',
        'money'           => 'float',
        'sort'            => 'integer',
        'status'          => 'integer',
        'data_state'      => 'integer',
    ];

    // 获取器【goods_info】
    public function getGoodsInfoAttr($value, $data)
    {
        return model('goods')->getOne($data['goods_id']);
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('sort desc,id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('sort desc,id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['goods_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['goods_info'] = '';
        }

        return $data;
    }
}
