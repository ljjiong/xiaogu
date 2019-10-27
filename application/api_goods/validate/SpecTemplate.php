<?php
namespace app\api_goods\validate;

use think\Validate;

class SpecTemplate extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '规格模板ID不能为空'],
        ['name', 'require|max:255|checkValue:name', '规格模板名称不能为空|规格模板名称最大限255字符'],
        ['content', 'require|array|checkValue:content', '模板值不能为空|模板值格式非法'],
        ['sort', 'number', '模板排序值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'content', 'sort'],
        'update' => ['name', 'content', 'sort', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'name':
                if ($this->currentScene == 'create') {
                    $spec_template = model('spec_templates')->findOne(['name' => $value]);
                } elseif ($this->currentScene == 'update') {
                    $spec_template = model('spec_templates')->findOne(['name' => $value, 'id' => ['neq', $id]]);
                } else {
                    return '验证场景不存在';
                }

                if ($spec_template) {
                    return '模板名称已存在';
                } else {
                    return true;
                }
                break;
            case 'content':
                $content_names = [];
                foreach ($value as $v) {
                    if (in_array($v['name'], $content_names)) {
                        return '模板值名称不能重复，【' . $v['name'] . '】已存在';
                        break;
                    }
                    array_push($content_names, $v['name']);

                    if (count($v['options']) !== count(array_unique($v['options']))) {
                        return '模板值【' . $v['name'] . '】名称下的选项值含有重复选项';
                        break;
                    }
                }
                return true;
                break;
            case 'id':
                $spec_template = model('spec_templates')->getOne($value);
                if ($spec_template) {
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
