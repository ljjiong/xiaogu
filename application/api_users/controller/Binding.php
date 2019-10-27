<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Binding extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'save_in_login,delete'],
        'checkUser'  => ['only' => 'save_in_login,delete'],
    ];

    /**
     * 【admin】授权绑定（未登录状态新增绑定）
     */
    public function save_in_no_login(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('binding');
        if ($validate->scene('in_no_login')->check($data)) {
            $user = model('users')->findOne(['mobile' => $data['mobile']]);

            if (isset($data['avatar'])) {
                if ($data['avatar']) {
                    model('users')->editOne(['avatar' => $data['avatar'], 'id' => $user['id']]);
                }
            }

            if (isset($data['nick_name'])) {
                if ($data['nick_name']) {
                    model('users')->editOne(['nick_name' => $data['nick_name'], 'id' => $user['id']]);
                }
            }

            if (isset($data['real_openid'])) {
                if ($data['real_openid']) {
                    $find_map = [
                        'client_type' => $this->client_type,
                        'user_type'   => 'user',
                        'user_id'     => $user['id'],
                        'type'        => 'wechat',
                        'name'        => 'openid',
                    ];
                    $user_third_account = model('user_third_accounts')->findOne($find_map);
                    if (!$user_third_account) {
                        $find_map['account'] = $data['real_openid'];
                        model('user_third_accounts')->addOne($find_map);
                    }
                }
            }

            $result = model('binding')->noLoginBinding($data);
            if ($result['code']) {
                $this->data['msg'] = '绑定成功';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】授权绑定（登录状态新增绑定）
     */
    public function save_in_login(Request $request)
    {
        $data       = $request->param();
        $data['id'] = $this->account_id;

        $validate = Loader::validate('binding');
        if ($validate->scene('in_login')->check($data)) {

            $result = model('binding')->loginBinding($data);
            if ($result['code']) {
                $this->data['msg'] = '绑定成功';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】解除绑定
     */
    public function delete(Request $request)
    {
        $data       = $request->param();
        $data['id'] = $this->account_id;

        $validate = Loader::validate('binding');
        if ($validate->scene('no_binding')->check($data)) {

            $result = model('binding')->noBinding($data);
            if ($result['code']) {
                $this->data['msg'] = '解除绑定成功';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
}
