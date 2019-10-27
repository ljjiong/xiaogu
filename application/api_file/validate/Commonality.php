<?php
namespace app\api_file\validate;

use think\Validate;

class Commonality extends Validate
{
    protected $rule = [
        ['type', 'require', '类型不能为空'],
        ['com_name', 'require', '名称不能为空'],
    ];
}
