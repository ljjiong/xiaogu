<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class Bonus extends Rest
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
    public function bonus_info()
    {
        $user = model('users')->getOne($this->unique_id);

        import('app.api_extend.extend.drp.Bonus');
        $Bonus = new \Bonus();
        // 如果成为分红商的条件为无，直接使其成为分红商
        $Bonus->become_bonus($this->unique_id);

        if ($user['is_bonus'] == 1) {
            $bonus_level    = model('bonus_levels', 'bonus_model')->getOne($user['bonus_level_id']);
            $user_info      = model('user_info')->getOne($this->unique_id);
            $child_user_num = model('users')->getAllCount(['parent_id' => $this->unique_id, 'is_bonus' => 0]);
            $order_num      = model('user_bonus_logs', 'bonus_model')->getOrderNum($this->unique_id);

            // ============【分红商】团队人数begin==============
            $result = $Bonus->team_user_nums($this->unique_id);
            // ============【分红商】团队人数end================
            $team_user_num = $result['data']['total_num'];

            $region_bonus_info = '';
            $region_bonus      = model('region_bonus', 'bonus_model')->findOne(['user_id' => $this->unique_id, 'status' => 1]);
            if ($region_bonus) {
                switch ($region_bonus['type']) {
                    case 1:
                        $region_bonus_info = $region_bonus['province'] . '【省级代理】';
                        break;
                    case 2:
                        $region_bonus_info = $region_bonus['city'] . '【市级代理】';
                        break;
                    case 3:
                        $region_bonus_info = $region_bonus['area'] . '【县级代理】';
                        break;
                    default:
                        # code...
                        break;
                }
            }

            $can_drawcash_bonus_money = $user_info['total_real_bonus_money'] - $user_info['already_drawcash_bonus_money'] - $user_info['wait_pay_bonus_money'];

            $data = [
                'is_bonus'           => 1,
                'become_bonus_time'  => $user['become_bonus_time'],
                'level_name'         => isset($bonus_level['level_name']) ? $bonus_level['level_name'] : '',
                'total_money'        => $user_info['total_real_bonus_money'],
                'can_drawcash_money' => round(floatval($can_drawcash_bonus_money), 2),
                'bonus_money'        => $user_info['already_drawcash_bonus_money'],
                'order_num'          => $order_num,
                'wait_pay_money'     => $user_info['wait_pay_bonus_money'],
                'child_user_num'     => $child_user_num,
                'team_user_num'      => $team_user_num,
                'region_bonus_info'  => $region_bonus_info,
            ];

        } else {
            $data = [
                'is_bonus'           => 0,
                'become_bonus_time'  => '',
                'level_name'         => '',
                'total_money'        => 0.00,
                'can_drawcash_money' => 0.00,
                'bonus_money'        => 0.00,
                'wait_pay_money'     => 0.00,
                'order_num'          => 0.00,
                'child_user_num'     => 0,
                'team_user_num'      => 0,
                'region_bonus_info'  => '',
            ];
        }

        $this->data['data'] = $data;
        return $this->data;
    }

    /**
     * 【user】查询分佣信息
     */
    public function bonus_money_info()
    {
        $user_info = model('user_info')->getOne($this->unique_id);

        if ($user_info) {
            $can_drawcash_bonus_money = $user_info['total_real_bonus_money'] - $user_info['already_drawcash_bonus_money'] - $user_info['wait_pay_bonus_money'];
            $already_apply_money      = $user_info['already_drawcash_bonus_money'] + $user_info['wait_pay_bonus_money'];

            $data = [
                'can_drawcash_money'  => round(floatval($can_drawcash_bonus_money), 2),
                'total_money'         => $user_info['total_real_bonus_money'],
                'already_apply_money' => round(floatval($already_apply_money), 2),
                'wait_pay_money'      => $user_info['wait_pay_bonus_money'],
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
