<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Rules extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read'],
        'checkAdmin' => ['except' => 'read'],
    ];

    /**
     * 【admin】查询全部规则列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 规则类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 规则标题模糊查询
                if ($key == 'title') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('rules')->getAllCount($map);
        $lists = model('rules')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个规则详情
     */
    public function read($id)
    {
        $this->data['data'] = model('rules')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建规则
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('rule');
        if ($validate->scene('create')->check($data)) {

            $result = model('rules')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增规则成功';
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
     * 【admin】更新规则
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('rule');
        if ($validate->scene('update')->check($data)) {

            $result = model('rules')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新规则成功';
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
     * 【admin】删除规则
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('rules')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除规则成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除规则
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('rules')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除规则成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线规则
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('rules')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线规则成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线规则
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('rules')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线规则成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
