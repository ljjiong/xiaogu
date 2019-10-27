<?php
namespace app\api_systems\validate;

use think\Validate;

import('app.api_extend.extend.dd.ddsql');

class TableField extends Validate
{
    protected $rule = [
        ['table_name', 'require|checkValue:table_name', '表名不能为空'],
        ['attr', 'require|max:50|checkValue:attr', '表列名不能为空|表列名最大限50字符'],
        ['abbr', 'require|max:20|checkValue:abbr', '表列名英文缩写不能为空|表列名英文缩写最大限20字符'],
        ['type', 'require|in:1,2', '表列类型不能为空|表列类型值非法'],

    ];

    protected $scene = [
        'create'     => ['table_name', 'attr', 'abbr', 'type'],
        'update'     => ['table_name', 'attr', 'abbr', 'type'],
        'delete'     => ['table_name', 'abbr'],
        'table_data' => ['table_name'],
    ];

    protected function checkValue($value, $rule)
    {
        $table_name = input('table_name');

        switch ($rule) {
            case 'table_name':
                $dd = model('dds')->findOne(['table_name' => $value]);
                if ($dd) {
                    return true;
                } else {
                    return '数据字典表名不存在';
                }
                break;
            case 'attr':
                $ddsql  = new \ddsql();
                $result = $ddsql->table_info($table_name);
                if ($this->currentScene == 'create') {
                    foreach ($result['data'] as $k => $v) {
                        if ($v['attr'] == $value) {
                            return '表列名已存在';
                            break;
                        }
                    }
                    return true;
                } elseif ($this->currentScene == 'update') {
                    return true;
                }
                break;
            case 'abbr':
                $ddsql  = new \ddsql();
                $result = $ddsql->table_info($table_name);
                if ($this->currentScene == 'create') {
                    foreach ($result['data'] as $k => $v) {
                        if ($v['abbr'] == $value) {
                            return '表列名英文缩写已存在';
                            break;
                        }
                    }
                    return true;
                } elseif ($this->currentScene == 'update') {
                    return true;
                } elseif ($this->currentScene == 'delete') {
                    return true;
                }
                break;
            default:
                # code...
                break;
        }
    }
}
