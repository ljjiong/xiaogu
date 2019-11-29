<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;
use phpmailer\PHPMailer;

class Articlesweb extends Rest
{
    protected $beforeActionList = [
        // 'checkClientType',
        // 'checkAuth',
        // 'checkToken' => ['except' => 'read,lists'],
        // 'checkAdmin' => ['except' => 'read,lists'],
    ];
    //登录
    public function login(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('login');
        if ($validate->check($data)) {

            $guid = $data['mobile'];

            // ==============下发授权token-BEGIN======================
            // $result = model('user_tokens')->addOneByGuid($guid, $this->client_type);
            // if ($result['code']) {
            //     $token = $result['data'];
            // } else {
            //     $this->data['code'] = 0;
            //     $this->data['msg']  = $result['msg'];
            //     return $this->data;
            // }
            // ==============下发授权token-END========================

            // ==============登录日志-BEGIN======================
            $result = model('user_visit_logs')->addOneByGuid($guid, $this->client_type, Request::instance()->ip());
            if (!$result['code']) {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
                return $this->data;
            }
            // ==============登录日志-END========================

            $user                        = model('users')->getOneByGuid($guid);
            $user['guid']                = $guid;
            $this->data['msg']           = '登录成功';
            // $this->data['data']['token'] = $token;
            $this->data['data']  = $user;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
    //注册
    public function register(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('register');
        if ($validate->check($data)) {
            // 注册会员
            $user_data = [
                'mobile'    => $data['mobile'],
                'role_ids'  => isset($data['role_ids']) ? array_unique($data['role_ids']) : [1],
                'avatar'    => isset($data['avatar']) ? $data['avatar'] : '',
                'nick_name' => isset($data['nick_name']) ? $data['nick_name'] : '',
            ];

            $result = model('users')->addOne($user_data);
            if ($result['code']) {
                $user = $result['data'];

                // if (isset($data['real_openid'])) {
                //     if ($data['real_openid']) {
                //         $find_map = [
                //             'client_type' => $this->client_type,
                //             'user_type'   => 'user',
                //             'user_id'     => $user['id'],
                //             'type'        => 'wechat',
                //             'name'        => 'openid',
                //         ];
                //         $user_third_account = model('user_third_accounts')->findOne($find_map);
                //         if (!$user_third_account) {
                //             $find_map['account'] = $data['real_openid'];
                //             model('user_third_accounts')->addOne($find_map);
                //         }
                //     }
                // }

                $account_data = [
                    'guid'          => $data['mobile'],
                    'password'      => wancll_md5($data['password']),
                    'user_id'       => $user['id'],
                    'qq_openid'     => isset($data['qq_openid']) ? $data['qq_openid'] : '',
                    'wechat_openid' => isset($data['wechat_openid']) ? $data['wechat_openid'] : '',
                ];
                $result = model('user_accounts')->addOne($account_data);
                if ($result['code']) {
                    // $this->login_info($result['data']['guid']);
                    $this->data['msg'] = '注册会员成功';
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
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
    public function good_tree(Request $request)
    {
        $data               = model('goods_cates')->getAllTree();
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }
    /*
     * 【admin】查询一个分类树（tree）
     * */
    public function read_tree(Request $request)
    {
        $map = $request->param();
        $data = model('categories')->getAllTree();
        $tree = list_to_tree($data);
        $this->data['data'] = get_one_tree($tree, $map['id']);
        return $this->data;
    }  
    public function tree(Request $request)
    {
        $map = $request->param();
        $data = model('categories')->getAllTree();
        $tree = list_to_tree($data);
        $this->data['data'] =$tree;
        // $this->data['data'] = get_one_tree($tree, $map['id']);
        return $this->data;
    }  
    public function tree_one(Request $request)
    {
        $map = $request->param();
        $this->data['data'] = model('categories')->getOne($map['id']);
        return $this->data;
    } 
    /**
     * 【web】查询全部售后
     */
    public function postsale_list(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 类别模糊查询
                if ($key == 'type_id') {
                    $map[$key] =  $value ;
                }


            } else {
                unset($map[$key]);
            }
        }
        $map['status']=1;
        $count = model('post_sale')->getAllCount($map);
        $lists = model('post_sale')->getAll($map);
        foreach ($lists as $key => $value) {
            switch ($value['type_id']) {
                case 1:
                    $lists[$key]['type_name'] ='电话';
                    break;
                case 2:
                    $lists[$key]['type_name'] ='邮箱';
                    break;
                case 3:
                    $lists[$key]['type_name'] ='微信公众号';
                    break;    
                
                default:
                    $lists[$key]['type_name'] ='';
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
    /**
     * 【web】查询全部下载文件
     */
    public function download_list(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 文章类别模糊查询
                // if ($key == 'user_type') {
                //     //访客的权限为2时只能获取无限制的文件
                //     if($value==2){
                //         $map['down_permission']=0;
                //     }else{
                //         $map['down_permission']=['in',[$value,0]];
                //     } 
                    
                // }
                   // 类别模糊查询
                if ($key == 'type_id') {
                    $map[$key] =  $value ;
                }
            } else {
                unset($map[$key]);
            }
        }
        if(isset($map['user_type'])){
            //为访客的权限2时只能获取无限制的文件
            if($map['user_type']==2){
                $map['down_permission']=0;
            }else{
                $map['down_permission']=['in',[$map['user_type'],0]];
            } 
            unset($map['user_type']);
        }else{
            $map['down_permission']=0;
        }
        $map['status']=1;
        $count = model('download_file')->getAllCount($map);
        $lists = model('download_file')->getAll($map,$this->page_num,$this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    /**
     * 【web】查询全部合作伙伴
     */
    public function partner_list(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 类别模糊查询
                if ($key == 'type_id') {
                    $map[$key] = ['in',explode(',', $value)];
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['status']=1;
        $count = model('partner')->getAllCount($map);
        $lists = model('partner')->getAll($map);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个文章详情
     */
    public function article_click_num(Request $request)
    {
        $data = $request->param();
        $data['data'] = model('articles')->getOne(@$data['id']);
        model('article')->update(['click_num'=>(int)$data['click_num']+1]);
    }

    /**
     * 【web】查询全部新闻
     */
    public function articles_list(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 类别模糊查询
                if ($key == 'type_id') {
                    $map[$key] =  $value ;
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['status']=1;
        $count = model('articles')->getAllCount($map);
        $lists = model('articles')->getAll($map,$this->page_num,$this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    /**
     * 【web】查询全部关于我们
     */
    public function articles_single_list(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 类别模糊查询
                if ($key == 'type_id') {
                    $map[$key] =  $value ;
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['status']=1;
        $count = model('articles_single')->getAllCount($map);
        $lists = model('articles_single')->getAll($map);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
      /**
     * 【web】查询全部核心技术
     */
    public function articles_hxjs_list(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                 // 类别模糊查询
                if ($key == 'type_id') {
                    $map[$key] =  $value ;
                }
                 // 类别模糊查询
                if ($key == 'class_id') {
                    $map[$key] =  $value ;
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['status']=1;
        $count = model('articleshxjs')->getAllCount($map);
        $lists = model('articleshxjs')->getAll($map);
        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];
        $this->data['data'] = $lists;
        return $this->data;
    }
    //解决方案
    public function commonality_list(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 类型
                if ($key == 'type_id') {
                    $map[$key] =  $value;
                }

                
            } else {
                unset($map[$key]);
            }
        }
        $map['status']=1;
        $count = model('commonality')->getAllCount($map);
        $lists = model('commonality')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    //产品列表
    public function goods_list(Request $request)
    {
        $map = $request->param();

        if (isset($map['sort_by'])) {
            $sort_by = $map['sort_by'];
            unset($map['sort_by']);
        } else {
            $sort_by = 'new_goods';
        }

        if (isset($map['sort_type'])) {
            $sort_type = $map['sort_type'];
            unset($map['sort_type']);
        } else {
            $sort_type = 'desc';
        }

        foreach ($map as $key => $value) {
            if ($value) {
                // 产品名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
                // 产品上线
                if ($key == 'status') {
                    $map[$key] =  $value;
                }
                if ($key == 'goods_cate_id') {
                    $map[$key] =  $value;
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['status']=1;
        $count = model('goods')->getAllCount($map);
        $lists = model('goods')->getAll($map, $this->page_num, $this->page_limit, $sort_by, $sort_type);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    //首页
    public function home_page()
    {
        $banners = model('banners')->getAll(['status'=>1], 1, 7);
        $articles_hxjs_3d=model('articleshxjs')->getAll(['class_id'=>1,'type_id'=>65,'status'=>1]);
        $articles_hxjs_2d=model('articleshxjs')->getAll(['class_id'=>1,'type_id'=>66,'status'=>1]);
        $articles_hxjs=[
            '3d'=>$articles_hxjs_3d,
            '2d'=>$articles_hxjs_2d
        ];
        $commonality=model('commonality')->getAll(['type_id'=>57]);
        $goods_list=model('goods')->getAll(['status'=>1],1,4);
        $lists=[
            'banners'=>$banners,
            'articles_hxjs'=>$articles_hxjs,
            'commonality'=>$commonality,
            'goods_xgcp'=>$goods_list
        ];
        $this->data['data'] = $lists;
        return $this->data;
    }

    //新闻资讯详情
    public function articles_read(Request $request)
    {
        $map = $request->param();
        $this->data['data'] = model('articles')->getOne($map['id']);
        return $this->data;
    }
    //产品详情
    public function goods_read(Request $request)
    {
        $map = $request->param();
        $this->data['data'] = model('goods')->getOne($map['id']);
        return $this->data;
    }




    //=============================================================================
    public function gettq()
    {
        $res=$this->https_request('https://free-api.heweather.net/s6/weather/now?location=CN101250101&key=6cd70502b7a748dbacba3e2f3ecae4b7');
        // echo $res;exit();
        $data       = json_decode($res, true);

        return  $data;
    }

    function https_request($url, $data = null)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        if (!empty($data)) {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($curl);
        curl_close($curl);
        return $output;
    }

    public function setemail()
    {
        $data=$this->gettq();
        // print_r($data['HeWeather6'][0]['now']);exit();
        $mail = new PHPMailer();
        $toemail = $_GET['toemail'];//收件人
        $mail->isSMTP();// 使用SMTP服务
        $mail->CharSet = "utf8";// 编码格式为utf8，不设置编码的话，中文会出现乱码
        $mail->Host = "smtp.163.com";// 发送方的SMTP服务器地址
        $mail->SMTPAuth = true;// 是否使用身份验证
        $mail->Username = "z15211057400@163.com";/// 发送方的163邮箱用户名，就是你申请163的SMTP服务使用的163邮箱
        $mail->Password = "8768540qq";// 发送方的邮箱密码，注意用163邮箱这里填写的是“客户端授权密码”而不是邮箱的登录密码！
        $mail->SMTPSecure = "ssl";// 使用ssl协议方式
        $mail->Port = 465;// 163邮箱的ssl协议方式端口号是465/994

        $mail->setFrom("z15211057400@163.com","亲爱的父亲");// 设置发件人信息，如邮件格式说明中的发件人，这里会显示为Mailer(xxxx@163.com），Mailer是当做名字显示
        $mail->addAddress($toemail,'Wang');// 设置收件人信息，如邮件格式说明中的收件人，这里会显示为Liang(yyyy@163.com)
        $mail->addReplyTo("z15211057400@163.com","Reply");// 设置回复人信息，指的是收件人收到邮件后，如果要回复，回复邮件将发送到的邮箱地址
        //$mail->addCC("xxx@163.com");// 设置邮件抄送人，可以只写地址，上述的设置也可以只写地址(这个人也能收到邮件)
        //$mail->addBCC("xxx@163.com");// 设置秘密抄送人(这个人也能收到邮件)
        //$mail->addAttachment("bug0.jpg");// 添加附件

        $mail->Subject = "儿啊，看下今天的天气";// 邮件标题

        // $num = rand(100000,999999);

        $mail->Body = "儿啊，今天天气：".$data['HeWeather6'][0]['now']['cond_txt'].",温度是".$data['HeWeather6'][0]['now']['tmp']."℃,刮的是".$data['HeWeather6'][0]['now']['wind_dir']."风，风速是".$data['HeWeather6'][0]['now']['wind_spd']."公里/小时,要注意防寒保暖哦！——————爱你的父亲";
        // 邮件正文
        //$mail->AltBody = "This is the plain text纯文本";// 这个是设置纯文本方式显示的正文内容，如果不支持Html方式，就会用到这个，基本无用

        if(!$mail->send()){// 发送邮件
            // echo "Message could not be sent.";
            // echo "Mailer Error: ".$mail->ErrorInfo;// 输出错误信息
            echo '失败';
        }else{
            echo '成功';  //成功
        }
    }

}
