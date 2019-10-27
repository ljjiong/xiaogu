<?php
namespace app\common\model;

/*
 *  【角色菜单权限菜单权限模型】
 */
class RoleNavPowers extends BaseModel
{
    // 指定数据表
    protected $table = 'work_role_nav_powers';

    //类型转换
    protected $type = [
        'role_id'    => 'integer',
        'data_state' => 'integer',
        'nav_ids'    => 'json',
    ];

    // 设置主键
    protected $pk = 'role_id';

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['role_id', 'create_time'];

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('role_id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('role_id desc')->select();
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('role_id', $id)->find();
        return $data ? $data : [];
    }

    // 新增数据
    public function addOne($param)
    {
        $result = $this->save($param);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($this->role_id), 'msg' => '添加角色菜单权限成功'];
        }
    }

    // 更新数据
    public function editOne($param)
    {
        $result = $this->save($param, ['role_id' => $param['role_id']]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($param['role_id']), 'msg' => '更新角色菜单权限成功'];
        }

    }

    // 删除数据（假删除）
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['role_id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除角色菜单权限成功'];
        }
    }

    // 删除数据（真删除）
    public function delOneTrue($id)
    {
        $this->where('role_id', $id)->delete();
        return ['code' => 1, 'data' => '', 'msg' => '删除角色菜单权限成功'];
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['role_id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除角色菜单权限成功'];
        }
    }

    // 删除数据（批量真删除）
    public function delAllTrue($ids)
    {
        $result = $this->where(['role_id' => ['in', $ids]])->delete();
        return ['code' => 1, 'data' => [], 'msg' => '批量删除角色菜单权限成功'];
    }

    // 批量操作
    public function batchUpdate($param, $ids)
    {
        $result = $this->save($param, ['role_id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量操作成功'];
        }
    }

}
