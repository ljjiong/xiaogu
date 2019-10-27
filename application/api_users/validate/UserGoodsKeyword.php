<?php
namespace app\api_users\validate;

use think\Validate;

class UserGoodsKeyword extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['keywords', 'array', '历史搜索关键词值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'keywords'],
        'update' => ['user_id', 'keywords'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    $user_goods_keyword = model('user_goods_keywords')->getOne($value);
                    if ($this->currentScene == 'create') {
                        if ($user_goods_keyword) {
                            return '会员历史搜索关键词数据已存在';
                        }
                    } elseif ($this->currentScene == 'update') {
                        if (!$user_goods_keyword) {
                            return '会员历史搜索关键词数据不存在';
                        }
                    }

                    return true;
                } else {
                    return '会员不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
