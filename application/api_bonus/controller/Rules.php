<?php
namespace app\api_bonus\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

import('app.api_extend.extend.drp.Bonus');

class Rules extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'update,update_become_bonus_info'],
        'checkAdmin' => ['only' => 'update,update_become_bonus_info'],
    ];

    /**
     * 【admin】查询基本参数
     */
    public function index()
    {
        $Bonus = new \Bonus();
        $data  = $Bonus->basic_info();

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
            update_config_file($data, 'application/api_bonus/config-bonus.php');
            $this->data['msg'] = '分红系统基础参数更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询成为分红商的条件
     */
    public function become_bonus_info()
    {
        $Bonus = new \Bonus();
        $data  = $Bonus->become_bonus_info();

        // 如果条件为购买特定商品，则查询出商品集合
        if($data['become_bonus_condition'] == 'goods')
        {
          $data['goods_info'] = [];
          foreach($data['become_bonus_value'] as $key => $value)
          {
            array_push($data['goods_info'], model('goods')->getOneBasicInfo($value));
          }
        }

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】更新成为分红商的条件
     */
    public function update_become_bonus_info(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('become_bonus');
        if ($validate->scene('update')->check($data)) {
            update_config_file($data, 'application/api_bonus/config-bonus.php');
            $this->data['msg'] = '成为分红商条件更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询分红商升级条件
     */
    public function bonus_up_level_info()
    {
        $Bonus = new \Bonus();
        $data  = $Bonus->bonus_up_level_info();

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】查询代理分红参数
     */
    public function agent_bonus_info()
    {
        $Bonus = new \Bonus();
        $data  = $Bonus->agent_bonus_info();

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】更新代理分红参数
     */
    public function update_agent_bonus_info(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('rule');
        if ($validate->scene('agent_info')->check($data)) {
            update_config_file($data, 'application/api_bonus/config-bonus.php');
            $this->data['msg'] = '代理分红商参数更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询地区分红参数
     */
    public function region_bonus_info()
    {
        $Bonus = new \Bonus();
        $data  = $Bonus->region_bonus_info();

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】更新地区分红参数
     */
    public function update_region_bonus_info(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('rule');
        if ($validate->scene('region_info')->check($data)) {
            update_config_file($data, 'application/api_bonus/config-bonus.php');
            $this->data['msg'] = '代理分红商参数更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询全球分红参数
     */
    public function global_bonus_info()
    {
        $Bonus = new \Bonus();
        $data  = $Bonus->global_bonus_info();

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】更新全球分红参数
     */
    public function update_global_bonus_info(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('rule');
        if ($validate->scene('global_info')->check($data)) {
            update_config_file($data, 'application/api_bonus/config-bonus.php');
            $this->data['msg'] = '全球分红参数更新成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

}
