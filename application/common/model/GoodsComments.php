<?php
namespace app\common\model;

/*
 *  【商品评论模型】
 */
class GoodsComments extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_goods_comments';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'order_id'   => 'integer',
        'goods_id'   => 'integer',
        'imgs'       => 'json',
        'status'     => 'integer',
        'data_state' => 'integer',
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

    // 获取器【order_goods_info】
    public function getOrderGoodsInfoAttr($value, $data)
    {
        return model('order_goods')->findOne(['order_id' => $data['order_id'], 'goods_id' => $data['goods_id']]);
    }

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 初始化
    protected static function init()
    {
        // 新增后更新评论状态
        self::afterInsert(function ($model) {
            $order_goods = model('order_goods')->findOne(['order_id' => $model->order_id, 'goods_id' => $model->goods_id]);
            if ($order_goods) {
                model('order_goods')->editOne(['id' => $order_goods['id'], 'is_comment' => 1]);
            }

            $no_comment_num = model('order_goods')->getAllCount(['order_id' => $model->order_id, 'return_goods_status' => 0, 'is_comment' => 0]);
            if ($no_comment_num == 0) {
                model('orders')->editOne(['id' => $model->order_id, 'is_comment' => 1]);
            }
        });

        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['imgs'])) {
                $model->imgs = base64_to_img(json_decode($model->data['imgs'], true));
            }

            // if (isset($model->content)) {
            //     $model->content = htmlentities(string)
            // }
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
            $data[$key]['order_goods_info'] = '';
            $data[$key]['user_info']        = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['order_goods_info'] = '';
            $data['user_info']        = '';
        }

        return $data;
    }
}
