<?php
namespace app\api_remuneration\validate;

use think\Validate;

class Remuneration extends Validate
{
    protected $rule = [
        ['uid', 'require|checkValue:uid', '用户不存在'],
        ['intention', 'require', '意向强度为空'],
        ['remark', 'require', '意向记录为空'],
        ['aid', 'require', '未登录'],
    ];

    protected $scene = [
        'create' => ['uid', 'intention', 'remark', 'aid'],
        'update' => ['uid', 'intention', 'remark', 'aid'],
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
