<?php
namespace app\common\model;

/*
 *  【会员第三方账号】
 */
class UserThirdAccounts extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_third_accounts';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'data_state' => 'integer',
    ];
}
