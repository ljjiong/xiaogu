<?php
namespace app\common\model;

/*
 *  【会员账户模型】
 */
class UserAccounts extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_accounts';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'data_state' => 'integer',
    ];

    // 隐藏属性
    protected $hidden = ['data_state', 'password', 'pay_password', 'create_time', 'update_time'];

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['id', 'create_time', 'user_id'];

    // 删除数据（假删除）:根据管理员ID
    public function delAllByUserIds($user_ids)
    {
        $result = $this->save(['data_state' => 0], ['user_id' => ['in', $user_ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除会员账户成功'];
        }
    }

    // 是否设置支付密码
    public function isSetPayPassword($user_account_id)
    {
        $pay_password = $this->where('id', $user_account_id)->value('pay_password');
        if (empty($pay_password)) {
            return ['code' => 0, 'data' => [], 'msg' => '支付密码未设置'];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '支付密码已设置'];
        }
    }
}
