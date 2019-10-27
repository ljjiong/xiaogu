<?php
namespace app\api_market\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class MarketActivities extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read'],
    ];

    /**
     * 【admin】查询全部营销活动列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 营销活动类别模糊查询
                if ($key == 'type') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 营销活动名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('market_activities')->getAllCount($map);
        $lists = model('market_activities')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个营销活动详情
     */
    public function read($id)
    {
        $this->data['data'] = model('market_activities')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建营销活动
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('market_activity');
        if ($validate->scene('create')->check($data)) {

            $result = model('market_activities')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增营销活动成功';
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
     * 【admin】更新营销活动
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('market_activity');
        if ($validate->scene('update')->check($data)) {

            $result = model('market_activities')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新营销活动成功';
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
     * 【admin】删除营销活动
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('market_activities')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除营销活动成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除营销活动
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('market_activities')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除营销活动成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线营销活动
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('market_activities')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线营销活动成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线营销活动
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('market_activities')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线营销活动成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
