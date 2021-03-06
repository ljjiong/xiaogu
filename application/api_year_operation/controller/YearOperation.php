<?php
namespace app\api_year_operation\controller;

use app\api_init\controller\Rest;
use think\Request;

// use think\Validate;

class YearOperation extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'index'],
        'checkAdmin' => ['except' => 'index,export'],
    ];

    /**
     * 【admin】查询全部数据   daily_statistical
     */
    public function index(Request $request)
    {

        $this->get_year_All($request);
        return $this->data;

    }

    public function get_year_All(request $request)
    {
        $map = $request->param();

        $res = model('operation')->get_year_All($map, $this->page_num, $this->page_limit, 'name');
 
        $this->data['data'] = $res;
        return $this->data;

    }

     /**
     * 【user】导出机器年报表数据
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
                'year'       => $val['year'],   //时间
                'name'           => $user['name'], // 电站、厂名
                'plant_name'     => $user['plant_name'], //水电站/厂名(下面的一厂，二厂，三厂)
                'active_power'   => $val['active_power'], //各厂/站，年电量合计
                'idle_work'      => $val['idle_work'],  //无用功率年总计
               

            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
             '年份',
            '水电站名字',
            '水电站/厂名(下面的一厂，二厂，三厂)', 
            '有功电量KW',
            '无功电量Kvar', 
           // '电厂归属片区',
            
        ];
       
        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data,$title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }

}
