<?php
namespace app\common\model;

/*
 *  【系统团购商品模型】
 */
class GroupBuySystemGoods extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_group_buy_system_goods';

    //类型转换
    protected $type = [
        'id'              => 'integer',
        'goods_id'        => 'integer',
        'person_num'      => 'integer',
        'money'           => 'float',
        'stock'           => 'integer',
        'person_buy_num'  => 'integer',
        'spec_group_info' => 'json',
        'sort'            => 'integer',
        'status'          => 'integer',
        'data_state'      => 'integer',
    ];

    // 获取器【goods_info】
    public function getGoodsInfoAttr($value, $data)
    {
        return model('goods')->getOne($data['goods_id']);
    }

    // 获取器【spec_group_info】
    public function getSpecGroupInfoAttr($value, $data)
    {
        $value = json_decode($value, true);

        foreach ($value as $k => $v) {
            $goods_spec_group = model('goods_spec_groups')->findOne(['goods_id' => $data['goods_id'], 'id_str' => $v['spec_group_id_str']]);
            if ($goods_spec_group) {
                $value[$k]['spec_option_group'] = $goods_spec_group['spec_option_group'];
            } else {
                $value[$k]['spec_option_group'] = '【当前规格组合项已删除】';
            }
        }

        return $value;
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

    // 查询单条数据
    public function getBasicInfoByGoodsId($goods_id)
    {
        $data = $this->where(['goods_id' => $goods_id])->find();
        return $data ? $data : [];
    }
}
