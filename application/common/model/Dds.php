<?php
namespace app\common\model;

/*
 *  【数据字典模型】
 */
class Dds extends BaseModel
{
    // 指定数据表
    protected $table = 'work_dds';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'nav_id'     => 'integer',
        'data_state' => 'integer',
    ];
}
