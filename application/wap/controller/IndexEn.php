<?php
// +----------------------------------------------------------------------
// | Minishop [ Easy to handle for Micro businesses ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.qasl.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: YiYun <http://www.ixiaoquan.com>
// +----------------------------------------------------------------------

namespace app\wap\controller;

use think\Controller;

/**
 * 网站首页控制器
 * @author  YiYun <jianhaihao@gmail.com>
 */
class IndexEn extends Controller
{
    // 搜索项目
    public function index()
    {
        // // $host = $_SERVER['HTTP_HOST'];
        
        $url  = $_SERVER["REQUEST_URI"];
        $url  = substr($url, -24);
        if ($url != "/wap/index_en/index.html") {
            echo "<script>location.href='/wap/index_en/index.html';</script>";
        }
        $banners = model('banners')->getAll(['status'=>1], 1, 7);
        $articles_hxjs_3d=model('articleshxjs')->getAll(['class_id'=>1,'type_id'=>65,'status'=>1]);
        $articles_hxjs_2d=model('articleshxjs')->getAll(['class_id'=>1,'type_id'=>66,'status'=>1]);
        $commonality=model('commonality')->getAll(['type_id'=>57]);
        $goods_list=model('goods')->getAll(['status'=>1],1,4);
        
        $this->assign('award',$banners);
        $this->assign('articles_hxjs_2d',$articles_hxjs_2d);
        $this->assign('articles_hxjs_3d',$articles_hxjs_3d);
        $this->assign('commonality',$commonality);
        $this->assign('goods_list',$goods_list);

        return view();
    }
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    public function news()
    {
        return view();
    }
    public function download()
    {
        return view();
    }
    public function aboutus()
    {
        return view();
    }
    public function all_list()
    {
        return view();
    }
    public function cn_26()
    {
        return view();
    }
    public function cn_27()
    {
        return view();
    }
    public function cn_28()
    {
        return view();
    }
    public function cn_29()
    {
        return view();
    }
    public function cn_30()
    {
        return view();
    }
    public function cn_31_2()
    {
        return view();
    }
    public function cn_32()
    {
        return view();
    }
    public function cn_33()
    {
        return view();
    }
    public function cn_34()
    {
        return view();
    }
    public function contact_cn_2()
    {
        return view();
    }
    public function job()
    {
        return view();
    }
    public function list_2d_cn_2()
    {
        return view();
    }
    public function list_3d()
    {
        return view();
    }
    public function list_3_2_cn()
    {
        return view();
    }
    public function list_4_cn()
    {
        return view();
    }
    public function list_5_cn()
    {
        return view();
    }
    public function list_101_cn()
    {
        return view();
    }
    public function list_103_cn()
    {
        return view();
    }
    public function list_112_cn()
    {
        return view();
    }
    public function list_113_cn()
    {
        return view();
    }
    public function list_117_cn()
    {
        return view();
    }
    public function list_123_cn()
    {
        return view();
    }
    public function list_126_cn()
    {
        return view();
    }
    public function news_2()
    {
        return view();
    }
    public function partner_2()
    {
        return view();
    }
    public function partner()
    {
        return view();
    }
    public function privacy_cn_2()
    {
        return view();
    }
    public function product_2()
    {
        return view();
    }
    public function product_4()
    {
        return view();
    }
    public function product()
    {
        return view();
    }
    public function register_include()
    {
        return view();
    }
    public function solutions_2()
    {
        return view();
    }
    public function alphalook3d_cn()
    {
        return view();
    }
}
