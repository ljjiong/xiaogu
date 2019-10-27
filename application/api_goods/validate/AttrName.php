<?php
namespace app\api_goods\validate;

use think\Validate;

class AttrName extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '属性名称ID不能为空'],
        ['attr_template_id', 'require|checkValue:attr_template_id', '属性模板ID不能为空'],
        ['name', 'require|max:255', '属性名称不能为空|属性名称最大限255字符'],
        ['sort', 'require|number', '属性排序不能为空|属性排序值必须为整数'],
        ['options', 'require|array', '属性值不能为空|属性值数据格式错误'],
    ];

    protected $scene = [
        'create' => ['attr_template_id', 'name', 'sort', 'options'],
        'update' => ['attr_template_id', 'name', 'sort', 'options', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'attr_template_id':
                $attr_template = model('attr_templates')->getOne($value);
                if ($attr_template) {
                    return true;
                } else {
                    return '属性模板不存在';
                }
                break;
            case 'id':
                $attr_name = model('attr_names')->getOne($value);
                if ($attr_name) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
