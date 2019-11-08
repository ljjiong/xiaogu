<?php
namespace app\common\model;

/*
 *  【会员模型】
 */
class Commonality extends BaseModel
{
    // 指定数据表
    protected $table = 'work_commonality';

    public function get_groups_All($where=[],$field){

        $data = $this->where($where)->order('id desc')->field('type')->group($field)->select();
        return $data;
    }

    // 获取器【type_name】
    public function getTypeNameAttr($value, $data)
    {
        $category = model('categories')->getOne($data['type_id']);
        return $category ? $category['name'] : '';
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
            $data[$key]['type_name'] = '';
        }

        return $data;
    }
}
