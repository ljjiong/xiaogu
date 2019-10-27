<?php
namespace app\common\bonus_model;

use app\common\model\BaseModel;

/*
 *  【全球分红信息模型】
 */
class GlobalBonus extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_global_bonus';

    // 设置主键
    protected $pk = 'user_id';


    //类型转换
    protected $type = [
        'goods_id'                =>  'integer',
        'bonus_level_id'          =>  'integer',
        'is_open_bonus'           =>  'integer',
        'is_open_global'          =>  'integer',
        'is_open_own_global_rate' =>  'boolean',
        'global_rate'             =>  'float',
        'bonus_type'              =>  'integer',
        'data_state'              =>  'integer',
    ];

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['user_id', 'create_time'];

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
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
            $data[$key]['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('user_id', $id)->find();
        if ($data) {
            $data['user_info'] = '';
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
            return ['code' => 1, 'data' => $this->getOne($this->user_id), 'msg' => '添加全球分红信息成功'];
        }
    }

    // 更新数据
    public function editOne($param)
    {
        $result = $this->save($param, ['user_id' => $param['user_id']]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($param['user_id']), 'msg' => '更新全球分红信息成功'];
        }

    }

    // 删除数据（假删除）
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['user_id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除全球分红信息成功'];
        }
    }

    // 删除数据（真删除）
    public function delOneTrue($id)
    {
        $this->where('user_id', $id)->delete();
        return ['code' => 1, 'data' => '', 'msg' => '删除全球分红信息成功'];
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['user_id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除全球分红信息成功'];
        }
    }

    // 删除数据（批量真删除）
    public function delAllTrue($ids)
    {
        $result = $this->where(['user_id' => ['in', $ids]])->delete();
        return ['code' => 1, 'data' => [], 'msg' => '批量删除全球分红信息成功'];
    }

    // 批量操作
    public function batchUpdate($param, $ids)
    {
        $result = $this->save($param, ['user_id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量操作成功'];
        }
    }
}
