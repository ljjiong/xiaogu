<?php
namespace app\common\model;

/*
 *  【管理员资产模型】
 */
class AdminAssets extends BaseModel
{
    // 指定数据表
    protected $table = 'work_admin_assets';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'admin_id'   => 'integer',
        'money'      => 'float',
        'score'      => 'float',
        'data_state' => 'integer',
    ];
}
