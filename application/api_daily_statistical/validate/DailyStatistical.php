<?php
namespace app\api_daily_statistical\validate;

use think\Validate;

class DailyStatistical extends Validate
{
    protected $rule = [
        ['name', 'require', '水库名称不能为空'],
        ['dateline', 'require', '日期不能为空'],
        ['water_yield', 'require', '进库水量不能为空'],
        ['electricity', 'require', '出库（发电）水量不能为空'],
        ['rainfall', 'require', '降雨量不能为空'],
        ['weather', 'require', '天气不能为空'],
    ];

    protected $scene = [
        'create' => ['name', 'dateline', 'water_yield', 'electricity','weather','rainfall'],
        'update' => ['name', 'dateline', 'water_yield', 'electricity','weather','rainfall'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'name':
                $daily_statistical = model('daily_statistical')->getOne($value);
                if ($daily_statistical) {
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