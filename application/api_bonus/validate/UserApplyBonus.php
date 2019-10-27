<?php
namespace app\api_bonus\validate;

use think\Validate;

class UserApplyBonus extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['parent_bonus_mobile', 'checkValue:parent_bonus_mobile'],
    ];

    protected $scene = [
        // 'update' => ['user_id', 'parent_bonus_mobile'],
        'update' => [],
    ];

    protected function checkValue($value, $rule)
    {
        $parent_bonus_mobile = input('parent_bonus_mobile');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    if ($parent_bonus_mobile == $user['mobile']) {
                        return '不可将您自己的手机号设为父分红商手机号';
                    }

                    $apply = model('user_apply_bonus', 'bonus_model')->findOne(['user_id' => $value]);
                    if ($apply) {
                        if ($apply['status'] == 3) {
                            return '您已是分红商';
                        } elseif ($apply['status'] == 1) {
                            return '您已提交申请信息，请等待审核';
                        } else {
                            return true;
                        }
                    } else {
                        return true;
                    }
                } else {
                    return '会员不存在';
                }
                break;
            case 'parent_bonus_mobile':
                if ($value) {
                    $user = model('users')->findOne(['mobile' => $value, 'is_bonus' => 1]);
                    if ($user) {
                        return true;
                    } else {
                        return '父分红商手机号不存在';
                    }
                } else {
                    return true;
                }
                break;
            default:
                # code...
                break;
        }
    }
}
