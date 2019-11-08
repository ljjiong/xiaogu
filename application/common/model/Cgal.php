<?php
namespace app\common\model;

/*
 *  【文章模型】
 */
class Cgal extends BaseModel
{
    // 指定数据表
    protected $table = 'work_cgal';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'imgs'       => 'json',
        'type_id'    => 'integer',
        'click_num'  => 'integer',
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

    // 获取器【content】
    public function getContentAttr($value, $data)
    {
        $data_value = htmlspecialchars_decode($value);
        $str        = 'src="' . get_host() . '/public/upload/ueditor';
        $real_value = str_replace('src="/public/upload/ueditor', $str, $data_value);
        return $real_value;
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
