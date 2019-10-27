<?php
namespace app\api_systems\validate;

use think\Validate;

class ReadIdCard extends Validate
{
    protected $rule = [
        ['base64_str', 'require', '图片base64位编码不能为空'],
        ['side', 'require|in:back,front', '图片类别不能为空|图片类别值非法'],
    ];
}
