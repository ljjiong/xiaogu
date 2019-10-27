<?php
namespace app\job\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class TimedTasks extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】开启或关闭任务队列
     */
    public function change_queue_status()
    {
        $is_open = input('is_open');

        if ($is_open) {
            system('php think queue:work --queue TimedTasksQueue --daemon');
            $this->data['msg'] = '开启任务队列成功';
        } else {
            system('php think queue:restart');
            $this->data['msg'] = '关闭任务队列成功';
        }

        return $this->data;
    }

    /**
     * 【admin】更新至当前时间
     */
    public function change_next_time()
    {
        $id = input('id');

        if ($id) {
            // 更新指定任务
            $task = model('timed_tasks')->getOne($id);
            if ($task) {
                $next_time       = $task['next_time'];
                $next_time_stamp = strtotime($next_time);

                while ($next_time_stamp <= time()) {
                    $next_time_stamp = strtotime($next_time . '+' . $task['interval_value'] . ' ' . $task['interval_type']);
                    $next_time       = date('Y-m-d H:i:s', $next_time_stamp);
                }

                $result = model('timed_tasks')->editOne(['id' => $id, 'next_time' => $next_time]);
                if ($result['code']) {
                    $this->data['msg']  = '更新任务下次执行时间成功';
                    $this->data['data'] = $result['data'];
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '任务不存在';
            }
        } else {
            // 更新全部任务
            $tasks       = model('timed_tasks')->getAll();
            $update_data = [];
            foreach ($tasks as $key => $task) {
                $next_time       = $task['next_time'];
                $next_time_stamp = strtotime($next_time);

                while ($next_time_stamp <= time()) {
                    $next_time_stamp = strtotime($next_time . '+' . $task['interval_value'] . ' ' . $task['interval_type']);
                    $next_time       = date('Y-m-d H:i:s', $next_time_stamp);
                }

                $update_data[] = [
                    'id'        => $task['id'],
                    'next_time' => $next_time,
                ];
            }

            $result = model('timed_tasks')->batchEdit($update_data);
            if ($result['code']) {
                $this->data['msg']  = '批量更新下次执行时间成功';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        }

        return $this->data;
    }

    /**
     * 【admin】查询全部定时任务列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 定时任务名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('timed_tasks')->getAllCount($map);
        $lists = model('timed_tasks')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个定时任务详情
     */
    public function read($id)
    {
        $this->data['data'] = model('timed_tasks')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建定时任务
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('timed_task');
        if ($validate->scene('create')->check($data)) {

            $result = model('timed_tasks')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增定时任务成功';
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
     * 【admin】更新定时任务
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('timed_task');
        if ($validate->scene('update')->check($data)) {

            $result = model('timed_tasks')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新定时任务成功';
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
     * 【admin】删除定时任务
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('timed_tasks')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '定时任务删除成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】开启定时任务
     */
    public function open()
    {
        $id     = input('id/d', 0);
        $result = model('timed_tasks')->editOne(['status' => 1, 'id' => $id]);
        if ($result['code']) {
            $this->data['msg'] = '定时任务开启成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】关闭定时任务
     */
    public function close()
    {
        $id     = input('id/d', 0);
        $result = model('timed_tasks')->editOne(['status' => 2, 'id' => $id]);
        if ($result['code']) {
            $this->data['msg'] = '定时任务关闭成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
