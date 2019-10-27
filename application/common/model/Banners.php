<?php
namespace app\common\model;

/*
 *  【轮播图模型】
 */
class Banners extends BaseModel
{
    // 指定数据表
    protected $table = 'work_banners';

    //类型转换
    protected $type = [
        'id'            => 'integer',
        'type_id'       => 'integer',
        'status'        => 'integer',
        'is_open_model' => 'boolean',
        'model_id'      => 'integer',
        'data_state'    => 'integer',
    ];

    // 获取器【img】
    public function getImgAttr($value, $data)
    {
        return show_upload_img($value);
    }

    // 获取器【type_name】
    public function getTypeNameAttr($value, $data)
    {
        $category = model('categories')->getOne($data['type_id']);
        return $category ? $category['name'] : '';
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['img'])) {
                $model->img = base64_to_img([$model->data['img']])[0];
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
            $data[$key]['type_name'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['type_name'] = '';
        }

        return $data;
    }
}
