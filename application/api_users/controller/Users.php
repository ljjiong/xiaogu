<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Loader;
use think\Request;

class Users extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        // 'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in,getPayAttr'],
        // 'checkUser'  => ['only' => 'complete_user_info,sign_in,getPayAttr'],
    ];

    /**
     * 【admin】查询全部会员
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 广告类别
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 广告位编号
                if ($key == 'nick_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 部门
                if ($key == 'department') {
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

        $count = model('users')->getAllCount($map);
        $lists = model('users')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
        //导入会员
    public function plzc(Request $request)
    {
        $data = $request->post();

        $excel_pass = substr($data['excel_pass'], 1);
        import('app.api_extend.extend.importAndExport.import');
        $import        = new \import();
        $user_accounts = $import->importExecl($excel_pass); 

        //循环导入文件中的内容
 
        for ($i = 6; $i < count($user_accounts); $i++) {
            if (!$user_accounts[$i]['B']) {
                continue;
            }
            $this->register($user_accounts[$i]['C'], $user_accounts[$i]['D'], $user_accounts[$i]['B']); 
        }
        $this->data['code'] = 0;
        $this->data['msg']  = '导入成功';
        return $this->data;
    }
    //注册会员
    public function register($mobile, $department, $nick_name)
    {
        $data['mobile']     = $mobile; //return $nick_name;
        $data['department'] = $department;
        $data['nick_name']  = $nick_name;
        $data['password']   = '123456';
        $res_exits          = model('users')->findOne(['mobile' => $data['mobile']]);
        if ($res_exits) {
            return;
        }
        // 注册会员
        $user_data = [
            'mobile'     => $data['mobile'],
            'role_ids'   => isset($data['role_ids']) ? array_unique($data['role_ids']) : [1],
            'avatar'     => isset($data['avatar']) ? $data['avatar'] : '',
            'nick_name'  => isset($data['nick_name']) ? $data['nick_name'] : '',
            'department' => isset($data['department']) ? $data['department'] : '',
        ];

        $result = Db::name('users')->insertGetId($user_data);
        $user   = model('users')->getOne($result);

        // 写入会员资产表信息
        // $result = Db::name('user_assets')->insert(['user_id' => $user['id'], 'money' => 0]);

        // 写入会员统计表信息
        Db::name('user_info')->insert(['user_id' => $user['id']]);

        $account_data = [
            'guid'     => $data['mobile'],
            'password' => wancll_md5($data['password']),
            'user_id'  => $user['id'],
            // 'qq_openid'     => isset($data['qq_openid']) ? $data['qq_openid'] : '',
            // 'wechat_openid' => isset($data['wechat_openid']) ? $data['wechat_openid'] : '',
        ]; //return $account_data;
        $result = Db::name('user_accounts')->insert($account_data);

    }



    /**
     * 【admin】查询全部岗位
     */
    public function poindex()
    {
        $position           = Db::table('work_custom_position')->select();
        $this->data['data'] = ['position' => $position];

        return $this->data;
    }

    /**
     * 【public】查询单个会员
     */
    public function read()
    {
        if ($this->account_type == 'admin') {
            $id = input('id');
        } else {
            $id = $this->unique_id;
        }

        $user = model('users')->getOne($id);
        if ($this->account_type == 'admin' || $user['id'] == $this->unique_id) {
            $this->data['data'] = $user;
        } else {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
        }

        return $this->data;
    }
    //--------------------------------------------------------------------------
    public function readu(Request $request){

        $data     = $request->param();
        $lists=model('users')->getOne($data['id']);
        // return $lists;
        $this->data['data']=$lists;
        return $this->data;
    }
    public function updateu(Request $request){

        $data     = $request->param();
        $result=model('users')->editOne($data);
        if ($result['code']) {
            $this->data['msg']  = '更新会员成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    //--------------------------------------------------------------------------
    
    /**
     * 【admin】新建会员
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        // return $data;
        $validate = Loader::validate('user');
        if ($validate->scene('create')->check($data)) {

            // 注册会员
            $data['role_ids'] = isset($data['role_ids']) ? array_unique($data['role_ids']) : [1];

            $result = model('users')->addOne($data);
            if ($result['code']) {
                $user = $result['data'];

                // // 写入会员资产表信息
                // $result = model('user_assets')->addOne(['user_id' => $user['id']]);
                // if (!$result['code']) {
                //     $this->data['code'] = 0;
                //     $this->data['msg']  = $result['msg'];
                //     return $this->data;
                // }

                $account_data = [
                    'guid'     => $data['mobile'],
                    'password' => wancll_md5($data['password']),
                    'user_id'  => $user['id'],
                ];
                $result = model('user_accounts')->addOne($account_data);
                if ($result['code']) {
                    $this->data['msg']  = '新增会员成功';
                    $this->data['data'] = $user;
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
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
     * 【admin】新建会员档案
     */
    public function recordsave(Request $request)
    {
        $data   = $request->param();
        $result = model('record')->addOne($data);
        if ($result['code']) {
            $this->data['msg']  = '更新会员成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }
        return $this->data;
    }

    /**
     * 【public】更新会员档案
     */
    public function recordupdate(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'record') {
            $data['id'] = $this->unique_id;
        }
        $result = model('record')->editOne($data);
        if ($result['code']) {
            $this->data['msg']  = '更新会员成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【public】更新会员
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['id'] = $this->unique_id;
        }
        unset($data['mobile']);

        $validate = Loader::validate('user');
        if ($validate->scene('update')->check($data)) {
            // $users = model('users')->getOne($data['id']);

            // if (isset($data['department']) && $users['department'] != $data['department']) {
            //     $logs = [
            //         'uid'               => $data['id'],
            //         'position_name'     => $data['department'],
            //         'old_position_name' => $users['department'],
            //     ];
            //     model('positionlogs')->addOne($logs);
            // }

            // return $data;
            $result = model('users')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员成功';
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
     * 【admin】删除会员(将会员的账号全部置空)
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('users')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员成功';
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

        $result = model('users')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量拉黑会员
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('users')->batchUpdate(['status' => 9], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拉黑会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量恢复会员
     */
    public function batch_recover_normal(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('users')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量恢复会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】管理员修改用户密码
     */
    public function admin_mod_password(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('password');
        if ($validate->scene('admin_mod')->check($data)) {

            $params = [
                'id'       => model('user_accounts')->findOne(['user_id' => $data['id']])['id'],
                'password' => wancll_md5($data['password']),
            ];

            $result = model('user_accounts')->editOne($params);
            if ($result['code']) {
                $this->data['msg'] = '修改密码成功';
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
     * 【admin】管理员修改用户手机号
     */
    public function admin_mod_mobile(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('mobile');
        if ($validate->scene('admin_mod')->check($data)) {

            $params = [
                'id'   => model('user_accounts')->findOne(['user_id' => $data['id']])['id'],
                'guid' => $data['mobile'],
            ];
            $result1 = model('user_accounts')->editOne($params);

            $params = [
                'id'     => $data['id'],
                'mobile' => $data['mobile'],
            ];
            $result2 = model('users')->editOne($params);

            if ($result1['code'] && $result2['code']) {
                $this->data['msg'] = '修改会员手机号成功';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result1['msg'] . $result2['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【user】是否完善个人资料
     */
    public function complete_user_info()
    {
        $user = model('users')->getOne($this->unique_id);

        if ($user['nick_name'] != '' && $user['qq'] != '' && $user['wechat'] != '' && $user['email'] != '' && $user['province'] != '' && $user['city'] != '' && $user['area'] != '') {
            $is_complete = 1;
        } else {
            $is_complete = 0;
        }

        $this->data['data'] = [
            'is_complete' => $is_complete,
        ];

        return $this->data;
    }

    /**
     * 【public】绑定推荐关系
     */
    public function binding_parent(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['user_id'] = $this->unique_id;
        }

        $validate = Loader::validate('binding_parent');
        if ($validate->scene('binding')->check($data)) {
            // 写入父子关系
            $parent = model('users')->findOne(['mobile' => $data['parent_mobile']]);
            if ($parent) {
                $parent_id = $parent['id'];
                if ($parent['parent_ids']) {
                    $parent_ids = $parent['parent_ids'] . $parent_id . '#';
                } else {
                    $parent_ids = '#' . $parent_id . '#';
                }

                $update_data = [
                    'id'         => $data['user_id'],
                    'parent_id'  => $parent_id,
                    'parent_ids' => $parent_ids,
                ];
                $result = model('users')->editOne($update_data);
                if ($result['code']) {
                    $this->data['msg'] = '绑定推荐关系成功';
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '绑定推荐关系失败';
                }
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【public】查询科成为父级的会员列表
     */
    public function parent_lists(Request $request)
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
            } else {
                unset($map[$key]);
            }
        }
        $map['is_distributor|is_bonus'] = 1;

        $count = model('users')->getAllCount($map);
        $lists = model('users')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /*
     * 【user】会员签到
     */
    public function sign_in()
    {
        $result = model('sign')->add_sign($this->unique_id);
        if ($result['code']) {
            $this->data['msg'] = '签到成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
