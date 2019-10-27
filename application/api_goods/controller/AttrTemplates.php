<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class AttrTemplates extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部属性模板
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 属性模板名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('attr_templates')->getAllCount($map);
        $lists = model('attr_templates')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条属性模板详情
     */
    public function read($id)
    {
        $this->data['data'] = model('attr_templates')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建属性模板
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('attr_template');
        if ($validate->scene('create')->check($data)) {

            $result = model('attr_templates')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增属性模板成功';
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
     * 【admin】更新属性模板
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('attr_template');
        if ($validate->scene('update')->check($data)) {

            $result = model('attr_templates')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新属性模板成功';
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
     * 【admin】删除属性模板
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('attr_templates')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除属性模板成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除属性模板
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('attr_templates')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除属性模板成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
