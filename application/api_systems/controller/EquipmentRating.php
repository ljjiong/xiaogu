<?php

namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Loader;
use think\Request;

import('app.api_extend.extend.dd.ddsql');

class EquipmentRating extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'index'],
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

        $count = model('equipment_rating')->getAllCount($map);
        $lists = model('equipment_rating')->getAll($map, $this->page_num, $this->page_limit);
        // echo model('accident')->getLastSql();  exit();

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

        $result = model('equipment_rating')->addOne($data);
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

        $result = model('equipment_rating')->editOne($data);
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


        $result = model('equipment_rating')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】导出事故报表
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

        $lists = model('equipment_rating')->getAll($map);

        import('app.api_extend.extend.importAndExport.export');

        $export_data = [];
        foreach ($lists as $key => $val) {
            // $user = model('accident')->getOne($val['id']); 

            $export_data[] = [
                'key'                  => $key + 1,
                'accident_time'       => $val['accident_time'],
                'name'           => $val['name'],
                'type'     => $val['type'],
                'death_toll'   => $val['death_toll'],
                'serious_injury'      => $val['serious_injury'],
                'direct_economic'       => $val['direct_economic'],
                'accident_classification'      => $val['accident_classification'],
                'accident_cause'       => $val['accident_cause'],
                'accident_summary'       => $val['accident_summary'],
                'create_time'       => $val['create_time'],
            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
            '序号',
            '日期',
            '名称',
            '类型',
            '死亡人数',
            '重伤人数',
            '直接经济损失',
            '事故类别',
            '事故原因',
            '事故简要情况',
            '录入时间', 
        ];

        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data, $title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }
}
