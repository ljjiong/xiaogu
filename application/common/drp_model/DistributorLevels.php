<?php
namespace app\common\drp_model;

use app\common\model\BaseModel;

/*
 *  【分销商等级模型】
 */
class DistributorLevels extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_distributor_levels';

    //类型转换
    protected $type = [
        'id'             =>  'integer',
        'rank_weight'    =>  'integer',
        'commission_1'   =>  'float',
        'commission_2'   =>  'float',
        'commission_3'   =>  'float',
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

    // 删除数据（假删除）
    public function delOne($id)
    {
        $level = $this->getOne($id);
        if ($level) {
            if ($level['rank_weight'] == 0) {
                return ['code' => 0, 'data' => [], 'msg' => '当前等级为默认等级，不可删除'];
            }
        }

        $result = $this->save(['data_state' => 0], ['id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除数据成功'];
        }
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        foreach ($ids as $id) {
            $level = $this->getOne($id);
            if ($level) {
                if ($level['rank_weight'] == 0) {
                    return ['code' => 0, 'data' => [], 'msg' => '分销商等级为0的为默认等级，不可删除'];
                    break;
                }
            }
        }

        $result = $this->save(['data_state' => 0], ['id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除数据成功'];
        }
    }
}
