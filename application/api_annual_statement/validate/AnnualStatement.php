<?php
namespace app\api_annual_statement\validate;

use think\Validate;

class AnnualStatement extends Validate
{
    protected $rule = [
        ['name', 'require', '水库名称不能为空'],
        ['particular_year', 'require', '年份不能为空'],
        ['enter', 'require', '进库水量不能为空'],
        ['generate', 'require', '出库（发电）水量不能为空'],
        ['rainfall', 'require', '降雨量不能为空'],
       
    ];

    protected $scene = [
        'create' => ['name', 'particular_year', 'enter', 'generate','rainfall'],
        'update' => ['name', 'particular_year', 'enter', 'generate','rainfall'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'name':
                $annual_statement = model('annual_statement')->getOne($value);
                if ($annual_statement) {
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