<?php
namespace app\common\model;

/*
 *  【数据字典模型】
 */
class File extends BaseModel
{
    // 指定数据表
    protected $table = 'work_company_file';

    protected $type = [
        'id'             => 'integer',
        'project_member' => 'json',
        'data_state'     => 'integer',
    ];


    //查询用户
    public function getUsersAttr($value, $data)
    {
        return model('admins')->getOne($data['uid']);
    }

    // 获取器【thum】
    public function getProjectMembersAttr($value, $data)
    {
        return model('users')->getColumn(['id' => ['in', $data['project_member']]], 'nick_name');
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
            $data[$key]['users']           = '';
            $data[$key]['project_members'] = '';
        }

        return $data;
    }
}
