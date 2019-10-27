<?php
namespace app\api_drp\controller;

use app\api_init\controller\Rest;

class Team extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
    ];

    /**
     * 【user】查询会员的客户
     */
    public function child_users()
    {
        $map = [
            'parent_id'      => $this->unique_id,
            'is_distributor' => 0,
        ];

        $count = model('users')->getAllCount($map);
        $lists = model('users')->getAll($map, $this->page_num, $this->page_limit);

        foreach ($lists as $key => $value) {
            $lists[$key]['user_info'] = model('user_info')->getOne($value['id']);
        }

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【user】查询会员的团队
     */
    public function team_users()
    {
        $team_type = input('team_type/d', 1);

        // ============【分销商】无条件成为分销商begin==============
        import('app.api_extend.extend.drp.Drp');
        $Drp    = new \Drp();
        $result = $Drp->team_info($this->unique_id, $this->page_num, $this->page_limit, $team_type);
        // ============【分销商】无条件成为分销商end================

        if ($result['code'] == 0) {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
            return $this->data;
        }

        $this->data['page'] = $result['data']['page_info'];
        $this->data['data'] = $result['data']['data_info'];

        return $this->data;
    }

}
