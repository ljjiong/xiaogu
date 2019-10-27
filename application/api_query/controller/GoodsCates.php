<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class GoodsCates extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【admin】根据商品分类查询模板
     */
    public function template(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('template');
        if ($validate->check($data)) {
            $goods_cate       = model('goods_cates')->getOne($data['goods_cate_id']);
            $spec_template_id = $goods_cate['spec_template_id'];
            $attr_template_id = $goods_cate['attr_template_id'];

            if ($spec_template_id) {
                $goods_cate['spec_template']          = model('spec_templates')->getOne($spec_template_id);
                $goods_cate['spec_template']['names'] = model('spec_names')->getAll(['spec_template_id' => $spec_template_id]);
            } else {
                $goods_cate['spec_template'] = (object) [];
            }

            if ($attr_template_id) {
                $goods_cate['attr_template']          = model('attr_templates')->getOne($attr_template_id);
                $goods_cate['attr_template']['names'] = model('attr_names')->getAll(['attr_template_id' => $attr_template_id]);
            } else {
                $goods_cate['attr_template'] = (object) [];
            }

            $this->data['data'] = $goods_cate;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
}
