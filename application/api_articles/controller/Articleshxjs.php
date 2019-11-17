<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Articleshxjs extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部文章列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 文章类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                if ($key == 'type_id') {
                    $map[$key] = $value;
                }

                // 文章标题模糊查询
                if ($key == 'title') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('articleshxjs')->getAllCount($map);
        $lists = model('articleshxjs')->getAll($map, $this->page_num, $this->page_limit);
        foreach ($lists as $key => $value) {
            switch ($value['class_id']) {
                case 1:
                    $lists[$key]['class_name'] ='产品功能';
                    break;
                case 2:
                    $lists[$key]['class_name'] ='应用场景';
                    break;
                case 3:
                    $lists[$key]['class_name'] ='产品优势';
                    break;    
                
                default:
                    $lists[$key]['class_name'] ='';
                    break;
            }
        }
        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个文章详情
     */
    public function read($id)
    {
        $this->data['data'] = model('articleshxjs')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建文章
     */
    public function save(Request $request)
    {
        $data = $request->param();

        // $validate = Loader::validate('article');
        // if ($validate->scene('create')->check($data)) {

            $result = model('articleshxjs')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增成功';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        // } else {
        //     $this->data['code'] = 0;
        //     $this->data['msg']  = $validate->getError();
        // }

        return $this->data;
    }

    /**
     * 【admin】更新文章
     */
    public function update(Request $request)
    {
        $data = $request->param();
        // unset($data['click_num']);
        // return $data;
        // $validate = Loader::validate('article');
        // if ($validate->scene('update')->check($data)) {

            $result = model('articleshxjs')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新成功';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        // } else {
        //     $this->data['code'] = 0;
        //     $this->data['msg']  = $validate->getError();
        // }

        return $this->data;
    }

    /**
     * 【admin】删除文章
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('articleshxjs')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除文章
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('articleshxjs')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线文章
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('articles')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线文章成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线文章
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('articles')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线文章成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】会员文章列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('articles')->getAllCount($map);
        $lists = model('articles')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
