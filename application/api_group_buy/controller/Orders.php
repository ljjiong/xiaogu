<?php
namespace app\api_group_buy\controller;

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
     * 【admin】查询全部团购活动订单列表
     */
    public function index(Request $request)
    {
        $this->deal_group_buy_limit();

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

                // 状态查询
                if ($key == 'status') {
                    switch ($value) {
                        case 1:
                            # 待付款
                            $map['status'] = 1;
                            break;
                        case 2:
                            # 拼团中
                            $map['status']           = 2;
                            $map['group_buy_status'] = 1;
                            break;
                        case 3:
                            # 拼团失败（退款中）
                            $map['status']           = 2;
                            $map['group_buy_status'] = ['in', '2,4'];
                            break;
                        case 4:
                            # 拼团失败（已退款）
                            $map['status']           = 2;
                            $map['group_buy_status'] = 5;
                            break;
                        case 5:
                            # 待发货
                            $map['status']           = 2;
                            $map['group_buy_status'] = 3;
                            break;
                        case 6:
                            # 待签收
                            $map['status']           = 3;
                            $map['group_buy_status'] = 3;
                            break;
                        case 7:
                            # 已完成
                            $map['status']           = 4;
                            $map['group_buy_status'] = 3;
                        case 9:
                            # 已取消
                            $map['status'] = 9;
                            break;
                        default:
                            unset($map[$key]);
                            break;
                    }

                }
            } else {
                unset($map[$key]);
            }
        }

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
     * 【public】查询单个团购活动订单详情
     */
    public function read($id)
    {
        $this->deal_group_buy_limit();

        $this->data['data'] = model('orders')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】团购活动订单预览
     */
    public function view(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('order');
        if ($validate->scene('view')->check($data)) {

            $spec_group_id_str = isset($data['spec_group_id_str']) ? $data['spec_group_id_str'] : '';

            import('app.api_extend.extend.order.GroupBuy');
            $GroupBuy = new \GroupBuy();
            $result   = $GroupBuy->view($this->unique_id, $data['address_id'], $data['goods_id'], $data['num'], $spec_group_id_str);

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
     * 【admin】新建团购活动订单
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

            import('app.api_extend.extend.order.GroupBuy');
            $GroupBuy = new \GroupBuy();
            $result   = $GroupBuy->create($this->unique_id, $data['address_id'], $data['goods_id'], $data['num'], $spec_group_id_str, $memo);

            // 写入团购活动订单
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
     * 【admin】会员拼团入团
     */
    public function join(Request $request)
    {

        $data = $request->param();

        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('order');
        if ($validate->scene('join')->check($data)) {

            $memo              = isset($data['memo']) ? $data['memo'] : '';
            $spec_group_id_str = isset($data['spec_group_id_str']) ? $data['spec_group_id_str'] : '';

            import('app.api_extend.extend.order.GroupBuy');
            $GroupBuy = new \GroupBuy();
            $result   = $GroupBuy->join($data['order_pid'], $this->unique_id, $data['address_id'], $data['goods_id'], $data['num'], $spec_group_id_str, $memo);

            // 写入团购活动订单
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
     * 【admin】删除团购活动订单
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('orders')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除团购活动订单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除团购活动订单
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('orders')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除团购活动订单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】会员全部团购活动订单列表
     */
    public function lists(Request $request)
    {
        $this->deal_group_buy_limit();

        $map            = $request->param();
        $map['user_id'] = $this->unique_id;

        if (isset($map['is_comment'])) {
            if ($map['is_comment'] == 0) {
                $map['is_all_return_goods'] = 0;
            }
        }

        if (isset($map['status'])) {
            switch ($map['status']) {
                case 1:
                    # 待付款
                    $map['status'] = 1;
                    break;
                case 2:
                    # 拼团中
                    $map['status']           = 2;
                    $map['group_buy_status'] = 1;
                    break;
                case 3:
                    # 待发货
                    $map['status']           = 2;
                    $map['group_buy_status'] = 3;
                    break;
                case 4:
                    # 待收货
                    $map['status']           = 3;
                    $map['group_buy_status'] = 3;
                    break;
                default:
                    unset($map['status']);
                    break;
            }

        }

        $map['type'] = ['in', '3,4'];

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

    // 处理拼团时限
    private function deal_group_buy_limit()
    {
        import('app.api_extend.extend.order.GroupBuy');
        $GroupBuy = new \GroupBuy();
        $GroupBuy->deal_group_buy_limit();
        $GroupBuy->deal_group_buy_return_money();
    }

    /**
     * 【user】导出订单
     */
    public function export(Request $request)
    {
        $this->deal_group_buy_limit();

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

                // 状态查询
                if ($key == 'status') {
                    switch ($value) {
                        case 1:
                            # 待付款
                            $map['status'] = 1;
                            break;
                        case 2:
                            # 拼团中
                            $map['status']           = 2;
                            $map['group_buy_status'] = 1;
                            break;
                        case 3:
                            # 拼团失败（退款中）
                            $map['status']           = 2;
                            $map['group_buy_status'] = ['in', '2,4'];
                            break;
                        case 4:
                            # 拼团失败（已退款）
                            $map['status']           = 2;
                            $map['group_buy_status'] = 5;
                            break;
                        case 5:
                            # 待发货
                            $map['status']           = 2;
                            $map['group_buy_status'] = 3;
                            break;
                        case 6:
                            # 待签收
                            $map['status']           = 3;
                            $map['group_buy_status'] = 3;
                            break;
                        case 7:
                            # 已完成
                            $map['status']           = 4;
                            $map['group_buy_status'] = 3;
                        case 9:
                            # 已取消
                            $map['status'] = 9;
                            break;
                        default:
                            unset($map[$key]);
                            break;
                    }
                }
            } else {
                unset($map[$key]);
            }
        }

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

            if ($val['group_buy_status'] == 1) {
                $group_buy_status = '等待拼团';
            } elseif ($val['group_buy_status'] == 2) {
                $group_buy_status = '限时拼团失败';
            } elseif ($val['group_buy_status'] == 3) {
                $group_buy_status = '拼团成功';
            } elseif ($val['group_buy_status'] == 4) {
                $group_buy_status = '拼团失败（退款中）';
            } elseif ($val['group_buy_status'] == 5) {
                $group_buy_status = '拼团失败（已退款）';
            } else {
                $group_buy_status = '';
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
                'pay_type'             => $pay_type,
                'status'               => $status,
                'group_buy_status'     => $group_buy_status,
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
            '支付方式',
            '订单状态',
            '拼团状态',
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
    //  * 【user】导出团购活动订单
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
    //  * 【user】导出团购活动订单
    //  */
    // public function import(Request $request)
    // {

    //     import('app.api_extend.extend.importAndExport.import');

    //     $import = new \import();
    //     $result = $import->importExecl($file = './test.xlsx');

    //     return $result;
    // }

}
