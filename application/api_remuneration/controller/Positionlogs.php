<?php
namespace app\api_remuneration\controller;

use app\api_init\controller\Rest;
use think\Request;

class Positionlogs extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in,index'],
        'checkUser'  => ['only' => 'complete_user_info,sign_in'],
    ];

    /**
     * 【admin】查询全部福利
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 职位
                if ($key == 'position_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 旧职位
                if ($key == 'old_position_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('welfare')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('positionlogs')->getAllCount($map);
        $lists = model('positionlogs')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    public function update(Request $request)
    {
        $data   = $request->param();
        $result = model('positionlogs')->editOne($data);
        if ($result['code']) {
            $this->data['msg']  = '更新会员成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【public】通过审核
     */
    public function pass(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'positionlogs') {
            $data['id'] = $this->unique_id;
        }

        $sedata = model('positionlogs')->getOne($data['id']);
        $logs   = [
            'id'         => $sedata['uid'],
            'department' => $sedata['position_name'],
        ];
        $result1 = model('users')->editOne($logs);

        $data['apply'] = 2;
        $result        = model('positionlogs')->editOne($data);

        if ($result['code']) {
            $this->data['msg']  = '审核通过';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【public】不通过审核
     */
    public function nopass(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'positionlogs') {
            $data['id'] = $this->unique_id;
        }
        $data['apply'] = 1;
        $result        = model('positionlogs')->editOne($data);
        if ($result['code']) {
            $this->data['msg']  = '审核不通过';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
