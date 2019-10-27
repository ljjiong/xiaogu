<?php
namespace app\common\bonus_model;

use app\common\model\BaseModel;

/*
 *  【分红等级模型】
 */
class BonusLevels extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_bonus_levels';


    //类型转换
    protected $type = [
        'is_global'      =>  'boolean',
        'id'             =>  'integer',
        'rank_weight'    =>  'integer',
        'rate'           =>  'float',
        'up_level_value' =>  'integer',
        'status'         =>  'integer',
        'data_state'     =>  'integer',
    ];

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('rank_weight asc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('rank_weight asc')->select();
        }

        return $data;
    }

    // 查询当前等级的更高一级等级ID
    public function nextLevel($now_level_id = 0)
    {
        $levels = $this->getAll(['status' => 1]);

        if ($now_level_id == 0) {
            $flag = 1;
        } else {
            $flag = 0;
        }

        $next_level_id = 0;
        foreach ($levels as $key => $value) {
            if ($flag == 1) {
                $next_level_id = $value['id'];
                break;
            }

            if ($value['id'] == $now_level_id) {
                $flag = 1;
            }
        }

        if ($next_level_id == 0 && $flag == 1) {
            $next_level_id = $now_level_id;
        }

        return $next_level_id;
    }
}
