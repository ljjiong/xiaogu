<?php
namespace app\api_project\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;
use think\Db;
class Project extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        // 'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in,master_read'],
        // 'checkUser'  => ['only' => 'complete_user_info,sign_in,master_read'],
    ];

    /**
     * 【admin】查询全部项目
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'project_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('project')->getAllCount($map);
        $lists = model('project')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    public function addxixixi()
    {
        $i = '董事长兼经理、副经理、麻林水电站、麻林水电站站长、麻林水电站副站长、麻林水电站书记、麻林水电站副书记、麻林水电站班长、红旗水电站、红旗水电站站长、红旗水电站副站长、红旗水电站书记、红旗水电站副书记、红旗水电站班长、红星水电站、红星水电站站长、红星水电站副站长、红星水电站书记、红星水电站副书记、红星水电站班长、新虹水电站、新虹水电站站长、新虹水电站副站长、新虹水电站书记、新虹水电站副书记、新虹水电站班长、大水江水电站、大水江水电站站长、大水江水电站副站长、大水江水电站书记、大水江水电站副书记、大水江水电站班长、东风水电站、东风水电站站长、东风水电站副站长、东风水电站书记、东风水电站副书记、东风水电站班长';
        $i = preg_replace('# #', '', $i);
        $map = explode('、',$i);return false;
        for ($i=0; $i < count($map); $i++) { 
            $where = ['position_name'=>$map[$i]];
            // Db::table('work_custom_position')->insert($where);
        }
        
    }
    /**
     * 【public】查询全部项目
     */
    function list(Request $request) {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($key == 'aid') {
                $map = ['id' => $value];
            }
        }

        $count = model('project')->getAllCount($map);
        $lists = model('project')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    //------------------------------------------------------------------------

    public function listsp(Request $request)
    {
        $map               = $request->param();
        $map['is_achieve'] = 0;
        $id                = $map['uid'];
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'uid') {
                    unset($map[$key]);
                }
                if ($key == 'project_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }
        // $id = $map['uid'];
        // unset($map['uid']);
        $count = model('project')->getAllCount($map);
        $lists = model('project')->getAll($map, $this->page_num, $this->page_limit);
        // return $lists;
        foreach ($lists as $key => $value) {
            # code...
            if (!empty($lists[$key]['project_member'])) {
                if (!in_array($id, $lists[$key]['project_member'])) {
                    unset($lists[$key]);
                }
            } else {
                unset($lists[$key]);
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
    //所有用户
    public function list_user(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {

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
    public function list_rw(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {

            } else {
                unset($map[$key]);
            }
        }

        $count = model('project_detail')->getAllCount($map);
        $lists = model('project_detail')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    public function savep(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('project');
        if ($validate->scene('create')->check($data)) {
            $result = model('project')->addOne($data);
            if ($result['code']) {
                $user = $result['data'];
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
    public function readp(Request $request)
    {
        $map                = $request->param();
        $lists              = model('project')->getOne($map['id']);
        $lists['fzr']       = model('users')->getOne($lists['project_manager'])['nick_name'];
        $lists['cyrs']      = model('users')->getAll(['id' => ['in', $lists['project_member']]]);
        $this->data['data'] = $lists;
        return $this->data;
    }
    //-----------------------------------------------------------------------------------
    /**
     * 【admin】批量删除会员
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('project')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除项目成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【admin】删除项目
     */
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            model('user_accounts')->delAllByUserIds([$id]);
            return ['code' => 1, 'data' => [], 'msg' => '删除会员成功'];
        }
    }
    /**
     * 【admin】新建项目
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('project');
        if ($validate->scene('create')->check($data)) {
            $result = model('project')->addOne($data);
            if ($result['code']) {
                $user = $result['data'];
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
     * 【public】更新项目
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'project') {
            $data['id'] = $this->unique_id;
        }
        $validate = Loader::validate('project');
        if ($validate->scene('update')->check($data)) {
            $result = model('project')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新项目成功';
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
     * 【admin】批量不启用项目
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('project')->batchUpdate(['status' => 9], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拉黑会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量启用项目
     */
    public function batch_recover_normal(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('project')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量恢复会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
