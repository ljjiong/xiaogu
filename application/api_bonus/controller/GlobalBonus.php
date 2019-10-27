<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GlobalBonus extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部全球分红信息列表
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

        $count = model('global_bonus', 'bonus_model')->getAllCount($map);
        $lists = model('global_bonus', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个全球分红信息详情
     */
    public function read($user_id)
    {
        $data = model('global_bonus', 'bonus_model')->getOne($user_id);

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】更新全球分红信息
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('global_bonus');
        if ($validate->scene('update')->check($data)) {
            $global_bonus = model('global_bonus', 'bonus_model')->getOne($data['user_id']);
            if ($global_bonus) {
                $result = model('global_bonus', 'bonus_model')->editOne($data);
            } else {
                $result = model('global_bonus', 'bonus_model')->addOne($data);
            }

            if ($result['code']) {
                $this->data['msg']  = '更新全球分红信息成功';
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
     * 【admin】删除商品分红信息
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('global_bonus', 'bonus_model')->delOneTrue($id);
        if ($result['code']) {
            $this->data['msg'] = '删除全球分红信息成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除文章
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('global_bonus', 'bonus_model')->delAllTrue($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除全球分红信息成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
