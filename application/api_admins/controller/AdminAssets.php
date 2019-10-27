<?php
namespace app\api_admins\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class AdminAssets extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部管理员资产
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'admin_mobile') {
                    $admin_ids       = model('admins')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['admin_id'] = ['in', $admin_ids];
                    unset($map['user_mobile']);
                }

                // 管理员昵称模糊查询
                if ($key == 'nick_name') {
                    $admin_ids       = model('admins')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['admin_id'] = ['in', $admin_ids];
                    unset($map['nick_name']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('admin_assets')->getAllCount($map);
        $lists = model('admin_assets')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询单个管理员资产
     */
    public function read($id)
    {
        $this->data['data'] = model('admin_assets')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建管理员资产
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('admin_asset');
        if ($validate->scene('create')->check($data)) {

            $result = model('admin_assets')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增管理员资产成功';
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
     * 【admin】更新管理员资产
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('admin_asset');
        if ($validate->scene('update')->check($data)) {

            $result = model('admin_assets')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新管理员资产成功';
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
     * 【admin】删除管理员资产
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('admin_assets')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除管理员资产成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除管理员资产
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('admin_assets')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除管理员资产成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
