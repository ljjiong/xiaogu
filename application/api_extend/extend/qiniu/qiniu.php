<?php
require 'extend/qiniu/autoload.php';

use Qiniu\Auth;

/**
 *  七牛
 **/
class qiniu
{
    // 签名公钥
    private $accessKey = '';

    // 签名私钥
    private $secretKey = '';

    // 存储空间
    private $bucket = '';

    // 存储空间外链默认域名
    private $uri = '';

    /**
     *  初始化参数
     */
    public function __construct()
    {
        $data  = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $qiniu = $data['qiniu'];

        $this->accessKey = $qiniu['accessKey'];
        $this->secretKey = $qiniu['secretKey'];
        $this->bucket    = $qiniu['bucket'];
        $this->uri       = $qiniu['uri'];
    }

    /**
     *  生成上传token
     */
    public function token($type)
    {
        $auth   = new Auth($this->accessKey, $this->secretKey);
        $policy = [
            'saveKey' => uniqid() . $type,
        ];
        $token = $auth->uploadToken($this->bucket, null, 3600, $policy);

        return $token;
    }

    /**
     *  获取外链域名
     */
    public function get_uri()
    {
        return $this->uri;
    }

    /**
     *  删除文件
     */
    public function delete($key)
    {
        $auth          = new Auth($this->accessKey, $this->secretKey);
        $config        = new \Qiniu\Config();
        $bucketManager = new \Qiniu\Storage\BucketManager($auth, $config);
        $err           = $bucketManager->delete($this->bucket, $key);
        if ($err) {
            return false;
        } else {
            return true;
        }
    }

    /**
     *  批量删除文件
     */
    public function batch_delete($keys)
    {
        $auth            = new Auth($this->accessKey, $this->secretKey);
        $config          = new \Qiniu\Config();
        $bucketManager   = new \Qiniu\Storage\BucketManager($auth, $config);
        $ops             = $bucketManager->buildBatchDelete($this->bucket, $keys);
        list($ret, $err) = $bucketManager->batch($ops);
        // if ($err) {
        //     return false;
        // } else {
        //     return true;
        // }
    }
}
