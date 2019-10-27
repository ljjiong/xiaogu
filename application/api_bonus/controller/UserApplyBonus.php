<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class UserApplyBonus extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index,agree,not_agree'],
        'checkUser'  => ['only' => 'apply'],
    ];

    /**
     * 【admin】查询全部会员申请分红商列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['mobile']);
                }

                // 会员昵称模糊查询
                if ($key == 'nick_name') {
                    $user_ids       = model('users')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['nick_name']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('user_apply_bonus', 'bonus_model')->getAllCount($map);
        $lists = model('user_apply_bonus', 'bonus_model')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员申请分红商详情
     */
    public function read()
    {
        if ($this->account_type == 'user') {
            $data = model('user_apply_bonus', 'bonus_model')->findOne(['user_id' => $this->unique_id]);
        } else {
            $id   = input('id');
            $data = model('user_apply_bonus', 'bonus_model')->getOne($id);
        }

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】同意会员申请分红商
     */
    public function agree()
    {
        $id = input('id/d', 0);

        $apply = model('user_apply_bonus', 'bonus_model')->getOne($id);
        if ($apply) {
            if ($apply['is_deal'] == 0) {
                $update_data = [
                    'id'        => $id,
                    'status'    => 3,
                    'is_deal'   => 1,
                    'deal_time' => date('Y-m-d H:i:s'),
                ];
                $result = model('user_apply_bonus', 'bonus_model')->editOne($update_data);
                if ($result['code']) {
                    // ============【分红商】会员申请成为分红商begin==============
                    import('app.api_extend.extend.drp.Bonus');
                    $Bonus = new \Bonus();
                    $Bonus->become_bonus($result['data']['user_id'], $result['data']['parent_bonus_mobile']);
                    // ============【分红商】会员申请成为分红商end================

                    $this->data['msg'] = '处理成功';
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '操作失败';
                }
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前申请已处理';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '数据不存在';
        }

        return $this->data;
    }

    /**
     * 【admin】不同意会员申请分红商
     */
    public function not_agree()
    {
        $id = input('id/d', 0);

        $apply = model('user_apply_bonus', 'bonus_model')->getOne($id);
        if ($apply) {
            if ($apply['is_deal'] == 0) {
                $update_data = [
                    'id'        => $id,
                    'status'    => 2,
                    'is_deal'   => 1,
                    'deal_time' => date('Y-m-d H:i:s'),
                ];
                $result = model('user_apply_bonus', 'bonus_model')->editOne($update_data);
                if ($result['code']) {
                    $this->data['msg'] = '处理成功';
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = '操作失败';
                }
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前申请已处理';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '数据不存在';
        }

        return $this->data;
    }

    /**
     * 【user】会员申请成为分红商
     */
    public function apply(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('user_apply_bonus');
        if ($validate->scene('update')->check($data)) {
            $apply = model('user_apply_bonus', 'bonus_model')->findOne(['user_id' => $data['user_id']]);

            if ($apply) {
                $update_data = [
                    'id'         => $apply['id'],
                    'is_deal'    => 0,
                    'status'     => 1,
                    // 'parent_bonus_mobile' => isset($data['parent_bonus_mobile']) ? $data['parent_bonus_mobile'] : '',
                    // 'apply_reason'              => isset($data['apply_reason']) ? $data['apply_reason'] : '',
                    'apply_time' => date('Y-m-d H:i:s'),
                ];
                $result = model('user_apply_bonus', 'bonus_model')->editOne($update_data);
            } else {
                $data['apply_time'] = date('Y-m-d H:i:s');
                $result             = model('user_apply_bonus', 'bonus_model')->addOne($data);
            }

            if ($result['code']) {
                $this->data['msg']  = '申请分红商已提交，请等待审核';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

}
