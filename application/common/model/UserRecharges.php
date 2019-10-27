<?php
namespace app\common\model;

/*
 *  【会员充值模型】
 */
class UserRecharges extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_recharges';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'money'      => 'float',
        'is_pay'     => 'integer',
        'status'     => 'integer',
        'data_state' => 'integer',
    ];

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
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
            $data[$key]['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_info'] = '';
        }

        return $data;
    }

    // 初始化
    protected static function init()
    {
        self::beforeInsert(function ($model) {
            $model->order_no = make_order_no('R');
        });
    }
}
