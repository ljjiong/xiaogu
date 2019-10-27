<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Request;

class BonusUsers extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
    ];

    /**
     * 【admin】查询全部分红商会员列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 会员昵称模糊查询
                if ($key == 'nick_name') {
                    $user_ids       = model('users')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['nick_name']);
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['is_bonus'] = 1;

        $count = model('users')->getAllCount($map);
        $lists = model('users')->getAll($map, $this->page_num, $this->page_limit);
        import('app.api_extend.extend.drp.Bonus');
        $Bonus = new \Bonus();
        foreach ($lists as $key => $value) {
            $lists[$key]['parent']         = model('users')->getOne($value['parent_id']);
            $lists[$key]['user_info']      = model('user_info')->getOne($value['id']);
            $region_bonus                  = model('region_bonus', 'bonus_model')->findOne(['user_id' => $value['id']]);
            $lists[$key]['region_bonus']   = $region_bonus ? $region_bonus : [];
            $global_bonus                  = model('global_bonus', 'bonus_model')->getOne($value['id']);
            $lists[$key]['global_bonus']   = $global_bonus ? $global_bonus : [];
            $lists[$key]['team_user_nums'] = $Bonus->team_user_nums($value['id'])['data'];
        }

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
}
