<?php
namespace app\api_contact\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Loader;
use think\Request;
class Contact extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists,index'],
        'checkAdmin' => ['except' => 'read,lists,index'],
    ];

    public function index(Request $request)
    {
    	$map = $request->param();
    	 foreach ($map as $key => $value) {
            if ($value) {
                // 广告类别
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 广告位编号
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 部门
                if ($key == 'department') {
                    $map[$key] = $value;
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('user_accounts')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('users')->getAllCount($map);
        $lists = model('users')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }


 /**
     * 【admin】查询全部岗位
     */
    public function poindex()
    {
        $position           = Db::table('work_custom_position')->select();
        $this->data['data'] = ['position' => $position];

        return $this->data;
    }



































}