<?php
namespace app\api\extend;

use think\Cache;
use think\Db;

class DataCache
{
    /**
     * 【data】创建缓存
     */
    public static function set($key, $value, $time = 3600)
    {
        Cache::set($key, $value, $time);
    }

    /**
     * 【data】auth缓存
     */
    public static function getAuth()
    {
        $data = Cache::get('auth');
        if ($data === false) {
            $auth = Db::name('params')->where(['key' => '授权码', 'data_state' => 1])->value('value');
            self::set('auth', $auth);
            $data = Cache::get('auth');
        }

        return $data;
    }

    // /**
    //  * 【data】权限缓存
    //  */
    // public static function getPowers($token = '')
    // {
    //     $data = Cache::get($token . 'powers');
    //     if ($data === false) {
    //         $result       = Db::name('tokens')->where(['token' => $token])->find();
    //         $user_id   = isset($result['user_id']) ? $result['user_id'] : 0;
    //         $user_type = isset($result['user_type']) ? $result['user_type'] : 'user';

    //         switch ($user_type) {
    //             case 'user':
    //                 $role_ids = Db::name('users')->where(['id' => $user_id, 'data_state' => 1])->value('role_ids');
    //                 break;
    //             case 'admin':
    //                 $role_ids = Db::name('admins')->where(['id' => $user_id, 'data_state' => 1])->value('role_ids');
    //                 break;
    //             default:
    //                 $role_ids = '';
    //                 break;
    //         }

    //         $api = [];
    //         $nav = [];
    //         if ($role_ids) {
    //             // API权限
    //             $api_powers = Db::name('role_api_powers')->where(['role_id' => ['in', $role_ids], 'data_state' => 1])->select();
    //             foreach ($api_powers as $key => $value) {
    //                 $module = $value['module'];
    //                 if ($value['create'] == 1) {
    //                     array_push($api, $module . '#' . 'create');
    //                 }

    //                 if ($value['update'] == 1) {
    //                     array_push($api, $module . '#' . 'update');
    //                 }

    //                 if ($value['read'] == 1) {
    //                     array_push($api, $module . '#' . 'read');
    //                 }

    //                 if ($value['delete'] == 1) {
    //                     array_push($api, $module . '#' . 'delete');
    //                 }
    //             }

    //             // 菜单权限
    //             $nav_powers = Db::name('role_nav_powers')->where(['role_id' => ['in', $role_ids], 'data_state' => 1])->select();
    //             foreach ($nav_powers as $value) {
    //                 if ($value['nav_ids']) {
    //                     $arr = explode(',', $value['nav_ids']);
    //                     foreach ($arr as $value1) {
    //                         if (!in_array($value1, $nav)) {
    //                             array_push($nav, $value1);
    //                         }
    //                     }
    //                 }
    //             }
    //         }

    //         $powers = [
    //             'api' => $api,
    //             'nav' => $nav,
    //         ];
    //         self::set($token . 'powers', $powers);
    //         $data = Cache::get($token . 'powers');
    //     }

    //     return $data;
    // }

    /**
     * 【data】权限缓存
     */
    public static function getPowers($token)
    {
        if ($token) {
            $data = Cache::get($token . 'api_powers');
            if ($data === false) {
                $result       = Db::name('tokens')->where(['token' => $token])->find();
                $user_id   = isset($result['user_id']) ? $result['user_id'] : 0;
                $user_type = isset($result['user_type']) ? $result['user_type'] : 'user';

                switch ($user_type) {
                    case 'user':
                        $role_ids = Db::name('users')->where(['id' => $user_id, 'data_state' => 1])->value('role_ids');
                        break;
                    case 'admin':
                        $role_ids = Db::name('admins')->where(['id' => $user_id, 'data_state' => 1])->value('role_ids');
                        break;
                    default:
                        $role_ids = '';
                        break;
                }

                $api = [];
                if ($role_ids) {
                    // API权限
                    $api_powers = Db::name('role_api_powers')->where(['role_id' => ['in', $role_ids], 'data_state' => 1])->select();
                    foreach ($api_powers as $key => $value) {
                        $module = $value['module'];
                        if ($value['create'] == 1 && !in_array($module . '#' . 'create', $api)) {
                            array_push($api, $module . '#' . 'create');
                        }

                        if ($value['update'] == 1 && !in_array($module . '#' . 'update', $api)) {
                            array_push($api, $module . '#' . 'update');
                        }

                        if ($value['read'] == 1 && !in_array($module . '#' . 'read', $api)) {
                            array_push($api, $module . '#' . 'read');
                        }

                        if ($value['delete'] == 1 && !in_array($module . '#' . 'delete', $api)) {
                            array_push($api, $module . '#' . 'delete');
                        }
                    }
                }

                self::set($token . 'api_powers', $api);
                $data = Cache::get($token . 'api_powers');
            }

            return $data;
        }else{
            return [];
        }
    }

    // /**
    //  * 【data】菜单缓存
    //  */
    // public static function getNavs($token = '')
    // {
    //     $data = Cache::get($token . 'nav_powers');
    //     if ($data === false) {
    //         $result       = Db::name('tokens')->where(['token' => $token])->find();
    //         $user_id   = isset($result['user_id']) ? $result['user_id'] : 0;
    //         $user_type = isset($result['user_type']) ? $result['user_type'] : 'user';

    //         switch ($user_type) {
    //             case 'user':
    //                 $role_ids = Db::name('users')->where(['id' => $user_id, 'data_state' => 1])->value('role_ids');
    //                 break;
    //             case 'admin':
    //                 $role_ids = Db::name('admins')->where(['id' => $user_id, 'data_state' => 1])->value('role_ids');
    //                 break;
    //             default:
    //                 $role_ids = '';
    //                 break;
    //         }

    //         $nav = [];
    //         if ($role_ids) {
    //             // 菜单权限
    //             $nav_powers = Db::name('role_nav_powers')->where(['role_id' => ['in', $role_ids], 'data_state' => 1])->select();
    //             foreach ($nav_powers as $value) {
    //                 if ($value['nav_ids']) {
    //                     $arr = explode(',', $value['nav_ids']);
    //                     foreach ($arr as $value1) {
    //                         if (!in_array($value1, $nav)) {
    //                             array_push($nav, $value1);
    //                         }
    //                     }
    //                 }
    //             }
    //         }

    //         self::set($token . 'nav_powers', $nav);
    //         $data = Cache::get($token . 'nav_powers');
    //     }

    //     return $data;
    // }


}
