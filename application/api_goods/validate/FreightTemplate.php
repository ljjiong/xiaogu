<?php
namespace app\api_goods\validate;

use think\Validate;

class FreightTemplate extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '运费模板ID不能为空'],
        ['name', 'require|max:255|checkValue:name', '运费模板名称不能为空|运费模板名称最大限255字符'],
        ['type', 'require|in:1,2', '计费方式不能为空|计费方式值非法'],
        ['basic_value', 'require|number|>:0', '基本值不能为空|基本值必须为整数或小数|基本值必须大于0'],
        ['basic_price', 'require|number|>:0', '基本价格不能为空|基本价格必须为整数或小数|基本价格必须大于0'],
        ['add_value', 'require|number|>:0', '增加值不能为空|增加值必须为整数或小数|增加值必须大于0'],
        ['add_price', 'require|number|>:0', '增加价格不能为空|增加价格必须为整数或小数|增加价格必须大于0'],
        ['content', 'array|checkValue:content', '特殊地区运费值格式非法'],
        ['sort', 'number', '模板排序值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'type', 'basic_value', 'basic_price', 'add_value', 'add_price', 'content', 'sort'],
        'update' => ['name', 'type', 'basic_value', 'basic_price', 'add_value', 'add_price', 'content', 'sort', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'name':
                if ($this->currentScene == 'create') {
                    $freight_template = model('freight_templates')->findOne(['name' => $value]);
                } elseif ($this->currentScene == 'update') {
                    $freight_template = model('freight_templates')->findOne(['name' => $value, 'id' => ['neq', $id]]);
                } else {
                    return '验证场景不存在';
                }

                if ($freight_template) {
                    return '模板名称已存在';
                } else {
                    return true;
                }
                break;
            case 'content':
                $area_codes = [];
                foreach ($value as $k => $v) {
                    if (!is_numeric($v['basic_value'])) {
                        return '【新增配送区域' . ($k + 1) . '】基本值必须为整数或小数';
                        break;
                    }

                    if ($v['basic_value'] <= 0) {
                        return '【新增配送区域' . ($k + 1) . '】基本值大于0';
                        break;
                    }

                    if (!is_numeric($v['basic_price'])) {
                        return '【新增配送区域' . ($k + 1) . '】基本价格必须为整数或小数';
                        break;
                    }

                    if ($v['basic_price'] <= 0) {
                        return '【新增配送区域' . ($k + 1) . '】基本价格必须大于0';
                        break;
                    }

                    if (!is_numeric($v['add_value'])) {
                        return '【新增配送区域' . ($k + 1) . '】增加值必须为整数或小数';
                        break;
                    }

                    if ($v['add_value'] <= 0) {
                        return '【新增配送区域' . ($k + 1) . '】增加值大于0';
                        break;
                    }

                    if (!is_numeric($v['add_price'])) {
                        return '【新增配送区域' . ($k + 1) . '】增加价格必须为整数或小数';
                        break;
                    }

                    if ($v['add_price'] <= 0) {
                        return '【新增配送区域' . ($k + 1) . '】增加价格必须大于0';
                        break;
                    }

                    if (count($v['area_codes']) !== count(array_unique($v['area_codes']))) {
                        return '【新增配送区域' . ($k + 1) . '】下的地区值含有重复选项';
                        break;
                    }

                    foreach ($v['area_codes'] as $k1 => $v1) {
                        if (in_array($v1, $area_codes)) {
                            return '地区值【' . $v1 . '】的运费被重复设置';
                            break 2;
                        }
                        array_push($area_codes, $v1);
                    }
                }
                return true;
                break;
            case 'id':
                $freight_template = model('freight_templates')->getOne($value);
                if ($freight_template) {
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
