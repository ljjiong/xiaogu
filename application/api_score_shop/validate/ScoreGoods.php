<?php
namespace app\api_score_shop\validate;

use think\Validate;

class ScoreGoods extends Validate
{
    protected $rule = [
        ['goods_id', 'require', '商品ID不能为空'],
        ['score', 'require', '积分值不能为空'],
        ['money', 'require', '金额值不能为空'],
        ['sort', 'require|number|>=:0', '排序值不能为空|排序值必须为整数|排序值不能小于0'],
        ['status', 'require|in:1,2', '状态值不能为空|状态值非法'],
        ['spec_group_info', 'array', '规格组合信息值非法'],
    ];

    protected $scene = [
        'update' => ['goods_id', 'score', 'money', 'sort', 'status', 'spec_group_info'],
    ];
}
