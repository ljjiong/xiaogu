<?php
namespace app\common\model;

/*
 *  【满减促销活动规则模型】
 */
class ActivityFullRules extends BaseModel
{
    // 指定数据表
    protected $table = 'work_activity_full_rules';

    //类型转换
    protected $type = [
        'id'                 => 'integer',
        'market_activity_id' => 'integer',
        'user_level_ids'     => 'json',
        'full_money'         => 'float',
        'reduce_money'       => 'float',
        'status'             => 'integer',
        'data_state'         => 'integer',
    ];

    // 获取器【activity_name】
    public function getActivityNameAttr($value, $data)
    {
        $activity = model('market_activities')->getOne($data['market_activity_id']);
        return $activity ? $activity['name'] : '';
    }

    // 获取器【user_level_info】
    public function getUserLevelInfoAttr($value, $data)
    {
        $user_levels = model('user_levels')->getColumn(['id' => ['in', json_decode($data['user_level_ids'], true)]], 'name');
        return implode(',', $user_levels);
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['activity_name']   = '';
            $data[$key]['user_level_info'] = '';

        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['activity_name']   = '';
            $data['user_level_info'] = '';
        }

        return $data;
    }

    // 查询全部(含分页)
    public function getAllBasicInfo($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        return $data;
    }
}
