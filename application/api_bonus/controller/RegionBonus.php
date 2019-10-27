<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class RegionBonus extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部地区分红
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

        $count = model('region_bonus', 'bonus_model')->getAllCount($map);
        $lists = model('region_bonus', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个地区分红
     */
    public function read($id)
    {
        $region_bonus       = model('region_bonus', 'bonus_model')->getOne($id);
        $this->data['data'] = $region_bonus;

        return $this->data;
    }

    /**
     * 【address】新建地区分红
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('region_bonus');
        if ($validate->scene('create')->check($data)) {

            $result = model('region_bonus', 'bonus_model')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增地区分红成功';
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
     * 【public】更新地区分红
     */
    public function update(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('region_bonus');
        if ($validate->scene('update')->check($data)) {

            $result = model('region_bonus', 'bonus_model')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新地区分红成功';
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
     * 【admin】删除地区分红
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('region_bonus', 'bonus_model')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除地区分红成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除地区分红
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('region_bonus', 'bonus_model')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除地区分红成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线地区分红
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('region_bonus', 'bonus_model')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线地区分红代理成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线地区分红
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('region_bonus', 'bonus_model')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线地区分红代理成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
