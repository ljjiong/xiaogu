<?php
namespace app\api_articles\validate;

use think\Validate;

class Banner extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '轮播图ID不能为空'],
        ['type_id', 'require|checkValue:type_id', '轮播图类别不能为空'],
        ['name', 'require|max:255', '轮播图名称不能为空|轮播图名称最大限255字符'],
        ['alt', 'max:255', '轮播图alt属性限255字符'],
        ['position', 'max:50', '轮播图位置限50字符'],
        ['is_open_model', 'in:0,1', '是否开启模型状态值非法'],
        ['status', 'in:1,2', '轮播图状态值非法'],
    ];

    protected $scene = [
        'create' => ['type_id', 'name', 'alt', 'position', 'is_open_model', 'status'],
        'update' => ['type_id', 'name', 'alt', 'position', 'status', 'is_open_model', 'id'],
    ];

    protected function checkValue($value, $rule, $data)
    {
        switch ($rule) {
            case 'type_id':
                // 轮播图分类树根ID为9
                $is_has = is_cate_child(9, $value);
                if (!$is_has) {
                    return '轮播图类别不存在';
                }
                break;
            case 'id':
                $banner = model('banners')->getOne($value);
                if (!$banner) {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }

        return true;
    }
}
