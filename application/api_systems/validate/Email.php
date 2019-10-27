<?php
namespace app\api_systems\validate;

use think\Validate;

class Email extends Validate
{
    protected $rule = [
        ['from_email', 'require|email', '发件人邮箱地址不能为空|发件人邮箱地址格式错误'],
        ['from_nickname', 'require|max:50', '发件人昵称不能为空|发件人昵称限50字符'],
        ['info_subject', 'require', '邮件标题不能为空'],
        ['info_body', 'require', '邮件内容不能为空'],
        ['to_emails', 'require|array|checkValue:to_emails', '收件人邮箱列表不能为空|收件人邮箱列表值非法'],
    ];

    protected $regex = [
        'mobile' => '/^1[34578]{1}\d{9}$/',
    ];

    protected $scene = [
        'create' => ['from_email', 'from_nickname', 'info_subject', 'info_body', 'to_emails'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'to_emails':
                $checkmail = "/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/";
                foreach ($value as $line_num => $email) {
                    if ($email) {
                        if (!preg_match($checkmail, $email)) {
                            return '第' . ($line_num + 1) . '个收件人邮箱地址格式错误';
                            break;
                        }
                    } else {
                        return '第' . ($line_num + 1) . '个收件人邮箱地址不能为空';
                        break;
                    }
                }
                return true;
                break;
            default:
                # code...
                break;
        }

    }
}
