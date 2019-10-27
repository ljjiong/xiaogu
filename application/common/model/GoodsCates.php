<?php
namespace app\common\model;

/*
 *  【商品分类模型】
 */
class GoodsCates extends BaseModel
{
    // 指定数据表
    protected $table = 'work_goods_cates';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'pid'        => 'integer',
        'sort'       => 'integer',
        'status'     => 'integer',
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

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('sort desc,id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('sort desc,id desc')->select();
        }

        return $data;
    }

    // 查询全部(tree)
    public function getAllTree()
    {
        $data = $this->order('sort desc,id desc')->select();
        return json_decode(json_encode($data), true);
    }

    // 查询全部(tree)
    public function getAllTreeUser()
    {
        $data = $this->where(['status' => 1])->order('sort desc,id desc')->select();
        return json_decode(json_encode($data), true);
    }
}
