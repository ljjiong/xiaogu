<?php
namespace app\api_file\validate;

use think\Validate;

class Company extends Validate
{
    protected $rule = [
        ['uid', 'require', '未登录'],
        ['file_name', 'require', '文件名不能为空'],
        ['file_url', 'require', '未上传文件'],

    ];
    
}
