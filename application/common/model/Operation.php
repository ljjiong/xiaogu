<?php
namespace app\common\model;

class Operation extends BaseModel
{
    // 指定数据表
    protected $table = 'work_electricity_statistics';

    //类型转换
    protected $type = [
        'id'             => 'integer',
        'dateline'       => 'string',
        'name'           => 'string',
        'plant_name'     => 'string',
        'unit'           => 'string',
        'running_status' => 'string',
        'active_power'   => 'string',
        'idle_work'      => 'string',
        'remark'         => 'string',
        'district'       => 'string',
        'annual_program' => 'string',
        'combined'       => 'string',
        'annual_output'  => 'string',
        'created_time'   => 'date',
    ];

    // 查询电站月数据
    public function get_month_All($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->field('name,dateline,district,plant_name,sum(active_power),sum(idle_work)')->group('dateline,name,district')->select();
 
            foreach ($data as $key => $value) {
                $data[$key]['active_power'] = $data[$key]['sum(active_power)'];
                $data[$key]['idle_work']    = $data[$key]['sum(idle_work)'];

                unset($data[$key]['sum(active_power)']);
                unset($data[$key]['sum(idle_work)']);
            }

        } else {
            $data = $this->where($where)->order('id desc')->group('dateline')->select();
        }

        return $data;
    }

    // 查询电站年数据
    public function get_year_All($where = [], $page_num = '', $page_limit = '')
    {

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->field('name,year,plant_name,sum(active_power),sum(idle_work),combined')->group('year,name,plant_name')->select();//,annual_program    annual_output,

            foreach ($data as $key => $value) {
                $data[$key]['active_power'] = $data[$key]['sum(active_power)'];
                $data[$key]['idle_work']    = $data[$key]['sum(idle_work)'];

                //计算年计划完成率
                // $data[$key]['annual_output'] = (number_format($data[$key]['active_power'] / $data[$key]['annual_program'], 6, '.', '') * 100) . "%";

                unset($data[$key]['sum(active_power)']);
                unset($data[$key]['sum(idle_work)']);

            }

        } else {
            $data = $this->where($where)->order('id desc')->group('year')->select();
        }

        return $data;
    }
}
