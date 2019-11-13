<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Articlesweb extends Rest
{
    protected $beforeActionList = [
        // 'checkClientType',
        // 'checkAuth',
        // 'checkToken' => ['except' => 'read,lists'],
        // 'checkAdmin' => ['except' => 'read,lists'],
    ];

/*
     * 【admin】查询一个分类树（tree）
     * */
    public function read_tree($id)
    {
        $data = model('categories')->getAllTree();
        $tree = list_to_tree($data);

        $this->data['data'] = get_one_tree($tree, $id);

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
        $lists = model('download_file')->getAll($map);

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
                    $map[$key] =  $value ;
                }
            } else {
                unset($map[$key]);
            }
        }

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

        $count = model('articles')->getAllCount($map);
        $lists = model('articles')->getAll($map);

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
            } else {
                unset($map[$key]);
            }
        }

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

}
