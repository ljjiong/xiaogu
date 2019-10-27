<?php
namespace app\common\model;

/*
 *  【会员模型】
 */
class Position extends BaseModel
{
    // 指定数据表
    protected $table = 'work_custom_position';

    // 获取器【user_info】
    public function getDepartmentAttr($value, $data)
    {	$department[]=model('users')->getAllCount(['department' => $data['position_name']]);
        return $department;
    }

    public function getAll($where = [], $page_num = '', $page_limit = '')
    {

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['department']   = '';
        }

        return $data;
    }
}
