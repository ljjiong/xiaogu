<?php
namespace app\common\behavior;

use think\Response;

/**
 * 跨域处理
 */

class CronRun
{
    public function run(&$dispatch)
    {
        $host_name = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : "*";
        $headers   = [
            "Access-Control-Allow-Origin"      => $host_name,
            "Access-Control-Allow-Credentials" => 'true',
            "Access-Control-Allow-Headers"     => "auth,client-type,content-type,page-limit,page-num,token",
        ];
        if ($dispatch instanceof Response) {
            $dispatch->header($headers);
        } else if (isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
            $dispatch['type']     = 'response';
            $response             = new Response('', 200, $headers);
            $dispatch['response'] = $response;
        }
    }
}
