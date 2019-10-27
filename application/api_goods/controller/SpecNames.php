<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class SpecNames extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];
    
    /**
     * 【admin】查询全部规格
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 规格名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('spec_names')->getAllCount($map);
        $lists = model('spec_names')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条规格详情
     */
    public function read($id)
    {
        $this->data['data'] = model('spec_names')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建规格
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('spec_name');
        if ($validate->scene('create')->check($data)) {

            $result = model('spec_names')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增规格成功';
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
     * 【admin】更新规格
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('spec_name');
        if ($validate->scene('update')->check($data)) {

            $result = model('spec_names')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新规格成功';
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
     * 【admin】删除规格
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('spec_names')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除规格成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除规格
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('spec_names')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除规格成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
