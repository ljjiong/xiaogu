<?php
namespace app\common\model;

class DailyStatistical extends BaseModel
{
    // 指定数据表
    protected $table = 'work_daily_statistical';

    //类型转换
    protected $type = [
        'id'           => 'integer',
        'dateline'     => 'string',
        'name'         => 'string',
        'enter'        => 'string',
        'generate'     => 'string',
        'imports'      => 'string',
        'Hanyama'      => 'string',
        'weather'      => 'string',
        'rainfall'     => 'integer',
        'created_time' => 'date',
    ];

    // 查询月数据
    public function get_month_All($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->field('name,dateline,sum(storages),sum(water_yield),sum(electricity),sum(rainfall),sum(imports),sum(hanyama)')->group('dateline,name')->select();
            
            foreach ($data as $key => $value) {
                $data[$key]['storages']    = $data[$key]['sum(storages)'];
                $data[$key]['water_yield'] = $data[$key]['sum(water_yield)'];
                $data[$key]['electricity'] = $data[$key]['sum(electricity)'];
                $data[$key]['rainfall']    = $data[$key]['sum(rainfall)'];
                $data[$key]['imports']    = $data[$key]['sum(imports)'];
                $data[$key]['hanyama']    = $data[$key]['sum(hanyama)'];
                unset( $data[$key]['sum(storages)']);
                unset( $data[$key]['sum(water_yield)']);
                unset( $data[$key]['sum(electricity)']);
                unset( $data[$key]['sum(rainfall)']);
                unset( $data[$key]['sum(imports)']);
                unset( $data[$key]['sum(hanyama)']);
            }

        } else {
            $data = $this->where($where)->order('id desc')->group('dateline')->select();
        }

        return $data;
    }


        // 查询大水江水库水情月数据
    public function get_floods_month_All($where = [], $page_num = '', $page_limit = '')
    {   
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->field('name,create_time,sum(storages),sum(water_yield),sum(electricity),sum(rainfall),sum(imports),sum(hanyama)')->group("date_format(create_time, '%Y-%m   '),name")->select();
            
            foreach ($data as $key => $value) {
                $data[$key]['storages']    = $data[$key]['sum(storages)'];
                $data[$key]['water_yield'] = $data[$key]['sum(water_yield)'];
                $data[$key]['electricity'] = $data[$key]['sum(electricity)'];
                $data[$key]['rainfall']    = $data[$key]['sum(rainfall)'];
                $data[$key]['imports']    = $data[$key]['sum(imports)'];
                $data[$key]['hanyama']    = $data[$key]['sum(hanyama)'];
                unset( $data[$key]['sum(storages)']);
                unset( $data[$key]['sum(water_yield)']);
                unset( $data[$key]['sum(electricity)']);
                unset( $data[$key]['sum(rainfall)']);
                unset( $data[$key]['sum(imports)']);
                unset( $data[$key]['sum(hanyama)']);
            }

        } else {
            $data = $this->where($where)->order('id desc')->group('dateline')->select();
        }

        return $data;
    }


        // 查询大圳水库水情月数据
    public function get_bigdata_month_All($where = [], $page_num = '', $page_limit = '')
    {   
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->field('name,create_time,sum(storages),sum(water_yield),sum(electricity),sum(rainfall),sum(imports),sum(hanyama)')->group("date_format(create_time, '%Y-%m   '),name")->select();
            
            foreach ($data as $key => $value) {
                $data[$key]['storages']    = $data[$key]['sum(storages)'];
                $data[$key]['water_yield'] = $data[$key]['sum(water_yield)'];
                $data[$key]['electricity'] = $data[$key]['sum(electricity)'];
                $data[$key]['rainfall']    = $data[$key]['sum(rainfall)'];
                $data[$key]['imports']    = $data[$key]['sum(imports)'];
                $data[$key]['hanyama']    = $data[$key]['sum(hanyama)'];
                unset( $data[$key]['sum(storages)']);
                unset( $data[$key]['sum(water_yield)']);
                unset( $data[$key]['sum(electricity)']);
                unset( $data[$key]['sum(rainfall)']);
                unset( $data[$key]['sum(imports)']);
                unset( $data[$key]['sum(hanyama)']);
            }

        } else {
            $data = $this->where($where)->order('id desc')->group('dateline')->select();
        }

        return $data;
    }


      // 查询年数据
    public function get_year_All($where = [], $page_num = '', $page_limit = '')
    {

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->field('name,year,sum(water_yield),sum(electricity),sum(imports),sum(hanyama),sum(rainfall),create_time')->group('year,name')->select(); 
            foreach ($data as $key => $value) {
                $data[$key]['water_yield']    = $data[$key]['sum(water_yield)'];
                $data[$key]['electricity'] = $data[$key]['sum(electricity)'];
                $data[$key]['imports'] = $data[$key]['sum(imports)'];
                $data[$key]['hanyama']    = $data[$key]['sum(hanyama)'];
                $data[$key]['rainfall']    = $data[$key]['sum(rainfall)'];
                unset( $data[$key]['sum(water_yield)']);
                unset( $data[$key]['sum(electricity)']);
                unset( $data[$key]['sum(imports)']);
                unset( $data[$key]['sum(hanyama)']);
                unset( $data[$key]['sum(rainfall)']);
            }

        } else {
            $data = $this->where($where)->order('id desc')->group('year')->select();
        }

        return $data;
    }


      // 查询大水江水库年数据
    public function get_floods_year_All($where = [], $page_num = '', $page_limit = '')
    {

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->field('name,year,sum(water_yield),sum(electricity),sum(imports),sum(hanyama),sum(rainfall),create_time')->group('year,name')->select(); 
            foreach ($data as $key => $value) {
                $data[$key]['water_yield']    = $data[$key]['sum(water_yield)'];
                $data[$key]['electricity'] = $data[$key]['sum(electricity)'];
                $data[$key]['imports'] = $data[$key]['sum(imports)'];
                $data[$key]['hanyama']    = $data[$key]['sum(hanyama)'];
                $data[$key]['rainfall']    = $data[$key]['sum(rainfall)'];
                unset( $data[$key]['sum(water_yield)']);
                unset( $data[$key]['sum(electricity)']);
                unset( $data[$key]['sum(imports)']);
                unset( $data[$key]['sum(hanyama)']);
                unset( $data[$key]['sum(rainfall)']);
            }

        } else {
            $data = $this->where($where)->order('id desc')->group('year')->select();
        }

        return $data;
    }
}
