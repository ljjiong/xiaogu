<?php
namespace app\common\model;

/*
 *  【退货模型】
 */
class ReturnGoods extends BaseModel
{
    // 指定数据表
    protected $table = 'work_return_goods';

    //类型转换
    protected $type = [
        'id'              => 'integer',
        'type'            => 'integer',
        'user_id'         => 'integer',
        'order_id'        => 'integer',
        'order_goods_id'  => 'integer',
        'return_money'    => 'float',
        'imgs'            => 'json',
        'is_return_money' => 'integer',
        'status'          => 'integer',
        'data_state'      => 'integer',
    ];

    // 获取器【imgs】
    public function getImgsAttr($value, $data)
    {
        $imgs = json_decode($value);
        foreach ($imgs as $key => $img) {
            $imgs[$key] = show_upload_img($img);
        }

        return $imgs;
    }

    // 获取器【order_info】
    public function getOrderInfoAttr($value, $data)
    {
        return model('orders')->getOneBasic($data['order_id']);
    }

    // 获取器【return_goods_info】
    public function getReturnGoodsInfoAttr($value, $data)
    {
        return model('order_goods')->getOne($data['order_goods_id']);
    }

    // 初始化
    protected static function init()
    {
        // 退款
        self::beforeInsert(function ($model) {
            $model->return_order_no = make_order_no('G');

            $order = model('orders')->getOne($model->order_id);
            if ($order) {
                if (count($order['order_goods_info']) == 1) {
                    $model->return_money = $order['total_money'];
                } else {
                    $order_goods         = model('order_goods')->getOne($model->order_goods_id);
                    $model->return_money = $order_goods['real_price'];
                }
            }

            model('orders')->editOne(['id' => $model->order_id, 'is_has_return_goods' => 1, 'is_deal_return_goods' => 0]);
            model('order_goods')->editOne(['id' => $model->order_goods_id, 'return_goods_status' => 1]);
        });

        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['imgs'])) {
                $model->imgs = base64_to_img(json_decode($model->data['imgs'], true));
            } else {
                $model->imgs = [];
            }
        });
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('update_time desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('update_time desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['order_info']        = '';
            $data[$key]['return_goods_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['order_info']        = '';
            $data['return_goods_info'] = '';
        }

        return $data;
    }
}
