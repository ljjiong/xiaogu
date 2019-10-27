<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Request;

class UserVisitLogs extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询会员全部登录日志
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['mobile']);
                }

                // 会员昵称模糊查询
                if ($key == 'nick_name') {
                    $user_ids       = model('users')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['nick_name']);
                }

                // IP
                if ($key == 'ip') {
                    $map['ip'] = ['like', '%'.$value.'%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('user_visit_logs')->getAllCount($map);
        $lists = model('user_visit_logs')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询单条会员登录日志详情
     */
    public function read($id)
    {
        $this->data['data'] = model('user_visit_logs')->getOne($id);

        return $this->data;
    }

}
