<?php
namespace app\api_remuneration\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Loader;
use think\Request;

class About extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in,single,pay,lists,index'],
        'checkUser'  => ['only' => 'complete_user_info,sign_in,single,pay,lists'],
    ];

    /**
     * 【admin】查询全部薪资
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

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('user_accounts')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('remuneration')->getAllCount($map);
        $lists = model('remuneration')->getAll($map, $this->page_num, $this->page_limit); //return $lists;
        foreach ($lists as $key => $value) { //round(floatval($lists[$key]['salary']), 2)
            switch ($value['type']) {
                case 'zz':   
                 $lists[$key]['salary']  = $value['asset_info']['C'] + $value['asset_info']['D'] + $value['asset_info']['E'] + $value['asset_info']['F'] + $value['asset_info']['G'] + $value['asset_info']['H'] + $value['asset_info']['I']+ $value['asset_info']['J'] + $value['asset_info']['K']+ $value['asset_info']['L'] + $value['asset_info']['M'] + $value['asset_info']['N'] + $value['asset_info']['O']+ $value['asset_info']['P'] + $value['asset_info']['Q'];  //应发金额

                 
                     if($value['asset_info']['V']!==0){
                    $lists[$key]['accumulation'] = round(floatval(($value['asset_info']['C'] + $value['asset_info']['D']   + $value['asset_info']['E'] + $value['asset_info']['G'] + $value['asset_info']['H'] + $value['asset_info']['I'] + $value['asset_info']['J'] ) * 0.12)); //住房公积金
                }else{
                    $lists[$key]['accumulation'] = 0;
                }

                    //工会费
                    if($value['asset_info']['W'] !==0){
                    $lists[$key]['trade'] = round(floatval($value['asset_info']['C'] * 0.005));
                }else{
                    $lists[$key]['trade'] = 0;
                } 

                $lists[$key]['subtotal'] = $value['asset_info']['S'] + $value['asset_info']['T'] + $value['asset_info']['U'] +  $lists[$key]['accumulation'] + $lists[$key]['trade'] +   $value['asset_info']['X']; //个人应缴费用

                $lists[$key]['absenteeism'] = $lists[$key]['salary'] - $lists[$key]['subtotal'] - $value['asset_info']['Z'];//实发金额
                    break;
                case 'wc':
                    //应发工资
                    $lists[$key]['salary'] = $value['asset_info']['M'] + $value['asset_info']['L'] + $value['asset_info']['D'] + $value['asset_info']['C'];

                    //安全奖
                    $lists[$key]['safety'] = round(floatval($value['asset_info']['F'] * $value['asset_info']['G']),2);

                    //生产奖
                    $lists[$key]['production'] = $value['asset_info']['J'] + $value['asset_info']['I'] + $value['asset_info']['H'];
 
                    //住房公积金
                    $lists[$key]['accumulation'] = round(floatval($value['asset_info']['C'] * 0.12));

                    //工会费
                    $lists[$key]['trade'] = round(floatval($value['asset_info']['C'] * 0.005));

                    //个人应缴费用小计
                    $lists[$key]['subtotal'] = $value['asset_info']['T'] + $lists[$key]['accumulation'] + $value['asset_info']['Q'] + $value['asset_info']['O'];

                    //实发工资
                    $lists[$key]['absenteeism'] = round(floatval($lists[$key]['salary'] - $lists[$key]['subtotal']));

                    break;
                case 'nt':
                    //应发工资
                    $lists[$key]['salary'] = $value['asset_info']['F'] + $value['asset_info']['E'] + $value['asset_info']['D'] + $value['asset_info']['C'];

                    //住房公积金
                    $lists[$key]['accumulation'] = round(floatval(($value['asset_info']['F'] + $value['asset_info']['C']) * 0.12),2);

                    //工会费
                    $lists[$key]['trade'] = round(floatval($value['asset_info']['C'] * 0.005));

                    //个人应缴费用小计
                    $lists[$key]['subtotal'] = $lists[$key]['trade'] + $lists[$key]['accumulation'] + $value['asset_info']['H'] + $value['asset_info']['I'] + $value['asset_info']['J'];
                    //  //实发工资
                    $lists[$key]['absenteeism'] = $lists[$key]['salary'] - $lists[$key]['subtotal'];
                    break;
                case 'bt':
                    //应发工资
                    $lists[$key]['salary'] = $value['asset_info']['F'] + $value['asset_info']['E'] + $value['asset_info']['D'] + $value['asset_info']['C'];

                    //住房公积金
                    $lists[$key]['accumulation'] = round(floatval(($value['asset_info']['C'] + $value['asset_info']['F']) * 0.12));

                    //工会费
                    $lists[$key]['trade'] = round(floatval($value['asset_info']['C'] * 0.005));

                    //个人应缴费用小计
                    $lists[$key]['subtotal'] = $lists[$key]['trade'] + $lists[$key]['accumulation'] + $value['asset_info']['J'] + $value['asset_info']['H'] + $value['asset_info']['I'];

                    //实发工资
                    $lists[$key]['absenteeism'] = $lists[$key]['salary'] - $lists[$key]['subtotal']; 
                    break;
                default:
                    # code...
                    break;
            }
        }
        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    public function lists(Request $request)
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

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('user_accounts')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('remuneration')->getAllCount($map);
        $lists = model('remuneration')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    // -------------------------------------分割线----------------------------------
    public function reads(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 按年查询
                if ($key == 'mobile') {
                    $map['asset_info'] = ['like', '%' . $value . '%'];
                    unset($map['mobile']);
                }
            }
        }
        $lists              = model('remuneration')->getAll($map);
        $this->data['data'] = $lists;
        return $this->data;
    }
    public function liststxl(Request $request)
    {
        $map = $request->param();

        foreach ($map as $key => $value) {
            if ($value) {
                // 按年查询
                if ($key == 'nick_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }
        $position           = Db::table('work_custom_position')->select();
        // return $position;

        $lists=array();
        foreach ($position as $key => $value) {
            $map['department']=$position[$key]['position_name'];
            $lists[$position[$key]['position_name']]=model('users')->getAll($map);
               
        }
        // return $lists;
        // $lists= model('users')->getAll($map);
        $this->data['data']=$lists;
        return $this->data;
    }
    // -------------------------------------分割线----------------------------------
    /**
     * 【admin】新建薪资
     */
    public function save(Request $request)
    {
        $data        = $request->param();
        $data['aid'] = $this->unique_id;
        $validate    = Loader::validate('remuneration');
        if ($validate->scene('create')->check($data)) {
            $i = [
                'month' => $data['month'],
                'uid'   => $data['uid'],
                'year'  => $data['year'],
            ];

            if ($result = model('remuneration')->findOne($i)) {
                $this->data['code'] = 0;
                $this->data['msg']  = '该用户本月工资表已提交';
                return $this->data;
            } else {
                $result = model('remuneration')->addOne($data);
                if ($result['code']) {
                    $this->data['msg']  = '工资条成功';
                    $this->data['data'] = $result;
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }}
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【public】更新薪资
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'remuneration') {
            $data['id'] = $this->unique_id;
        }

        $data['aid'] = $this->unique_id;
        unset($data['mobile']);
        $validate = Loader::validate('remuneration');
        if ($validate->scene('update')->check($data)) {
            if (!empty($data['expiry_time'])) {
                $data['start_time'] = $data['expiry_time'][0];
                $data['end_time']   = $data['expiry_time'][1];
            }
            $result = model('remuneration')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新薪资成功';
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
     * 【admin】删除薪资(将薪资的账号全部置空)
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('remuneration')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除薪资成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除薪资
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('remuneration')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除薪资成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
    /**
     * 【admin】批量拉黑薪资
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('remuneration')->batchUpdate(['data_state' => 9], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拉黑薪资成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    // 批量导入数据
    public function lead(Request $request)
    {
        $data       = $request->post();
        $excel_pass = substr($data['excel_pass'], 1);
        import('app.api_extend.extend.importAndExport.import');
        $import     = new \import();
        $excel_info = $import->importExecl($excel_pass);
        switch ($data['type']) {
            case 'zz': 
                for ($i = 6; $i < count($excel_info); $i++) {
                    if (!$excel_info[$i]['B']) {
                        continue;
                    } 
                    $this->excel_emport($data['type'], $excel_info[1]['A'], $excel_info[3]['C'], $excel_info[3]['D'], $excel_info[6]['AC'], $excel_info[$i]);
                }

                break;
            case 'wc':
                for ($i = 6; $i < count($excel_info); $i++) {
                    if (!$excel_info[$i]['B']) {
                        continue;
                    }
                    $this->excel_emport($data['type'], $excel_info[1]['A'], $excel_info[3]['C'], $excel_info[3]['D'], $excel_info[5]['X'], $excel_info[$i]);
                }
                break;
            case 'nt':
                for ($i = 5; $i < count($excel_info); $i++) {
                    if (!$excel_info[$i]['B']) {
                        continue;
                    }
                    $this->excel_emport($data['type'], $excel_info[1]['A'], $excel_info[2]['C'], $excel_info[2]['D'], $excel_info[5]['P'], $excel_info[$i]);
                }
                break;
            case 'bt':
                for ($i = 6; $i < count($excel_info); $i++) {
                    if (!$excel_info[$i]['B']) {
                        continue;
                    }
                    $this->excel_emport($data['type'], $excel_info[1]['A'], $excel_info[3]['C'], $excel_info[3]['D'], $excel_info[5]['AC'], $excel_info[$i]);
                }
                break;
            default:
                # code...
                break;
        }

        $this->data['code'] = 0;
        $this->data['msg']  = '导入成功';
        return $this->data;
    }
    public function excel_emport($type, $station, $year, $month, $mobile, $asset_info)
    {  
        $data = [
            'type'        => $type,
            'station'     => $station,
            'year'        => $year,
            'month'       => $month,
            'mobile'      => $mobile,
            'asset_info'  => json_encode($asset_info),
            'create_time' => date('Y-m-d H:i:s', time()),
            'update_time' => date('Y-m-d H:i:s', time()),
        ];
        Db::name('remuneration')->insert($data);
    }

    // 根据登录用户的ID获取当前用户薪资
    public function pay(Request $request)
    {  
        $data = $request->param(); 
        $user = model('users')->findOne(['id' => $this->unique_id]);    
        $map  = [
            'asset_info' => ['like',  '%'.$user['mobile'] . '%'],
            'month'      => $data['month'],
            'year'       => $data['year'],
        ];   
 
        
        $lists = model('remuneration')->findOne($map);     //echo model('remuneration')->getLastSql();  exit();
        if (!empty($lists['type'])) {
            switch ($lists['type']) { 
                case 'zz':
                      $base = $lists['asset_info']['C']; // 基本工资 
                      $auxiliary = $lists['asset_info']['D'];//辅助工资
                      $station   = $lists['asset_info']['E'];//岗位津贴
                      $nation =  $lists['asset_info']['F'];//民族补贴 
                      $safety_award    = $lists['asset_info']['G'];//安全奖基数
                      $production = $lists['asset_info']['H'];//生产奖
                      $bonus = $lists['asset_info']['I'];// 奖金 1
                      $rest     = $lists['asset_info']['J'];//其他1
                      $sanitation = $lists['asset_info']['K']; //卫生费1
                      $birthday = $lists['asset_info']['L']; //生日慰问金1
                      $duty  = $lists['asset_info']['M']; //值班补助1
                      $punch = $lists['asset_info']['N']; //打卡费1
                      $annuity  = $lists['asset_info']['O']; //发电之星1
                      $generate = $lists['asset_info']['P']; //加班费1
                      $responsible = $lists['asset_info']['Q'];//加班加点包干工资
                      $provide = $lists['asset_info']['S']; //养老金 1
                      $enterprise = $lists['asset_info']['T']; //企业年金1
                      $medical = $lists['asset_info']['U']; //医保  
                      $labour = $lists['asset_info']['X']; //劳务费 
                      $system = $lists['asset_info']['Z'];//违反制度扣款
                      $should = $generate + $annuity + $punch + $duty + $birthday + $sanitation + $rest + $bonus + $production + $safety_award + $nation + $station + $auxiliary + $base + $responsible;//应发工资  
                      if($lists['asset_info']['W'] !== 0){
                      $labor_union  = round(floatval($lists['asset_info']['C'] * 0.005)); //工会费
                    }else {
                        $labor_union = 0;
                    } 
                    if($lists['asset_info']['V'] !==0){
                    $housing =round(floatval( ($base + $auxiliary + $station + $safety_award + $production + $bonus + $rest)*0.12));//住房公积金
                }else {
                    $housing = 0;
                }
                 
                    $personage =$provide +  $enterprise + $medical + $housing + $labor_union + $labour ;//个人应缴费用
                     
                    $real_hair =  $should - $personage; //实发工资
                $res = [
                       '基本工资' => $base, // 基本工资
                       '辅助工资'=>$auxiliary, //辅助工资
                       '岗位津贴'=>$station,//岗位津贴
                       '民族补贴 ' => $nation,//民族补贴 
                       '安全奖基数'=>$safety_award,//安全奖基数
                       '生产奖' => $production,//生产奖
                       '奖金'=>$bonus,// 奖金
                       '其他'   => $rest, //其他
                       '卫生费'=>$sanitation,//卫生费 
                       '生日慰问金'   => $birthday,//生日慰问金
                       '值班补助'    => $duty,//值班补助
                       '打卡费' => $punch,//打卡费
                       '发电之星'    => $annuity, //发电之星
                       '加班费' => $generate,//加班费
                       '加班加点包干工资' => $responsible, //加班加点包干工资
                       '养老金'   => $provide,//养老金
                       '企业年金'    => $enterprise,//企业年金
                       '医保' => $medical,//医保 
                       '住房公积金' => $housing,//住房公积金
                       '工会费'=> $labor_union,  //工会费
                       '劳务费'    => $labour, //劳务费 
                        '违反制度扣款'   => $system, //违反制度扣款
                       '个人应缴费用' => $personage,//个人应缴费用
                       '实发工资' => $real_hair,//实发工资
                       '应发工资'    => $should//应发工资
                ];
                    break;
                case 'wc': //round(floatval($goods_money), 2);
                $base = $lists['asset_info']['C']; // 基本工资
                $ethnic =  $lists['asset_info']['D'];//民族补贴
                $auxiliary = $lists['asset_info']['E'];//辅助工资
                $safety_award = $lists['asset_info']['F'];//安全奖系数
                $cardinal    = $lists['asset_info']['G'];//安全奖基数
                $medical   = $lists['asset_info']['Q']; //医疗保险
                $annuity   = $lists['asset_info']['O']; //养老金
                $sanitation = $lists['asset_info']['L']; //卫生费
                $labour   = $lists['asset_info']['T']; //劳务费 
                if($lists['asset_info']['S'] != 0){
                     $labor_union    = round(floatval($lists['asset_info']['C'] * 0.005)); //工会费
                  }else {
                      $labor_union = 0;
                  }
                  $safety = $safety_award * $cardinal; //安全奖 
                  $should =  $base ;//应发工资
                  if($lists['asset_info']['R'] !=0){
                    $housing = round(floatval($base*0.12));//住房公积金
                }else {
                    $housing = 0;
                }
                $personage =  $labour +  $annuity +   $medical + $housing;  //个人应缴费用
                $real_hair = $should - $personage;//实发工资
                    $res = [ 
                        '基本工资' => $base,
                        '民族补贴'=> $ethnic,
                        '辅助工资' => $auxiliary,
                        '安全奖系数'=> $safety_award,
                        '安全奖基数'   => $cardinal,
                        '医疗保险'  => $medical,
                        '养老金'   => $annuity,
                        '卫生费' => $sanitation,
                        '劳务费'   => $labour,
                        '工会费' => $labor_union,
                        '安全奖'    => $safety,
                        '住房公积金' => $housing,
                        '应发工资'   => $should,
                        '劳务费'    => $labour, //劳务费 
                        // '违反制度扣款'   => $system, //违反制度扣款
                    ];
                    
                    break;
                case 'bt':
                        $base = $lists['asset_info']['C']; // 基本工资
                        $subsidy = $lists['asset_info']['D']; //临时生活补贴
                        $sanitation = $lists['asset_info']['E']; //卫生费
                        $auxiliary  = $lists['asset_info']['F']; //辅助工资
                        $annuity   = $lists['asset_info']['H']; //养老金
                        $medical  = $lists['asset_info']['J']; //医疗保险
                        $enterprise =  $lists['asset_info']['I']; //企业年金(7-8)
                        if($lists['asset_info']['L'] != 0){
                            $labor_union  = round(floatval($lists['asset_info']['C'] * 0.005)); //工会费
                          }else {
                              $labor_union = 0;
                          }
                        $should  =  $auxiliary + $sanitation + $subsidy + $base;//应发工资
                        if($lists['asset_info']['K'] !=0){
                            $housing = round(floatval(($base + $auxiliary) *0.12));//住房公积金
                        }else {
                            $housing = 0;
                        }  
                        $personage = $annuity + $enterprise + $medical + $housing + $labor_union; // 个人应缴费用
                        $real_hair =  $should - $personage;//实发工资

                    $res = [        
                        '基本工资' => $base,
                        '临时生活补贴' => $subsidy,
                        '卫生费' => $sanitation,
                        '辅助工资' => $auxiliary,
                        '养老金'   => $annuity,
                        '医疗保险'  => $medical,
                        '企业年金(7-8)' => $enterprise,
                        '工会费' => $labor_union,
                        '住房公积金'    => $housing,
                        '应发工资'     => $should,
                        '个人应缴费用'  => $personage,
                        '实发工资'  => $real_hair, 
                    ];
                    break;
                case 'nt':
                    $base = $lists['asset_info']['C']; // 基本工资
                    $subsidy = $lists['asset_info']['D'];//临时生活补贴
                    $sanitation =  $lists['asset_info']['E']; //卫生费
                    $auxiliary  = $lists['asset_info']['F']; //辅助工资
                    $annuity    = $lists['asset_info']['H']; //养老金
                    $medical   = $lists['asset_info']['J']; //医疗保险
                    $enterprise =  $lists['asset_info']['I']; //企业年金    
                    if($lists['asset_info']['L'] !== 0){
                        $labor_union  = round(floatval($lists['asset_info']['C'] * 0.005));//工会费
                      }else {
                          $labor_union = 0;
                      } 
                    $should =  $auxiliary + $sanitation + $subsidy + $base;//应发工资
                    if($lists['asset_info']['K'] !==0){
                        $housing = round(floatval(($base + $auxiliary) *0.12));//住房公积金
                    }else {
                        $housing = 0;
                    }  
                    $personage = $annuity  +  $enterprise + $medical + $housing + $labor_union;// 个人应缴费用
                    $real_hair = $should - $personage;//实发工资
                    $res = [           
                        '基本工资' => $base,
                        '临时生活补贴' => $subsidy,
                        '卫生费'=> $sanitation,
                        '辅助工资'=> $auxiliary,
                        '养老金' => $annuity,
                        '医疗保险' => $medical,
                        '企业年金' => $enterprise,
                        '工会费' => $labor_union,
                        '住房公积金'   => $housing,
                        '应发工资'   => $should,
                        '个人应缴费用' => $personage,
                        '实发工资' => $real_hair,
                    ];
                    break;

            }

            $this->data['data'] = $res;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '该月无薪资';
        }
        return $this->data;
    }
}
