<?php
namespace app\common\model;

/*
 *  【会员认证模型】
 */
class UserAuths extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_auths';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'imgs'       => 'json',
        'status'     => 'integer',
        'data_state' => 'integer',
    ];

    // 获取器【id_card_front_img】
    public function getIdCardFrontImgAttr($value)
    {
        return show_upload_img($value);
    }

    // 获取器【id_card_back_img】
    public function getIdCardBackImgAttr($value)
    {
        return show_upload_img($value);
    }

    // 获取器【imgs】
    public function getImgsAttr($value)
    {
        $imgs = json_decode($value);
        foreach ($imgs as $key => $img) {
            $imgs[$key] = show_upload_img($img);
        }

        return $imgs;
    }

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->id_card_front_img) && $model->id_card_front_img) {
                $model->id_card_front_img = isset($model->data['id_card_front_img']) ? deal_upload_img([$model->data['id_card_front_img']], 400)[0] : '';
            }

            if (isset($model->id_card_back_img) && $model->id_card_back_img) {
                $model->id_card_back_img = isset($model->data['id_card_back_img']) ? deal_upload_img([$model->data['id_card_back_img']], 400)[0] : '';
            }

            if (isset($model->imgs) && $model->imgs) {
                $model->imgs = isset($model->data['imgs']) ? deal_upload_img(json_decode($model->data['imgs'], true)) : [];
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
}
