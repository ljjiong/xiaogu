<?php
namespace app\api_systems\validate;

use think\Validate;

class Qiniu extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', 'ID不能为空'],
        ['file_name', 'require|max:255', '文件名不能为空|文件名限255字符'],
        ['file_type', 'require', '文件类型不能为空'],
        ['key', 'require', '七牛key不能为空'],
    ];

    protected $scene = [
        'create' => ['file_name', 'file_type', 'key'],
        'update' => ['file_name', 'id'],
    ];

    protected function checkValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $qiniu_file = model('qiniu_files')->getOne($value);
                if ($qiniu_file) {
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
