<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserDrawcashs extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index,not_agree,batch_not_agree,agree,batch_agree'],
    ];

    /**
     * 【admin】查询全部会员提现
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['mobile']);
                }

                // 会员昵称模糊查询
                if ($key == 'nick_name') {
                    $user_ids       = model('users')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['nick_name']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('user_drawcashs')->getAllCount($map);
        $lists = model('user_drawcashs')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员提现
     */
    public function read($id)
    {
        $this->data['data'] = model('user_drawcashs')->getOne($id);

        return $this->data;
    }

    /**
     * 【address】新建会员提现
     */
    public function save(Request $request)
    {
        $data               = $request->param();
        $data['user_id']    = $this->unique_id;
        $data['account_id'] = $this->account_id;

        $validate = Loader::validate('user_drawcash');
        if ($validate->scene('create')->check($data)) {

            $result = model('user_drawcashs')->addOne($data);
            if ($result['code']) {
                model('user_assets')->applyDrawcash($result['data']['id']);

                $this->data['msg']  = '提现申请成功';
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
     * 【address】新建会员提现 （指纹确认）
     */
    public function touch_id_save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('user_drawcash');
        if ($validate->scene('touch_id')->check($data)) {

            $result = model('user_drawcashs')->addOne($data);
            if ($result['code']) {
                model('user_assets')->applyDrawcash($result['data']['id']);

                $this->data['msg']  = '提现申请成功';
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
     * 【public】更新会员提现
     */
    public function update(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('user_drawcash');
        if ($validate->scene('update')->check($data)) {

            $result = model('user_drawcashs')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员提现成功';
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
     * 【admin】删除会员提现
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('user_drawcashs')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员提现成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员提现
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('user_drawcashs')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员提现成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】拒绝提现
     */
    public function not_agree()
    {
        $id            = input('id/d', 0);
        $user_drawcash = model('user_drawcashs')->getOne($id);
        if ($user_drawcash) {
            if ($user_drawcash['status'] !== 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前提现申请已处理';
                return $this->data;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '提现数据不存在';
            return $this->data;
        }

        $result = model('user_drawcashs')->editOne(['id' => $id, 'status' => 2]);
        if ($result['code']) {
            model('user_assets')->notAgreeDrawcash($id);

            $this->data['msg'] = '拒绝提现成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    // /**
    //  * 【user】批量拒绝提现
    //  */
    // public function batch_not_agree(Request $request)
    // {
    //     if (1 != self::check_power(2)) {
    //         return $this->data;
    //     }

    //     if ($this->account_type != 'admin') {
    //         $this->data['code'] = 400100;
    //         $this->data['msg']  = '非法操作';
    //         return $this->data;
    //     }

    //     $ids = $request->param()['id'];
    //     // 校验权限
    //     foreach ($ids as $id) {
    //         // 校验删除权限
    //         $data = model('user_drawcashs')->getOne($id);
    //         if ($data['status'] !== 1) {
    //             $this->data['code'] = 0;
    //             $this->data['msg']  = 'ID为' . $id . '的数据已处理';
    //             return $this->data;
    //             break;
    //         }
    //     }

    //     $result = model('user_drawcashs')->batchUpdate(['status' => 2], $ids);
    //     if ($result['code']) {

    //         // 拒绝提现后返还资金
    //         $update_asset_data     = [];
    //         $update_asset_log_data = [];
    //         foreach ($ids as $id) {
    //             $user_drawcash = model('user_drawcashs')->getOne($id);
    //             $user_asset    = model('user_assets')->findOne(['user_id' => $user_drawcash['user_id']]);

    //             if ($user_drawcash['asset_type'] == 'money') {
    //                 $update_asset_data[] = [
    //                     'id'    => $user_asset['id'],
    //                     'money' => $user_asset['money'] + $user_drawcash['money'],
    //                 ];

    //                 $update_asset_log_data[] = [
    //                     'user_id'      => $user_drawcash['user_id'],
    //                     'asset_type'   => 'money',
    //                     'change_type'  => 'user_drawcash_not_agree',
    //                     'change_money' => $user_drawcash['money'],
    //                     'intro'        => '管理员拒绝提现，资金返还',
    //                     'desc'         => '管理员拒绝提现，系统自动返还提现资金',
    //                 ];
    //             }
    //         }
    //         model('user_assets')->batchEdit($update_asset_data);
    //         model('user_asset_logs')->batchAdd($update_asset_log_data);

    //         $this->data['msg'] = '拒绝提现成功';
    //     } else {
    //         $this->data['code'] = 0;
    //         $this->data['msg']  = $result['msg'];
    //     }

    //     return $this->data;
    // }

    /**
     * 【user】同意提现
     */
    public function agree()
    {
        $id            = input('id/d', 0);
        $user_drawcash = model('user_drawcashs')->getOne($id);
        if ($user_drawcash) {
            if ($user_drawcash['status'] !== 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前提现申请已处理';
                return $this->data;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '提现数据不存在';
            return $this->data;
        }

        if ($user_drawcash['type'] == 'withdrawToBankCard') {
            $data = [
                'id'     => $id,
                'status' => 3,
                'is_pay' => 1,
            ];
        } else {
            $data = [
                'id'     => $id,
                'status' => 3,
            ];
        }
        $result = model('user_drawcashs')->editOne($data);
        if ($result['code']) {
            $this->data['msg'] = '同意提现成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    // /**
    //  * 【user】批量同意提现
    //  */
    // public function batch_agree(Request $request)
    // {
    //     $ids = $request->param()['id'];
    //     // 校验权限
    //     foreach ($ids as $id) {
    //         // 校验删除权限
    //         $data = model('user_drawcashs')->getOne($id);
    //         if ($data['status'] !== 1) {
    //             $this->data['code'] = 0;
    //             $this->data['msg']  = 'ID为' . $id . '的数据已处理';
    //             return $this->data;
    //             break;
    //         }
    //     }

    //     $result = model('user_drawcashs')->batchUpdate(['status' => 3], $ids);
    //     if ($result['code']) {
    //         $this->data['msg'] = '批量同意提现成功';
    //     } else {
    //         $this->data['code'] = 0;
    //         $this->data['msg']  = $result['msg'];
    //     }

    //     return $this->data;
    // }

    /**
     * 【user】第三方打款
     */
    public function pay()
    {
        $id            = input('id/d', 0);
        $user_drawcash = model('user_drawcashs')->getOne($id);
        if ($user_drawcash) {
            if ($user_drawcash['status'] !== 3) {
                $this->data['code'] = 0;
                $this->data['msg']  = '状态错误，暂不可打款';
                return $this->data;
            }

            if ($user_drawcash['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '已打款';
                return $this->data;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '提现数据不存在';
            return $this->data;
        }

        switch ($user_drawcash['type']) {
            case 'withdrawToWx':
                // 打款到微信
                $user               = model('users')->getOne($user_drawcash['user_id']);
                $user_third_account = model('user_third_accounts')->findOne(['user_id' => $user_drawcash['user_id'], 'type' => 'wechat']);
                if ($user_third_account) {
                    // 获取ip
                    $request = Request::instance();
                    $ip      = $request->ip();

                    import('app.api_extend.extend.wechat.WechatPay');
                    $wechat_pay = new \WechatPay();
                    $result     = $wechat_pay->org_pay($user_third_account['client_type'], $ip, $user_drawcash['apply_no'], $user_third_account['account'], $user_drawcash['money'], $user['mobile'], '会员提现打款');
                    if (!$result['code']) {
                        $this->data['code'] = 0;
                        $this->data['msg']  = '【打款失败】' . $result['msg'];
                        return $this->data;
                    }
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '【打款失败】会员暂未绑定微信收款账号';
                    return $this->data;
                }
                break;
            case 'withdrawToAli':
                // 打款到支付宝
                $user               = model('users')->getOne($user_drawcash['user_id']);
                $user_third_account = model('user_third_accounts')->findOne(['user_id' => $user_drawcash['user_id'], 'type' => 'ali']);
                if ($user_third_account) {
                    import('app.api_extend.extend.ali.AliPay');
                    $ali_pay = new \AliPay();
                    $result  = $ali_pay->org_pay($user_drawcash['apply_no'], $user_third_account['account'], $user_drawcash['money'], $user_third_account['name'], '会员提现打款');
                    if (!$result['code']) {
                        $this->data['code'] = 0;
                        $this->data['msg']  = '【打款失败】' . $result['msg'];
                        return $this->data;
                    }
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '【打款失败】会员暂未绑定支付宝收款账号';
                    return $this->data;
                }
                break;
            default:
                $this->data['code'] = 0;
                $this->data['msg']  = '【打款失败】收款类别值非法';
                return $this->data;
                break;
        }

        $result = model('user_drawcashs')->editOne(['id' => $id, 'is_pay' => 1]);
        if ($result['code']) {
            $this->data['msg'] = '打款成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
