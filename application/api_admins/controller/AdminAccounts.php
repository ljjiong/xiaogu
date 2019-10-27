<?php
namespace app\api_admins\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class AdminAccounts extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'register,reset_password,mod_password,mod_password_self'],
        'checkAdmin' => ['only' => 'register,reset_password,mod_password,mod_password_self'],
    ];

    /**
     * 【admin】注册管理员
     */
    public function register(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('register');
        if ($validate->check($data)) {
            // 注册管理员
            $admin_data = [
                'nick_name' => $data['guid'],
                'role_ids'  => isset($data['role_ids']) ? array_unique($data['role_ids']) : '',
            ];
            $result = model('admins')->addOne($admin_data);
            if ($result['code']) {
                $admin = $result['data'];

                // 写入管理员资产表信息
                $result = model('admin_assets')->addOne(['admin_id' => $admin['id']]);
                if (!$result['code']) {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                    return $this->data;
                }

                $account_data = [
                    'guid'     => $data['guid'],
                    'password' => wancll_md5($data['password']),
                    'admin_id' => $admin['id'],
                ];
                $result = model('admin_accounts')->addOne($account_data);
                if ($result['code']) {
                    $this->data['msg'] = '注册管理员成功';
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
     * 【admin】管理员登录
     */
    public function login(Request $request)
    {
        $data     = $request->param(); 
        $validate = Loader::validate('login');
        if ($validate->check($data)) {

            $guid = $data['guid'];

            // ==============下发授权token-BEGIN======================
            $result = model('admin_tokens')->addOneByGuid($guid, $this->client_type);
            if ($result['code']) {
                $token = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
                return $this->data;
            }
            // ==============下发授权token-END========================

            // ==============登录日志-BEGIN======================
            $result = model('admin_visit_logs')->addOneByGuid($guid, $this->client_type, Request::instance()->ip());
            if (!$result['code']) {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
                return $this->data;
            }
            // ==============登录日志-END========================

            // 获取菜单数据
            $navs = get_admin_navs($token['token']);

            $admin         = model('admins')->getOneByGuid($guid);
            $admin['guid'] = $guid;

            $this->data['msg']           = '登录成功';
            $this->data['data']['token'] = $token;
            $this->data['data']['user']  = $admin;
            $this->data['data']['navs']  = $navs;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】重置密码
     */
    public function reset_password(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('password');
        if ($validate->scene('reset')->check($data)) {

            $params = [
                'id'       => model('admin_accounts')->findOne(['guid' => $data['guid']])['id'],
                'password' => wancll_md5($data['password']),
            ];

            $result = model('admin_accounts')->editOne($params);
            if ($result['code']) {
                $this->data['msg'] = '重置密码成功';
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
     * 【admin】修改密码
     */
    public function mod_password(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('password');
        if ($validate->scene('mod')->check($data)) {

            $params = [
                'id'       => $data['admin_account_id'],
                'password' => wancll_md5($data['password']),
            ];

            $result = model('admin_accounts')->editOne($params);
            if ($result['code']) {
                $this->data['msg'] = '修改密码成功';
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
     * 【admin】修改当前管理员密码
     */
    public function mod_password_self(Request $request)
    {
        $data                     = $request->param();
        $data['admin_account_id'] = $this->account_id;

        $validate = Loader::validate('password');
        if ($validate->scene('mod')->check($data)) {

            $params = [
                'id'       => $data['admin_account_id'],
                'password' => wancll_md5($data['password']),
            ];

            $result = model('admin_accounts')->editOne($params);
            if ($result['code']) {
                $this->data['msg'] = '修改密码成功';
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
