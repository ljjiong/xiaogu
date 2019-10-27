<?php
namespace app\common\model;

/*
 *  【七牛文件模型】
 */
class QiniuFiles extends BaseModel
{
    // 指定数据表
    protected $table = 'work_qiniu_files';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'data_state' => 'integer',
    ];
}
