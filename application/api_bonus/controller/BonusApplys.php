<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class BonusApplys extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read,save,lists'],
    ];

    /**
     * 【admin】查询全部分销商佣金提现列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 会员手机号模糊查询
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

        $count = model('bonus_applys', 'bonus_model')->getAllCount($map);
        $lists = model('bonus_applys', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个分销商佣金提现详情
     */
    public function read($id)
    {
        $result = model('bonus_applys', 'bonus_model')->detail($id, $this->page_num, $this->page_limit);

        if ($this->account_type == 'admin' || $result['data']['user_id'] == $this->unique_id) {

            $this->data['data'] = $result['data'];

            $this->data['page'] = [
                'page_num'   => $this->page_num,
                'page_limit' => $this->page_limit,
                'data_count' => $result['total_data_num'],
            ];
        } else {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
        }

        return $this->data;
    }

    /**
     * 【admin】新建分销商佣金提现
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $data['user_id'] = $this->unique_id;
        $validate        = Loader::validate('bonus_apply');
        if ($validate->scene('create')->check($data)) {

            $result = model('bonus_applys', 'bonus_model')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '佣金提现申请成功';
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
     * 【admin】佣金提现审核通过
     */
    public function pass()
    {
        $id = input('id/d', 0);

        $apply = model('bonus_applys', 'bonus_model')->getOne($id);
        if ($apply) {
            if ($apply['status'] == 1) {
                switch ($apply['receipt_type']) {
                    case 'money':
                        // 更新会员资产信息并写入日志
                        $result = model('user_assets')->getBonus($apply['user_id'], $apply['money'], $apply['apply_no']);
                        if (!$result['code']) {
                            $this->data['code'] = 0;
                            $this->data['msg']  = '【打款失败】' . $result['msg'];
                            return $this->data;
                        }
                        break;
                    case 'wechat':
                        // 打款到微信
                        $user               = model('users')->getOne($apply['user_id']);
                        $user_third_account = model('user_third_accounts')->findOne(['user_id' => $apply['user_id'], 'type' => 'wechat']);
                        if ($user_third_account) {
                            // 获取ip
                            $request = Request::instance();
                            $ip      = $request->ip();

                            import('app.api_extend.extend.wechat.WechatPay');
                            $wechat_pay = new \WechatPay();
                            $result     = $wechat_pay->org_pay($user_third_account['client_type'], $ip, $apply['apply_no'], $user_third_account['account'], $apply['money'], $user['mobile'], '分红商佣金提现');
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
                    case 'ali':
                        // 打款到支付宝
                        $user               = model('users')->getOne($apply['user_id']);
                        $user_third_account = model('user_third_accounts')->findOne(['user_id' => $apply['user_id'], 'type' => 'ali']);
                        if ($user_third_account) {
                            import('app.api_extend.extend.ali.AliPay');
                            $ali_pay = new \AliPay();
                            $result  = $ali_pay->org_pay($apply['apply_no'], $user_third_account['account'], $apply['money'], $user_third_account['name'], '分红商佣金提现');
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

                $update_applty_data = [
                    'id'                => $id,
                    'deal_time'         => date('Y-m-d H:i:s'),
                    'already_pay_money' => $apply['money'],
                    'pay_time'          => date('Y-m-d H:i:s'),
                    'is_pay'            => 1,
                    'status'            => 3,
                ];
                model('bonus_applys', 'bonus_model')->editOne($update_applty_data);

                $update_log_data = [];
                foreach ($apply['user_bonus_log_ids'] as $key => $value) {
                    $log               = model('user_bonus_logs', 'bonus_model')->getOne(intval($value));
                    $update_log_data[] = [
                        'id'                     => intval($value),
                        'already_drawcash_money' => $log['real_money'],
                        'status'                 => 3,
                    ];
                }
                model('user_bonus_logs', 'bonus_model')->batchEdit($update_log_data);

                // 更新分佣的信息统计
                model('user_info')->updateBonusByLogIds($apply['user_bonus_log_ids']);

                // 触发分红商自动升级
                import('app.api_extend.extend.drp.Bonus');
                $Bonus = new \Bonus();
                // ============【分红】分红商自动升级begin==============
                $Bonus->auto_up_level($apply['user_id']);
                // ============【分红】分红商自动升级end================

                $this->data['msg'] = '申请提现审核通过';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前佣金提现申请已处理';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '数据不存在';
        }

        return $this->data;
    }

    /**
     * 【admin】佣金提现审核通过
     */
    public function not_pass()
    {
        $id = input('id/d', 0);

        $apply = model('bonus_applys', 'bonus_model')->getOne($id);
        if ($apply) {
            if ($apply['status'] == 1) {
                $update_applty_data = [
                    'id'        => $id,
                    'deal_time' => date('Y-m-d H:i:s'),
                    'status'    => 2,
                ];
                model('bonus_applys', 'bonus_model')->editOne($update_applty_data);
                $update_log_data = [];
                foreach ($apply['user_bonus_log_ids'] as $key => $value) {
                    $log               = model('user_bonus_logs', 'bonus_model')->getOne($value);
                    $update_log_data[] = [
                        'id'     => $value,
                        'status' => 2,
                    ];
                }
                model('user_bonus_logs', 'bonus_model')->batchEdit($update_log_data);

                $this->data['msg'] = '申请提现审核不通过成功';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前佣金提现申请已处理';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '数据不存在';
        }

        return $this->data;
    }

    /**
     * 【admin】佣金提现审核通过
     */
    public function reset_check()
    {
        $id = input('id/d', 0);

        $apply = model('bonus_applys', 'bonus_model')->getOne($id);
        if ($apply) {
            if ($apply['status'] == 2) {
                $update_applty_data = [
                    'id'        => $id,
                    'deal_time' => null,
                    'status'    => 1,
                ];
                model('bonus_applys', 'bonus_model')->editOne($update_applty_data);
                $update_log_data = [];
                foreach ($apply['user_bonus_log_ids'] as $key => $value) {
                    $log               = model('user_bonus_logs', 'bonus_model')->getOne($value);
                    $update_log_data[] = [
                        'id'     => $value,
                        'status' => 1,
                    ];
                }
                model('user_bonus_logs', 'bonus_model')->batchEdit($update_log_data);

                $this->data['msg'] = '恢复申请状态操作通过';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '状态错误，不可操作';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '数据不存在';
        }

        return $this->data;
    }

    /**
     * 【user】会员分销商佣金提现列表
     */
    public function lists(Request $request)
    {
        $map            = $request->param();
        $map['user_id'] = $this->unique_id;

        $money = model('bonus_applys', 'bonus_model')->getMoney($map);
        $count = model('bonus_applys', 'bonus_model')->getAllCount($map);
        $lists = model('bonus_applys', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = [
            'money'     => $money,
            'apply_num' => $count,
            'applys'    => $lists,
        ];

        return $this->data;
    }

}
