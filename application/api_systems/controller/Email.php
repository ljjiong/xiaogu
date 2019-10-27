<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

import('app.api_extend.extend.email.email');

class Email extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];
    
    /**
     * 【admin】发送邮件
     */
    public function send(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('email');
        if ($validate->scene('create')->check($data)) {

            $email                = new \email();
            $email->subject       = $data['info_subject'];
            $email->body          = $data['info_body'];
            $email->from_nickname = $data['from_nickname'];
            foreach ($data['to_emails'] as $key => $value) {
                $email->to[] = [
                    'to_email'    => $value,
                    'to_nickname' => '',
                ];
            }

            $result = $email->send();
            if ($result['code'] == 1) {
                $this->data['msg'] = '邮件发送成功';
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
     * 【admin】获取发信人邮件地址
     */
    public function get_from_email(Request $request)
    {
        $email  = new \email();
        $result = $email->get_from_email();

        $this->data['data'] = $result;

        return $this->data;
    }

}
