<?php
namespace app\common\model;

/*
 *  【管理员模型】
 */
class Admins extends BaseModel
{
    // 指定数据表
    protected $table = 'work_admins';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'role_ids'   => 'json',
        'status'     => 'integer',
        'data_state' => 'integer',
    ];

    // 获取器【avatar】
    public function getAvatarAttr($value, $data)
    {
        if ($value) {
            return show_upload_img($value);
        } else {
            $config = model('config')->findOne(['name' => 'avatar']);
            return $config ? $config['value'] : '';
        }
    }

    // 获取器【guid】
    public function getGuidAttr($value, $data)
    {
        $admin_account = model('admin_accounts')->findOne(['admin_id' => $data['id']]);
        return $admin_account ? $admin_account['guid'] : '';
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['avatar'])) {
                $model->avatar = base64_to_img([$model->data['avatar']], 200, 200)[0];
            }
        });
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        $where['is_view'] = 1;
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['guid'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['guid'] = '';
        }

        return $data;
    }

    // 根据guid获取管理员信息
    public function getOneByGuid($guid)
    {
        $admin_account = model('admin_accounts')->findOne(['guid' => $guid]);
        if ($admin_account) {
            return $this->getOne($admin_account['admin_id']);
        } else {
            return [];
        }
    }

    // 删除数据（假删除）
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            model('admin_accounts')->delAllByAdminIds([$id]);
            return ['code' => 1, 'data' => [], 'msg' => '删除管理员成功'];
        }
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            model('admin_accounts')->delAllByAdminIds($ids);
            return ['code' => 1, 'data' => [], 'msg' => '删除管理员成功'];
        }
    }
}
