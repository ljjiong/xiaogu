<?php
namespace app\common\model;

/*
 *  【会员地址模型】
 */
class Addresses extends BaseModel
{
    // 指定数据表
    protected $table = 'work_addresses';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'is_default' => 'integer',
        'sort'       => 'integer',
        'data_state' => 'integer',
    ];

    // 获取器【address_info】
    public function getAddressInfoAttr($value, $data)
    {
        return $data['province'] . $data['city'] . $data['area'] . $data['address'];
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理地区编码
        self::beforeWrite(function ($model) {
            // 处理省份
            if (isset($model->data['province_code'])) {
                $json            = file_get_contents('extend/china_regions/province_object.json');
                $arr             = json_decode($json, true);
                $model->province = $arr[$model->data['province_code']]['name'];
            }

            // 处理城市
            if (isset($model->data['city_code'])) {
                $json        = file_get_contents('extend/china_regions/city_object.json');
                $arr         = json_decode($json, true);
                $model->city = $arr[$model->data['city_code']]['name'];
            }

            // 处理地区
            if (isset($model->data['area_code'])) {
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
            $data = $this->where($where)->order('user_id desc, is_default desc, id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('user_id desc, is_default desc, id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['address_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['address_info'] = '';
        }

        return $data ? $data : [];
    }

    // 设置为默认地址
    public function deal_default($id)
    {
        $address = $this->getOne($id);
        if ($address['is_default'] == 1) {
            $other_addresses = $this->getAll(['user_id' => $address['user_id'], 'id' => ['neq', $address['id']]]);
            $update_data     = [];
            foreach ($other_addresses as $key => $value) {
                $update_data[] = [
                    'id'         => $value['id'],
                    'is_default' => 0,
                ];
            }
            $result = $this->saveAll($update_data);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                return ['code' => 1, 'data' => [], 'msg' => '批量操作成功'];
            }
        } else {
            return;
        }
    }
}
