<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
use think\Db;

// 发送短信验证码
function send_mobile_code($mobile)
{
    if (preg_match("/^1[0-9]{1}\d{9}$/", $mobile)) {

        import('app.api_extend.extend.sms.Sms');
        $Sms    = new \Sms();
        $result = $Sms->sendCode($mobile);

        if ($result['code']) {
            return [1, '发送成功'];
        } else {
            return [0, $result['msg']];
        }
    } else {
        return [0, '手机号码格式错误'];
    }
}

// 校验短信验证码
function check_mobile_code($mobile, $code)
{
    import('app.api_extend.extend.sms.Sms');
    $Sms = new \Sms();
    return $Sms->checkCode($mobile, $code);
}

function wancll_md5($param)
{
    return md5(md5($param . '@wancll'));
}

/**
 * 返回带协议的域名
 */
function get_host()
{
    $host     = $_SERVER["HTTP_HOST"];
    $protocol = is_ssl() ? "https://" : "http://";
    return $protocol . $host;
}

/**
 * 判断是否SSL协议
 * @return boolean
 */
function is_ssl()
{
    if (isset($_SERVER['HTTPS']) && ('1' == $_SERVER['HTTPS'] || 'on' == strtolower($_SERVER['HTTPS']))) {
        return true;
    } elseif (isset($_SERVER['SERVER_PORT']) && ('443' == $_SERVER['SERVER_PORT'])) {
        return true;
    }
    return false;
}

/**
 * 处理上传的图片
 * @return boolean
 */
function deal_upload_img($arr, $new_width = '', $new_height = '', $max_size = '')
{
    $result = [];

    foreach ($arr as $key => $value) {
        // 传值为空
        if (!$value) {
            $result[] = '';
            continue;
        }

        // 当前系统的图片
        if (strpos($value, get_host()) !== false) {
            $deal_value  = str_replace(get_host(), '', $value);
            $output_file = '.' . $deal_value;
            // 处理图片宽高
            if ($new_width && $new_height) {
                deal_img($output_file, $new_width, $new_height, 100);
            }

            // 处理图片大小
            if ($max_size) {
                $size = filesize($output_file);
                $rate = 100;
                while ($size > $max_size) {
                    deal_img($output_file, '', '', $rate);
                    $size = filesize($output_file);
                    $rate -= 10;

                    if ($rate == 0) {
                        break;
                    }
                }
            }
            $result[] = $deal_value;
            continue;
        }

        // 非当前系统的图片
        if (strpos($value, 'http') !== false) {
            $result[] = $value;
            continue;
        }

        $result[] = $value;
    }

    return $result;
}

/**
 * 显示上传的图片
 * @return boolean
 */
function show_upload_img($value)
{
    $img_url = '';

    if ($value) {
        if (strpos($value, 'http') !== false) {
            $img_url = $value;
        } else {
            $img_url = get_host() . $value;
        }
    }

    return $img_url;
}

/**
 * 处理base64位图片集
 * @return boolean
 */
function base64_to_img($arr, $new_width = '', $new_height = '', $max_size = '')
{
    $result = [];

    foreach ($arr as $key => $value) {
        // 传值为空
        if (!$value) {
            $result[] = '';
            continue;
        }

        // 当前系统的图片
        if (strpos($value, get_host()) !== false) {
            $result[] = str_replace(get_host(), '', $value);
            continue;
        }

        // 非当前系统的图片
        if (strpos($value, 'http') !== false) {
            $result[] = $value;
            continue;
        }

        // base64位字符的值
        $base_img = str_replace('data:image/jpeg;base64,', '', $value);
        $base_img = str_replace('data:image/jpg;base64,', '', $base_img);
        $base_img = str_replace('data:image/png;base64,', '', $base_img);
        $base_img = str_replace('data:image/gif;base64,', '', $base_img);

        $dir         = './public/upload/goods_images/';
        $filename    = time() . rand(100, 999) . '.jpg';
        $output_file = $dir . $filename;
        file_put_contents($output_file, base64_decode($base_img));

        // 处理图片宽高
        if ($new_width && $new_height) {
            deal_img($output_file, $new_width, $new_height);
        } elseif ($new_width) {
            $img_info = getimagesize($output_file);
            $bili     = $img_info[1] / $img_info[0];
            deal_img($output_file, $new_width, $new_width * $bili);
        } elseif ($new_height) {
            $img_info = getimagesize($output_file);
            $bili     = $img_info[0] / $img_info[1];
            deal_img($output_file, $new_height * $bili, $new_height);
        }

        // 处理图片大小
        if ($max_size) {
            $size = filesize($output_file);
            $rate = 100;
            while ($size > $max_size) {
                deal_img($output_file, '', '', $rate);
                $size = filesize($output_file);
                $rate -= 10;

                if ($rate == 0) {
                    break;
                }
            }
        }

        $result[] = '/public/upload/goods_images/' . $filename;
    }

    return $result;
}

