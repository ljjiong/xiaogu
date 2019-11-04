<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Goods extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部产品列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        echo $this->googleTran('早安');die();
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
            } else {
                unset($map[$key]);
            }
        }

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

    /**
     * 【public】查询单个产品详情
     */
    public function read($id)
    {
        $this->data['data'] = model('goods')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建产品
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('goods');
        if ($validate->scene('create')->check($data)) {

            $result = model('goods')->addOne($data);
            if ($result['code']) {
                $goods_id = $result['data']['id'];

                // 处理规格组合项
                $real_stock      = 0;
                $spec_group_info = isset($data['spec_group_info']) ? $data['spec_group_info'] : [];
                foreach ($spec_group_info as $key => $value) {
                    $spec_group_info[$key]['goods_id'] = $goods_id;
                    $spec_group_info[$key]['id_str']   = make_spec_group_id($goods_id, $value['spec_option_group']);
                    $real_stock += $value['stock'];
                }
                model('goods_spec_groups')->batchAdd($spec_group_info);
                // 更新真实库存
                if (count($spec_group_info) > 0) {
                    model('goods')->editOne(['id' => $goods_id, 'stock' => $real_stock]);
                }

                $this->data['test'] = $spec_group_info;
                $this->data['msg']  = '新增产品成功';
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
     * 【admin】更新产品
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('goods');
        if ($validate->scene('update')->check($data)) {

            $result = model('goods')->editOne($data);
            if ($result['code']) {
                $goods_id = $result['data']['id'];

                // 处理规格组合项
                $real_stock = 0;
                model('goods_spec_groups')->delAllTrueByGoodsId($goods_id);
                $spec_group_info = isset($data['spec_group_info']) ? $data['spec_group_info'] : [];
                foreach ($spec_group_info as $key => $value) {
                    unset($spec_group_info[$key]['id']);
                    $spec_group_info[$key]['goods_id'] = $goods_id;
                    $spec_group_info[$key]['id_str']   = make_spec_group_id($goods_id, $value['spec_option_group']);
                    $real_stock += $value['stock'];
                }
                model('goods_spec_groups')->batchAdd($spec_group_info);
                // 更新真实库存
                if (count($spec_group_info) > 0) {
                    model('goods')->editOne(['id' => $goods_id, 'stock' => $real_stock]);
                }

                $this->data['msg']  = '更新产品成功';
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
     * 【admin】删除产品
     */
    public function delete()
    {
        $id = input('id/d', 0);

        $result = model('goods')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除产品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除产品
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除产品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线产品
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线产品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线产品
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线产品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】查询全部产品列表
     */
    public function lists(Request $request)
    {
        $map = $request->param();

        if (isset($map['sort_by'])) {
            $sort_by = $map['sort_by'];
            unset($map['sort_by']);
        } else {
            $sort_by = 'all';
        }

        if (isset($map['sort_type'])) {
            $sort_type = $map['sort_type'];
            unset($map['sort_type']);
        } else {
            $sort_type = 'desc';
        }

        if (isset($map['system_type'])) {
            switch ($map['system_type']) {
                case 'drp':
                    import('app.api_extend.extend.drp.Drp');
                    $Drp       = new \Drp();
                    $drp_goods = $Drp->become_distributor_goods();
                    $map['id'] = ['in', $drp_goods];
                    break;
                case 'bonus':
                    import('app.api_extend.extend.drp.Bonus');
                    $Bonus       = new \Bonus();
                    $bonus_goods = $Bonus->become_bonus_goods();
                    $map['id']   = ['in', $bonus_goods];
                    break;
                default:
                    # code...
                    break;
            }

            unset($map['system_type']);
        }

        if (isset($map['keyword'])) {
            model('goods_keywords')->updateKeyword($map['keyword']);

            if ($this->token != '') {
                model('user_goods_keywords')->updateUserKeyword($this->token, $map['keyword']);
            }
        }

        if (isset($map['goods_cate_id'])) {
            $current_goods_cate_id = $map['goods_cate_id'];

            if ($current_goods_cate_id) {
                unset($map['goods_cate_id']);
                $child_2_cate_ids = model('goods_cates')->getColumn(['pid' => $current_goods_cate_id], 'id');

                $find_goods_cate_ids  = array_merge([$current_goods_cate_id], $child_2_cate_ids);
                $map['goods_cate_id'] = ['in', $find_goods_cate_ids];
            }
        }

        $map['status'] = 1;

        foreach ($map as $key => $value) {
            if ($value) {
                // 产品名称模糊查询
                if ($key == 'keyword') {
                    $map['name'] = ['like', '%' . $value . '%'];
                    unset($map['keyword']);
                }

                // 产品标签检索
                if ($key == 'tag') {
                    $map['tags'] = ['like', '%' . $value . '%'];
                    unset($map['tag']);
                }

                // 自定义产品标签检索
                if ($key == 'custom_tag') {
                    $tag_ids        = model('goods_tags')->getColumn(['name' => ['like', '%' . $value . '%']], 'id');
                    $find_goods_ids = [];
                    $all_goods      = model('goods')->getAll();
                    foreach ($all_goods as $k1 => $v1) {
                        foreach ($v1['tag_ids'] as $k2 => $tag_id) {
                            if (in_array($tag_id, $tag_ids) && !in_array($v1['id'], $find_goods_ids)) {
                                array_push($find_goods_ids, intval($v1['id']));
                            }
                        }
                    }
                    $map['id'] = ['in', $find_goods_ids];
                    unset($map['custom_tag']);
                }
            } else {
                unset($map[$key]);
            }
        }

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

    /**
     * 获取促销订单的产品信息
     */
    public function goods_info(Request $request)
    {
        $goods_id           = $request->post()['goods_id'];
        $data['goods_info'] = [];
        foreach ($goods_id as $key => $value) {
            array_push($data['goods_info'], model('goods')->getOneBasicInfo($value));
        }

        $this->data['data'] = $data;

        return $this->data;
    }

}
