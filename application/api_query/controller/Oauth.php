<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Oauth extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'binding'],
        'checkUser'  => ['only' => 'binding'],
    ];

    /**
     * 【admin】查询绑定信息
     */
    public function binding()
    {
        $user_account       = model('user_accounts')->getOne($this->account_id);
        $this->data['data'] = $user_account;

        return $this->data;
    }

    /**
     * 【admin】根据openid查询
     */
    public function openid(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('oauth');
        if ($validate->scene('openid')->check($data)) {
            $user_account = model('user_accounts')->findOne([$data['type'] . '_openid' => $data['openid']]);
            if ($user_account) {
                $this->login_info($user_account['guid']);
            } else {
                $this->data['data'] = $data;
                $this->data['msg']  = '请绑定账号';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /*
    ==============================================
    =============== 获取用户登录信息 =============
    ==============================================
     */

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
