<?php
namespace app\common\model;

/*
 *  【营销活动模型】
 */
class MarketActivities extends BaseModel
{
    // 指定数据表
    protected $table = 'work_market_activities';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'imgs'       => 'json',
        'status'     => 'integer',
        'data_state' => 'integer',
    ];

    // 获取器【thum】
    public function getThumAttr($value, $data)
    {
        return show_upload_img($value);
    }

    // 获取器【imgs】
    public function getImgsAttr($value, $data)
    {
        $imgs = json_decode($value);
        foreach ($imgs as $key => $img) {
            $imgs[$key] = show_upload_img($img);
        }

        return $imgs;
    }

    // 获取器【rule_info】
    public function getRuleInfoAttr($value, $data)
    {
        if ($data['type'] == 'discount') {
            $rules = model('activity_discount_rules')->getAll(['market_activity_id' => $data['id'], 'status' => 1]);
        } elseif ($data['type'] == 'full') {
            $rules = model('activity_full_rules')->getAll(['market_activity_id' => $data['id'], 'status' => 1]);
        } elseif ($data['type'] == 'coupon') {
            $rules = model('activity_coupons')->getAll(['market_activity_id' => $data['id'], 'status' => 1]);
        } else {
            $rules = '';
        }

        return $rules;
    }

    // 获取器【end_timestamp】
    public function getEndTimestampAttr($value, $data)
    {
        return strtotime($data['end_time']);
    }

    // 获取器【content】
    public function getContentAttr($value, $data)
    {
        $data_value = htmlspecialchars_decode($value);
        $str        = 'src="' . get_host() . '/public/upload/ueditor';
        $real_value = str_replace('src="/public/upload/ueditor', $str, $data_value);
        return $real_value;
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['thum'])) {
                $model->thum = base64_to_img([$model->data['thum']], 200, 200)[0];
            }

            if (isset($model->data['imgs'])) {
                $model->imgs = base64_to_img(json_decode($model->data['imgs'], true));
            }
        });
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        $this->auto_deal_expire();

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['rule_info']     = '';
            $data[$key]['end_timestamp'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $this->auto_deal_expire();

        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['rule_info']     = '';
            $data['end_timestamp'] = '';
        }

        return $data;
    }

    // 删除数据（假删除）
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $discount_rule_ids = model('activity_discount_rules')->getColumn(['market_activity_id' => $id], 'id');
            model('activity_discount_rules')->delAll($discount_rule_ids);
            $full_rule_ids = model('activity_full_rules')->getColumn(['market_activity_id' => $id], 'id');
            model('activity_full_rules')->delAll($full_rule_ids);
            $coupon_ids = model('activity_coupons')->getColumn(['market_activity_id' => $id], 'id');
            model('activity_coupons')->delAll($coupon_ids);

            return ['code' => 1, 'data' => [], 'msg' => '删除数据成功'];
        }
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $discount_rule_ids = model('activity_discount_rules')->getColumn(['market_activity_id' => ['in', $ids]], 'id');
            model('activity_discount_rules')->delAll($discount_rule_ids);
            $full_rule_ids = model('activity_full_rules')->getColumn(['market_activity_id' => ['in', $ids]], 'id');
            model('activity_full_rules')->delAll($full_rule_ids);
            $coupon_ids = model('activity_coupons')->getColumn(['market_activity_id' => ['in', $ids]], 'id');
            model('activity_coupons')->delAll($coupon_ids);

            return ['code' => 1, 'data' => [], 'msg' => '批量删除数据成功'];
        }
    }

    // 获取活动详细信息（含会员信息）
    public function getActivityInfo($user_id, $money, $goods_ids)
    {
        // 获取会员等级ID
        $user_level = model('user_levels')->getOneByUserId($user_id);
        if ($user_level) {
            $user_level_id = $user_level['id'];
        } else {
            $user_level_id = 0;
        }

        $data = [];

        $now = date('Y-m-d H:i:s');
        $map = [
            'type'       => ['in', 'discount,full'],
            'begin_time' => ['<= time', $now],
            'end_time'   => ['> time', $now],
            'status'     => 1,
        ];
        $activities = model('market_activities')->getAll($map);

        foreach ($activities as $key => $activity) {
            // 限时折扣活动
            if ($activity['type'] == 'discount') {
                $discount_rules = model('activity_discount_rules')->getAllBasicInfo(['market_activity_id' => $activity['id'], 'goods_id' => ['in', $goods_ids]]);
                foreach ($discount_rules as $key1 => $discount) {
                    if (in_array($user_level_id, $discount['user_level_ids'])) {
                        $data['discount'][] = $discount;
                    }
                }
            }

            // 满减促销活动
            if ($activity['type'] == 'full') {
                $full_rules = model('activity_full_rules')->getAllBasicInfo(['market_activity_id' => $activity['id'], 'full_money' => ['<=', $money], 'status' => 1]);
                foreach ($full_rules as $key1 => $full) {
                    if (in_array($user_level_id, $full['user_level_ids'])) {
                        $data['full'][] = $full;
                    }
                }
            }
        }

        // 优惠券
        $map = [
            'expiry_time' => ['> time', $now],
            'status'      => 1,
            'reach_money' => ['<=', $money],
            'user_id'     => $user_id,
        ];
        $user_coupons = model('user_coupons')->getAll($map);
        if ($user_coupons) {
            $data['coupon'] = $user_coupons;
        }

        return $data;
    }

    /**
     * 【admin】处理过期的活动
     */
    private function auto_deal_expire()
    {
        $map = [
            'status'   => 1,
            'end_time' => ['<= time', date('Y-m-d H:i:s')],
        ];
        model('market_activities')->where($map)->update(['status' => 2]);
    }
}
