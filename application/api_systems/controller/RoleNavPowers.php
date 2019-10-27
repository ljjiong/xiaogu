<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class RoleNavPowers extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【admin】查询角色菜单权限的全部菜单权限
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 角色菜单权限名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('role_nav_powers')->getAllCount($map);
        $lists = model('role_nav_powers')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询指定角色菜单权限的菜单权限
     */
    public function read($role_id)
    {
        $data = model('role_nav_powers')->getOne($role_id);

        if ($data) {
            $this->data['data'] = $data['nav_ids'];
        } else {
            $this->data['data'] = [];
        }

        return $this->data;
    }

    /**
     * 【admin】新建角色菜单权限的菜单权限
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('role_nav_power');
        if ($validate->scene('create')->check($data)) {

            $result = model('role_nav_powers')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增角色菜单权限成功';
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
     * 【admin】更新角色菜单权限
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('role_nav_power');
        if ($validate->scene('update')->check($data)) {

            $result = model('role_nav_powers')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新角色菜单权限成功';
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
     * 【admin】删除角色菜单权限
     */
    public function delete()
    {
        $role_id = input('role_id/d', 0);
        $result  = model('role_nav_powers')->delOneTrue($role_id);
        if ($result['code']) {
            $this->data['msg'] = '删除角色菜单权限成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除角色菜单权限
     */
    public function batch_delete(Request $request)
    {
        $role_ids = $request->param()['role_ids'];

        $result = model('role_nav_powers')->delAllTrue($role_ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除角色菜单权限成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
