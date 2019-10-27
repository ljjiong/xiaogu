<?php
namespace app\api_goods\validate;

use think\Validate;

class GoodsCate extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '商品分类ID不能为空'],
        ['name', 'require|max:255', '商品分类名称不能为空|商品分类名称最大限255字符'],
        ['pid', 'require|checkValue:pid', '商品分类父ID不能为空'],
        ['status', 'require|in:1,2', '商品分类状态值不能为空|商品分类状态值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'pid', 'status'],
        'update' => ['name', 'pid', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'pid':
                if ($value) {
                    $goods_cate = model('goods_cates')->findOne(['id' => $value]);
                    if ($goods_cate) {
                        // 不能自己作为自己的父分类
                        if ($id) {
                            if ($value == $id) {
                                return '商品分类父ID不能为自身ID';
                            }
                        }

                        // 最多限两级分类
                        $result = goods_cate_level_limit($id, $value, 2);
                        if (!$result) {
                            return '商品分类最多限2级';
                        }

                        return true;
                    } else {
                        return '商品分类父ID不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $goods_cate = model('goods_cates')->getOne($value);
                if ($goods_cate) {
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
