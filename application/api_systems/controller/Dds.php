<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Db;
use think\Loader;
use think\Request;

import('app.api_extend.extend.dd.ddsql');

class Dds extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin'=> ['except' => 'index'],
    ];

    /**
     * 【admin】查询全部数据字典
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 数据字典名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 数据字典数据表名模糊查询
                if ($key == 'table_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }
        $map['id'] = ['<>', 27];

        $count = model('dds')->getAllCount($map);
        $lists = model('dds')->getAll($map, $this->page_num, $this->page_limit);
        // return $lists;

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单条数据字典详情
     */
    public function read($id)
    {
        $this->data['data'] = model('dds')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建数据字典
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('dd');
        if ($validate->scene('create')->check($data)) {

            $result = model('dds')->addOne($data);
            if ($result['code']) {
                // 创建表
                $ddsql = new \ddsql();
                $ddsql->create_table($result['data']['table_name']);

                $this->data['msg']  = '新增数据字典成功';
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
     * 【admin】更新数据字典
     */
    public function update(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('dd');
        if ($validate->scene('update')->check($data)) {

            $result = model('dds')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新数据字典成功';
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
     * 【admin】删除数据字典
     */
    public function delete()
    {
        $id = input('id/d', 0);

        // 删除表
        $dd    = model('dds')->getOne($id);
        $ddsql = new \ddsql();
        $ddsql->del_table($dd['table_name']);

        $result = model('dds')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除数据字典成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除数据字典
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        foreach ($ids as $value) {
            // 删除表
            $dd    = model('dds')->getOne($value);
            $ddsql = new \ddsql();
            $ddsql->del_table($dd['table_name']);
        }

        $result = model('dds')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除数据字典成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】查询数据表信息
     */
    public function table_info()
    {
        $table = input('table_name');

        $ddsql  = new \ddsql();
        $result = $ddsql->table_info($table);

        $this->data['data'] = $result['data'];

        return $this->data;
    }

    /**
     * 【admin】查询指定数据表列
     */
    public function get_table_field()
    {
        $table = input('table_name');
        $abbr  = input('abbr');

        $ddsql  = new \ddsql();
        $result = $ddsql->get_field($table, $abbr);

        $this->data['data'] = $result['data'];

        return $this->data;
    }

    /**
     * 【admin】增加数据表列
     */
    public function add_table_field(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('table_field');
        if ($validate->scene('create')->check($data)) {

            $ddsql  = new \ddsql();
            $result = $ddsql->add_field($data['table_name'], $data['attr'], $data['abbr'], $data['type']);

            if ($result['code']) {
                $this->data['msg'] = '增加数据表列成功';
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
     * 【admin】修改数据表列
     */
    public function mod_table_field(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('table_field');
        if ($validate->scene('update')->check($data)) {

            $ddsql  = new \ddsql();
            $result = $ddsql->mod_field($data['table_name'], $data['attr'], $data['abbr'], $data['type']);

            if ($result['code']) {
                $this->data['msg'] = '修改数据表列成功';
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
     * 【admin】删除数据表列
     */
    public function del_table_field(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('table_field');
        if ($validate->scene('delete')->check($data)) {

            $ddsql  = new \ddsql();
            $result = $ddsql->del_field($data['table_name'], $data['abbr']);

            if ($result['code']) {
                $this->data['msg'] = '删除数据表列成功';
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
     * 【admin】增加字典数据
     */
    public function add_table_data(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('table_field');
        if ($validate->scene('table_data')->check($data)) {

            $table      = $data['table_name'];
            $table_name = 'custom_' . $table;
            unset($data['table_name']);

            foreach ($data as $key => $value) {
                $ddsql  = new \ddsql();
                $result = $ddsql->get_field($table, $key);
                if ($result['data']['type'] == 2) {
                    $data[$key] = base64_to_img([$value])[0];
                }
            }

            $table_data_id = Db::name($table_name)->insertGetId($data);
            if ($table_data_id) {
                $this->data['msg'] = '添加字典数据成功';
            } else {
                $this->data['msg'] = '添加字典数据失败';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】修改字典数据
     */
    public function mod_table_data(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('table_field');
        if ($validate->scene('table_data')->check($data)) {

            $table      = $data['table_name'];
            $table_name = 'custom_' . $table;
            unset($data['table_name']);

            foreach ($data as $key => $value) {
                if ($key != 'id') {
                    $ddsql  = new \ddsql();
                    $result = $ddsql->get_field($table, $key);
                    if ($result['data']['type'] == 2) {
                        $data[$key] = base64_to_img([$value])[0];
                    }
                }
            }

            $result = Db::name($table_name)->update($data);
            if ($result !== false) {
                $this->data['msg'] = '更新字典数据成功';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '更新字典数据失败';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】删除字典数据
     */
    public function del_table_data(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('table_field');
        if ($validate->scene('table_data')->check($data)) {

            $table_name = 'custom_' . $data['table_name'];
            unset($data['table_name']);

            $result = Db::name($table_name)->where('id', $data['id'])->delete();

            $this->data['msg'] = '删除字典数据成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询字典全部数据
     */
    public function all_table_data(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('table_field');
        if ($validate->scene('table_data')->check($data)) {

            $table      = $data['table_name'];
            $table_name = 'custom_' . $table;
            unset($data['table_name']);

            $count = Db::name($table_name)->count();
            $lists = Db::name($table_name)->page($this->page_num, $this->page_limit)->select();

            // 查询图片属性
            $ddsql     = new \ddsql();
            $field     = $ddsql->table_info($table);
            $img_field = [];
            foreach ($field['data'] as $key => $value) {
                if ($value['type'] == 2) {
                    $img_field[] = $value['abbr'];
                }
            }

            // 处理图片属性
            foreach ($lists as $key => $value) {
                foreach ($img_field as $abbr) {
                    $lists[$key][$abbr] = $value[$abbr] ? get_host() . $value[$abbr] : '';
                }
            }

            $this->data['page'] = [
                'page_num'   => $this->page_num,
                'page_limit' => $this->page_limit,
                'data_count' => $count,
            ];

            $this->data['data'] = $lists;
            $this->data['msg']  = '获取字典全部数据成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】查询指定ID字典数据
     */
    public function id_table_data(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('table_field');
        if ($validate->scene('table_data')->check($data)) {

            $table      = $data['table_name'];
            $table_name = 'custom_' . $table;
            unset($data['table_name']);

            $result = Db::name($table_name)->where('id', $data['id'])->find();

            // 查询图片属性
            $ddsql     = new \ddsql();
            $field     = $ddsql->table_info($table);
            $img_field = [];
            foreach ($field['data'] as $key => $value) {
                if ($value['type'] == 2) {
                    $img_field[] = $value['abbr'];
                }
            }

            // 处理图片属性
            foreach ($img_field as $abbr) {
                $result[$abbr] = $result[$abbr] ? get_host() . $result[$abbr] : '';
            }

            $this->data['data'] = $result;
            $this->data['msg']  = '获取字典指定ID数据成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }
}
