<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Request;

class Test extends Rest
{
    // protected $beforeActionList = [
    //     'checkClientType',
    //     'checkAuth',
    // ];

    /**
     * 【test】显示系统所有表名称
     */
    public function index(Request $request)
    {
        // 触发分红商自动升级
        import('app.api_extend.extend.drp.Bonus');
        $Bonus = new \Bonus();
        // ============【分红】分红商自动升级begin==============
        $Bonus->auto_up_level(28);
        // ============【分红】分红商自动升级end================
        return $this->data;
    }

    /**
     * 【test】显示系统所有表名称
     */
    public function show_tables(Request $request)
    {
        $sql    = "show tables";
        $result = Db::query($sql);

        $data = [];
        foreach ($result as $key => $value) {
            $table  = implode(':', $value);
            $data[] = str_replace('wancll_', '', $table);
        }

        $str = '';
        foreach ($data as $key => $value) {
            $str .= "'" . $value . "',";
        }

        $this->data['data'] = $str;
        return $this->data;

    }
    //自动调用    任务超时判断
    // is_ot   0: 未超时   1：超时
    public function pro_timeout()
    {    
        $nowTime = date('Y-m-d h-i-s');
        $map     = [
            'end_time' => ['<', $nowTime],
            'is_ot'    => 0,
        ];
        Db::table('work_project_detail')->where($map)->update(['is_ot' => 1]);
    }

    public function in_push(Request $request)
    {
        $map  = $request->param();
        $nowTime = date('YmdHis');
        $aa=strtotime($nowTime)-80;
        $nowTime = date('Y-m-d H:i:s',$aa);
        $map1 = [
            'project_member' => ['like', '%'.$map['id'].'%'],
            'create_time'  => ['>',$nowTime],
        ];
        $news  = Db::table('work_annoncements')->where($map1)->select();
        $newss = Db::table('work_annoncements')->where($map1)->column('id');
        if (isset($news)) {
            $this->data['data']=$news;
        }
        return $this->data;
    }

}
