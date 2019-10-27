<?php
namespace app\common\bonus_model;

use app\common\model\BaseModel;

/*
 *  【地区分红模型】
 */
class RegionBonus extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_region_bonus';

    //类型转换
    protected $type = [
        'id'               => 'integer',
        'user_id'          => 'integer',
        'type'             => 'integer',
        'is_open_own_rate' => 'boolean',
        'region_rate'      => 'float',
        'status'           => 'integer',
        'data_state'       => 'integer',
    ];

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理地区编码
        self::beforeWrite(function ($model) {
            // 处理省份
            if (isset($model->data['province_code']) && $model->data['province_code']) {
                $json            = file_get_contents('extend/china_regions/province_object.json');
                $arr             = json_decode($json, true);
                $model->province = $arr[$model->data['province_code']]['name'];
            }

            // 处理城市
            if (isset($model->data['city_code']) && $model->data['city_code']) {
                $json        = file_get_contents('extend/china_regions/city_object.json');
                $arr         = json_decode($json, true);
                $model->city = $arr[$model->data['city_code']]['name'];
            }

            // 处理地区
            if (isset($model->data['area_code']) && $model->data['area_code']) {
                $json        = file_get_contents('extend/china_regions/area_object.json');
                $arr         = json_decode($json, true);
                $model->area = $arr[$model->data['area_code']]['name'];
            }
        });
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_info'] = '';
        }

        return $data;
    }
}
