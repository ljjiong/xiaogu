<?php
namespace app\common\model;

/*
 *  【商品标签模型】
 */
class GoodsTags extends BaseModel
{
    // 指定数据表
    protected $table = 'work_goods_tags';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'sort'       => 'integer',
        'data_state' => 'integer',
    ];

    // 获取器【thum】
    public function getThumAttr($value, $data)
    {
        return show_upload_img($value);
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['thum'])) {
                $model->thum = base64_to_img([$model->data['thum']], 200, 200)[0];
            }
        });
    }
}
