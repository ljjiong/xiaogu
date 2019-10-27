<?php
namespace app\api_operation\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;
use think\Validate;

class Operation extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'index'],
        'checkAdmin' => ['except' => 'index,export'],
    ];

    /**
     * 【admin】查询全部数据
     */
    public function index(Request $request)
    {
        $map                = $request->param();
        $count              = model('operation')->getAllCount($map);
        $lists              = model('operation')->getAll($map, $this->page_num, $this->page_limit);
        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;

    }

    /**
     * 【admin】查询全部数据
     */
    public function lists(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 按年项目详情
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
                if ($key == 'dateline') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }
        $count              = model('operation')->getAllCount($map);
        $lists              = model('operation')->getAll($map, $this->page_num, $this->page_limit);
        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;

    }

    /**
     * 【admin】新建任务
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('operation');
        if ($validate->scene('create')->check($data)) {
            $data['year'] = substr($data['dateline'], 0, 4);
            $result       = model('operation')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增数据成功';
                $this->data['data'] = $result['data'];

            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            echo 11;
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】更新任务
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('operation');
        if ($validate->scene('update')->check($data)) {
            $data['year'] = substr($data['dateline'], 0, 4);
            $result       = model('operation')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新数据成功';
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
     * 【admin】删除任务
     */
    public function delete()
    {
        $id = input('id/d', 0);

        $result = model('operation')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除数据成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】导出实时运转数据
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

        $lists = model('operation')->getAll($map);

        import('app.api_extend.extend.importAndExport.export');

        $export_data = [];
        foreach ($lists as $key => $val) {
            $user = model('operation')->getOne($val['id']); 

            $export_data[] = [
                'key'            => $key + 1, 
                'name'           => $user['name'],
                'plant_name'     => $user['plant_name'],
                'unit'           => $val['unit'],
                'running_status' => $val['running_status'],
                'active_power'   => $val['active_power'],
                'idle_work'      => $val['idle_work'],
                'remark'         => $val['remark'],
                'district'       => $val['district'],
                'annual_program' => $val['annual_program'],
                'create_time'    => $val['create_time'],

            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
            '序号',
            '水电站名字',
            '水电站/厂名(下面的一厂，二厂，三厂)',
            '机组',
            '运行状态',
            '有功电量KW',
            '无功电量Kvar',
            '备注',
            '电厂归属片区',
            '当前功率/KW.H',
            '录入时间', 
        ];
       
        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data,$title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }
}
