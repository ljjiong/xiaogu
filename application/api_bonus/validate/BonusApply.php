<?php
namespace app\api_bonus\validate;

use think\Validate;

class BonusApply extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['receipt_type', 'require|in:money,ali,wechat', '收款类别不能为空|收款类别值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'receipt_type'],
    ];

    protected function checkValue($value, $rule)
    {
        $id           = input('id');
        $receipt_type = input('receipt_type');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    $user_info = model('user_info')->getOne($value);
                    if ($user_info) {
                        $can_drawcash_bonus_money = $user_info['total_real_bonus_money'] - $user_info['already_drawcash_bonus_money'] - $user_info['wait_pay_bonus_money'];
                        if ($can_drawcash_bonus_money > 0) {
                            import('app.api_extend.extend.drp.Bonus');
                            $Bonus = new \Bonus();
                            $data  = $Bonus->basic_info();
                            if ($can_drawcash_bonus_money < $data['min_drawcash_money']) {
                                return '当前可提现金额小于最低提现额，暂不可提现';
                            }

                            if ($receipt_type == 'money') {
                                return true;
                            } elseif ($receipt_type == 'ali') {
                                $third_account = model('user_third_accounts')->findOne(['user_id' => $value, 'type' => 'ali']);
                                if ($third_account) {
                                    return true;
                                } else {
                                    return '暂未绑定支付宝收款账号';
                                }
                            } elseif ($receipt_type == 'wechat') {
                                $third_account = model('user_third_accounts')->findOne(['user_id' => $value, 'type' => 'wechat']);
                                if ($third_account) {
                                    return true;
                                } else {
                                    return '暂未绑定微信收款账号';
                                }
                            } else {
                                return '收款类别值非法';
                            }
                        } else {
                            return '暂无可提现分红';
                        }
                    } else {
                        return '暂无分红信息，不可提现';
                    }
                } else {
                    return '会员不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
