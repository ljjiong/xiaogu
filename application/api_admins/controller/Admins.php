<?php
namespace app\api_admins\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Admins extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部管理员
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 昵称模糊查询
                if ($key == 'nick_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $admin_ids = model('admin_accounts')->getColumn(['guid' => ['like', '%' . $value . '%']], 'admin_id');
                    $map['id'] = ['in', $admin_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $map['is_view'] = 1;

        $count = model('admins')->getAllCount($map);
        $lists = model('admins')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询单个管理员
     */
    public function read($id)
    {
        $this->data['data'] = model('admins')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建管理员
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('admin');
        if ($validate->scene('create')->check($data)) {

            // 注册管理员
            $data['role_ids'] = isset($data['role_ids']) ? array_unique($data['role_ids']) : '';

            $result = model('admins')->addOne($data);
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
                    $this->data['msg']  = '注册管理员成功';
                    $this->data['data'] = $admin;
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
     * 【admin】更新管理员
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('admin');
        if ($validate->scene('update')->check($data)) {

            $admin_account = model('admin_accounts')->findOne(['admin_id' => $data['id']]);

            if (isset($data['guid']) && $admin_account) {
                if ($data['guid']) {
                    model('admin_accounts')->editOne(['id' => $admin_account['id'], 'guid' => $data['guid']]);
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '账户名不能为空';
                    return $this->data;
                }
            }

            if (isset($data['password']) && $admin_account) {
                if ($data['password']) {
                    model('admin_accounts')->editOne(['id' => $admin_account['id'], 'password' => wancll_md5($data['password'])]);
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '密码不能为空';
                    return $this->data;
                }
            }

            $result = model('admins')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新管理员成功';
                $this->data['data'] = $result['data'];
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
     * 【admin】更新管理员
     */
    public function update_self(Request $request)
    {
        $data       = $request->param();
        $data['id'] = $this->unique_id;

        $validate = Loader::validate('admin');
        if ($validate->scene('update_self')->check($data)) {

            $admin_account = model('admin_accounts')->findOne(['admin_id' => $this->unique_id]);

            if (isset($data['guid']) && $admin_account) {
                if ($data['guid']) {
                    model('admin_accounts')->editOne(['id' => $admin_account['id'], 'guid' => $data['guid']]);
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '账户名不能为空';
                    return $this->data;
                }
            }

            if (isset($data['password']) && $admin_account) {
                if ($data['password']) {
                    model('admin_accounts')->editOne(['id' => $admin_account['id'], 'password' => wancll_md5($data['password'])]);
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '密码不能为空';
                    return $this->data;
                }
            }

            if (isset($data['role_ids'])) {
                unset($data['role_ids']);
            }

            if (isset($data['status'])) {
                unset($data['status']);
            }

            $result = model('admins')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新个人信息成功';
                $this->data['data'] = $result['data'];
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
     * 【admin】删除管理员(将管理员的账号全部置空)
     */
    public function delete()
    {
        $id = input('id/d', 0);

        // 删除管理员账号
        model('admin_accounts')->where(['admin_id' => $id])->update(['data_state' => 0]);
        // 删除管理员账号对应的token
        model('admin_tokens')->where(['admin_id' => $id])->delete();

        $result = model('admins')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除管理员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除管理员
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('admins')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除管理员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量拉黑管理员
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('admins')->batchUpdate(['status' => 9], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拉黑管理员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量恢复管理员
     */
    public function batch_recover_normal(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('admins')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量恢复管理员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】获取当前管理员的菜单
     */
    public function navs(Request $request)
    {
        $navs = get_admin_navs($this->token);

        $this->data['data'] = $navs;

        return $this->data;
    }

}
