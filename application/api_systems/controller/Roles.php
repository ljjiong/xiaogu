<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Roles extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部角色
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 角色名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('roles')->getAllCount($map);
        $lists = model('roles')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条管理员登录日志详情
     */
    public function read($id)
    {
        $this->data['data'] = model('roles')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建角色
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('role');
        if ($validate->scene('create')->check($data)) {

            $result = model('roles')->addOne($data);
            if ($result['code']) {
                $role_id = $result['data']['id'];
                model('role_nav_powers')->addOne(['role_id' => $role_id, 'nav_ids' => []]);

                $this->data['msg']  = '新增角色成功';
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
     * 【admin】更新角色
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('role');
        if ($validate->scene('update')->check($data)) {

            $result = model('roles')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新角色成功';
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
     * 【admin】删除角色
     */
    public function delete()
    {
        $id = input('id/d', 0);

        $is_use_role = 0;

        $admins = model('admins')->getAll();
        foreach ($admins as $key => $value) {
            if (in_array($id, $value['role_ids'])) {
                $is_use_role = 1;
                break;
            }
        }
        if ($is_use_role == 0) {
            $users = model('users')->getAll();
            foreach ($users as $key => $value) {
                if (in_array($id, $value['role_ids'])) {
                    $is_use_role = 1;
                    break;
                }
            }
        }

        if ($is_use_role == 1) {
            $this->data['code'] = 0;
            $this->data['msg']  = '当前角色正在被用户使用, 暂不可删除';
            return $this->data;
        }

        $result = model('roles')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除角色成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除角色
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('roles')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除角色成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