/**
 * desription 压缩图片
 * @param sting $imgsrc 图片路径
 * @param string $imgdst 压缩后保存路径
 * @param number $rate 压缩比率 0（最差质量，文件最小）到 100（最佳质量，文件最大）
 */
function deal_img($imgsrc, $new_width = '', $new_height = '', $rate = 100, $imgdst = '')
{
    list($width, $height, $type) = getimagesize($imgsrc);

    if (!$new_width) {
        $new_width = $width;
    }

    if (!$new_height) {
        $new_height = $height;
    }

    if (!$imgdst) {
        $imgdst = $imgsrc;
    }

    switch ($type) {
        case 1:
            $giftype = check_gifcartoon($imgsrc);
            if ($giftype) {
                header('Content-Type:image/gif');
                $image_wp = imagecreatetruecolor($new_width, $new_height);
                $image    = imagecreatefromgif($imgsrc);
                imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
                imagejpeg($image_wp, $imgdst, $rate); // 图像质量，范围从 0（最差质量，文件最小）到 100（最佳质量，文件最大），默认75
                imagedestroy($image_wp);
            }
            break;
        case 2:
            header('Content-Type:image/jpeg');
            $image_wp = imagecreatetruecolor($new_width, $new_height);
            $image    = imagecreatefromjpeg($imgsrc);
            imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
            imagejpeg($image_wp, $imgdst, $rate);
            imagedestroy($image_wp);
            break;
        case 3:
            header('Content-Type:image/png');
            $image_wp = imagecreatetruecolor($new_width, $new_height);
            //分配颜色 + alpha，将颜色填充到新图上
            $alpha = imagecolorallocatealpha($image_wp, 0, 0, 0, 127);
            imagefill($image_wp, 0, 0, $alpha);

            $image = imagecreatefrompng($imgsrc);
            imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
            imagejpeg($image_wp, $imgdst, $rate);
            imagedestroy($image_wp);
            break;
    }
}

/**
 * desription 判断是否gif动画
 * @param sting $image_file图片路径
 * @return boolean t 是 f 否
 */
function check_gifcartoon($image_file)
{
    $fp         = fopen($image_file, 'rb');
    $image_head = fread($fp, 1024);
    fclose($fp);
    return preg_match("/" . chr(0x21) . chr(0xff) . chr(0x0b) . 'NETSCAPE2.0' . "/", $image_head) ? false : true;
}

/**
 * 把返回的数据集转换成Tree
 */
function list_to_tree($list, $pk = 'id', $pid = 'pid', $child = '_child', $root = 0)
{
    // 创建Tree
    $tree = array();
    if (is_array($list)) {
        // 创建基于主键的数组引用
        $refer = array();
        foreach ($list as $key => $data) {
            $refer[$data[$pk]] = &$list[$key];
        }
        foreach ($list as $key => $data) {
            // 判断是否存在parent
            $parentId = $data[$pid];
            if ($root == $parentId) {
                $tree[] = &$list[$key];
            } else {
                if (isset($refer[$parentId])) {
                    $parent           = &$refer[$parentId];
                    $parent[$child][] = &$list[$key];
                }
            }
        }
    }

    return $tree;
}

/**
 * 模拟提交数据，获得返回值(post)
 */
