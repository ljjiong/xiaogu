<?php
namespace app\common\model;

/*
 *  【系统规则模型】
 */
class ServicingInstallation extends BaseModel
{
    // 指定数据表
    protected $table = 'work_servicing_installation';

    //类型转换
    protected $type = [
        'id'         => 'integer',
    ];

}   