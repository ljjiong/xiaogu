<?php
namespace app\common\model;

/*
 *  【管理员访问日志模型】
 */
class AdminVisitLogs extends BaseModel
{
    // 指定数据表
    protected $table = 'work_admin_visit_logs';

    //类型转换
    protected $type = [
        'id'               => 'integer',
        'admin_account_id' => 'integer',
        'admin_id'         => 'integer',
        'data_state'       => 'integer',
    ];

    // 获取器【guid】
    public function getGuidAttr($value, $data)
    {
        $admin_account = model('admin_accounts')->getOne($data['admin_account_id']);
        return $admin_account ? $admin_account['guid'] : '';
    }

    // 获取器【mobile】
    public function getMobileAttr($value, $data)
    {
        $admin = model('admins')->getOne($data['admin_id']);
        return $admin ? $admin['mobile'] : '';
    }

    // 获取器【nick_name】
    public function getNickNameAttr($value, $data)
    {
        $admin = model('admins')->getOne($data['admin_id']);
        return $admin ? $admin['nick_name'] : '';
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
            $data[$key]['guid']      = '';
            $data[$key]['mobile']    = '';
            $data[$key]['nick_name'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['guid']      = '';
            $data['mobile']    = '';
            $data['nick_name'] = '';
        }

        return $data;
    }

    // 新增数据
    public function addOneByGuid($guid, $client_type, $ip)
    {
        $admin_account = model('admin_accounts')->findOne(['guid' => $guid]);
        if ($admin_account) {

            $param = [
                'admin_account_id' => $admin_account['id'],
                'admin_id'         => $admin_account['admin_id'],
                'client_type'      => $client_type,
                'ip'               => $ip,
                'login_time'       => date('Y-m-d H:i:s'),
            ];

            $result = $this->save($param);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => $this->getOne($this->id), 'msg' => '添加管理员访问日志成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '管理员账号不存在'];
        }
    }
}
