<?php
namespace app\common\model;

/*
 *  【角色模型】
 */
class Roles extends BaseModel
{
    // 指定数据表
    protected $table = 'work_roles';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'data_state' => 'integer',
    ];

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

}
