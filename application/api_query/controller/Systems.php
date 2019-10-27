<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

import('app.api_extend.extend.drp.Bonus');
import('app.api_extend.extend.drp.Drp');

class Systems extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【public】系统开启情况
     */
    // public function info()
    // {
    //     // 分销信息
    //     $Bonus      = new \Bonus();
    //     $bonus_info = $Bonus->basic_info();

    //     // 分红信息
    //     $Drp      = new \Drp();
    //     $drp_info = $Drp->basic_info();

    //     $data = [
    //         'is_open_bonus' => $bonus_info['is_open'],
    //         'is_open_drp'   => $drp_info['is_open'],
    //     ];

    //     $this->data['data'] = $data;
    //     return $this->data;
    // }
}
