<?php
namespace app\api_articles\validate;

use think\Validate;

class Feedback extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '反馈ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['mobile', 'mobile', '联系电话格式错误'],
        ['email', 'email', '邮箱格式错误'],
        ['title', 'require|max:255', '反馈标题不能为空|反馈标题限255字符'],
        ['content', 'require', '反馈内容不能为空'],
    ];

    protected $regex = [
        'mobile' => '/^1[34578]{1}\d{9}$/',
    ];

    protected $scene = [
        'create' => ['user_id', 'mobile', 'email', 'title', 'content'],
        'update' => ['user_id', 'mobile', 'email', 'title', 'content', 'id'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if (!$user) {
                    return '会员ID不存在';
                }
                break;
            case 'id':
                $feedback = model('feedbacks')->getOne($value);
                if (!$feedback) {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }

        return true;
    }
}
