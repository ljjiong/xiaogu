<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Ronghub extends Rest
{
    public $appKey = '';
    public $appSecret = '';
    public function _initialize() {
        parent::_initialize();
        $this->appKey = '25wehl3u2svlw';
        $this->appSecret = 'wJQmXoqB9bb1j2';
        import('app.api_extend.extend.ronghub.rongcloud');
        $this->RongCloud = new \RongCloud('25wehl3u2svlw','wJQmXoqB9bb1j2');
    }
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['except' => 'getToken'],
    ];

    /**
     * 生成token
     */
    public function get_token(Request $request)
    {
        $user_info = model('users')->getOne($this->unique_id);
        //融云获取token
        $result = $this->RongCloud->user()->getToken($user_info['id'], $user_info['nick_name'], 'http://wancllshop.wx.wygoo.com/'.$user_info['avatar']);
        $this->data['data'] = json_decode($result);
        return $this->data;
    }
    /**
     * 刷新用户信息
     */
    public function refresh(Request $request)
    {
        $user_info = model('users')->getOne($this->unique_id);
        //融云获取token
        $result = $this->RongCloud->user()->getToken($user_info['id'], $user_info['nick_name'], 'http://wancllshop.wx.wygoo.com/'.$user_info['avatar']);
        $this->data['data'] = json_decode($result);
        return $this->data;
    }
}
