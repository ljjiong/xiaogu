<?php
namespace app\common\model;

/*
 *  【系统规则模型】
 */
class EquipmentRating extends BaseModel
{
    // 指定数据表
    protected $table = 'work_equipment_rating';

    //类型转换
    protected $type = [
        'id'         => 'integer',
    ];
 

    
}
