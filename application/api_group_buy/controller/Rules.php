<?php
namespace app\api_group_buy\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Rules extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'update'],
        'checkAdmin' => ['only' => 'update'],
    ];

    /**
     * 【admin】查询基本参数
     */
    public function index()
    {
        import('app.api_extend.extend.order.GroupBuy');

        $GroupBuy = new \GroupBuy();
        $data     = $GroupBuy->rule();

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】更新基本参数
     */
    public function update(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('rule');
        if ($validate->scene('update')->check($data)) {
            update_config_file($data, 'application/api_group_buy/config-group-buy.php');
            $this->data['msg'] = '团购规则更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
}
