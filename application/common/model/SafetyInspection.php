<?php
namespace app\common\model;

/*
 *  【系统规则模型】
 */
class SafetyInspection extends BaseModel
{
    // 指定数据表
    protected $table = 'work_safety_inspection';

    //类型转换
    protected $type = [
        'id'         => 'integer',
    ];

    // 获取器【thum】
    // public function getThumAttr($value, $data)
    // {
    //     return show_upload_img($value);
    // }

    
    // // 查询全部(含分页)
    // public function getAll($where = [], $page_num = '', $page_limit = '')
    // {
    //     if ($page_num && $page_limit) {
    //         $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
    //     } else {
    //         $data = $this->where($where)->order('id desc')->select();
    //     }

    //     foreach ($data as $key => $value) {
    //         $data[$key]['type_name'] = '';
    //     }

    //     return $data;
    // }

    
}
