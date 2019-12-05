<?php
namespace app\common\model;

/*
 *  【配置模型】
 */
class Config extends BaseModel
{
    // 指定数据表
    protected $table = 'work_config';

    //类型转换
    protected $type = [
        'id' => 'integer',
    ];

    // 获取器【value】
    public function getValueAttr($value, $data)
    {
        switch ($data['name']) {
            case 'system_title':
                return $value ? $value : 'work';
                break;
            case 'version':
                return $value ? $value : 'v1.4.2';
                break;
            case 'head':
                return $value ? $value : '';
                break;
            case 'body':
                return $value ? $value : '';
                break;
            case 'copyright':
                return $value ? $value : '湖南蜗壳科技有限公司';
                break;
            case 'customer_telephone':
                return $value ? $value : '';
                break;
            case 'web_icon':
                return $value ? show_upload_img($value) : show_upload_img('/public/upload/user_images/20180926/baa9bc1f16dbdc95b49db87e5adff317.png');
                break;
            case 'admin_login_logo':
                return $value ? show_upload_img($value) : show_upload_img('/public/static/images/login-logo.png');
                break;
            case 'admin_index_logo':
                return $value ? show_upload_img($value) : show_upload_img('/public/static/images/fa-trademark.png');
                break;
            case 'wap_index_logo':
                return $value ? show_upload_img($value) : show_upload_img('/public/static/wap/images/index_logo.png');
                break;
            case 'wap_login_logo':
                return $value ? show_upload_img($value) : show_upload_img('/public/static/wap/images/wap_logo.png');
                break;
            case 'home_pc_logo':
                return $value ? show_upload_img($value) : show_upload_img('/public/upload/user_images/20181028/25e8f92a0c5fb9c33881f5da093abbda.jpg');
                break;
            case 'avatar':
                return $value ? show_upload_img($value) : show_upload_img('/public/static/images/avatar.png');
                break;
            case 'share_img':
                return $value ? show_upload_img($value) : show_upload_img('/public/static/wap/images/yaoqing.png');
                break;
            default:
                # code...
                break;
        }
    }

}
