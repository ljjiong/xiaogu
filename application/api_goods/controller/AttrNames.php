<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class AttrNames extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin',
    ];

    /**
     * 【admin】查询全部属性名称
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 属性名称名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('attr_names')->getAllCount($map);
        $lists = model('attr_names')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条属性名称详情
     */
    public function read($id)
    {
        $this->data['data'] = model('attr_names')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建属性名称
     */
    public function save(Request $request)
    {

        $data = $request->param();

        $validate = Loader::validate('attr_name');
        if ($validate->scene('create')->check($data)) {

            $result = model('attr_names')->addOne($data);
            if ($result['code']) {
                $attr_name_id     = $result['data']['id'];
                $attr_template_id = $result['data']['attr_template_id'];
                $options          = array_unique($data['options']); // 去除重复值

                // 批量新增属性值
                $option_data = [];
                foreach ($options as $key => $value) {
                    $option_data[] = [
                        'attr_template_id' => $attr_template_id,
                        'attr_name_id'     => $attr_name_id,
                        'option'           => $value,
                    ];
                }
                model('attr_options')->batchAdd($option_data);

                $this->data['msg']  = '新增属性名称成功';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】更新属性名称
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('attr_name');
        if ($validate->scene('update')->check($data)) {
            unset($data['attr_template_id']); //不可再更新属性模板的值(模型只读字段也已做处理)

            $result = model('attr_names')->editOne($data);
            if ($result['code']) {

                // 获取当前属性名称的含有的属性值（old)
                $old_option_data = model('attr_names')->getOne($data['id']);
                $old_options     = array_column($old_option_data['options'], 'option');

                // 获取当前属性名称的含有的属性值（new)
                $new_options = array_unique($data['options']); //去除重复值

                // 需要删除的值
                $need_del_options = array_diff($old_options, $new_options);
                $need_del_data    = [
                    'attr_template_id' => $old_option_data['attr_template_id'],
                    'attr_name_id'     => $data['id'],
                    'option'           => ['in', $need_del_options],
                ];
                model('attr_options')->delAllTrue($need_del_data);

                // 需要新增的值
                $need_add_options = array_diff($new_options, $old_options);
                $need_add_data    = [];
                foreach ($need_add_options as $key => $value) {
                    $need_add_data[] = [
                        'attr_template_id' => $old_option_data['attr_template_id'],
                        'attr_name_id'     => $data['id'],
                        'option'           => $value,
                    ];
                }
                model('attr_options')->batchAdd($need_add_data);

                $this->data['msg']  = '更新属性名称成功';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】删除属性名称
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('attr_names')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除属性名称成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除属性名称
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('attr_names')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除属性名称成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

}
