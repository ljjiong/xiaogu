<?php
/**
 * 【APNS】iOS消息推送
 */
class apns
{
    // 请配置参数
    private $passphrase = ''; // 证书密码
    private $cert_path  = ''; // 证书路径

    public function __construct()
    {
        $this->passphrase = '123456';
        $this->cert_path  = dirname(__FILE__) . '/dev_123456.pem';
    }

    /**
     * 【APNS】消息推送
     *  $deviceToken 设备token
     *  $message 消息内容
     *  $env 1为正式环境,0为开发环境
     */
    public function push($deviceToken, $message, $env = 1)
    {
        $ctx = stream_context_create();
        stream_context_set_option($ctx, 'ssl', 'local_cert', $this->cert_path);
        stream_context_set_option($ctx, 'ssl', 'passphrase', $this->passphrase);

        if ($env == 1) {
            $apnsHost = 'gateway.push.apple.com';
        } else {
            $apnsHost = 'gateway.sandbox.push.apple.com';
        }

        $fp = stream_socket_client('ssl://' . $apnsHost . ':2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);
        if (!$fp) {
            return ['code' => 0, 'msg' => 'Failed to connect: ' . $err . $errstr . PHP_EOL];
        }

        $body['aps'] = [
            'alert' => $message,
            'sound' => 'default',
        ];
        $payload = json_encode($body);
        $msg     = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;
        $result  = fwrite($fp, $msg, strlen($msg));
        fclose($fp);

        if (!$result) {
            return ['code' => 0, 'msg' => 'Message not delivered' . PHP_EOL];
        } else {
            return ['code' => 1, 'msg' => 'Message successfully delivered'];
        }
    }

    public function test()
    {
        $deviceToken = '4956718ce7a8250d1ab76546365dbb25af3b10b76d750494b37b00a1e5f1c4dc';
        $passphrase  = '123456';
        $message     = '这是一条推送消息';

        $ctx = stream_context_create();
        stream_context_set_option($ctx, 'ssl', 'local_cert', 'F:\wwwroot\wancll_v4_cpbrbf\web\application\api_extend\extend\apns\dev_123456.pem'); //ck文件
        stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

        $fp = stream_socket_client(
            'ssl://gateway.sandbox.push.apple.com:2195', $err,
            $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);

        if (!$fp) {
            exit("Failed to connect: $err $errstr" . PHP_EOL);
        }

        echo 'Connected to APNS' . PHP_EOL;

        $body['aps'] = array(
            'alert' => $message,
            'sound' => 'default',
        );

        $payload = json_encode($body);

        $msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;

        $result = fwrite($fp, $msg, strlen($msg));

        if (!$result) {
            echo 'Message not delivered' . PHP_EOL;
        } else {
            echo 'Message successfully delivered' . PHP_EOL;
        }

        fclose($fp);
    }
}
