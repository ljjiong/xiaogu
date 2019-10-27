<?php
namespace app\api_orders\validate;

use think\Validate;

class Pay extends Validate
{
    protected $rule = [
        ['order_no', 'require', '订单号不能为空'],
        ['user_id', 'require', '会员ID不能为空'],
        ['account_id', 'require|checkValue:account_id', '会员账号不能为空'],
        ['pay_password', 'require', '请输入支付密码'],
    ];

    protected $scene = [
        'money'    => ['order_no', 'user_id', 'account_id', 'pay_password'],
        'touch_id' => ['order_no', 'user_id'],
    ];

    protected function checkValue($value, $rule)
    {
        $pay_password = input('pay_password');

        switch ($rule) {
            case 'account_id':
                $user_account = model('user_accounts')->getOne($value);
                if ($user_account) {
                    $map = [
                        'id'           => $value,
                        'pay_password' => wancll_md5($pay_password),
                    ];
                    $result = model('user_accounts')->findOne($map);
                    if ($result) {
                        return true;
                    } else {
                        return '支付密码错误';
                    }
                } else {
                    return '会员账号不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
