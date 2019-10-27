<?php
namespace app\api_intention\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class About extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in'],
        'checkUser'  => ['only' => 'complete_user_info,sign_in'],
    ];

    /**
     * 【admin】查询全部意向记录
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 按年查询
                if ($key == 'month') {
                    $map[$key] = $value;
                }

                // 按月份查询
                if ($key == 'year') {
                    $map[$key] = $value;
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

        $count = model('intention')->getAllCount($map);
        $lists = model('intention')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    /**
     * 【admin】新建意向记录
     */
    public function save(Request $request)
    {
        $data        = $request->param();
        $data['aid'] = $this->unique_id;
        $validate    = Loader::validate('intention');
        if ($validate->scene('create')->check($data)) {

            $result = model('intention')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增意向记录成功';
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
     * 【public】更新意向记录
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'intention') {
            $data['id'] = $this->unique_id;
        }

        $data['aid'] = $this->unique_id;
        unset($data['mobile']);
        $validate = Loader::validate('intention');
        if ($validate->scene('update')->check($data)) {

            $result = model('intention')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新意向记录成功';
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
     * 【admin】删除意向记录(将意向记录的账号全部置空)
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('intention')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除意向记录成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除意向记录
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('intention')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除意向记录成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【admin】批量拉黑意向记录
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('intention')->batchUpdate(['data_state' => 9], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拉黑意向记录成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
