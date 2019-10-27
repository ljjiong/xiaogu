<?php
namespace app\common\model;

/*
 *  【会员等级模型】
 */
class UserLevels extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_levels';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'min_score'  => 'float',
        'status'     => 'integer',
        'data_state' => 'integer',
    ];

    public function getOneByUserId($user_id)
    {
        // $user_asset = model('user_assets')->findOne(['user_id' => $user_id]);
        // $data       = $this->where(['min_score' => ['<=', $user_asset['score']]])->order('min_score desc')->find();

        // return $data;
    }
}
