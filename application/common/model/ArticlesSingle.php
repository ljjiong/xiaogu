<?php
namespace app\common\model;

/*
 *  【会员地址模型】
 */
class ArticlesSingle extends BaseModel
{
    // 指定数据表
    protected $table = 'work_articles_single';

    //类型转换
    protected $type = [
        'id'         => 'integer',
    ];

}
