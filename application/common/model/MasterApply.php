<?php
namespace app\common\model;

/*
 *  【会员模型】
 */
class MasterApply extends BaseModel
{
    // 指定数据表
    protected $table = 'work_master_apply';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'data_state' => 'integer',
    ];
}
