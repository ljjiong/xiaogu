<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

import('app.api_extend.extend.qiniu.qiniu');

class Qiniu extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部七牛文件
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 七牛文件名称模糊查询
                if ($key == 'file_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 七牛文件类型模糊查询
                if ($key == 'file_type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('qiniu_files')->getAllCount($map);
        $lists = model('qiniu_files')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个文件详情
     */
    public function read($id)
    {
        $this->data['data'] = model('qiniu_files')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建七牛文件
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('qiniu');
        if ($validate->scene('create')->check($data)) {

            $qiniu            = new \qiniu();
            $uri              = $qiniu->get_uri();
            $data['file_url'] = $uri . $data['key'];

            $result = model('qiniu_files')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增七牛文件成功';
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
     * 【admin】更新七牛文件
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('qiniu');
        if ($validate->scene('update')->check($data)) {

            $result = model('qiniu_files')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新七牛文件成功';
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
     * 【admin】删除七牛文件
     */
    public function delete()
    {
        $id = input('id/d', 0);

        $qiniu_file = model('qiniu_files')->getOne($id);
        if ($qiniu_file) {
            $qiniu = new \qiniu();
            $qiniu->delete($qiniu_file['key']);
        }

        $result = model('qiniu_files')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除七牛文件成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除七牛文件
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $keys  = model('qiniu_files')->getColumn(['id' => ['in', $ids]], 'key');
        $qiniu = new \qiniu();
        $qiniu->batch_delete($keys);

        $result = model('qiniu_files')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除七牛文件成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 生成七牛上传的token
     */
    public function create_qiniu_token()
    {
        $type  = input('type');
        $qiniu = new \qiniu();

        $this->data['data'] = $qiniu->token($type);

        return $this->data;
    }

}
