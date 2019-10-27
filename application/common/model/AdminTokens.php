<?php
namespace app\common\model;

/*
 *  【管理员token模型】
 */
class AdminTokens extends BaseModel
{
    // 指定数据表
    protected $table = 'work_admin_tokens';

    //类型转换
    protected $type = [
        'id'               => 'integer',
        'admin_account_id' => 'integer',
        'admin_id'         => 'integer',
        'expire_time'      => 'integer',
        'data_state'       => 'integer',
    ];

    // 新增数据(根据)
    public function addOneByGuid($guid, $client_type)
    {
        $admin_account = model('admin_accounts')->findOne(['guid' => $guid]);
        if ($admin_account) {

            if ($client_type == 'app') {
                $expire_time = '';
            } else {
                $expire_time = 7200;
            }

            $param = [
                'admin_account_id' => $admin_account['id'],
                'admin_id'         => $admin_account['admin_id'],
                'client_type'      => $client_type,
                'token'            => 'admin&' . $client_type . '@' . md5(uniqid($admin_account['id'])),
                'refresh_token'    => 'admin&' . $client_type . '@' . md5('yiyun' . uniqid($admin_account['id'])),
                'expire_time'      => $expire_time,
            ];

            $result = $this->save($param);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => $this->getOne($this->id), 'msg' => '添加管理员token成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '管理员账号不存在'];
        }
    }

    // 更新数据
    public function editOneById($id)
    {
        $admin_token = model('admin_tokens')->getOne($id);
        if ($admin_token) {
            $param = [
                'token'         => 'admin&' . $admin_token['client_type'] . '@' . md5(uniqid($admin_token['admin_account_id'])),
                'refresh_token' => 'admin&' . $admin_token['client_type'] . '@' . md5('yiyun' . uniqid($admin_token['admin_account_id'])),
            ];

            $result = $this->save($param, ['id' => $id]);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => $this->getOne($id), 'msg' => '更新管理员token成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '管理员token不存在'];
        }
    }
}
