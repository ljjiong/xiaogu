<?php
namespace app\common\model;

/*
 *  【调岗日志模型】
 */
class Positionlogs extends BaseModel
{
    // 指定数据表
    protected $table = 'work_custom_position_logs';

    public function getUsersAttr($value, $data)
    {
        return model('users')->getOne($data['uid']);
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
            $data[$key]['users'] = '';
        }

        return $data;
    }
}
