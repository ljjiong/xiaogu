<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Helper extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'send_code,check_code,refresh_token'],
    ];

    /**
     * 发送短信验证码
     */
    public function send_code(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('code');
        if ($validate->scene('send')->check($data)) {
            if ($data['type'] == 3) {
                return $this->data;
            } else {
                $result = send_mobile_code($data['mobile']);
                if ($result[0] == 1) {
                    $this->data['msg'] = '发送成功';
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result[1];
                }
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 发送短信验证码
     */
    public function check_code(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('code');
        if ($validate->scene('check')->check($data)) {
            $result = check_mobile_code($data['mobile'], $data['code']);
            if ($result) {
                $data['status'] = true;
            } else {
                $data['status'] = false;
            }

            $this->data['data'] = $data;
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 刷新token
     */
    public function refresh_token()
    {
        $token         = input('token');
        $refresh_token = input('refresh_token');
        if ($token && $refresh_token) {
            if (strpos($token, 'admin') === 0) {
                $check_token = model('admin_tokens')->findOne(['token' => $token, 'refresh_token' => $refresh_token]);
            } elseif (strpos($token, 'user') === 0) {
                $check_token = model('user_tokens')->findOne(['token' => $token, 'refresh_token' => $refresh_token]);
            }

            if ($check_token) {
                $time_length = time() - strtotime($check_token['update_time']);

                // 时间长度大于1天，重新登录
                if ($time_length >= 86400) {
                    $this->token_state = 100401;
                    $this->data['msg'] = '参数已失效，请重新登录';
                } else {
                    if (strpos($token, 'admin') === 0) {
                        $result = model('admin_tokens')->editOneById($check_token['id']);
                    } elseif (strpos($token, 'user') === 0) {
                        $result = model('user_tokens')->editOneById($check_token['id']);
                    }

                    if ($result['code']) {
                        $this->data['data'] = $result['data'];
                        $this->data['msg']  = '刷新成功';
                    } else {
                        $this->data['code'] = 0;
                        $this->data['msg']  = $result['msg'];
                    }
                }
            } else {
                $this->data['data'] = 0;
                $this->data['msg']  = '参数错误';
            }
        } else {
            $this->data['data'] = 0;
            $this->data['msg']  = '参数缺失';
        }

        return $this->data;
    }

    /**
     * 生成二维码
     */
    public function qrcode()
    {
        $order_no           = input('order_no');
        $this->data['data'] = get_host() . qrcode('WancllAPI://' . $order_no);

        return $this->data;
    }

    /**
     * 上传文件【单个文件】
     */
    public function upload_file()
    {
        $file      = request()->file('file');
        $save_path = input('save_path');
        $is_rename = input('is_rename/b', false);

        // 移动到框架应用根目录下的对应目录
        if ($file) {
            
            /**
             * ============================================================================================
             * ==========================测试环境开始线=======================================================
             * ============================================================================================
             */
            // 测试环境下开启,方便上传第三方所需文件（正式环境下请关闭）
            if ($save_path) {
                if ($save_path == '/') {
                    $info = $file->move(ROOT_PATH, $is_rename);
                } else {
                    $info = $file->move(ROOT_PATH . $save_path, $is_rename);
                }
            } else {
                $info = $file->move(ROOT_PATH . 'public' . DS . 'upload', $is_rename);
            }
            /**
             * ============================================================================================
             * ==========================测试环境结束线=======================================================
             * ============================================================================================
             */


            /**
             * ============================================================================================
             * ==========================正式环境开始线=======================================================
             * ============================================================================================
             */
            // 正式环境下开启
            // $save_path = DS.'public'.DS.'upload'.DS;
            // $info = $file->validate(['ext'=>'jpg,gif,jpeg,png','type'=>'image/jpeg,image/gif,image/jpeg,image/png'])->move(ROOT_PATH . 'public' . DS . 'upload', true);
            /**
             * ============================================================================================
             * ==========================正式环境结束线=======================================================
             * ============================================================================================
             */

            if ($info) {
                // 成功上传后 获取上传信息
                $path = str_replace('\\', '/', $info->getSaveName());
                $data = [
                    'ext'            => $info->getExtension(),
                    'file_name'      => $info->getFilename(),
                    'file_path'      => $save_path . $path,
                    'host_file_path' => get_host() . $save_path . $path,
                ];

                $this->data['data'] = $data;
            } else {
                // 上传失败获取错误信息
                $this->data['code'] = 0;
                $this->data['msg']  = $file->getError();
            }
        }

        return $this->data;
    }

    /**
     * 【user】读取微信证书文件
     */
    public function read_wechat_cert()
    {
        $dir      = "./extend/wechat_app_pay/cert/";
        $app_file = scandir($dir);
        $app_cert = [];
        foreach ($app_file as $key => $value) {
            if ($value != '.' && $value != '..') {
                $app_cert[] = [
                    'name' => $value,
                    'url'  => get_host() . '/extend/wechat_pay/cert/' . $value,
                ];
            }
        }

        $dir      = "./extend/wechat_pay/cert/";
        $web_file = scandir($dir);
        $web_cert = [];
        foreach ($web_file as $key => $value) {
            if ($value != '.' && $value != '..') {
                $web_cert[] = [
                    'name' => $value,
                    'url'  => get_host() . '/extend/wechat_pay/cert/' . $value,
                ];
            }
        }

        $dir       = "./";
        $root_file = scandir($dir);
        $root_cert = [];
        foreach ($root_file as $key => $value) {
            if (strstr($value, 'MP_verify_')) {
                $root_cert[] = [
                    'name' => $value,
                    'url'  => get_host() . '/' . $value,
                ];
            }
        }

        $this->data['data'] = [
            'app_cert'  => $app_cert,
            'web_cert'  => $web_cert,
            'root_cert' => $root_cert,
        ];

        return $this->data;
    }

    /**
     * 【user】删除目录下的文件
     */
    public function del_file()
    {
        $file_path = request()->param('file_path');
        unlink($file_path);

        $this->data['msg'] = '删除成功';
        return $this->data;
    }

    /**
     * 【user】读取身份证信息（base64）
     */
    public function read_id_card()
    {
        $base64_str = input('base64_str');
        $side       = input('side');

        $url  = 'http://apis.juhe.cn/idimage/verify';
        $data = [
            'key'   => 'ace91b195fcb98cd676a0a9ff83fbead',
            'image' => $base64_str,
            'side'  => $side,
        ];
        $result             = https_request($url, $data);
        $this->data['data'] = $result;

        return $this->data;
    }

    /**
     * 【user】读取银行卡信息（base64）
     */
    public function read_bank_card()
    {
        $base64_str = input('base64_str');

        $url  = "http://v.apistore.cn/api/c9/bankcard";
        $data = [
            "key"         => "20f9b4df96e7cfcd4ffed6a241721d13",
            "bas64String" => $base64_str,
        ];
        $result             = https_request($url, $data);
        $this->data['data'] = $result;

        return $this->data;
    }
}
