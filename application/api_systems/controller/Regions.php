<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Request;

class Regions extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【public】获取省市县全部数据
     */
    public function index(Request $request)
    {
        $regions_json = file_get_contents('extend/china_regions/regions.json');
        $regions_arr  = json_decode($regions_json, true);

        $this->data['data'] = $regions_arr;
        return $this->data;
    }
}
