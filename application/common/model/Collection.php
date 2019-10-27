<?php
namespace app\common\model;

/*
 *  【收藏表】
 */
class Collection extends BaseModel
{
    // 指定数据表
    protected $table = 'work_collection';

    // 获取器【user_info】
    public function getMasterAttr($value, $data)
    {
        return model('users')->getOne($data['mid']);
    }

    public function getAll($where = [], $page_num = '', $page_limit = '')
    {

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['master'] = '';
        }

        return $data;
    }
}
