<?php
namespace app\common\model;

/*
 *  【项目模型】
 */
class ProjectDetail extends BaseModel
{
    // 指定数据表
    protected $table = 'work_project_detail';

    //类型转换
    protected $type = [
        'project_member' => 'json',
    ];

    

    public function getProjectMembersAttr($value, $data)
    {
        return model('users')->getColumn(['id' => ['in', $data['project_member']]], 'nick_name');
    }

    public function getProjectManagersAttr($value, $data)
    {
        return model('users')->getOne($data['project_manager']);
    }

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
            $data[$key]['project_members']  = '';
            $data[$key]['users']            = '';
            $data[$key]['project_managers'] = '';

        }

        return $data;
    }

}
