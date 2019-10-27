<?php
namespace app\api_score_shop\controller;

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
        import('app.api_extend.extend.order.ScoreShop');

        $ScoreShop = new \ScoreShop();
        $data      = $ScoreShop->rule();

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
            update_config_file($data, 'application/api_score_shop/config-score-shop.php');
            $this->data['msg'] = '积分商城规则更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
}
