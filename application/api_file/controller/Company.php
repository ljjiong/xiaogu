<?php
namespace app\api_file\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Company extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        // 'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in,index'],
        // 'checkUser'  => ['only' => 'lists,complete_user_info,sign_in '],
    ];

    /**
     * 【admin】查询全部文件
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'file_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('file')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('file')->getAllCount($map);
        $lists = model('file')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询全部文件
     */
    public function lists(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'file_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('file')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('file')->getAllCount($map);
        $lists = model('file')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    

    /**
     * 【admin】新建文件
     */
    public function save(Request $request)
    {
        $data        = $request->param();
        $data['uid'] = $this->unique_id;
        $validate    = Loader::validate('Company');
        if ($validate->scene('create')->check($data)) {
            $result = model('file')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增文件成功';
                $this->data['data'] = $result;
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
     * 【public】更新文件
     */
    public function update(Request $request)
    {
        $data = $request->param();
        $data['uid'] = $this->unique_id;
        $validate = Loader::validate('Company');
        if ($validate->scene('Company')->check($data)) {
            $result = model('file')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新文件成功';
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
     * 【admin】删除文件(将文件的账号全部置空)
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('file')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除文件成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除文件
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('file')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除文件成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【admin】批量拉黑文件
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('file')->batchUpdate(['data_state' => 9], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拉黑文件成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
