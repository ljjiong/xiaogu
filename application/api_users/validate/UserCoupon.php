<?php
namespace app\api_users\validate;

use think\Validate;

class UserCoupon extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['activity_coupon_id', 'require|checkValue:activity_coupon_id', '优惠券ID不能为空'],
        ['coupon_no', 'require|checkValue:coupon_no', '领取码不能为空'],
    ];

    protected $scene = [
        'create'  => ['user_id', 'activity_coupon_id'],
        'receive' => ['user_id', 'coupon_no'],
    ];

    protected function checkValue($value, $rule)
    {
        $activity_coupon_id = input('activity_coupon_id');
        $coupon_no          = input('coupon_no');
        $now                = date('Y-m-d H:i:s');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    if ($this->currentScene == 'create') {
                        $user_coupon = model('user_coupons')->findOne(['activity_coupon_id' => $activity_coupon_id, 'user_id' => $value]);
                        if ($user_coupon) {
                            return '优惠券已领取';
                        }
                    } elseif ($this->currentScene == 'receive') {
                        $activity_coupon = model('activity_coupons')->findOne(['coupon_no' => $coupon_no]);
                        if ($activity_coupon) {
                            $user_coupon = model('user_coupons')->findOne(['activity_coupon_id' => $activity_coupon['id'], 'user_id' => $value]);
                            if ($user_coupon) {
                                return '优惠券已领取';
                            }
                        } else {
                            return '领取码无效';
                        }
                    }

                    return true;
                } else {
                    return '会员ID不存在';
                }
                break;
            case 'activity_coupon_id':
                $activity_coupon = model('activity_coupons')->findOne(['id' => $value, 'expiry_time' => ['> time', $now], 'status' => 1]);
                if ($activity_coupon) {
                    if ($activity_coupon['issue_num'] <= $activity_coupon['use_num']) {
                        return '优惠券已被领取完了';
                    } else {
                        return true;
                    }
                } else {
                    return '优惠券数据不存在';
                }
                break;
            case 'coupon_no':
                $activity_coupon = model('activity_coupons')->findOne(['coupon_no' => $value, 'expiry_time' => ['> time', $now], 'status' => 1]);
                if ($activity_coupon) {
                    if ($activity_coupon['issue_num'] <= $activity_coupon['use_num']) {
                        return '优惠券已被领取完了';
                    } else {
                        return true;
                    }
                } else {
                    return '领取码无效';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
