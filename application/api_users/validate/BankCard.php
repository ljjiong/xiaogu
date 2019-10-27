<?php
namespace app\api_users\validate;

use think\Validate;

class BankCard extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '会员资产ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['bank_name', 'require', '银行名称不能为空'],
        ['card_number', 'require', '银行卡号不能为空'],
        ['card_holder', 'require', '持卡人不能为空'],
    ];

    protected $scene = [
        'create' => ['user_id', 'bank_name', 'card_number', 'card_holder'],
        'update' => ['user_id', 'bank_name', 'card_number', 'card_holder', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员不存在';
                }
                break;
            case 'id':
                $bank_card = model('bank_cards')->getOne($value);
                if ($bank_card) {
                    return true;
                } else {
                    return '银行卡数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
