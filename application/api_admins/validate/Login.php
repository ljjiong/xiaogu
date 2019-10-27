<?php
namespace app\api_admins\validate;

use think\Validate;

class Login extends Validate
{
    protected $rule = [
        ['guid', 'require|checkValue:guid', '账户名不能为空'],
        ['password', 'require|checkValue:password', '密码不能为空'],
    ];

    protected function checkValue($value, $rule)
    {
        $guid = input('guid');

        switch ($rule) {
            case 'guid':
                $admin_account = model('admin_accounts')->findOne(['guid' => $value]);
                if ($admin_account) {
                    return true;
                } else {
                    return '账户名不存在';
                }
                break;
            case 'password':
                $data = [
                    'guid'     => $guid,
                    'password' => wancll_md5($value),
                ];
                $admin_account = model('admin_accounts')->findOne($data);
                if ($admin_account) {
                    $admin = model('admins')->getOne($admin_account['admin_id']);
                    if ($admin) {
                        if ($admin['status'] == 9) {
                            return '管理员已被拉黑';
                        } else {
                            return true;
                        }
                    } else {
                        return '管理员不存在';
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
