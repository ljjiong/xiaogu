<?php
namespace app\api_remuneration\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Welfare extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read,update,binding_parent,complete_user_info,sign_in,index'],
        'checkUser'  => ['only' => 'complete_user_info,sign_in,lists'],
    ];

    /**
     * 【admin】查询全部福利
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 标题查询
                if ($key == 'weal') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 福利查询
                if ($key == 'title') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('welfare')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('welfare')->getAllCount($map);
        $lists = model('welfare')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
      /**
     * 【admin】查询全部福利
     */
    public function lists(Request $request)
    {
        $map = $request->param();
       

        $count = model('welfare')->getAllCount($map);
        $lists = model('welfare')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }
    /**
     * 【admin】新建会员
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('welfare');
        if ($validate->scene('create')->check($data)) {
            // 注册会员
            $result = model('welfare')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '添加福利成功';
                $this->data['data'] = $result;
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
     * 【public】更新会员
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'welfare') {
            $data['id'] = $this->unique_id;
        }

        unset($data['mobile']);

        $result = model('welfare')->editOne($data);
        if ($result['code']) {
            $this->data['msg']  = '更新福利成功';
            $this->data['data'] = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】删除会员(将会员的账号全部置空)
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('welfare')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除福利成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('welfare')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除福利成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }
}
