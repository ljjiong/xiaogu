<?php
namespace app\api_monthly_statistics\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;
use think\Validate;

class MonthlyStatistics extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'index'],
        'checkAdmin' => ['except' => 'index,export,floods_monthly,bigdata_monthly'],
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
        $res = model('daily_statistical')->get_month_All($map, $this->page_num, $this->page_limit, 'dateline');

        $this->data['data'] = $res;
        return $this->data;

    }

    /**
     * 【admin】新建任务
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('monthly_statistics');
        if ($validate->scene('create')->check($data)) {
            $result = model('monthly_statistics')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增数据成功';
                $this->data['data'] = $result['data'];
                // $this->data['created_time']= $data['created_time'];

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

        $validate = Loader::validate('monthly_statistics');
        if ($validate->scene('update')->check($data)) {

            $result = model('monthly_statistics')->editOne($data);
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
     * 大水江水库水情月统计
     */
    public function floods_monthly(request $request)
    {        
         $map=[
            'name' => ['like','大水江'.'%'],
         ];
        $res = model('daily_statistical')->get_floods_month_All($map, $this->page_num, $this->page_limit, 'dateline');

        $this->data['data'] = $res;
        return $this->data;

    }


      /**
     * 大圳水库水情月统计
     */
    public function bigdata_monthly(request $request)
    {        
         $map=[
            'name' => ['like','大圳'.'%'],
         ];
        $res = model('daily_statistical')->get_bigdata_month_All($map, $this->page_num, $this->page_limit, 'dateline');

        $this->data['data'] = $res;
        return $this->data;

    }
    /**
     * 东风水库
     */
    public function eastwind_monthly(Request $request)
    {
        $map=[
            'name' => ['like','东风'.'%'],
         ];
        $res = model('daily_statistical')->get_bigdata_month_All($map, $this->page_num, $this->page_limit, 'dateline');

        $this->data['data'] = $res;
        return $this->data;
    }
    /**
     * 【admin】删除任务
     */
    public function delete()
    {
        $id = input('id/d', 0);

        $result = model('monthly_statistics')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除数据成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

      /**
     * 【user】导出水库水情月统计数据
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
                'dateline'       => $val['dateline'],  //日期
                
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
             '日期',
            
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
     * 【user】导出大水江水库水情月统计数据
     */
    public function export1(Request $request)
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
                'dateline'       => $val['dateline'],  //日期 
                'storages'     => $user['storages'], //进库流量(M3/S)
                'water_yield'   => $val['water_yield'], //进库水量(M3/万)
                'delivery'      => $val['delivery'], //出库流量(M3/S)
                'electricity'       => $val['electricity'], //出库（发电）水量（万M3）
                'rainfall'       => $val['rainfall'],//降雨(MM) 
                'create_time'       => $val['create_time'],//录入时间
            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
            
            '水库名',
             '日期', 
            '进库流量(M3/S)', 
            '进库水量(M3/万)',
            '出库流量(M3/S)', 
            '出库（发电）水量（万M3）',
            '降雨(MM)', 
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
