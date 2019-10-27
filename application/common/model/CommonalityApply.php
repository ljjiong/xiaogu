<?php
namespace app\common\model;

/*
 *  【会员模型】
 */
class CommonalityApply extends BaseModel
{
    // 指定数据表
    protected $table = 'work_commonality_applys';

    public function getUsersAttr($value, $data)
    {
        return model('users')->getOne($data['uid']);
    }
    public function getComAttr($value, $data)
    {
        return model('commonality')->getOne($data['comid']);
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
            $data[$key]['com']   = '';
        }

        return $data;
    }
}
