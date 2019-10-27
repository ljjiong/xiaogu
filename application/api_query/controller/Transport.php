<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Transport extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【admin】查询物流信息(快递100)
     */
    public function read_by_kd100(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('transport');
        if ($validate->scene('read')->check($data)) {
            $AppKey = '29833628d495d7a5';
            $url    = 'http://api.kuaidi100.com/api?id=' . $AppKey . '&com=' . $data['express_type'] . '&nu=' . $data['express_no'] . '&show=0&muti=1&order=desc';
            $result = json_decode(https_request($url), true);

            $this->data['data'] = $result;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询物流信息（快递鸟）
     */
    public function read_by_kdn(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('transport');
        if ($validate->scene('read')->check($data)) {

            import('app.api_extend.extend.kdapi.Esearch');

            $eorder = new \Esearch();
            $result = $eorder->read($data['eorder_express_type'], $data['express_no']);
            if ($result['code']) {
                $this->data['msg']  = '查询成功';
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
