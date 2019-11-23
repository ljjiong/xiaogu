<?php
namespace app\api_articles\validate;

use think\Validate;

class Login extends Validate
{
    protected $rule = [
        ['mobile', 'require|checkValue:mobile', '手机号不能为空'],
        ['password', 'require|checkValue:password', '密码不能为空'],
    ];

    protected function checkValue($value, $rule)
    {
        $mobile = input('mobile');

        switch ($rule) {
            case 'mobile':
                $user_account = model('user_accounts')->findOne(['guid' => $value]);
                if ($user_account) {
                    return true;
                } else {
                    return '账户名不存在';
                }
                break;
            case 'password':
                $data = [
                    'guid'     => $mobile,
                    'password' => wancll_md5($value),
                ];
                $user_account = model('user_accounts')->findOne($data);
                if ($user_account) {
                    $user = model('users')->getOne($user_account['user_id']);
                    if ($user) {
                        if ($user['status'] == 9) {
                            return '会员已被拉黑';
                        } else {
                            return true;
                        }
                    } else {
                        return '会员不存在';
                    }
                } else {
                    return '密码错误';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
