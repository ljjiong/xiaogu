<?php
namespace app\common\model;

/*
 *  【会员模型】
 */
class Users extends BaseModel
{
    // 指定数据表
    protected $table = 'work_users';

    //类型转换
    protected $type = [
        'id'                   => 'integer',
        'gender'               => 'integer',
        'distributor_level_id' => 'integer',
        'parent_id'            => 'integer',
        'role_ids'             => 'json',
        'is_distributor'       => 'boolean',
        'is_bonus'             => 'boolean',
        'bonus_level_id'       => 'integer',
        'status'               => 'integer',
        'keep_sign_in_num'     => 'integer',
        'total_sign_in_num'    => 'integer',
        'data_state'           => 'integer',
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

    // 获取器【record】  档案
    public function getRecordAttr($value, $data)
    {
        return model('record')->findOne(['uid' => $data['id']]);
    }

    // 获取器【user_level】
    public function getUserLevelAttr($value, $data)
    {
        $level_info = model('user_levels')->getOneByUserId($data['id']);
        return $level_info ? $level_info['name'] : '';
    }

    // 获取器【user_level_id】
    public function getUserLevelIdAttr($value, $data)
    {
        $level_info = model('user_levels')->getOneByUserId($data['id']);
        return $level_info ? $level_info['id'] : '';
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['avatar'])) {
                $model->avatar = base64_to_img([$model->data['avatar']], 200, 200)[0];
            }

            // 处理省份
            if (isset($model->data['province_code'])) {
                if ($model->data['province_code']) {
                    $json            = file_get_contents('extend/china_regions/province_object.json');
                    $arr             = json_decode($json, true);
                    $model->province = $arr[$model->data['province_code']]['name'];
                }
            }

            // 处理城市
            if (isset($model->data['city_code'])) {
                if ($model->data['city_code']) {
                    $json        = file_get_contents('extend/china_regions/city_object.json');
                    $arr         = json_decode($json, true);
                    $model->city = $arr[$model->data['city_code']]['name'];
                }
            }

            // 处理地区
            if (isset($model->data['area_code'])) {
                if ($model->data['area_code']) {
                    $json        = file_get_contents('extend/china_regions/area_object.json');
                    $arr         = json_decode($json, true);
                    $model->area = $arr[$model->data['area_code']]['name'];
                }
            }
        });
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
            $data[$key]['user_level']    = '';
            $data[$key]['user_level_id'] = '';
            $data[$key]['record'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $this->deal_keep_sign_in($id);

        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_level']    = '';
            $data['user_level_id'] = '';
        }

        return $data;
    }

    // 处理连续签到
    private function deal_keep_sign_in($id)
    {
        $user = $this->where('id', $id)->find();

        $last_sign_in_timestamp = strtotime(date('Y-m-d', strtotime($user['last_sign_in_time'])));
        $today_timestamp        = strtotime(date('Y-m-d'));

        $day_num = ($today_timestamp - $last_sign_in_timestamp) / 86400;
        if ($day_num > 1) {
            $this->where('id', $id)->update(['keep_sign_in_num' => 0]);
        }
    }

    // 根据guid获取会员信息
    public function getOneByGuid($guid)
    {
        $user_account = model('user_accounts')->findOne(['guid' => $guid]);
        if ($user_account) {
            return $this->getOne($user_account['user_id']);
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
            model('user_accounts')->delAllByUserIds([$id]);
            return ['code' => 1, 'data' => [], 'msg' => '删除会员成功'];
        }
    }

    // 删除数据（真删除）
    public function delOneTrue($id)
    {
        $result = $this->where('id', $id)->delete();
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            model('user_accounts')->delAllByUserIds([$id]);
            return ['code' => 1, 'data' => [], 'msg' => '删除会员成功'];
        }
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            model('user_accounts')->delAllByUserIds($ids);
            return ['code' => 1, 'data' => [], 'msg' => '删除会员成功'];
        }
    }

    // 获取会员基本信息
    public function getUserBasicInfo($user_id)
    {
        $data = $this->where('id', $user_id)->field('id,mobile,nick_name,avatar')->find();
        return $data ? $data : [];
    }

    public function getOneParent($user_id)
    {
        $user = $this->getOne($user_id);
        if ($user) {
            return $user['parent_id'] ? $user['parent_id'] : 0;
        } else {
            return 0;
        }
    }

    // 查询全部(tree)
    public function getAllTree($where = [])
    {
        $data = $this->where($where)->select();
        foreach ($data as $key => $value) {
            $data[$key]['user_info'] = model('user_info')->getOne($value['id']);
        }

        return json_decode(json_encode($data), true);
    }
}
