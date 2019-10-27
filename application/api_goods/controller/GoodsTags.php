<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GoodsTags extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'save,update,delete,batch_delete'],
        'checkAdmin' => ['only' => 'save,update,delete,batch_delete'],
    ];

    /**
     * 【admin】查询全部商品标签列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 商品标签名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods_tags')->getAllCount($map);
        $lists = model('goods_tags')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个商品标签详情
     */
    public function read($id)
    {
        $this->data['data'] = model('goods_tags')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建商品标签
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('goods_tag');
        if ($validate->scene('create')->check($data)) {

            $result = model('goods_tags')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增商品标签成功';
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
     * 【admin】更新商品标签
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('goods_tag');
        if ($validate->scene('update')->check($data)) {

            $result = model('goods_tags')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新商品标签成功';
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
     * 【admin】删除商品标签
     */
    public function delete()
    {
        $id = input('id/d', 0);

        // 组合正在使用的商品标签
        $goods_tags     = model('goods')->getColumn([], 'tag_ids');
        $use_goods_tags = [];
        foreach ($goods_tags as $key => $value) {
            $str = str_replace('[', '', $value);
            $str = str_replace(']', '', $str);
            $tag = explode(',', $str);
            foreach ($tag as $k => $v) {
                if ($v && !in_array($v, $use_goods_tags)) {
                    array_push($use_goods_tags, intval($v));
                }
            }
        }
        if (in_array($id, $use_goods_tags)) {
            $this->data['code'] = 0;
            $this->data['msg']  = '存在商品使用该标签, 不可删除';
            return $this->data;
        }

        $result = model('goods_tags')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除商品标签成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除商品标签
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];
        
        // 组合正在使用的商品标签
        $goods_tags     = model('goods')->getColumn([], 'tag_ids');
        $use_goods_tags = [];
        foreach ($goods_tags as $key => $value) {
            $str = str_replace('[', '', $value);
            $str = str_replace(']', '', $str);
            $tag = explode(',', $str);
            foreach ($tag as $k => $v) {
                if ($v && !in_array($v, $use_goods_tags)) {
                    array_push($use_goods_tags, intval($v));
                }
            }
        }

        foreach ($ids as $id) {
            if (in_array($id, $use_goods_tags)) {
                $this->data['code'] = 0;
                $this->data['msg']  = 'ID为' . $id . '的商品标签下含有商品, 不可删除';
                return $this->data;
                break;
            }
        }

        $result = model('goods_tags')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除商品标签成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
