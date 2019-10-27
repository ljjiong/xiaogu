<?php
namespace app\api_admins\validate;

use think\Validate;

class Password extends Validate
{
    protected $rule = [
        ['admin_account_id', 'require|checkValue:admin_account_id', '账户ID不能为空'],
        ['guid', 'require|checkValue:guid', '账户名不能为空'],
        ['old_password', 'require', '旧密码不能为空'],
        ['password', 'require|min:6|max:15|confirm', '密码不能为空|密码最少6位|密码最大15位|密码与确认密码不一致'],
    ];

    protected $scene = [
        'mod'   => ['admin_account_id', 'old_password', 'password'],
        'reset' => ['guid', 'password'],
    ];

    protected function checkValue($value, $rule)
    {
        $old_password = input('old_password');

        switch ($rule) {
            case 'guid':
                $admin_account = model('admin_accounts')->findOne(['guid' => $value]);
                if ($admin_account) {
                    return true;
                } else {
                    return '账户名不存在';
                }
                break;
            case 'admin_account_id':
                $admin_account = model('admin_accounts')->getOne($value);
                if ($admin_account) {
                    if ($this->currentScene == 'mod') {
                        if ($admin_account['password'] === wancll_md5($old_password)) {
                            return true;
                        } else {
                            return '旧密码错误';
                        }
                    } else {
                        return true;
                    }
                } else {
                    return '账户ID不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
