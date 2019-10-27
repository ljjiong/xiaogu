<?php
namespace app\common\model;

class AnnualStatement extends BaseModel
{
	 // 指定数据表
    protected $table = 'work_annual_statement';

    //类型转换
    protected $type = [
        'id'                   => 'integer',
        'particular_year'      => 'string',
        'name'            	   => 'string',
        'enter'                => 'string',
        'generate'             => 'string',
        'imports'              => 'string',
        'Hanyama'              => 'string',
        'rainfall'             => 'integer',
        'created_time'         => 'integer',
    ];
}

?>