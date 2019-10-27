<?php
namespace app\api_bonus\validate;

use think\Validate;

class RegionBonus extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '地址ID不能为空'],
        ['user_id', 'require|checkValue:user_id', '会员ID不能为空'],
        ['type', 'require|in:1,2,3|checkValue:type', '地区代理级别不能为空|地区代理级别值非法'],
        ['province_code', 'checkValue:province_code'],
        ['city_code', 'checkValue:city_code'],
        ['area_code', 'checkValue:area_code'],
        ['is_open_own_rate', 'require|boolean', '是否开启单独分红不能为空|是否开启单独分红值非法'],
        ['region_rate', 'number|<=:100', '地区独立分红比例不能为空|地区独立分红比例必须为数字|地区独立分红比例不能大于100'],
        ['status', 'require|in:1,2', '状态值不能为空|状态值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'type', 'province_code', 'city_code', 'area_code', 'is_open_own_rate', 'region_rate', 'status'],
        'update' => ['user_id', 'type', 'province_code', 'city_code', 'area_code', 'is_open_own_rate', 'region_rate', 'status', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        $province_code = input('province_code');
        $city_code     = input('city_code');
        $area_code     = input('area_code');
        $id            = input('id');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    if ($user['is_bonus'] == 1) {
                        if ($this->currentScene == 'create') {
                            $region_bonus = model('region_bonus', 'bonus_model')->findOne(['user_id' => $value]);
                        } elseif ($this->currentScene == 'update') {
                            $region_bonus = model('region_bonus', 'bonus_model')->findOne(['user_id' => $value, 'id' => ['neq', $id]]);
                        } else {
                            return '验证场景不存在';
                        }

                        if ($region_bonus) {
                            return '当前会员已设置区域分红信息';
                        } else {
                            return true;
                        }
                    } else {
                        return '当前会员暂不是分红商';
                    }
                } else {
                    return '会员ID不存在';
                }
                break;
            case 'province_code':
                if ($value) {
                    $json = file_get_contents('extend/china_regions/province_object.json');
                    $arr  = json_decode($json, true);
                    if (isset($arr[$value])) {
                        return true;
                    } else {
                        return '省份编码不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'city_code':
                if ($value) {
                    $json = file_get_contents('extend/china_regions/city_object.json');
                    $arr  = json_decode($json, true);
                    if (isset($arr[$value])) {
                        return true;
                    } else {
                        return '城市编码不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'area_code':
                if ($value) {
                    $json = file_get_contents('extend/china_regions/area_object.json');
                    $arr  = json_decode($json, true);
                    if (isset($arr[$value])) {
                        return true;
                    } else {
                        return '地区编码不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'type':
                if ($value == 1) {
                    if ($this->currentScene == 'create') {
                        $region_bonus = model('region_bonus', 'bonus_model')->findOne(['type' => 1, 'province_code' => $province_code]);
                    } elseif ($this->currentScene == 'update') {
                        $region_bonus = model('region_bonus', 'bonus_model')->findOne(['type' => 1, 'province_code' => $province_code, 'id' => ['neq', $id]]);
                    } else {
                        return '验证场景不存在';
                    }

                    if ($region_bonus) {
                        return '当前地区的分红代理已设置';
                    } else {
                        return true;
                    }
                } elseif ($value == 2) {
                    if ($this->currentScene == 'create') {
                        $region_bonus = model('region_bonus', 'bonus_model')->findOne(['type' => 2, 'city_code' => $city_code]);
                    } elseif ($this->currentScene == 'update') {
                        $region_bonus = model('region_bonus', 'bonus_model')->findOne(['type' => 2, 'city_code' => $city_code, 'id' => ['neq', $id]]);
                    } else {
                        return '验证场景不存在';
                    }

                    if ($region_bonus) {
                        return '当前地区的分红代理已设置';
                    } else {
                        return true;
                    }
                } elseif ($value == 3) {
                    if ($this->currentScene == 'create') {
                        $region_bonus = model('region_bonus', 'bonus_model')->findOne(['type' => 3, 'area_code' => $area_code]);
                    } elseif ($this->currentScene == 'update') {
                        $region_bonus = model('region_bonus', 'bonus_model')->findOne(['type' => 3, 'area_code' => $area_code, 'id' => ['neq', $id]]);
                    } else {
                        return '验证场景不存在';
                    }

                    if ($region_bonus) {
                        return '当前地区的分红代理已设置';
                    } else {
                        return true;
                    }
                } else {
                    return '区域分红商类别值非法';
                }
                break;
            case 'id':
                $region_bonus = model('region_bonus', 'bonus_model')->getOne($value);
                if ($region_bonus) {
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
