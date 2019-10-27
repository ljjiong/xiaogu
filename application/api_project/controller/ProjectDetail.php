<?php
namespace app\api_project\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class ProjectDetail extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        // 'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in,master_read,index,personage'],
        // 'checkUser'  => ['only' => 'complete_user_info,sign_in,master_read,lists'],
    ];

    /**
     * 【admin】查询全部任务
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 按年项目详情
                if ($key == 'task') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
                if ($key == 'uid') {
                    $map[$key] = 'nick_name';
                }
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

    /**
     * 【public】查询全部任务
     */
    public function lists(Request $request) {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 按年项目详情
                if ($key == 'states') {
                    $map[$key] = $value;
                }
                if ($key == 'project_name') {
                    $map[$key] = ['like','%'.$value.'%'];
                }
                if ($key == 'uid') {
                    $map['project_member'] = ['like','%'.$value.'%'];
                    unset($map['uid']);
                }
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
	
	  /**
     *  
     * 验收项目
     */
    public function affirm(Request $request) {
        $data = $request->param();
       $res = model('project_detail')->findOne(['id'=>$data['id'],'uid'=>$data['uid']]);   
       if($res['states'] == 1){  
        $result = model('project_detail')->editOne(['affirm'=>$data['affirm'],'uid'=>$res['uid'],'id'=>$res['id']]);
        if ($result['code']) {
            $this->data['msg']  = '验收项目成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }
       }else{
        $this->data['code'] = 0;
        $this->data['msg']  = '该项目还未提交';
       } 
        return $this->data;
    }

    /**
     * 【public】查询全部任务
     */
    public function read(Request $request) {
        $map = $request->param();
        $lists = model('project_detail')->getAll(['id'=>$map['id']]);
        
        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】批量删除会员
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('project_detail')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除任务成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【admin】删除任务
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
     * 【admin】新建任务
     */
    public function save(Request $request)
    {
        $data        = $request->param();
        $data['uid'] = $this->unique_id;
        $validate    = Loader::validate('project_detail');
        if ($validate->scene('create')->check($data)) {
            $result = model('project_detail')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增任务成功';
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
     * 【public】更新任务
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'project_detail') {
            $data['id'] = $this->unique_id;
        }

        $validate = Loader::validate('project_detail');
        if ($validate->scene('update')->check($data)) {
            $result = model('project_detail')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新任务成功';
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
     * 【admin】批量不启用任务
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('project_detail')->batchUpdate(['status' => 9], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拉黑会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量启用任务
     */
    public function batch_recover_normal(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('project_detail')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量恢复会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
	
	//查询个人任务
    public function personage(Request $request)
    {
        $res = model('project_detail')->getAll(['performer'=>$this->unique_id]);

        $this->data['data'] = $res;
        return $this->data;
    }

    /**
     * 【public】更新任务
     */
    // public function over_project(Request $request)
    // {
    //     $map = $request->param();
    //     $id = $map['id'];
    //         $data = [
    //             'id'=>$id,
    //         ] 
    //         $result = model('project_detail')->editOne($data);
    //         if ($result['code']) {
    //             $this->data['msg']  = '更新任务成功';
    //             $this->data['data'] = $result['data'];
    //         } else {
    //             $this->data['code'] = 0;
    //             $this->data['msg']  = $result['msg'];
    //         }

    //     return $this->data;
    // }
}
