<?php
namespace app\api_users\validate;

use think\Validate;

class Address extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '地址ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['consignee_name', 'require|max:50', '签收人姓名不能为空|签收人姓名限50字符'],
        ['mobile', 'require|mobile', '手机号不能为空|手机号格式错误'],
        ['province_code', 'require|checkValue:province_code', '省份编码不能为空'],
        ['city_code', 'require|checkValue:city_code', '城市编码不能为空'],
        ['area_code', 'require|checkValue:area_code', '地区编码不能为空'],
        ['address', 'require|max:255', '详细地址不能为空|详细地址限255字符'],
        ['is_default', 'require|in:0,1', '是否设为默认地址不能为空|是否设为默认地址值非法'],
    ];

    protected $regex = [
        'mobile' => '/^1[0-9]{1}\d{9}$/',
    ];

    protected $scene = [
        'create'      => ['user_id', 'consignee_name', 'mobile', 'province_code', 'city_code', 'area_code', 'address', 'is_default'],
        'update'      => ['user_id', 'consignee_name', 'mobile', 'province_code', 'city_code', 'area_code', 'address', 'is_default', 'id'],
        'set_default' => ['is_default', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员ID不存在';
                }
                break;
            case 'province_code':
                $json = file_get_contents('extend/china_regions/province_object.json');
                $arr  = json_decode($json, true);
                if (isset($arr[$value])) {
                    return true;
                } else {
                    return '省份编码不存在';
                }
                break;
            case 'city_code':
                $json = file_get_contents('extend/china_regions/city_object.json');
                $arr  = json_decode($json, true);
                if (isset($arr[$value])) {
                    return true;
                } else {
                    return '城市编码不存在';
                }
                break;
            case 'area_code':
                $json = file_get_contents('extend/china_regions/area_object.json');
                $arr  = json_decode($json, true);
                if (isset($arr[$value])) {
                    return true;
                } else {
                    return '地区编码不存在';
                }
                break;
            case 'id':
                $address = model('addresses')->getOne($value);
                if ($address) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }

}
