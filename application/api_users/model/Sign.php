<?php
namespace app\api_users\model;

use app\common\model\BaseModel;

/*
 *  【授权绑定模型】
 */
class Sign extends BaseModel
{
    // 指定数据表
    protected $table = 'work_users';

    //类型转换
    protected $type = [
        'id'                   => 'integer',
        'gender'               => 'integer',
        'distributor_level_id' => 'integer',
        'parent_id'            => 'integer',
        'role_ids'             => 'json',
        'is_distributor'       => 'boolean',
        'is_bonus'             => 'boolean',
        'bonus_level_id'       => 'integer',
        'status'               => 'integer',
        'keep_sign_in_num'     => 'integer',
        'total_sign_in_num'    => 'integer',
        'data_state'           => 'integer',
    ];

    // 未登录状态创建授权绑定信息
    public function add_sign($user_id)
    {
        $user = model('users')->getOne($user_id);

        if (!$user) {
            return ['code' => 0, 'msg' => '会员不存在'];
        }

        $last_sign_in_timestamp = strtotime(date('Y-m-d', strtotime($user['last_sign_in_time'])));
        $today_timestamp        = strtotime(date('Y-m-d'));
        if ($last_sign_in_timestamp == $today_timestamp) {
            return ['code' => 0, 'msg' => '今日已签到'];
        } else {
            $day_num = ($today_timestamp - $last_sign_in_timestamp) / 86400;
            if ($day_num == 1) {
                $keep_sign_in_num = $user['keep_sign_in_num'] + 1;
            } else {
                $keep_sign_in_num = 1;
            }
        }

        // 更新签到天数
        $update_data = [
            'id'                => $user_id,
            'keep_sign_in_num'  => $keep_sign_in_num,
            'total_sign_in_num' => $user['total_sign_in_num'] + 1,
            'last_sign_in_time' => date('Y-m-d H:i:s'),
        ];

        $result = model('users')->editOne($update_data);
        if ($result['code']) {
            // 写入签到日志
            model('score_logs')->addScoreBySignIn($user_id);

            return ['code' => 1, 'msg' => '签到成功'];
        } else {
            return ['code' => 0, 'msg' => '签到失败'];
        }
    }
}
