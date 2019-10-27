<?php
namespace app\api_file\validate;

use think\Validate;

class Remuneration extends Validate
{
    protected $rule = [
        ['uid', 'require|checkValue:uid', '用户不存在'],
        ['base_pay', 'number', '基本工资非法金额'],
        ['overtime_wage', 'number', '加班工资金额'],
        ['mission_allowance', 'number', '出差补贴非法金额'],
        ['belate', 'number', '迟到早退非法金额'],
        ['salary', 'number', '应发工资非法金额'],
        ['absenteeism', 'number', '实发工资非法金额'],
        ['expiry_time', 'require', '未选择时间'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'uid':
                $goods = model('users')->getOne($value);
                if ($goods) {
                    return true;
                } else {
                    return '用户不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
