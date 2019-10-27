<?php
namespace app\api_drp\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class DistributorLevels extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部分销商等级列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 分销商等级名称模糊查询
                if ($key == 'level_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('distributor_levels', 'drp_model')->getAllCount($map);
        $lists = model('distributor_levels', 'drp_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个分销商等级详情
     */
    public function read($id)
    {
        $this->data['data'] = model('distributor_levels', 'drp_model')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建分销商等级
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('distributor_level');
        if ($validate->scene('create')->check($data)) {

            $result = model('distributor_levels', 'drp_model')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增分销商等级成功';
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
     * 【admin】更新分销商等级
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('distributor_level');
        if ($validate->scene('update')->check($data)) {

            $result = model('distributor_levels', 'drp_model')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新分销商等级成功';
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
     * 【admin】删除分销商等级
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('distributor_levels', 'drp_model')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除分销商等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除分销商等级
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('distributor_levels', 'drp_model')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除分销商等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线分销商等级
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('distributor_levels', 'drp_model')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线分销商等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线分销商等级
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('distributor_levels', 'drp_model')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线分销商等级成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】会员分销商等级列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('distributor_levels', 'drp_model')->getAllCount($map);
        $lists = model('distributor_levels', 'drp_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
