<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Guides extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部指导手册列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 指导手册类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 指导手册标题模糊查询
                if ($key == 'title') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('guides')->getAllCount($map);
        $lists = model('guides')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个指导手册详情
     */
    public function read($id)
    {
        $this->data['data'] = model('guides')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建指导手册
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('guide');
        if ($validate->scene('create')->check($data)) {

            $result = model('guides')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增指导手册成功';
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
     * 【admin】更新指导手册
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('guide');
        if ($validate->scene('update')->check($data)) {

            $result = model('guides')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新指导手册成功';
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
     * 【admin】删除指导手册
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('guides')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除指导手册成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除指导手册
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('guides')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除指导手册成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线指导手册
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('guides')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线指导手册成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线指导手册
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('guides')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线指导手册成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