function https_request($url, $data = null)
{
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
    if (!empty($data)) {
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $output = curl_exec($curl);
    curl_close($curl);
    return $output;
}

/**
 * 模拟提交数据，获得返回值(get)
 */
function https_request_get($url)
{
    //初始化
    $curl = curl_init();
    //设置抓取的url
    curl_setopt($curl, CURLOPT_URL, $url);
    //设置头文件的信息作为数据流输出
    curl_setopt($curl, CURLOPT_HEADER, 1);
    //设置获取的信息以文件流的形式返回，而不是直接输出。
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    //执行命令
    $data = curl_exec($curl);
    //关闭URL请求
    curl_close($curl);
    //显示获得的数据
    return $data;
}

/**
 * 生成二维码
 * @author YiYun
 */
function qrcode($data, $path = '')
{
    vendor('phpqrcode.phpqrcode');

    $filename = rand(100, 999) . time();
    if (empty($data)) {
        return '参数错误';
    }
    if (empty($path)) {
        $path = './public/upload/qrcodes/' . $filename . '.png';
    }
    QRcode::png($data, $path, 'L', 4);

    $path = '/public/upload/qrcodes/' . $filename . '.png';

    return $path;
}

function make_order_no($type)
{
    return $type . date('YmdHis') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
}

/**
 *  更新第三方配置文件
 */
function update_config_file($data, $file_path = '')
{
    if ($file_path) {
        $config_file = $file_path;
    } else {
        $config_file = 'application/api_init/config-' . WANCLL_ENV . '.php';
    }

    if (file_exists($config_file)) {
        $configs = include $config_file;
    } else {
        $configs = array();
    }

    $configs = array_merge($configs, $data);
    $result  = file_put_contents($config_file, "<?php\nreturn " . var_export($configs, true) . ";");

    return $result;
}

/**
 *  数组分页处理
 */
function array_page($array, $limit, $page = 1)
{
    if ($limit == 0 || $page == 0) {
        $start = 0;
        return array_slice($array, $start, count($array));
    } else {
        $start = ($page - 1) * $limit;
        return array_slice($array, $start, $limit);
    }
}

/**
 *  数组转xml函数
 */
function arr_to_xml($arr)
{
    $xml = '<xml>';
    foreach ($arr as $key => $val) {
        if (is_numeric($val)) {
            $xml = $xml . '<' . $key . '>' . $val . '</' . $key . '>';
        } else {
            $xml = $xml . '<' . $key . '><![CDATA[' . $val . ']]></' . $key . '>';
        }
    }
    $xml = $xml . '</xml>';

    return $xml;
}

/**
 *  xml转数组函数
 */
function xml_to_arr($xml)
{
    return json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
}

/**
 * 生成商品组合项的唯一ID
 */
function make_spec_group_id($goods_id, $spec_option_group)
{
    $arr = explode('_', $spec_option_group);
    sort($arr);
    $str = $goods_id . '-' . implode('_', $arr);

    return md5($str);
}

// 获取某一分类树
function get_one_tree($tree, $id)
{
    $one_tree = [];
    foreach ($tree as $value) {
        if ($id == $value['id']) {
            $one_tree = $value;
            break;
        }
    }

    return $one_tree;
}

// 检测分类树的子集
function is_cate_child($pid, $id)
{
    $is_has   = 0;
    $cate_ids = model('categories')->where(['pid' => $pid, 'status' => 1])->column('id');

    while ($is_has == 0 && $cate_ids) {
        if (in_array($id, $cate_ids)) {
            $is_has = 1;
        } else {
            $cate_ids = model('categories')->where(['pid' => ['in', $cate_ids], 'status' => 1])->column('id');
        }
    }

    return $is_has == 1 ? true : false;
}

/*
 * 读取配置文件
 * */
function get_config_file($index)
{
    $data = include 'application/api_init/config-' . WANCLL_ENV . '.php';
    return isset($data[$index]) ? $data[$index] : [];
}

/**
 *  根据经纬度计算两地距离
 */
function get_distance($lat1, $lng1, $lat2, $lng2)
{
    // 地球半径
    $earthRadius = 6367000;

    $lat1 = ($lat1 * pi()) / 180;
    $lng1 = ($lng1 * pi()) / 180;
    $lat2 = ($lat2 * pi()) / 180;
    $lng2 = ($lng2 * pi()) / 180;

    $calcLongitude = $lng2 - $lng1;
    $calcLatitude  = $lat2 - $lat1;
    $stepOne       = pow(sin($calcLatitude / 2), 2) + cos($lat1) * cos($lat2) * pow(sin($calcLongitude / 2), 2);
    $stepTwo       = 2 * asin(min(1, sqrt($stepOne)));
    $distance      = $earthRadius * $stepTwo;

    if ($distance < 1000) {
        $result = round($distance) . 'm';
    } else {
        $result = round(($distance / 1000)) . 'km';
    }

    return $result;
}

/**
 *  查找IDs集
 *  params：key字段
 *  params：value值
 *  params：table表名
 *  params：is_exact是否精确匹配(默认启用模糊查询)
 */
function get_ids($key, $value, $table, $is_exact = 0)
{
    $map = [];
    if ($is_exact == 0) {
        $map = [
            $key         => ['like', '%' . $value . '%'],
            'data_state' => 1,
        ];
    } elseif ($is_exact == 1) {
        $map = [
            $key         => $value,
            'data_state' => 1,
        ];
    }

    $ids = Db::name($table)->where($map)->column('id');
    return $ids;
}

/**
 *  校验layui的认证与授权
 *  params：auth认证码
 *  params：token授权码
 */
function layui_check_power($auth, $token)
{
    $system_auth = DataCache::getAuth();
    if ($auth !== $system_auth) {
        return 0;
    }

    $check_token = Db::name('tokens')->where(['token' => $token, 'is_mobile' => 0])->find();
    if ($check_token) {
        $time_length = time() - $check_token['create_time'];
        // 时间长度大于1天，重新登录
        if ($time_length >= 86400) {
            return 0;
            // 时间长度大于过期时间（2小时）且小于1天，刷新token
        } elseif ($time_length < 86400 && $time_length > $check_token['expire_time']) {
            return 0;
        }
    } else {
        return 0;
    }

    return 1;
}

/**
 *  创建产品的唯一序列号
 */
function make_uuid()
{
    $chars = md5(uniqid(mt_rand(), true));
    $uuid  = substr($chars, 0, 8) . '-';
    $uuid .= substr($chars, 8, 4) . '-';
    $uuid .= substr($chars, 12, 4) . '-';
    $uuid .= substr($chars, 16, 4) . '-';
    $uuid .= substr($chars, 20, 12);
    return $uuid;
}

/*
 * 商品分类等级控制
 */
function goods_cate_level_limit($goods_cate_id, $pid, $level_limit)
{
    // 计算分类的上级的层数
    $result = goods_cate_level_location($pid);
    if ($result['code']) {
        $up_level_num = $result['up_level_num'];
    } else {
        return $result;
    }

    // 计算分类的下级的层数
    $result = goods_cate_level_location($goods_cate_id);
    if ($result['code']) {
        $down_level_num = $result['down_level_num'];
    } else {
        return $result;
    }

    $total_level_num = $up_level_num + $down_level_num + 2;
    if ($total_level_num > $level_limit) {
        return false;
    } else {
        return true;
    }
}

/*
 * 计算商品分类等级所在位置
 */
function goods_cate_level_location($goods_cate_id)
{
    if ($goods_cate_id == 0) {
        return ['code' => 1, 'up_level_num' => 0, 'down_level_num' => 0];
    }

    $goods_cate = model('goods_cates')->getOne($goods_cate_id);
    if (!$goods_cate) {
        return ['code' => 0, 'msg' => 'ID为' . $goods_cate_id . '的分类不存在'];
    }

    $up_level   = 0;
    $down_level = 0;

    // 查询上级的层数
    $next_up_goods_cate = model('goods_cates')->getOne($goods_cate['pid']);
    while ($next_up_goods_cate) {
        ++$up_level;
        $next_up_goods_cate = model('goods_cates')->getOne($next_up_goods_cate['pid']);
    }

    // 查询下级的层数
    $next_down_goods_cate = model('goods_cates')->findOne(['pid' => $goods_cate_id]);
    while ($next_down_goods_cate) {
        ++$down_level;
        $next_down_goods_cate = model('goods_cates')->findOne(['pid' => $next_down_goods_cate['id']]);
    }

    return ['code' => 1, 'up_level_num' => $up_level, 'down_level_num' => $down_level];
}