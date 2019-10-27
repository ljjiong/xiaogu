<?php
namespace app\api_month_operation\controller;

use app\api_init\controller\Rest;
use think\Request;

// use think\Validate;

class MonthOperation extends Rest
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

        $this->getMonthlyAttr($request);
        return $this->data;

    }

    public function getMonthlyAttr(request $request)
    {
        $map = $request->param();
        $res = model('operation')->get_month_All($map, $this->page_num, $this->page_limit, 'name');
//echo model('daily_statistical')->getLastSql();  exit();
        $this->data['data'] = $res;
        return $this->data;

    }

     /**
     * 【user】导出机器月报表数据
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
                'dateline'       => $val['dateline'],  
                'name'           => $user['name'],
                'plant_name'     => $user['plant_name'], 
                'active_power'   => $val['active_power'],
                'idle_work'      => $val['idle_work'], 
                'district'       => $val['district'], 

            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
             '日期',
            '水电站名字',
            '水电站/厂名(下面的一厂，二厂，三厂)', 
            '有功电量KW',
            '无功电量Kvar', 
            '电厂归属片区',
            
        ];
       
        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data,$title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }

}
