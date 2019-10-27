<?php
namespace app\common\model;

/*
 *  【管理员账户模型】
 */
class AdminAccounts extends BaseModel
{
    // 指定数据表
    protected $table = 'work_admin_accounts';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'admin_id'   => 'integer',
        'data_state' => 'integer',
    ];

    // 隐藏属性
    protected $hidden = ['data_state', 'password', 'pay_password', 'qq_openid', 'wechat_openid', 'create_time', 'update_time'];

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['id', 'create_time', 'user_id'];

    // 删除数据（假删除）:根据管理员ID
    public function delAllByAdminIds($admin_ids)
    {
        $result = $this->save(['data_state' => 0], ['admin_id' => ['in', $admin_ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除管理员账户成功'];
        }
    }
}
