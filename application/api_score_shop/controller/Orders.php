<?php
namespace app\api_score_shop\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Orders extends Rest
{

    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index,export'],
        'checkUser'  => ['only' => 'lists'],
    ];

    /**
     * 【admin】查询全部积分商城订单列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 会员手机号模糊查询
                if ($key == 'user_mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['user_mobile']);
                }

                // 会员昵称模糊查询
                if ($key == 'nick_name') {
                    $user_ids       = model('users')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['nick_name']);
                }

                // 会员昵称模糊查询
                if ($key == 'order_no') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 会员昵称模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $map['type'] = 2;

        // 时间查询处理
        if(isset($map['begin_time']) && isset($map['end_time'])) {
            $map['create_time'] = [['>= time', $map['begin_time']], ['<= time', $map['end_time']], 'and'];
            unset($map['begin_time']);
            unset($map['end_time']);
        } else if(isset($map['begin_time'])) {
            $map['create_time'] = ['>= time', $map['begin_time']];
            unset($map['begin_time']);
        } else if(isset($map['end_time'])) {
            $map['create_time'] = ['<= time', $map['end_time']];
            unset($map['end_time']);
        }

        $count = model('orders')->getAllCount($map);
        $lists = model('orders')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个积分商城订单详情
     */
    public function read($id)
    {
        $this->data['data'] = model('orders')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】积分商城订单预览
     */
    public function view(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('order');
        if ($validate->scene('view')->check($data)) {

            $spec_group_id_str = isset($data['spec_group_id_str']) ? $data['spec_group_id_str'] : '';

            import('app.api_extend.extend.order.ScoreShop');
            $ScoreShop = new \ScoreShop();
            $result    = $ScoreShop->view($this->unique_id, $data['address_id'], $data['goods_id'], $data['num'], $spec_group_id_str);

            if ($result['code']) {
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
     * 【admin】新建积分商城订单
     */
    public function save(Request $request)
    {

        $data = $request->param();

        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('order');
        if ($validate->scene('create')->check($data)) {

            $memo              = isset($data['memo']) ? $data['memo'] : '';
            $spec_group_id_str = isset($data['spec_group_id_str']) ? $data['spec_group_id_str'] : '';

            import('app.api_extend.extend.order.ScoreShop');
            $ScoreShop = new \ScoreShop();
            $result    = $ScoreShop->create($this->unique_id, $data['address_id'], $data['goods_id'], $data['num'], $spec_group_id_str, $memo);

            // 写入积分商城订单
            if ($result['code']) {
                $this->data['msg']  = '创建订单成功';
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
     * 【admin】删除积分商城订单
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('orders')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除积分商城订单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除积分商城订单
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('orders')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除积分商城订单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】会员全部积分商城订单列表
     */
    public function lists(Request $request)
    {
        $map            = $request->param();
        $map['user_id'] = $this->unique_id;

        if (isset($map['is_comment'])) {
            if ($map['is_comment'] == 0) {
                $map['is_all_return_goods'] = 0;
            }
        }

        $map['type'] = 2;

        $count = model('orders')->getAllCount($map);
        $lists = model('orders')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【user】导出订单
     */
    public function export(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 会员手机号模糊查询
                if ($key == 'user_mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['user_mobile']);
                }

                // 会员昵称模糊查询
                if ($key == 'nick_name') {
                    $user_ids       = model('users')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['nick_name']);
                }

                // 会员昵称模糊查询
                if ($key == 'order_no') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 会员昵称模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $map['type'] = 2;

        // 时间查询处理
        if(isset($map['begin_time']) && isset($map['end_time'])) {
            $map['create_time'] = [['>= time', $map['begin_time']], ['<= time', $map['end_time']], 'and'];
            unset($map['begin_time']);
            unset($map['end_time']);
        } else if(isset($map['begin_time'])) {
            $map['create_time'] = ['>= time', $map['begin_time']];
            unset($map['begin_time']);
        } else if(isset($map['end_time'])) {
            $map['create_time'] = ['<= time', $map['end_time']];
            unset($map['end_time']);
        }

        $lists = model('orders')->getAll($map);

        import('app.api_extend.extend.importAndExport.export');

        $export_data = [];
        foreach ($lists as $key => $val) {
            $user = model('users')->getOne($val['user_id']);

            if ($val['pay_type'] == 1) {
                $pay_type = '支付宝';
            } elseif ($val['pay_type'] == 2) {
                $pay_type = '微信';
            } elseif ($val['pay_type'] == 3) {
                $pay_type = '钱包';
            } else {
                $pay_type = '';
            }

            if ($val['status'] == 1) {
                $status = '待付款';
            } elseif ($val['status'] == 2) {
                $status = '已付款待发货';
            } elseif ($val['status'] == 3) {
                $status = '已发货待收货';
            } elseif ($val['status'] == 4) {
                $status = '已收货';
            } elseif ($val['status'] == 9) {
                $status = '已取消';
            } else {
                $status = '';
            }

            $export_data[] = [
                'key'                  => $key + 1,
                'order_no'             => $val['order_no'],
                'user_mobile'          => $user['mobile'],
                'user_nick_name'       => $user['nick_name'],
                'express_type'         => $val['express_type'],
                'express_no'           => $val['express_no'],
                'address'              => $val['province'] . $val['city'] . $val['area'] . $val['address'],
                'goods_money'          => $val['goods_money'],
                'freight_money'        => $val['freight_money'],
                'total_money'          => $val['total_money'],
                'total_score'          => $val['total_score'],
                'pay_type'             => $pay_type,
                'status'               => $status,
                'is_has_return_goods'  => ($val['is_has_return_goods'] == 0 ? '否' : '是'),
                'is_deal_return_goods' => ($val['is_deal_return_goods'] == 0 ? '否' : '是'),
                'return_goods_money'   => $val['return_goods_money'],
                'create_time'          => $val['create_time'],
            ];
        }

        import('app.api_extend.extend.importAndExport.export');
        $arr = [
            '序号',
            '订单号',
            '下单会员手机号',
            '下单会员昵称',
            '快递方式',
            '快递单号',
            '收货地址',
            '商品金额',
            '运费金额',
            '订单总金额',
            '订单总积分',
            '支付方式',
            '订单状态',
            '是否含有退货',
            '是否处理完退货',
            '退货金额',
            '下单时间',
        ];
        $title  = uniqid();
        $export = new \export();
        $result = $export->exportExcel($arr, $export_data, $title, $savepeth = './excel/');

        $this->data['data'] = get_host() . '/excel/' . $title . '.xlsx';
        $this->data['msg']  = '导出文件成功';

        return $this->data;
    }

    // /**
    //  * 【user】导出积分商城订单
    //  */
    // public function export(Request $request)
    // {
    //     // $map = $request->param();

    //     // $count = model('orders')->getAllCount($map);
    //     // $lists = model('orders')->getAll($map, $this->page_num, $this->page_limit);

    //     import('app.api_extend.extend.importAndExport.export');

    //     $arr = [
    //         'title',
    //         'name',
    //     ];

    //     $lists = [
    //         [1, 2],
    //         [3, 4],
    //     ];

    //     $title = 'test';

    //     $export = new \export();
    //     $result = $export->order($arr, $lists, $title);

    //     // return $this->data;
    // }

    // /**
    //  * 【user】导出积分商城订单
    //  */
    // public function import(Request $request)
    // {

    //     import('app.api_extend.extend.importAndExport.import');

    //     $import = new \import();
    //     $result = $import->importExecl($file = './test.xlsx');

    //     return $result;
    // }

}
