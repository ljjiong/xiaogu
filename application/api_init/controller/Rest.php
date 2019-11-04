<?php
namespace app\api_init\controller;

use think\Controller;
use think\exception\HttpResponseException;
use think\Request;
use think\Response;

class Rest extends Controller
{
    public $client_type  = 'pc';
    public $account_type = 'user';
    public $account_id   = 0;
    public $unique_id    = 0; //admin_id||user_id

    public $page_num;
    public $page_limit;

    public $auth;
    public $token;
    public $request_uri;

    public $data = [
        'code' => 1,
        'msg'  => 'success',
        'data' => [],
    ];

    /**
     * 【init】初始化参数
     */
    public function _initialize()
    {
        // 资源类型检测
        $request = Request::instance();
        $header  = $request->header();

        // 初始化参数
        $this->client_type = isset($header['client-type']) ? $header['client-type'] : '';
        $this->page_num    = isset($header['page-num']) ? $header['page-num'] : '';
        $this->page_limit  = isset($header['page-limit']) ? $header['page-limit'] : '';
        $this->auth        = isset($header['auth']) ? $header['auth'] : '';
        $this->token       = isset($header['token']) ? $header['token'] : '';
        $this->request_uri = $request->module() . '/' . $request->controller() . '/' . $request->action();
    }

    /**
     * 校验【client_type】
     */
    protected function checkClientType()
    {
        if ($this->client_type) {
            if (!in_array($this->client_type, ['pc', 'wap', 'app', 'wechat', 'applet'])) {
                self::createResponse(100101, '客户端类型不存在');
            }
        } else {
            self::createResponse(100100, '客户端类型缺失');
        }
    }

    /**
     * 校验【auth】
     */
    protected function checkAuth()
    {
        if ($this->auth) {
            $data        = include 'application/api_init/config-' . WANCLL_ENV . '.php';
            $system_auth = $data['auth'][$this->client_type . '_auth'];
            if ($this->auth !== $system_auth) {
                self::createResponse(100301, 'auth错误');
            }
        } else {
            self::createResponse(100300, 'auth缺失');
        }
    }

    /**
     *  校验【token】
     */
    protected function checkToken()
    {
        if ($this->token) {
            if (strpos($this->token, 'admin') === 0) {
                $this->account_type = 'admin';
            } elseif (strpos($this->token, 'user') === 0) {
                $this->account_type = 'user';
            } else {
                self::createResponse(100401, 'token错误');
            }

            $check_token = model($this->account_type . '_tokens')->findOne(['token' => $this->token, 'client_type' => $this->client_type]);
            if ($check_token) {
                // 若有过期时间校验过期时间
                if ($check_token['expire_time']) {
                    $time_length = time() - strtotime($check_token['update_time']);
                    // 时间长度大于1天，重新登录
                    if ($time_length >= 86400) {
                        model($this->account_type . '_tokens')->delOneTrue($check_token['id']);
                        self::createResponse(100401, 'token错误');

                        // 时间长度大于过期时间（2小时）且小于1天，刷新token
                    } elseif ($time_length > $check_token['expire_time'] && $time_length < 86400) {
                        self::createResponse(100402, 'token过期');
                    } else {
                        switch ($this->account_type) {
                            case 'user':
                                $this->account_id = $check_token['user_account_id'];
                                $this->unique_id  = $check_token['user_id'];
                                break;
                            case 'admin':
                                $this->account_id = $check_token['admin_account_id'];
                                $this->unique_id  = $check_token['admin_id'];
                                break;
                            default:
                                self::createResponse(100401, 'token错误');
                                break;
                        }
                    }
                } else {
                    switch ($this->account_type) {
                        case 'user':
                            $this->account_id = $check_token['user_account_id'];
                            $this->unique_id  = $check_token['user_id'];
                            break;
                        case 'admin':
                            $this->account_id = $check_token['admin_account_id'];
                            $this->unique_id  = $check_token['admin_id'];
                            break;
                        default:
                            self::createResponse(100401, 'token错误');
                            break;
                    }
                }
            } else {
                self::createResponse(100401, 'token错误');
            }
        } else {
            self::createResponse(100400, 'token缺失');
        }
    }

    /**
     * 校验【request_uri】
     */
    protected function checkPower()
    {
        return;
    }

    /**
     * 校验【admin】
     */
    protected function checkAdmin()
    {
        if (strpos($this->token, 'admin') === 0) {
            return true;
        } elseif (strpos($this->token, 'user') === 0) {
            self::createResponse(400101, '限管理员调用');
        } else {
            self::createResponse(400100, '非法操作');
        }
    }

    /**
     * 校验【user】
     */
    protected function checkUser()
    {
        if (strpos($this->token, 'admin') === 0) {
            self::createResponse(400102, '限用户调用');
            return true;
        } elseif (strpos($this->token, 'user') === 0) {
            return true;
        } else {
            self::createResponse(400100, '非法操作');
        }
    }

    /**
     * 校验【dev】
     */
    protected function checkDev()
    {
        if (WANCLL_ENV !== 'dev') {
            self::createResponse(400103, '限dev环境调用');
        }
    }

    /**
     * 【error】校验未通过，抛出异常
     */
    protected function createResponse($code, $msg)
    {
        $this->data['code'] = $code;
        $this->data['msg']  = $msg;

        $response = Response::create($this->data, 'json');
        throw new HttpResponseException($response);
    }

    /**
     * GOOGLE翻译 汉英
     */
    public function googleTran($text)
    {
        if (empty($text)) {
            return "";
        }

        sleep(1); //反间碟
        $wf = file_get_contents('http://translate.google.cn/translate_t?sl=zh-CN&tl=en&text=' . urlencode($text) . '#');echo 1;die();
        if (false === $wf || empty($wf)) {
            return false;
        }
        //echo $wf;

        //截取相关信息
        $return = "";
        $wf     = mb_substr($wf, 14000, 28100, 'utf-8');

        $wf = strip_tags($wf);
        //print_r ($wf);
        $star = strpos($wf, "英语中文(简体)日语");

        if (false === $star) {
            return false;
        }
        $end = strpos($wf, "Alpha字典");
        if (false === $end) {
            return false;
        }
        $return = strip_tags(substr($wf, $star + 18, $end - $star - 18));

        return $return;

    }
}
