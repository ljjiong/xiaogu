<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserAssets extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
    ];
    
    /**
     * 【admin】查询全部会员资产
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
            } else {
                unset($map[$key]);
            }
        }

        $count = model('user_assets')->getAllCount($map);
        $lists = model('user_assets')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询单条会员资产
     */
    public function read($id)
    {
        $user_asset = model('user_assets')->getOne($id);
        $this->data['data'] = $user_asset;

        return $this->data;
    }

    /**
     * 【address】新建会员资产
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('user_asset');
        if ($validate->scene('create')->check($data)) {

            $result = model('user_assets')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增会员资产成功';
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
     * 【public】更新会员资产
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('user_asset');
        if ($validate->scene('update')->check($data)) {

            $result = model('user_assets')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员资产成功';
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
     * 【admin】删除会员资产
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('user_assets')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员资产成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员资产
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_assets')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员资产成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
