<?php
namespace app\common\model;

/*
 *  【项目模型】
 */
class Performance extends BaseModel
{
    //类型转换
    protected $type = [
        'id'          => 'integer',
        'departments' => 'json',
        'publics'     => 'json',
    ];
    // 指定数据表
    protected $table = 'work_performance';

    public function getUsersAttr($value, $data)
    {
        return model('users')->getOne($data['uid']);
    }
    public function getAdminsAttr($value, $data)
    {
        return model('admins')->getOne($data['aid']);
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
            $data[$key]['admins'] = '';
            $data[$key]['users']  = '';
        }

        return $data;
    }

}
