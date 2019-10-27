<?php
namespace app\api_systems\validate;

use think\Validate;

class Code extends Validate
{
    protected $rule = [
        ['mobile', 'require|mobile|checkValue:mobile', '手机号不能为空|手机号格式错误'],
        ['type', 'require|in:1,2,3', '类型值不能为空|类型值非法'],
        ['code', 'require', '验证码不能为空'],
    ];

    protected $regex = [
        'mobile' => '/^1[0-9]{1}\d{9}$/',
    ];

    protected $scene = [
        'send'  => ['mobile', 'type'],
        'check' => ['mobile', 'code'],
    ];

    protected function checkValue($value, $rule)
    {
        $type = input('type');

        switch ($rule) {
            case 'mobile':
                if ($type == 1 && $this->currentScene == 'send') {
                    // 校验是否被注册
                    $user_account = model('user_accounts')->findOne(['guid' => $value]);
                    if ($user_account) {
                        return "手机号已被注册";
                    } else {
                        return true;
                    }
                }if ($type == 3 && $this->currentScene == 'send') {
                    // 校验是否被注册
                    $user_account = model('user_accounts')->findOne(['guid' => $value]);
                    if ($user_account) {
                        return true;
                    } else {
                        return '当前手机号暂未注册';
                    }
                } else {
                    return true;
                }
                break;
            default:
                # code...
                break;
        }

    }
}
