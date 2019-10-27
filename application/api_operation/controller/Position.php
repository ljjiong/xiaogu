<?php
namespace app\api_operation\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;
use think\Validate;

class Position extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'index'],
        // 'checkAdmin' => ['except' => 'index'],
    ];

    /**
     * 【admin】查询全部数据
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 按年项目详情
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
                if ($key == 'dateline') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }
        $count              = model('position')->getAllCount($map);
        $lists              = model('position')->getAll($map, $this->page_num, $this->page_limit);
        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;

    }
    /**
     * 【admin】查询全部数据
     */
    public function indexs(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 按年项目详情
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
                if ($key == 'dateline') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }
        $count              = model('position')->getAllCount($map);
        $lists              = model('position')->getAll($map, $this->page_num, $this->page_limit);
        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;

    }

    /**
     * 【admin】查询全部数据
     */
    public function lists(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 按年项目详情
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
                if ($key == 'dateline') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }
        $count              = model('position')->getAllCount($map);
        $lists              = model('position')->getAll($map, $this->page_num, $this->page_limit);
        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;

    }

    /**
     * 【admin】新建任务
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('position');
        if ($validate->scene('create')->check($data)) {
            $result = model('position')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增数据成功';
                $this->data['data'] = $result['data'];

            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            echo 11;
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】更新任务
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('position');
        if ($validate->scene('update')->check($data)) {
            $result = model('position')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新数据成功';
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
     * 【admin】删除任务
     */
    public function delete()
    {
        $id = input('id/d', 0);

        $result = model('position')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除数据成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【admin】批量删除会员
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('position')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
