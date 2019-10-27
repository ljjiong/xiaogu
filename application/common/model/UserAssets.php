<?php
namespace app\common\model;

/*
 *  【会员资产模型】
 */
class UserAssets extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_assets';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'money'      => 'float',
        'span'       => 'float',
        'score'      => 'float',
        'data_state' => 'integer',
    ];

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_info'] = '';
        }

        return $data;
    }

    // 会员申请提现
    public function applyDrawcash($user_drawcash_id)
    {
        $user_drawcash = model('user_drawcashs')->getOne($user_drawcash_id);

        $result = $this->where(['user_id' => $user_drawcash['user_id']])->setDec('money', $user_drawcash['money']);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $asset_log_data = [
                'user_id'      => $user_drawcash['user_id'],
                'asset_type'   => 'money',
                'change_type'  => 'user_drawcash',
                'change_money' => $user_drawcash['money'],
                'intro'        => '申请提现扣款【' . $user_drawcash['order_no'] . '】',
                'desc'         => '会员申请提现，系统自动扣款，提现申请单号【' . $user_drawcash['order_no'] . '】',
            ];
            model('user_asset_logs')->addOne($asset_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }

    // 管理员拒绝提现
    public function notAgreeDrawcash($user_drawcash_id)
    {
        $user_drawcash = model('user_drawcashs')->getOne($user_drawcash_id);

        if ($user_drawcash) {
            $result = $this->where(['user_id' => $user_drawcash['user_id']])->setInc('money', $user_drawcash['money']);

            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                $asset_log_data = [
                    'user_id'      => $user_drawcash['user_id'],
                    'asset_type'   => 'money',
                    'change_type'  => 'user_drawcash_not_agree',
                    'change_money' => $user_drawcash['money'],
                    'intro'        => '提现审核未通过回款',
                    'desc'         => '管理员拒绝提现，系统自动返还提现资金',
                ];
                model('user_asset_logs')->addOne($asset_log_data);

                return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '提现数据不存在'];
        }
    }

    // 会员钱包充值
    public function moneyRecharge($user_id, $money)
    {
        $result = $this->where(['user_id' => $user_id])->setInc('money', $money);

        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $asset_log_data = [
                'user_id'      => $user_id,
                'asset_type'   => 'money',
                'change_type'  => 'user_money_recharge',
                'change_money' => $money,
                'intro'        => '会员钱包充值',
                'desc'         => '会员通过第三方对钱包进行充值',
            ];
            model('user_asset_logs')->addOne($asset_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }

    // 会员钱包充值
    public function moneyRechargeByAdmin($user_id, $money)
    {
        $result = $this->where(['user_id' => $user_id])->setInc('money', $money);

        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $asset_log_data = [
                'user_id'      => $user_id,
                'asset_type'   => 'money',
                'change_type'  => 'user_money_recharge',
                'change_money' => $money,
                'intro'        => '管理员充值',
                'desc'         => '管理员在后台给会员进行充值',
            ];
            model('user_asset_logs')->addOne($asset_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }

    // 分销佣金提现打款
    public function getCommission($user_id, $money, $apply_no = '')
    {
        $result = $this->where(['user_id' => $user_id])->setInc('money', $money);

        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $asset_log_data = [
                'user_id'      => $user_id,
                'asset_type'   => 'money',
                'change_type'  => 'user_get_commission',
                'change_money' => $money,
                'intro'        => '分销佣金提现【' . $apply_no . '】',
                'desc'         => '会员申请分销提现到钱包',
            ];
            model('user_asset_logs')->addOne($asset_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }

    // 分红佣金提现打款
    public function getBonus($user_id, $money, $apply_no = '')
    {
        $result = $this->where(['user_id' => $user_id])->setInc('money', $money);

        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $asset_log_data = [
                'user_id'      => $user_id,
                'asset_type'   => 'money',
                'change_type'  => 'user_get_bonus',
                'change_money' => $money,
                'intro'        => '分红佣金提现【' . $apply_no . '】',
                'desc'         => '会员申请分红提现到钱包',
            ];
            model('user_asset_logs')->addOne($asset_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }

    public function pay_span($user_id, $money)
    {
        $asset = $this->findOne(['user_id' => $user_id]);
        if ($asset['money'] < $money) {
            return ['code' => 0, 'data' => [], 'msg' => '钱包余额不足请充值'];
        } else {
            $asset_log_data = [
                'user_id'      => $user_id,
                'asset_type'   => 'span',
                'change_type'  => 'pay_span',
                'change_money' => $money,
                'intro'        => '缴纳诚信保证金',
                'desc'         => '缴纳诚信保证金',
            ];
            model('user_asset_logs')->addOne($asset_log_data);
            $this->where(['user_id' => $user_id])->setInc('span', $money);
            $this->where(['user_id' => $user_id])->setDec('money', $money);
            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }
}
