<?php
namespace app\api_systems\validate;

use think\Request;
use think\Validate;

class Category extends Validate
{
    protected $rule = [
        ['id', 'require|checkValue:id', '分类ID不能为空'],
        ['name', 'require|max:255|checkValue:name', '分类名称不能为空|分类名称最大限255字符'],
        ['pid', 'require|checkValue:pid|canAdd', '父级分类不能为空'],
        ['sort', 'require|number|>=:0', '排序不能为空|排序必须为数字|排序必须大于0'],
        ['status', 'require|in:1,2', '状态不能为空|状态值非法'],
    ];

    protected $scene = [
        'create'       => ['name', 'pid', 'status'],
        'update'       => ['name', 'pid', 'status', 'id'],
        'delete'       => ['id'],
        'batch_delete' => ['id' => 'require|array|checkValue:id'],
    ];

    // 分类删除：有子不能删父
    protected function canDelete($id)
    {
        $model = model('categories')->getOne($id);
        if ($model) {
            $son = model('categories')->findOne(['pid' => $id]);
            if ($son) {
                return ['code' => 0, 'msg' => 'id为' . $id . '的分类有子分类，请先删除其子分类'];
            }
        }

        return ['code' => 1];
    }

    // 最大分类层数限制
    protected function canAdd($pid)
    {
        $config    = get_config_file('category');
        $max       = $config['max_level'];
        $hasParent = true;
        for ($i = 1; $i <= $max; $i++) {
            $model = model('categories')->getOne($pid);
            if ($model) {
                $pid = $model->pid;
            } else {
                $hasParent = false;
                break;
            }
        }

        if ($hasParent) {
            return '最大分类层数为' . $max;
        }

        return true;
    }

    protected function checkValue($value, $rule)
    {
        if ($this->currentScene == 'batch_delete') {
            $id = Request::instance()->param()['id'];
        } else {
            $id = input('id');
        }

        switch ($rule) {
            case 'pid':
                if ($value == 0) {
                    return true;
                } else {
                    $model = model('categories')->getOne($value);
                    if ($model) {
                        if ($this->currentScene == 'create') {
                            return true;
                        } elseif ($this->currentScene == 'update') {
                            if ($value == $id) {
                                return '父级分类不能为自身';
                            } else {
                                return true;
                            }
                        }
                    } else {
                        return '数据不存在';
                    }
                }
                break;
            case 'id':
                if ($this->currentScene == 'update') {
                    $model = model('categories')->getOne($value);
                    if (!$model) {
                        return '数据不存在';
                    }
                    return true;
                } else if ($this->currentScene == 'delete') {
                    $result = $this->canDelete($value);
                    if (!$result['code']) {
                        return $result['msg'];
                    }
                    return true;
                } else if ($this->currentScene == 'batch_delete') {
                    foreach ($value as $id) {
                        $result = $this->canDelete($id);
                        if (!$result['code']) {
                            return $result['msg'];
                        }
                    }
                    return true;
                }
                break;
            case 'name':
                $pid   = input('pid');
                $model = model('categories')->findOne(['name' => $value]);
                if ($this->currentScene == 'create') {
                    // 同名存在，且同属一个分类，不允许重名
                    if ($model && $model->pid == $pid) {
                        return '该分类已存在';
                    }
                    return true;
                } elseif ($this->currentScene == 'update') {
                    if ($model && ($model->id != $id) && $model->pid == $pid) {
                        return '该分类已存在';
                    }
                    return true;
                }
                break;
            default:
                # code...
                break;
        }
    }
}
