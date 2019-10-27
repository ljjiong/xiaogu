<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserAccounts extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'mod_password,change_mobile'],
        'checkUser'  => ['only' => 'mod_password,change_mobile'],
    ];

    /**
     * 【user】注册会员
     */
    public function register(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('register');
        if ($validate->check($data)) {
            // 注册会员
            $user_data = [
                'mobile'    => $data['mobile'],
                'role_ids'  => isset($data['role_ids']) ? array_unique($data['role_ids']) : [1],
                'avatar'    => isset($data['avatar']) ? $data['avatar'] : '',
                'nick_name' => isset($data['nick_name']) ? $data['nick_name'] : '',
            ];

            $result = model('users')->addOne($user_data);
            if ($result['code']) {
                $user = $result['data'];

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

                // 写入会员资产表信息
                $result = model('user_assets')->addOne(['user_id' => $user['id'], 'money' => 0]);
                if (!$result['code']) {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                    return $this->data;
                }

                // 写入会员统计表信息
                model('user_info')->addOne(['user_id' => $user['id']]);

                $account_data = [
                    'guid'          => $data['mobile'],
                    'password'      => wancll_md5($data['password']),
                    'user_id'       => $user['id'],
                    'qq_openid'     => isset($data['qq_openid']) ? $data['qq_openid'] : '',
                    'wechat_openid' => isset($data['wechat_openid']) ? $data['wechat_openid'] : '',
                ];
                $result = model('user_accounts')->addOne($account_data);
                if ($result['code']) {
                    $this->login_info($result['data']['guid']);
                    $this->data['msg'] = '注册会员成功';
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
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
     * 【user】会员登录
     */
    public function login(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('login');
        if ($validate->check($data)) {

            $guid = $data['mobile'];

            // ==============下发授权token-BEGIN======================
            $result = model('user_tokens')->addOneByGuid($guid, $this->client_type);
            if ($result['code']) {
                $token = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
                return $this->data;
            }
            // ==============下发授权token-END========================

            // ==============登录日志-BEGIN======================
            $result = model('user_visit_logs')->addOneByGuid($guid, $this->client_type, Request::instance()->ip());
            if (!$result['code']) {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
                return $this->data;
            }
            // ==============登录日志-END========================

            $user                        = model('users')->getOneByGuid($guid);
            $user['guid']                = $guid;
            $this->data['msg']           = '登录成功';
            $this->data['data']['token'] = $token;
            $this->data['data']['user']  = $user;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【user】重置密码
     */
    public function reset_password(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('password');
        if ($validate->scene('reset')->check($data)) {

            $params = [
                'id'       => model('user_accounts')->findOne(['guid' => $data['mobile']])['id'],
                'password' => wancll_md5($data['password']),
            ];

            $result = model('user_accounts')->editOne($params);
            if ($result['code']) {
                $this->data['msg'] = '设置登录密码成功';
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
     * 【user】修改密码
     */
    public function mod_password(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('password');
        if ($validate->scene('mod')->check($data)) {

            $params = [
                'id'       => model('user_accounts')->findOne(['guid' => $data['mobile']])['id'],
                'password' => wancll_md5($data['password']),
            ];

            $result = model('user_accounts')->editOne($params);
            if ($result['code']) {
                $this->data['msg'] = '修改登录密码成功';
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
     * 【user】重置支付密码
     */
    public function reset_pay_password(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('pay_password');
        if ($validate->scene('reset')->check($data)) {

            $params = [
                'id'           => model('user_accounts')->findOne(['guid' => $data['mobile']])['id'],
                'pay_password' => wancll_md5($data['pay_password']),
            ];

            $result = model('user_accounts')->editOne($params);
            if ($result['code']) {
                $this->data['msg'] = '设置支付密码成功';
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
     * 【user】更换手机号
     */
    public function change_mobile(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('change_mobile');
        if ($validate->scene('change')->check($data)) {

            $user   = model('users')->findOne(['mobile' => $data['old_mobile']]);
            $result = model('users')->editOne(['mobile' => $data['new_mobile'], 'id' => $user['id']]);
            if ($result['code']) {
                $user_account = model('user_accounts')->findOne(['guid' => $data['old_mobile']]);
                $result       = model('user_accounts')->editOne(['guid' => $data['new_mobile'], 'id' => $user_account['id']]);
                if ($result['code']) {
                    $this->data['msg'] = '修改手机号成功';
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '修改手机号失败';
                }
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '修改手机号失败';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【private】获取登录信息
     */
    private function login_info($guid)
    {
        // ==============下发授权token-BEGIN======================
        $result = model('user_tokens')->addOneByGuid($guid, $this->client_type);
        if ($result['code']) {
            $token = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
            return;
        }
        // ==============下发授权token-END========================

        // ==============登录日志-BEGIN======================
        $result = model('user_visit_logs')->addOneByGuid($guid, $this->client_type, Request::instance()->ip());
        if (!$result['code']) {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
            return;
        }
        // ==============登录日志-END========================

        $user         = model('users')->getOneByGuid($guid);
        $user['guid'] = $guid;

        $this->data['msg']           = '登录成功';
        $this->data['data']['token'] = $token;
        $this->data['data']['user']  = $user;
        return;
    }
}
