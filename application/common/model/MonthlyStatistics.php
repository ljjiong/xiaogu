<?php
namespace app\common\model;

class MonthlyStatistics extends BaseModel
{
	 // 指定数据表
    protected $table = 'work_monthly_statistics';

    //类型转换
    protected $type = [
        'id'                   => 'integer',
        'month'                => 'string',
        'name'            	   => 'string',
        'enter'                => 'integer',
        'generate'             => 'integer',
        'imports'              => 'integer',
        'Hanyama'              => 'integer',
        'weather'              => 'integer',
        'aggregates'           => 'integer',
        'created_time'         => 'integer',
    ];
}