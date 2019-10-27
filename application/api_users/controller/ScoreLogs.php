<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class ScoreLogs extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['only' => 'lists'],
    ];

    /**
     * 【admin】查询全部会员积分日志
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

        $count = model('score_logs')->getAllCount($map);
        $lists = model('score_logs')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员积分日志
     */
    public function read($id)
    {
        $score_log = model('score_logs')->getOne($id);
        if ($this->account_type == 'admin' || $score_log['user_id'] == $this->unique_id) {
            $this->data['data'] = $score_log;
        } else {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
        }

        return $this->data;
    }

    /**
     * 【address】新建会员积分日志
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('score_log');
        if ($validate->scene('create')->check($data)) {

            $result = model('score_logs')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增会员积分日志成功';
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

    /**
     * 【public】更新会员积分日志
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('score_log');
        if ($validate->scene('update')->check($data)) {

            $result = model('score_logs')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员积分日志成功';
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

    /**
     * 【admin】删除会员积分日志
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('score_logs')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员积分日志成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员积分日志
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('score_logs')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员积分日志成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】查询全部会员积分日志
     */
    public function lists(Request $request)
    {

        $map['user_id'] = $this->unique_id;

        $count = model('score_logs')->getAllCount($map);
        $lists = model('score_logs')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】管理员给会员充值积分
     */
    public function save_by_admin(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('score_log');
        if ($validate->scene('admin_recharge_score')->check($data)) {

            $data['change_type'] = 'admin_recharge_score';
            $data['intro']       = '管理员充值积分';
            $data['desc']        = '管理员给会员充值积分, 充值时间' . date('Y-m-d H:i:s');

            $result = model('score_logs')->addOne($data);
            if ($result['code']) {
                model('user_assets')->where(['user_id' => $data['user_id']])->setInc('score', $data['change_num']);

                $this->data['msg']  = '管理员充值积分成功';
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
