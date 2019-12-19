<?php
// +----------------------------------------------------------------------
// | Minishop [ Easy to handle for Micro businesses ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.qasl.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: YiYun <http://www.ixiaoquan.com>
// +----------------------------------------------------------------------

namespace app\home\controller;

use think\Controller;
use think\Request;

/**
 * 网站首页控制器
 * @author  YiYun <jianhaihao@gmail.com>
 */
class En extends Controller
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
    // 搜索项目
    public function index()
    {
        // // $host = $_SERVER['HTTP_HOST'];
        
        $url  = $_SERVER["REQUEST_URI"];
        $url  = substr($url, -20);
        if ($url != "/home/en/index.html") {
            echo "<script>location.href='/home/en/index.html';</script>";
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
    
    public function login()
    {
        return view();
    }
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    public function aboutus(Request $request)
    {
        $this->inclued_head();
        $this->inclued_foot();
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 类别模糊查询
                if ($key == 'id') {
                    $map['type_id'] =  $value ;
                    unset($map[$key]);
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['status']=1;
        // $count = model('articles_single')->getAllCount($map);
        $articles_single = model('articles_single')->findOne($map);
        $trees=$this->read_tree(43);
        $this->assign('trees',$trees);
        $this->assign('articles_single',$articles_single);
        return view();
    }
    public function download()
    {
        $this->inclued_head();
        $this->inclued_foot();
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
    public function read_tree($id)
    {
        $data = model('categories')->getAllTree();
        $tree = list_to_tree($data);
        return get_one_tree($tree, $id);
    }
    public function news_list()
    {
        $this->inclued_head();
        $this->inclued_foot();
        return view();
    }
    public function news(Request $request)
    {
        $this->inclued_head();
        $this->inclued_foot();
        $map = $request->param();
        $articles_read = model('articles')->getOne($map['id']);
        $this->assign('articles_read',$articles_read);
        return view();
    }
    public function partner_2()
    {
        return view();
    }
    public function partner()
    {
        $this->inclued_head();
        $this->inclued_foot();
        $core = model('partner')->getAll(['status'=>1,'type_id'=>49]);
        $strategy = model('partner')->getAll(['status'=>1,'type_id'=>50]);
        $algorithm = model('partner')->getAll(['status'=>1,'type_id'=>['in',[60,61,62,63]]]);
        $this->assign('core', $core);
        $this->assign('strategy', $strategy);
        $this->assign('algorithm', $algorithm);
        return view('partner_2');
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
    public function products(Request $request)
    {
        $map = $request->param();
        $dataList = model('goods')->getOne($map['id']);
        $this->assign('dataList',$dataList);
        $this->inclued_head();
        $this->inclued_foot();
        return view();
    }
}
