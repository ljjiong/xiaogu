<?php
namespace app\api_admins\controller;

use app\api_init\controller\Rest;
use think\Request;

class AdminVisitLogs extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询管理员全部登录日志
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $admin_ids = model('admins')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['admin_id'] = ['in', $admin_ids];
                    unset($map['mobile']);
                }

                // 管理员昵称模糊查询
                if ($key == 'nick_name') {
                    $admin_ids = model('admins')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['admin_id'] = ['in', $admin_ids];
                    unset($map['nick_name']);
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $admin_account_ids       = model('admin_accounts')->getColumn(['guid' => ['like', '%' . $value . '%']], 'id');
                    $map['admin_account_id'] = ['in', $admin_account_ids];
                    unset($map['guid']);
                }

                // IP
                if ($key == 'ip') {
                    $map['ip'] = ['like', '%'.$value.'%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('admin_visit_logs')->getAllCount($map);
        $lists = model('admin_visit_logs')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询单条管理员登录日志详情
     */
    public function read($id)
    {
        $this->data['data'] = model('admin_visit_logs')->getOne($id);

        return $this->data;
    }

}
