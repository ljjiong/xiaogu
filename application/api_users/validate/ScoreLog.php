<?php
namespace app\api_users\validate;

use think\Validate;

class ScoreLog extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员积分日志ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['change_type', 'require', '积分变动类别不能为空'],
        ['change_num', 'require|number|>=:0.01', '积分变动数量不能为空|积分变动数量值非法|积分变动数量值最小为0.01'],
        ['intro', 'require', '积分日志简介不能为空'],
        ['desc', 'require', '积分日志描述不能为空'],
    ];

    protected $scene = [
        'create'               => ['user_id', 'change_type', 'change_num', 'intro', 'desc'],
        'update'               => ['user_id', 'change_type', 'change_num', 'intro', 'desc', 'id'],
        'admin_recharge_score' => ['user_id', 'change_num'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员不存在';
                }
                break;
            case 'id':
                $score_log = model('score_logs')->getOne($value);
                if ($score_log) {
                    return true;
                } else {
                    return '会员积分日志数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
