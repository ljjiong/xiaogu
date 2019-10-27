<?php
namespace app\api_operation\validate;

use think\Validate;

class Operation extends Validate
{
    protected $rule = [
        ['name', 'require', '水库名称不能为空'],
        ['dateline', 'require', '日期不能为空'],
        ['running_status', 'require', '机组运行状态不能为空'],
        ['active_power', 'require', '有功电量不能为空/Kw.H'],
        ['remark', 'require', '备注不能为空'],

    ];

    protected $scene = [
        'create' => ['name', 'dateline', 'running_status', 'active_power', 'remark'],
        'update' => ['name', 'dateline', 'running_status', 'active_power', 'remark'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'name':
                $Operation = model('Operation')->getOne($value);
                if ($Operation) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
