<?php
namespace app\common\model;

/*
 *  【商品购物车模型】
 */
class Carts extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_carts';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'goods_id'   => 'integer',
        'num'        => 'integer',
        'status'     => 'integer',
        'data_state' => 'integer',
    ];

    // 获取器【goods_info】
    public function getGoodsInfoAttr($value, $data)
    {
        return model('goods')->getOne($data['goods_id']);
    }

    // 获取器【spec_group_info】
    public function getSpecGroupInfoAttr($value, $data)
    {
        return model('goods_spec_groups')->findOne(['id_str' => $data['spec_group_id_str'], 'goods_id' => $data['goods_id']]);
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
            $data[$key]['goods_info']      = '';
            $data[$key]['spec_group_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['goods_info']      = '';
            $data['spec_group_info'] = '';
        }

        return $data;
    }

    public function cleanUserCartTrue($where)
    {
        $this->where($where)->delete();
    }
}
