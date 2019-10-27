<?php
namespace app\common\model;

/*
 *  【商品规格模板模型】
 */
class SpecTemplates extends BaseModel
{
    // 指定数据表
    protected $table = 'work_spec_templates';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'content'    => 'json',
        'sort'       => 'integer',
        'data_state' => 'integer',
    ];

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('sort desc,id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('sort desc,id desc')->select();
        }

        return $data;
    }
}
