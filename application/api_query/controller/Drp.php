<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class Drp extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'lists'],
    ];

    /**
     * 【user】查询分销商基本信息
     */
    public function distributor_info()
    {
        $user = model('users')->getOne($this->unique_id);

        import('app.api_extend.extend.drp.Drp');
        $Drp = new \Drp();
        // 如果成为分销商的条件为无，直接使其成为分销商
        $Drp->become_distributor($this->unique_id);

        if ($user['is_distributor'] == 1) {
            $distributor_level = model('distributor_levels', 'drp_model')->getOne($user['distributor_level_id']);
            $user_info         = model('user_info')->getOne($this->unique_id);
            $child_user_num    = model('users')->getAllCount(['parent_id' => $this->unique_id, 'is_distributor' => 0]);
            $order_num         = model('user_commission_logs', 'drp_model')->getOrderNum($this->unique_id);

            // ============【分销商】团队人数begin==============
            $result = $Drp->team_user_nums($this->unique_id);
            // ============【分销商】团队人数end================
            $team_user_num = $result['data']['total_num'];

            $can_drawcash_commission_money = $user_info['total_real_commission_money'] - $user_info['already_drawcash_commission_money'] - $user_info['wait_pay_commission_money'];

            $data = [
                'is_distributor'          => 1,
                'become_distributor_time' => $user['become_distributor_time'],
                'level_name'              => $distributor_level['level_name'],
                'total_money'             => $user_info['total_real_commission_money'],
                'can_drawcash_money'      => round(floatval($can_drawcash_commission_money), 2),
                'commission_money'        => $user_info['already_drawcash_commission_money'],
                'order_num'               => $order_num,
                'child_user_num'          => $child_user_num,
                'team_user_num'           => $team_user_num,
            ];

        } else {
            $data = [
                'is_distributor'          => 0,
                'become_distributor_time' => '',
                'level_name'              => '',
                'total_money'             => 0.00,
                'can_drawcash_money'      => 0.00,
                'commission_money'        => 0.00,
                'order_num'               => 0.00,
                'child_user_num'          => 0,
                'team_user_num'           => 0,
            ];
        }

        $this->data['data'] = $data;
        return $this->data;
    }

    /**
     * 【user】查询分佣信息
     */
    public function commission_info()
    {
        $user_info = model('user_info')->getOne($this->unique_id);

        if ($user_info) {
            $can_drawcash_commission_money = $user_info['total_real_commission_money'] - $user_info['already_drawcash_commission_money'] - $user_info['wait_pay_commission_money'];
            $already_apply_money           = $user_info['already_drawcash_commission_money'] + $user_info['wait_pay_commission_money'];

            $data = [
                'can_drawcash_money'  => round(floatval($can_drawcash_commission_money), 2),
                'total_money'         => $user_info['total_real_commission_money'],
                'already_apply_money' => round(floatval($already_apply_money), 2),
                'wait_pay_money'      => $user_info['wait_pay_commission_money'],
            ];
        } else {
            $data = [
                'can_drawcash_money'  => 0,
                'total_money'         => 0,
                'already_apply_money' => 0,
                'wait_pay_money'      => 0,
            ];
        }

        $this->data['data'] = $data;
        return $this->data;
    }
}
