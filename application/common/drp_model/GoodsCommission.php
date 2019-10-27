<?php
namespace app\common\drp_model;

use app\common\model\BaseModel;

/*
 *  【商品分佣信息模型】
 */
class GoodsCommission extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_goods_commission';

    // 设置主键
    protected $pk = 'goods_id';

    //类型转换
    protected $type = [
        'goods_id'             =>  'integer',
        'distributor_level_id' =>  'integer',
        'is_open_commission'   =>  'boolean',
        'commission_type'      =>  'integer',
        'commission_1_value'   =>  'float',
        'commission_2_value'   =>  'float',
        'commission_3_value'   =>  'float',
        'data_state'           =>  'integer',
    ];

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['goods_id', 'create_time'];

    // 获取器【goods_info】
    public function getGoodsInfoAttr($value, $data)
    {
        return model('goods')->getOneBasicInfo($data['goods_id']);
    }

    // 初始化
    protected static function init()
    {
        // 删除后删除掉商品等级分佣信息
        self::afterDelete(function ($model) {
            model('commission_goods_levels', 'drp_model')->where(['goods_id' => ($model->goods_id)])->delete();
        });
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('create_time desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('create_time desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['goods_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('goods_id', $id)->find();
        if ($data) {
            $data['goods_info'] = '';
        }

        return $data;
    }

    // 新增数据
    public function addOne($param)
    {
        $result = $this->save($param);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($this->goods_id), 'msg' => '添加商品分佣信息成功'];
        }
    }

    // 更新数据
    public function editOne($param)
    {
        $result = $this->save($param, ['goods_id' => $param['goods_id']]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($param['goods_id']), 'msg' => '更新商品分佣信息成功'];
        }

    }

    // 删除数据（假删除）
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['goods_id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除商品分佣信息成功'];
        }
    }

    // 删除数据（真删除）
    public function delOneTrue($id)
    {
        $this->where('goods_id', $id)->delete();
        return ['code' => 1, 'data' => '', 'msg' => '删除商品分佣信息成功'];
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['goods_id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除商品分佣信息成功'];
        }
    }

    // 删除数据（批量真删除）
    public function delAllTrue($ids)
    {
        $result = $this->where(['goods_id' => ['in', $ids]])->delete();
        return ['code' => 1, 'data' => [], 'msg' => '批量删除商品分佣信息成功'];
    }

    // 批量操作
    public function batchUpdate($param, $ids)
    {
        $result = $this->save($param, ['goods_id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量操作成功'];
        }
    }
}
