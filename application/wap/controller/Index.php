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
use think\Request;

/**
 * 网站首页控制器
 * @author  YiYun <jianhaihao@gmail.com>
 */
class Index extends Controller
{
    

    public function inclued_head()
    {

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
        $map['status']=1;
        $goods = model('goods')->getAll($map, 1, 4, $sort_by, $sort_type);
        $this->assign('goods',$goods);
        $data = model('categories')->getAllTree();
        $tree = list_to_tree($data);
        for ( $i =0; $i< count($tree);$i++) {
           switch($tree[$i]['id'])
            {
                case 64:
                    $hxjs=$tree[$i];
                    break;
                case 40:
                    $xwzx=$tree[$i];
                    break;
                default:
                    break;
            }
           
        }
        $this->assign('hxjs',$hxjs);
        $this->assign('xwzx',$xwzx);
    }
    public function inclued_foot()
    {
        $data               = model('goods_cates')->getAllTree();
        $goods_tree= list_to_tree($data);
        $this->assign('cpzx',$goods_tree);
        
    }
    // public function __construct()
    // {
    //     $this->inclued_head();
    // }
    // 搜索项目
    public function index()
    {
        // $host = $_SERVER['HTTP_HOST'];
        
        $url  = $_SERVER["REQUEST_URI"];
        $url  = substr($url, -21);
        if ($url != "/wap/index/index.html") {
            echo "<script>location.href='/wap/index/index.html';</script>";
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
        $this->inclued_head();
        $this->inclued_foot();
        return view();
    }
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    public function aboutus()
    {
        $this->inclued_head();
        $this->inclued_foot();
        return view();
    }
    public function download()
    {
        return view();
    }
    public function aboutus_cn_2()
    {
        return view();
    }
    public function all_list(Request $request)
    {
        $map = $request->param();
        $data = model('categories')->getAllTree();
        $tree = list_to_tree($data);
        $trees = get_one_tree($tree, 64);
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
        if(!isset($map['type_id'])){
            $map['class_id'] = 1;
        }
        $map['status']=1;
        $column = model('articleshxjs')->getAll($map);
        $this->assign('trees',$trees);
        $this->assign('column',$column);
        $this->inclued_head();
        $this->inclued_foot();
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
        $this->inclued_head();
        $this->inclued_foot();
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
    public function product(Request $request)
    {
        $this->inclued_head();
        $this->inclued_foot();
        return view();
    }
    public function register_include()
    {
        return view();
    }
    public function solutions()
    {
        $this->inclued_head();
        $this->inclued_foot();
        return view();
    }
    public function alphalook(Request $request)
    {
        $map = $request->param();
        $dataList = model('goods')->getOne($map['id']);
        $this->assign('dataList',$dataList);
        $this->inclued_head();
        $this->inclued_foot();
        return view();
    }
}
