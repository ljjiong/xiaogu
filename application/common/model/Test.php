<?php
namespace app\common\model;

/*
 *  【测试模型】
 */
class Test extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_test';

    // 类型转换
    protected $type = [
        'id'         => 'integer',
        'content'    => 'json',
        'data_state' => 'integer',
    ];
}
