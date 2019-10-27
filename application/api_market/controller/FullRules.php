<?php
namespace app\api_market\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class fullRules extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read'],
    ];
    
    /**
     * 【admin】查询全部满减促销规则列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // // 满减促销规则类别模糊查询
                // if ($key == 'type') {
                //     $map[$key] = ['like', '%' . $value . '%'];
                // }

                // // 满减促销规则名称模糊查询
                // if ($key == 'name') {
                //     $map[$key] = ['like', '%' . $value . '%'];
                // }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('activity_full_rules')->getAllCount($map);
        $lists = model('activity_full_rules')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个满减促销规则详情
     */
    public function read($id)
    {
        $this->data['data'] = model('activity_full_rules')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建满减促销规则
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('full_rule');
        if ($validate->scene('create')->check($data)) {

            $result = model('activity_full_rules')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增满减促销规则成功';
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
     * 【admin】更新满减促销规则
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('full_rule');
        if ($validate->scene('update')->check($data)) {

            $result = model('activity_full_rules')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新满减促销规则成功';
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
     * 【admin】删除满减促销规则
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('activity_full_rules')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除满减促销规则成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除满减促销规则
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('activity_full_rules')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除满减促销规则成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线满减促销规则
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('activity_full_rules')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线满减促销规则成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线满减促销规则
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('activity_full_rules')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线满减促销规则成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
