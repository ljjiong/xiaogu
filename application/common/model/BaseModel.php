<?php
namespace app\common\model;

use think\Model;

/*
 *  【基础模型】供其他模型继承使用
 */
class BaseModel extends Model
{
    // 时间戳自动写入
    protected $autoWriteTimestamp = 'datetime';

    // 隐藏属性
    protected $hidden = ['data_state'];

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['id', 'create_time'];

    // 自动过滤掉不存在的字段
    protected $field = true;

    // 定义全局的查询范围
    protected function base($query)
    {
        $query->where('data_state', 1);
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        return $data;
    }

    // 查询统计
    public function getAllCount($where)
    {
        return $this->where($where)->count();
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        return $data ? $data : [];
    }

    // 查询单条数据是否存在
    public function findOne($where)
    {
        $data = $this->where($where)->find();
        return $data ? $data : [];
    }

    // 新增数据
    public function addOne($param)
    {
        $result = $this->save($param);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($this->id), 'msg' => '添加数据成功'];
        }
    }

    // 批量新增数据
    public function batchAdd($param)
    {
        $result = $this->saveAll($param);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $result, 'msg' => '批量添加数据成功'];
        }
    }

    // 更新数据
    public function editOne($param)
    {
        $result = $this->save($param, ['id' => $param['id']]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($param['id']), 'msg' => '更新数据成功'];
        }
    }

    // 批量新增数据
    public function batchEdit($param)
    {
        $result = $this->saveAll($param);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $result, 'msg' => '批量更新数据成功'];
        }
    }

    // 删除数据（假删除）
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除数据成功'];
        }
    }

    // 删除数据（真删除）
    public function delOneTrue($id)
    {
        $result = $this->where('id', $id)->delete();
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除数据成功'];
        }
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除数据成功'];
        }
    }

    // 删除数据（批量假删除）
    public function delAllTrue($ids)
    {
        $result = $this->where(['id' => ['in', $ids]])->delete();
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除数据成功'];
        }
    }

    // 批量操作
    public function batchUpdate($param, $ids)
    {
        $result = $this->save($param, ['id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量操作成功'];
        }
    }

    // 根据查询条件查找全部的IDs
    public function getColumn($where, $field)
    {
        return $this->where($where)->column($field);
    }
}
