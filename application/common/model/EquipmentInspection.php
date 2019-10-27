<?php
namespace app\common\model;

/*
 *  【系统规则模型】
 */
class EquipmentInspection extends BaseModel
{
    // 指定数据表
    protected $table = 'work_equipment_inspection';

    //类型转换
    protected $type = [
        'id'         => 'integer',
    ];
 

    
}
