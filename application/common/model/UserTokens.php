<?php
namespace app\common\model;

/*
 *  【会员token模型】
 */
class UserTokens extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_tokens';

    //类型转换
    protected $type = [
        'id'              => 'integer',
        'user_account_id' => 'integer',
        'user_id'         => 'integer',
        'expire_time'     => 'integer',
        'data_state'      => 'integer',
    ];

    // 新增数据(根据)
    public function addOneByGuid($guid, $client_type)
    {
        $user_account = model('user_accounts')->findOne(['guid' => $guid]);
        if ($user_account) {

            if ($client_type == 'app' || $client_type == 'applet') {
                $expire_time = '';
            } else {
                $expire_time = 7200;
            }

            $param = [
                'user_account_id' => $user_account['id'],
                'user_id'         => $user_account['user_id'],
                'client_type'     => $client_type,
                'token'           => 'user&' . $client_type . '@' . md5(uniqid($user_account['id'])),
                'refresh_token'   => 'user&' . $client_type . '@' . md5('yiyun' . uniqid($user_account['id'])),
                'expire_time'     => $expire_time,
            ];

            $result = $this->save($param);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => $this->getOne($this->id), 'msg' => '添加会员token成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '会员账号不存在'];
        }
    }

    // 更新数据
    public function editOneById($id)
    {
        $user_token = model('user_tokens')->getOne($id);
        if ($user_token) {
            $param = [
                'token'         => 'user&' . $user_token['client_type'] . '@' . md5(uniqid($user_token['user_account_id'])),
                'refresh_token' => 'user&' . $user_token['client_type'] . '@' . md5('yiyun' . uniqid($user_token['user_account_id'])),
            ];

            $result = $this->save($param, ['id' => $id]);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => $this->getOne($id), 'msg' => '更新会员token成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '会员token不存在'];
        }
    }
}
