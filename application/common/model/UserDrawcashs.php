<?php
namespace app\common\model;

/*
 *  【会员提现模型】
 */
class UserDrawcashs extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_drawcashs';

    //类型转换
    protected $type = [
        'id'           => 'integer',
        'user_id'      => 'integer',
        'money'        => 'float',
        'bank_card_id' => 'integer',
        'is_pay'       => 'integer',
        'status'       => 'integer',
        'data_state'   => 'integer',
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
            $model->order_no = make_order_no('D');
        });

        // 新增或更新时处理银行卡号
        self::beforeWrite(function ($model) {
            if (isset($model->data['bank_card_id']) && $model->data['bank_card_id']) {
                $bank_card = model('bank_cards')->getOne($model->data['bank_card_id']);

                $model->bank_name   = $bank_card['bank_name'];
                $model->card_number = $bank_card['card_number'];
                $model->card_holder = $bank_card['card_holder'];
            }
        });
    }
}
