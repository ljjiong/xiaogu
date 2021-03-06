<?php
namespace app\common\model;

/*
 *  【合作伙伴模型】
 */
class PostSale extends BaseModel
{
    // 指定数据表
    protected $table = 'work_post_sale';

    //类型转换
    protected $type = [
        'id'                      => 'integer',
    ];

    // 获取器【user_info】
    // public function getUserInfoAttr($value, $data)
    // {
    //     return model('users')->getUserBasicInfo($data['user_id']);
    // }
     // 获取器【type_name】
   

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
        }

        return $data;
    }

}
