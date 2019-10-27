<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Loader;
use think\Request;

import('app.api_extend.extend.dd.ddsql');

class FacilityMaintenance extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin'=> ['except' => 'index'],
    ];

    /**
     * 【admin】查询全部数据字典
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 数据字典名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 数据字典数据表名模糊查询
                if ($key == 'table_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('facility_maintenance')->getAllCount($map);
        $lists = model('facility_maintenance')->getAll($map, $this->page_num, $this->page_limit);
        // return $lists;

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条数据字典详情
     */
    public function read($id)
    {
        $this->data['data'] = model('dds')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建数据字典
     */
    public function save(Request $request)
    {
        $data = $request->param();

        // $validate = Loader::validate('dd');
        // if ($validate->scene('create')->check($data)) {

            $result = model('facility_maintenance')->addOne($data);
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
     * 【admin】更新数据字典
     */
    public function update(Request $request)
    {
        $data = $request->param();

        // $validate = Loader::validate('dd');
        // if ($validate->scene('update')->check($data)) {

            $result = model('facility_maintenance')->editOne($data);
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
     * 【admin】删除数据字典
     */
    public function delete()
    {
        $id = input('id/d', 0);

        // 删除表
        $dd    = model('dds')->getOne($id);
        $ddsql = new \ddsql();
        $ddsql->del_table($dd['table_name']);

        $result = model('dds')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除数据字典成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];


        $result = model('facility_maintenance')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
   
      /**
     * 【user】导出设备检修试验管理报表
     */
    public function export(Request $request)
    {
        $map = $request->param(); 

          
        $lists = model('facility_maintenance')->getAll($map);

        import('app.api_extend.extend.importAndExport.export');

        $export_data = [];
        foreach ($lists as $key => $val) {
            // $user = model('accident')->getOne($val['id']); 

            $export_data[] = [
            'key'                            => $key + 1,
                'name_unit'                  => $val['name_unit'],
                'manufacture'                => $val['manufacture'],
                'testing_instrument'         => $val['testing_instrument'],
                'test_items'                 => $val['test_items'],
                'test_content'               => $val['test_content'],
                'place'                      => $val['place'],
                'measured_data'              => $val['measured_data'],
                'permissible_value'          => $val['permissible_value'],
                'test_result'                => $val['test_result'],
                'weather'                    => $val['weather'],
                'tester'                     => $val['tester'],
                'monitor'                    => $val['monitor'],
                'create_time'                => $val['create_time'],
            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
            '序号',
            '单位名称',
            '设备生产日期',
            '测试仪器',
            '测试项目',
            '测试内容',
            '测试地点',
            '测试数据',
            '允许值',
            '测试结果',
            '测试当日天气', 
            '测试人员',
            '监测人',
            '测试日期', 
        ];

        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data, $title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }
}
