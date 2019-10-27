<?php
namespace app\api_users\validate;

use think\Validate;

class BindingParent extends Validate
{
    protected $rule = [
        ['parent_mobile', 'require|checkValue:parent_mobile', '推荐人手机号不能为空'],
        ['user_id', 'require|checkValue:user_id', '当前会员ID不能为空'],
    ];

    protected $scene = [
        'binding' => ['parent_mobile', 'user_id'],
    ];

    protected function checkValue($value, $rule)
    {
        $parent_mobile = input('parent_mobile');

        switch ($rule) {
            case 'parent_mobile':
                $user_account = model('user_accounts')->findOne(['guid' => $value]);
                $user         = model('users')->findOne(['mobile' => $value]);
                if ($user_account && $user) {
                    if ($user['is_distributor'] == 1 || $user['is_bonus'] == 1) {
                        return true;
                    } else {
                        return '当前推荐人不具备推荐资格';
                    }
                } else {
                    return '推荐人手机号暂未注册或未绑定会员';
                }
                break;
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    if ($user['parent_id']) {
                        return '当前会员已绑定推荐人,不可更改';
                    }

                    if ($user['mobile'] == $parent_mobile) {
                        return '会员自己不可绑定自己为推荐人';
                    }

                    $other_user = model('users')->findOne(['parent_id' => $value]);
                    if ($other_user) {
                        return '当前会员已发展下级，不可调整上级';
                    } else {
                        return true;
                    }
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
