<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class Users extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkUser'  => ['only' => 'is_set_pay_password,check_pay_password,is_sign_in'],
        'checkAdmin' => ['only' => 'parent_tree'],
    ];

    /**
     * 【user】会员等级与成长值
     */
    public function asset()
    {
        $map['user_id'] = $this->unique_id;
        $user_asset     = model('user_assets')->findOne($map);

        $level_info             = model('user_levels')->getOneByUserId($this->unique_id);
        $user_asset['level']    = $level_info['name'];
        $user_asset['level_id'] = $level_info['id'];

        $this->data['data'] = $user_asset;

        return $this->data;
    }

    /**
     * 【user】会员认证
     */
    public function auth()
    {
        $map['user_id'] = $this->unique_id;
        $user_auth      = model('user_auths')->findOne($map);
        if (!$user_auth) {
            $user_auth['status'] = 0;
        }
        $this->data['data'] = $user_auth;

        return $this->data;
    }

    /**
     * 【public】查询默认地址
     */
    public function default_address()
    {
        $map = [
            'user_id'    => $this->unique_id,
            'is_default' => 1,
        ];

        $address = model('addresses')->findOne($map);
        if ($address) {
            $this->data['data'] = $address;
        } else {
            $this->data['data'] = model('addresses')->findOne(['user_id' => $this->unique_id]);
        }

        return $this->data;
    }

    /**
     * 【public】查询是否设置支付密码
     */
    public function is_set_pay_password()
    {
        $result             = model('user_accounts')->isSetPayPassword($this->account_id);
        $this->data['data'] = [
            'is_set_pay_password' => $result['code'],
            'user_account_id'     => $this->account_id,
        ];

        return $this->data;
    }

    /**
     * 【public】查询支付密码是否正确
     */
    public function check_pay_password()
    {
        $pay_password = input('pay_password');

        if ($pay_password) {
            $user_account = model('user_accounts')->findOne(['id' => $this->account_id, 'pay_password' => wancll_md5($pay_password)]);
            if (!$user_account) {
                $this->data['code'] = 0;
                $this->data['msg']  = '支付密码错误';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '支付密码不能为空';
        }

        return $this->data;
    }

    /**
     * 【admin】查询推荐关系
     */
    public function parent_tree()
    {
        $data               = model('users')->getAllTree();
        $this->data['data'] = list_to_tree($data, 'id', 'parent_id');

        return $this->data;
    }

    /**
     * 【admin】查询推荐关系
     */
    public function parent_tree_by_mobile()
    {
        $mobile = input('mobile');

        $parent = [];
        if ($mobile) {
            $user = model('users')->findOne(['mobile' => $mobile]);
            if ($user) {
                $user['user_info'] = model('user_info')->getOne($user['id']);
                $has_child         = model('users')->findOne(['parent_id' => $user['id']]);
                if ($has_child) {
                    $user['is_update_position'] = false;
                } else {
                    $user['is_update_position'] = true;
                }
                $data = model('users')->getAll(['parent_id' => $user['id']]);
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '所查会员不存在';
                return $this->data;
            }

            $parent_id = $user['parent_id'];
            if ($parent_id) {
                while ($parent_id) {
                    $parent              = model('users')->getOne($parent_id);
                    $parent['user_info'] = model('user_info')->getOne($parent_id);
                    $has_child           = model('users')->findOne(['parent_id' => $parent_id]);
                    if ($has_child) {
                        $parent['is_update_position'] = false;
                    } else {
                        $parent['is_update_position'] = true;
                    }
                    $parent['_child'] = [$user];

                    $parent_id = $parent['parent_id'];
                    $user      = $parent;
                }
            } else {
                $parent = $user;
            }
        } else {
            $data = model('users')->getAll(['parent_id' => null]);
        }

        foreach ($data as $key => $value) {
            $data[$key]['user_info'] = model('user_info')->getOne($value['id']);
            $has_child               = model('users')->findOne(['parent_id' => $value['id']]);
            if ($has_child) {
                $data[$key]['is_update_position'] = false;
            } else {
                $data[$key]['is_update_position'] = true;
            }
        }

        $this->data['data'] = [
            'lists'       => $data,
            'parent_line' => [$parent],
        ];

        return $this->data;
    }

    /**
     * 【public】查询今日是否签到
     */
    public function is_sign_in()
    {
        $user = model('users')->getOne($this->unique_id);
        if ($user) {
            $last_sign_in_day = date('Y-m-d', strtotime($user['last_sign_in_time']));
            $today            = date('Y-m-d');
            if ($last_sign_in_day == $today) {
                $this->data['data'] = [
                    'is_sign_in'        => 1,
                    'last_sign_in_time' => $user['last_sign_in_time'],
                ];
            } else {
                $this->data['data'] = [
                    'is_sign_in'        => 0,
                    'last_sign_in_time' => '',
                ];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '会员不存在';
        }

        return $this->data;
    }
}
