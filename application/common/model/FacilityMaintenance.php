<?php
namespace app\common\model;

/*
 *  【系统规则模型】
 */
class FacilityMaintenance extends BaseModel
{
    // 指定数据表
    protected $table = 'work_facility_maintenance';

    //类型转换
    protected $type = [
        'id'         => 'integer',
    ];
}
?>