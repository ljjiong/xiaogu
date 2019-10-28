<?php
namespace app\api_goods\validate;

use think\Validate;

class Goods extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '产品ID不能为空'],
        ['goods_cate_id', 'require|checkValue:goods_cate_id', '产品类别不能为空'],
        ['goods_no', 'max:50', '产品编码限50字符'],
        ['goods_code', 'max:50', '产品条码限50字符'],
        ['is_virtual', 'require|in:0,1', '是否为虚拟产品不能为空|是否为虚拟产品值非法'],
        ['name', 'require|max:255', '产品名称不能为空|产品名称最大限255字符'],
        ['standard', 'max:255', '产品规格最大限255字符'],
        ['stock', 'number|>=:0', '产品库存数量值必须为数值|产品库存不能小于0'],
        ['weight', 'number|>=:0', '产品重量必须为数值|产品重量不能小于0'],
        ['cost_price', 'number|>=:0', '产品成本价必须为数值|产品成本价不能小于0'],
        // ['sell_price', 'number|>=:0', '产品销售价必须为数值数|产品销售价不能小于0'],
        ['market_price', 'number|>=:0', '产品市场价必须为数值|产品市场价不能小于0'],
        ['red_price', 'number|>=:0', '产品红包价必须为数值|产品红包价不能小于0'],
        ['sell_num', 'number|>=:0', '产品销售量必须为整数|产品销售量不能小于0'],
        ['click_num', 'number|>=:0', '产品点击量必须为整数|产品点击量不能小于0'],
        ['collect_num', 'number|>=:0', '产品收藏量必须为整数|产品收藏量不能小于0'],
        ['sort', 'number|>=:0', '产品排序值必须为整数|产品排序值不能小于0'],
        ['is_top', 'in:0,1', '是否置顶产品不能为空|是否置顶产品值非法'],
        ['score', 'in:1,2,3,4,5', '产品综合评分不能为空|产品综合评分值非法'],
        ['status', 'in:1,2', '产品状态不能为空|产品状态值非法'],
        // ['attr_info', 'array|checkValue:attr_info', '属性模板信息格式非法'],
        // ['spec_info', 'array|checkValue:spec_info', '规格模板信息格式非法'],
        ['spec_group_info', 'array', '规格组合信息格式非法'],
        ['freight_template_id', 'require|checkValue:freight_template_id', '运费模板值不能为空'],
    ];

    protected $scene = [
        'create' => ['goods_cate_id', 'goods_no', 'goods_code', 'is_virtual', 'name', 'standard', 'stock', 'weight', 'cost_price', 'sell_price', 'market_price', 'red_price', 'sell_num', 'click_num', 'collect_num', 'sort', 'is_top', 'score', 'status', 'attr_info', 'spec_info', 'spec_group_info', 'freight_template_id'],
        'update' => ['goods_cate_id', 'goods_no', 'goods_code', 'is_virtual', 'name', 'standard', 'stock', 'weight', 'cost_price', 'sell_price', 'market_price', 'red_price', 'sell_num', 'click_num', 'collect_num', 'sort', 'is_top', 'score', 'status', 'attr_info', 'spec_info', 'spec_group_info', 'freight_template_id', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $is_virtual = input('is_virtual');

        switch ($rule) {
            case 'goods_cate_id':
                $goods_cate = model('goods_cates')->getOne($value);
                if ($goods_cate) {
                    return true;
                } else {
                    return '产品分类不存在';
                }
                break;
            case 'attr_info':
                $content_names = [];
                foreach ($value as $v) {
                    if (in_array($v['name'], $content_names)) {
                        return '属性模板信息中的名称不能重复，【' . $v['name'] . '】已存在';
                        break;
                    }
                    array_push($content_names, $v['name']);

                    if (count($v['options']) !== count(array_unique($v['options']))) {
                        return '属性模板信息中的【' . $v['name'] . '】名称下的选项值含有重复选项';
                        break;
                    }

                    if ($v['value']) {
                        if (!in_array($v['value'], $v['options'])) {
                            return '属性模板信息中的【' . $v['name'] . '】名称下的选中值不在候选项中';
                        }
                    }
                }
                return true;
                break;
            case 'spec_info':
                $content_names = [];
                foreach ($value as $v) {
                    if (in_array($v['name'], $content_names)) {
                        return '规格模板信息中的名称不能重复，【' . $v['name'] . '】已存在';
                        break;
                    }
                    array_push($content_names, $v['name']);

                    if (count($v['options']) !== count(array_unique($v['options']))) {
                        return '规格模板信息中的【' . $v['name'] . '】名称下的选项值含有重复选项';
                        break;
                    }
                }
                return true;
                break;
            case 'freight_template_id':
                if ($is_virtual == 1 && $value !== 0) {
                    return '虚拟产品无需设置运费';
                }
                if ($value) {
                    $freight_template = model('freight_templates')->getOne($value);
                    if ($freight_template) {
                        return true;
                    } else {
                        return '运费模板不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $goods = model('goods')->getOne($value);
                if ($goods) {
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
