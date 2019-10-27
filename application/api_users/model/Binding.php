<?php
namespace app\api_users\model;

use app\common\model\BaseModel;

/*
 *  【授权绑定模型】
 */
class Binding extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_accounts';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'data_state' => 'integer',
    ];

    // 未登录状态创建授权绑定信息
    public function noLoginBinding($data)
    {
        $user_account = model('user_accounts')->findOne(['guid' => $data['mobile']]);
        if ($user_account) {
            if ($data['openid_type'] == 'qq') {
                $param = [
                    'qq_openid' => $data['openid'],
                ];
            } elseif ($data['openid_type'] == 'wechat') {
                $param = [
                    'wechat_openid' => $data['openid'],
                ];
            } else {
                return ['code' => 0, 'data' => [], 'msg' => 'openid类型错误'];
            }

            $result = $this->save($param, ['id' => $user_account['id']]);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => [], 'msg' => '授权绑定成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '会员账号不存在'];
        }
    }

    // 登录状态创建授权绑定信息
    public function loginBinding($data)
    {
        $user_account = model('user_accounts')->getOne($data['id']);
        if ($user_account) {
            if ($data['openid_type'] == 'qq') {
                $param = [
                    'qq_openid' => $data['openid'],
                ];
            } elseif ($data['openid_type'] == 'wechat') {
                $param = [
                    'wechat_openid' => $data['openid'],
                ];
            } else {
                return ['code' => 0, 'data' => [], 'msg' => 'openid类型错误'];
            }

            $result = $this->save($param, ['id' => $user_account['id']]);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => [], 'msg' => '授权绑定成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '会员账号不存在'];
        }
    }

    // 登录状态创建授权绑定信息
    public function noBinding($data)
    {
        $user_account = model('user_accounts')->getOne($data['id']);
        if ($user_account) {
            if ($data['openid_type'] == 'qq') {
                $param = [
                    'qq_openid' => '',
                ];
            } elseif ($data['openid_type'] == 'wechat') {
                $param = [
                    'wechat_openid' => '',
                ];
            } else {
                return ['code' => 0, 'data' => [], 'msg' => 'openid类型错误'];
            }

            $result = $this->save($param, ['id' => $user_account['id']]);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => [], 'msg' => '解除绑定成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '会员账号不存在'];
        }
    }
}
