<?php
namespace app\common\model;

/*
 *  【优惠券模型】
 */
class ActivityCoupons extends BaseModel
{
    // 指定数据表
    protected $table = 'work_activity_coupons';

    //类型转换
    protected $type = [
        'id'                 => 'integer',
        'market_activity_id' => 'integer',
        'reach_money'        => 'float',
        'change_value'       => 'float',
        'issue_num'          => 'integer',
        'use_num'            => 'integer',
        'status'             => 'integer',
        'data_state'         => 'integer',
    ];

    // 获取器【activity_name】
    public function getActivityNameAttr($value, $data)
    {
        $activity = model('market_activities')->getOne($data['market_activity_id']);
        return $activity ? $activity['name'] : '';
    }

    // 初始化
    protected static function init()
    {
        // 新增时创建优惠券编号
        self::beforeInsert(function ($model) {
            $model->coupon_no = make_order_no('C');
        });
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        $this->autoUpdateStatus();

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['activity_name'] = '';

        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['activity_name'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function updateUseNum($id, $num)
    {
        $result = $this->where('id', $id)->setInc('use_num', $num);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [$this->getOne($id)], 'msg' => '更新数据成功'];
        }
    }

    // 更新失效优惠券状态为下线
    public function autoUpdateStatus()
    {
        $now = date('Y-m-d H:i:s');
        $map = [
            'expiry_time' => ['<= time', $now],
            'status'      => 1,
        ];

        $this->where($map)->update(['status' => 2]);
    }
}
