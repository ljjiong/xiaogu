<?php
namespace app\common\model;

class MonthOperation extends BaseModel
{
 // 指定数据表
    protected $table = 'work_electricity_statistics';

    //类型转换
    protected $type = [
        'id'             => 'integer',
        'dateline'       => 'string',
        'name'           => 'string',
        'plant_name'     => 'string',
        'unit'           => 'string',
        'running_status' => 'string',
        'active_power'   => 'string',
        'idle_work'      => 'string',
        'remark'         => 'string',
        'district'       => 'string',
        'annual_program' => 'string',
        'combined'       => 'string',
        'annual_output'  => 'string',
        'created_time'   => 'date',
    ];
}