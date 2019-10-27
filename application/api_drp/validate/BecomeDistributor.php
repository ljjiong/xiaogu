<?php
namespace app\api_drp\validate;

use think\Validate;

class BecomeDistributor extends Validate
{
    protected $rule = [
        ['become_distributor_condition', 'require|in:no,apply,order_num,order_money,goods', '成为分销商的条件不能为空|成为分销商值非法'],
        ['is_need_complete_user_info', 'require|boolean', '是否需要完善信息不能为空|是否需要完善信息值非法'],
    ];

    protected $scene = [
        'update' => ['become_distributor_condition', 'is_need_complete_user_info'],
    ];
}
