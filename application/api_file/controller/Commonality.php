<?php
namespace app\api_file\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Commonality extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        // 'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in'],
        // 'checkUser'  => ['only' => 'complete_user_info,sign_in,lists'],
    ];

    /**
     * 【admin】查询全部方案
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 类型
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 名称
                if ($key == 'com_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('user_accounts')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('commonality')->getAllCount($map);
        $lists = model('commonality')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    public function group_type(){
        $count = model('commonality')->get_groups_all([],'type');
        return $count;
    }
     /**
     * 【admin】查询全部方案
     */
    public function lists(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 类型
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 名称
                if ($key == 'com_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('user_accounts')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('commonality')->getAllCount($map);
        $lists = model('commonality')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    /**
     * 【admin】新建方案
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('commonality');
        if ($validate->scene('create')->check($data)) {
            $result = model('commonality')->addOne($data);
            if ($result['code']) {

                $this->data['msg']  = '新增方案成功';
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
     * 【public】更新方案
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'remuneration') {
            $data['id'] = $this->unique_id;
        }

        unset($data['mobile']);

        $validate = Loader::validate('commonality');
        if ($validate->scene('commonality')->check($data)) {

            $result = model('commonality')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新方案成功';
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
     * 【admin】删除方案
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('commonality')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除方案成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除方案
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('commonality')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除方案成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
