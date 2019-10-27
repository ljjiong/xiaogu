<?php
use think\Db;

require 'extend/jpush/autoload.php';

/**
 *  极光推送
 **/
class Push
{
    private $app_key       = 'b342a0792832d5a851ea4486';
    private $master_secret = '7902caa4491145b832ce344c';

    public function send_notice($content, $device_id = '')
    {
        $client = new \JPush\Client($this->app_key, $this->master_secret);

        $pusher = $client->push();
        $pusher->setPlatform('all');
        $pusher->options(['apns_production' => true]);

        if ($device_id) {
            $pusher->addRegistrationId($device_id);
        } else {
            $pusher->addAllAudience();
        }
        $pusher->setNotificationAlert($content);
        $result = $pusher->send();

        return $result;
    }

    public function send_msg()
    {
        $client = new \JPush\Client($this->app_key, $this->master_secret);

        $pusher = $client->push();
        $pusher->setPlatform('all');
        $pusher->options(['apns_production' => true]);

        if ($device_id) {
            $pusher->addRegistrationId($device_id);
        } else {
            $pusher->addAllAudience();
        }
        $pusher->message($content);
        $result = $pusher->send();

        return $result;
    }

    public function jpush_msg($device_id, $msg)
    {

        $client     = new \JPush\Client($this->app_key, $this->master_secret);
        $jpush_info = Db::name('jpush_devices')->where('device_id', $device_id)->find();
        if ($jpush_info) {
            if ($jpush_info['type'] == 'ios') {
                $pusher = $client->push();
                $pusher->setPlatform('ios');
                $pusher->addRegistrationId($device_id);
                $pusher->options(['apns_production' => true]);
                $pusher->iosNotification($msg, array('sound' => 'default'));
                $result = $pusher->send();
            }

            if ($jpush_info['type'] == 'android') {
                $pusher = $client->push();
                $pusher->setPlatform('android');
                $pusher->addRegistrationId($device_id);
                $pusher->options(['apns_production' => true]);
                $pusher->setNotificationAlert($msg);
                $result = $pusher->send();
            }

            return ['code' => 1, 'msg' => '推送操作成功'];
        } else {
            return ['code' => 0, 'msg' => '设备ID不存在'];
        }
    }
}


// if ($jpush_info['type'] == 'ios') {
//     $pusher = $client->push();
//     $pusher->setPlatform('ios');
//     $pusher->addRegistrationId($device_id);
//     $pusher->options(['apns_production' => true]);
//     // $pusher->iosNotification($msg, array('sound' => 'default'));
//     //  $pusher->message('Hello JPush', [
//     //     'title'        => 'Hello',
//     //     'content_type' => 'text',
//     //     // 'extras'       => [
//     //     //     'sound' => '',
//     //     // ],
//     // ]);
//     $result = $pusher->send();
// }

// if ($jpush_info['type'] == 'android') {
//     $pusher = $client->push();
//     $pusher->setPlatform('android');
//     $pusher->addRegistrationId($device_id);
//     $pusher->options(['apns_production' => true]);
//     // $pusher->setNotificationAlert($msg);

//     $pusher->message('Hello JPush', [
//         'title'        => 'Hello',
//         'content_type' => 'text',
//         'extras'       => [
//             'sound' => 'widget://res/vidio.mp3',
//         ],
//     ]);
//     $result = $pusher->send();
// }