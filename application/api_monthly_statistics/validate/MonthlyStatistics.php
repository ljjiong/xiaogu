<?php
namespace app\api_monthly_statistics\validate;

use think\Validate;

class MonthlyStatistics extends Validate
{
    protected $rule = [
        ['name', 'require', '水库名称不能为空'],
        ['month', 'require', '月份不能为空'],
        ['enter', 'require', '进库水量不能为空'],
        ['generate', 'require', '出库（发电）水量不能为空'],
        ['rainfall', 'require', '降雨量不能为空'],
    ];

    protected $scene = [
        'create' => ['name', 'month', 'enter', 'generate','rainfall'],
        'update' => ['name', 'month', 'enter', 'generate','rainfall'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'name':
                $monthly_statistics = model('monthly_statistics')->getOne($value);
                if ($monthly_statistics) {
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