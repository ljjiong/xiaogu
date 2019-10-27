<?php

/**
 *  获取后台管理员的菜单列表
 */
function get_admin_navs($token)
{
    $result   = model('admin_tokens')->findOne(['token' => $token]);
    $admin    = model('admins')->getOne($result['admin_id']);
    $role_ids = $admin['role_ids'];

    $nav = [];
    if ($role_ids) {
        // 菜单权限
        $nav_powers = model('role_nav_powers')->getAll(['role_id' => ['in', $role_ids]]);
        foreach ($nav_powers as $value) {
            if ($value['nav_ids']) {
                $arr = $value['nav_ids'];
                foreach ($arr as $value1) {
                    if (!in_array($value1, $nav)) {
                        array_push($nav, $value1);
                    }
                }
            }
        }
    }

    $data = model('navs')->getAllTree(['id' => ['in', $nav], 'status' => 1]);
    foreach ($data as $key => $value) {
        if ($value['module'] && $value['class'] && $value['method']) {
            $data[$key]['href'] = get_host() . '/' . $value['module'] . '/' . $value['class'] . '/' . $value['method'];
        } else {
            $data[$key]['href'] = '';
        }
    }
    $left_nav = list_to_tree($data);

    return $left_nav;
}
