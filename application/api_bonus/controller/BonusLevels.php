<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class BonusLevels extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部分红等级列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 分红等级名称模糊查询
                if ($key == 'level_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('bonus_levels', 'bonus_model')->getAllCount($map);
        $lists = model('bonus_levels', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个分红等级详情
     */
    public function read($id)
    {
        $this->data['data'] = model('bonus_levels', 'bonus_model')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建分红等级
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('bonus_level');
        if ($validate->scene('create')->check($data)) {

            $result = model('bonus_levels', 'bonus_model')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增分红等级成功';
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
     * 【admin】更新分红等级
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('bonus_level');
        if ($validate->scene('update')->check($data)) {

            $result = model('bonus_levels', 'bonus_model')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新分红等级成功';
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
     * 【admin】删除分红等级
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('bonus_levels', 'bonus_model')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除分红等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除分红等级
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bonus_levels', 'bonus_model')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除分红等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线分红等级
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bonus_levels', 'bonus_model')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线分红等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线分红等级
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bonus_levels', 'bonus_model')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线分红等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】会员分红等级列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('bonus_levels', 'bonus_model')->getAllCount($map);
        $lists = model('bonus_levels', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
