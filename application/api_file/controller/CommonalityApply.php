<?php
namespace app\api_file\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class CommonalityApply extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        // 'checkAdmin' => ['except' => 'save,lists'],
        // 'checkUser'  => ['only' => 'lists,save'],
    ];

    /**
     * 【admin】查询全部公共资源
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {

            } else {
                unset($map[$key]);
            }
        }
        $map['states'] = 1;
        $count         = model('commonality')->getAllCount($map);
        $lists         = model('commonality')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    public function lists(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {

            } else {
                unset($map[$key]);
            }
        }
        $map['states'] = 1;
        $count         = model('commonality')->getAllCount($map);
        $lists         = model('commonality')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    /**
     * 【admin】申请公共资源
     */
    public function save(Request $request)
    {
        $data          = $request->param();
        $data['uid']   = $this->unique_id;
        $data['comid'] = $data['id'];
        unset($data['id']);
        $validate = Loader::validate('commonality_apply');
        if ($validate->scene('create')->check($data)) {

            $data['start_time'] = $data['expiry_time'][0];
            $data['end_time']   = $data['expiry_time'][1];
            $result             = model('commonality_apply')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增公共资源成功';
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
    //-------------------------------------------------------------------

    public function listsgg(Request $request){
        $map = $request->param();
        
        $count         = model('commonality')->getAllCount($map);
        $lists         = model('commonality')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    public function savec(Request $request)
    {
        $data          = $request->param();
        $validate = Loader::validate('commonality_apply');
        if ($validate->scene('create')->check($data)) {
            $result             = model('commonality_apply')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增公共资源成功';
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

    //-------------------------------------------------------------------
    /**
     * 【admin】通过申请公共资源
     */
    public function pass(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'commonality_apply') {
            $data['id'] = $this->unique_id;
        }

        unset($data['mobile']);

        $data['status'] = 3;

        $result = model('commonality_apply')->editOne($data);
        if ($result['code']) {
            $this->data['msg']  = '审核成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }
        return $this->data;
    }
    /**
     * 【admin】不通过申请公共资源
     */
    public function nopass(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'commonality_apply') {
            $data['id'] = $this->unique_id;
        }

        unset($data['mobile']);

        $data['status'] = 2;

        $result = model('commonality_apply')->editOne($data);
        if ($result['code']) {
            $this->data['msg']  = '审核成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }
        return $this->data;
    }
    /**
     * 【admin】查询审核公共资源
     */
    public function audit_index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 昵称模糊查询
                if ($key == 'nick_name') {
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
        $count = model('commonality_apply')->getAllCount($map);
        $lists = model('commonality_apply')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
