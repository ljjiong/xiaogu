<?php
namespace app\api_performance\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Loader;
use think\Request;

class Performance extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        // 'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in,master_read,personage'],
        // 'checkUser'  => ['only' => 'complete_user_info,sign_in,master_read,personage'],
    ];

    /**
     * 【public】查询全部记录
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

            } else {
                unset($map[$key]);
            }
        }

        // // $datas['aid'] = $this->unique_id;
        // // $admims       = model('users')->getOne($datas['aid']);

        // if ($admims['department'] != '管理员') {$map['pid'] = $admims['department'];}
        $count = model('performance')->getAllCount($map);
        $lists = model('performance')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    public function standards(Request $request)
    {
        $map                = $request->param();
        $datas['aid']       = $this->unique_id;
        $admims             = model('users')->getOne($datas['aid']);
        $standards          = Db::table('work_custom_position')->field('standard')->where('position_name', $admims['department'])->find();
        $this->data['data'] = $standards;
        return $this->data;
    }

    /**
     * 【admin】查询部门全部人员
     */
    public function index_user(Request $request)
    {
        $map = $request->param();

        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'nick_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }
        // $datas['aid'] = $this->unique_id;
        // $admims       = model('users')->getOne($datas['aid']);
        // return $admims['department'];
        // if ($admims['department'] != '管理员') {$map['department'] = $admims['department'];}

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

    // 根据登录ID查询个人绩效
    public function personage(Request $request)
    {
        $map = $request->param();
        $res = model('performance')->findOne(['uid' => $this->unique_id]);

        $this->data['data'] = $res;
        return $this->data;

    }

    
    public function project_self_deduct(Request $request)
    {
        $map    = $request->param();
        $result = 0;
        if (isset($map['year']) && isset($map['month']) && isset($map['uid'])) {
            $where = [
                //拼接年月 查询一个月绩效
                'end_time' => ['like', '%' . $map['year'] . '-' . $map['month'] . '%'],
                'performer'      => $map['uid'],
            ];
            $result = model('project_detail')->getAllCount($where);
        }
        $this->data['data'] = $result;
        return $this->data;

    }


    /**
     * 【admin】批量删除会员
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('performance')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【admin】删除绩效考核
     */
    public function delOne($id)
    {

        $id     = input('id/d', 0);
        $result = model('performance')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【admin】新建绩效考核
     */
    public function save(Request $request)
    {
        $data        = $request->param();
        $data['aid'] = $this->unique_id;
        $validate    = Loader::validate('performance');
        if ($validate->scene('create')->check($data)) {
            $i = [
                'month' => $data['month'],
                'uid'   => $data['uid'],
                'year'  => $data['year'],
            ];

            if ($result = model('performance')->findOne($i)) {
                $this->data['code'] = 0;
                $this->data['msg']  = '该用户本月已经审核完成';
                return $this->data;
            } else {
                $result = model('performance')->addOne($data);
                if ($result['code']) {
                    $user = $result['data'];
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【public】更新绩效考核
     */
    public function update(Request $request)
    {
        $data        = $request->param();
        $data['aid'] = $this->unique_id;
        $validate    = Loader::validate('performance');
        if ($validate->scene('update')->check($data)) {
            $result = model('performance')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新绩效考核成功';
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
    public function listsjx(Request $request){
        $data        = $request->param();

       $lists= model('performance')->getAll($data);

        $this->data['data'] = $lists;
        return $this->data;
    }


      /**
     * 【user】导出绩效
     */
    public function export(Request $request)
    {
        $map = $request->param(); 
 
        // 时间查询处理
        if (isset($map['create_time']) && isset($map['update_time'])) {
            $map['create_time'] = [['>= time', $map['create_time']], ['<= time', $map['update_time']], 'and'];
            unset($map['create_time']);
            unset($map['update_time']);
        } else if (isset($map['create_time'])) {
            $map['create_time'] = ['>= time', $map['create_time']];
            unset($map['create_time']);
        } else if (isset($map['update_time'])) {
            $map['create_time'] = ['<= time', $map['update_time']];
            unset($map['update_time']);
        }

        $lists = model('performance')->getAll();
 
        import('app.api_extend.extend.importAndExport.export');

        $export_data = [];
        foreach ($lists as $key => $val) {
            $user = model('performance')->getOne($val['id']); 
            
            $res  = model('users')->findOne(['id'=>$user['uid']]);
            
            $export_data[] = [
                'key'            => $key + 1, 
                'year'           => $user['year'],
                'month'          => $user['month'],  
                'nick_name'      => $res['nick_name'],
                'department'     => $res['department'],
                'grade'          => $user['grade'],
                'remark'         => $user['remark'], 

            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
            '序号',
            '年份',
            '月份',
            '姓名',
            '部门',
            '考核评分',
            '备注', 
        ];
       
        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data,$title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }
}
