<?php
namespace app\api_annual_statement\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;
use think\Validate;

class AnnualStatement extends Rest
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
        // $map = $request->param();
        // $count = model('annual_statement')->getAllCount($map);
        // $lists = model('annual_statement')->getAll($map, $this->page_num, $this->page_limit);
        // $this->data['page'] = [
        //     'page_num'   => $this->page_num,
        //     'page_limit' => $this->page_limit,
        //     'data_count' => $count,
        // ];

        // $this->data['data'] = $lists;
        $this->getYearAttr($request);

        return $this->data;
    }

    public function getYearAttr(request $request)
    {
        $map = $request->param();
        $res = model('daily_statistical')->get_year_All($map, $this->page_num, $this->page_limit, 'year');
 
        $this->data['data'] = $res;
        return $this->data;

    }
    //大水江
    public function floods_year(request $request)
    {
        $map=[
            'name' => ['like','大水江'.'%'],
         ];
        $res = model('daily_statistical')->get_floods_year_All($map, $this->page_num, $this->page_limit, 'year');
       
        $this->data['data'] = $res;
        return $this->data;

    }
    //大圳
    public function bigdata_year(request $request)
    {
        $map=[
            'name' => ['like','大圳'.'%'],
         ];
        $res = model('daily_statistical')->get_floods_year_All($map, $this->page_num, $this->page_limit, 'year');
       
        $this->data['data'] = $res;
        return $this->data;

    }

    //东风
    public function eastwind_year(Request $request)
    {
        $map=[
            'name' => ['like','东风'.'%'],
         ];
        $res = model('daily_statistical')->get_floods_year_All($map, $this->page_num, $this->page_limit, 'year');
       
        $this->data['data'] = $res;
        return $this->data;
    }

        /**
     * 【user】导出水库水情年统计数据
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

        $lists = model('daily_statistical')->getAll($map);

        import('app.api_extend.extend.importAndExport.export');

        $export_data = [];
        foreach ($lists as $key => $val) {
            $user = model('daily_statistical')->getOne($val['id']); 

            $export_data[] = [
                
                'name'           => $val['name'],  //水库名
                'year'       => $val['year'],  //年份
                
                //'storages'     => $user['storages'], //进库流量(M3/S)
                'water_yield'   => $val['water_yield'], //进库水量(M3/万)
                //'delivery'      => $val['delivery'], //出库流量(M3/S)
                'electricity'       => $val['electricity'], //出库（发电）水量（万M3）
                'imports'       => $val['imports'],// 进口引水（进库引水情况m3）
                'hanyama'       => $val['hanyama'],//半山引水（半山引水情况m3)
                'rainfall'       => $val['rainfall'],//降雨(MM)
              //  'weather'       => $val['weather'],//天气情况
               // 'create_time'       => $val['create_time'],//录入时间
            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
            
            '水库名',
             '年份',
            
            //'进库流量(M3/S)', 
            '进库水量(M3/万)',
           // '出库流量(M3/S)', 
            '出库（发电）水量（万M3）',
            '进口引水（进库引水情况m3）',
            '半山引水（半山引水情况m3)',
            '降雨(MM)',
          //  '天气情况',
          //  '录入时间',
        ];
       
        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data,$title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }

        /**
     * 【user】导出水库水情年统计数据
     */
    public function floods_year_export(Request $request)
    {
        $map = [
          'name' => ['like','大水江'.'%']  
        ];
        $lists = model('daily_statistical')->getAll($map);

        import('app.api_extend.extend.importAndExport.export');

        $export_data = [];
        foreach ($lists as $key => $val) {
            $user = model('daily_statistical')->getOne($val['id']); 

            $export_data[] = [
                
                'name'           => $val['name'],  //水库名
                'year'       => $val['year'],  //年份 
                'water_yield'   => $val['water_yield'], //进库水量(M3/万)
                'electricity'       => $val['electricity'], //出库（发电）水量（万M3）
                'rainfall'       => $val['rainfall'],//降雨(MM)
            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
            
            '水库名',
             '年份', 
            '进库水量(M3/万)', 
            '出库（发电）水量（万M3）', 
            '降雨(MM)', 
        ];
       
        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data,$title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }
}
