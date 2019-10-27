<?php
namespace app\api_drp\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

import('app.api_extend.extend.drp.Drp');

class Rules extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'update,update_become_distributor_info'],
        'checkAdmin' => ['only' => 'update,update_become_distributor_info'],
    ];

    /**
     * 【admin】查询基本参数
     */
    public function index()
    {
        $Drp  = new \Drp();
        $data = $Drp->basic_info();

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
            update_config_file($data, 'application/api_drp/config-drp.php');
            $this->data['msg'] = '分销系统基础参数更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询成为分销商的条件
     */
    public function become_distributor_info()
    {
        $Drp  = new \Drp();
        $data = $Drp->become_distributor_info();

        // 如果条件为购买特定商品，则查询出商品集合
        if($data['become_distributor_condition'] == 'goods')
        {
          $data['goods_info'] = [];
          foreach($data['become_distributor_value'] as $key => $value)
          {
            array_push($data['goods_info'], model('goods')->getOneBasicInfo($value));
          }
        }

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】更新成为分销商的条件
     */
    public function update_become_distributor_info(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('become_distributor');
        if ($validate->scene('update')->check($data)) {
            update_config_file($data, 'application/api_drp/config-drp.php');
            $this->data['msg'] = '成为分销商条件更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询分销商升级条件
     */
    public function distributor_up_level_info()
    {
        $Drp  = new \Drp();
        $data = $Drp->distributor_up_level_info();

        $this->data['data'] = $data;

        return $this->data;
    }
}
