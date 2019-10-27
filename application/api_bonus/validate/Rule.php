<?php
namespace app\api_bonus\validate;

use think\Validate;

class Rule extends Validate
{
    protected $rule = [
        ['is_open', 'require|boolean', '是否开启分销系统不能为空|开启分销系统值非法'],
        ['bonus_way', 'require|in:bonus_price,sell_price,market_price,cost_price', '分红计算方式不能为空|分红计算方式值非法'],
        ['is_open_self', 'require|boolean', '是否开启内购不能为空|是否开启内购值非法'],
        ['up_level_condition', 'require|in:bonus_money,order_money,order_num,team_user_num', '分红升级条件不能为空|分红升级条件值非法'],
        ['is_agent', 'require|boolean', '是否开启代理分红不能为空|是否开启代理分红值非法'],
        ['is_open_range_agent', 'require|boolean', '代理分红是否开启极差不能为空|代理分红是否开启极差值非法'],
        ['is_region', 'require|boolean', '是否开启地区分红不能为空|是否开启地区分红值非法'],
        ['is_open_range_region', 'require|boolean', '地区分红是否开启极差不能为空|地区分红是否开启极差值非法'],
        ['region_province_rate', 'number|<=:100', '省级分红比例不能为空|省级分红比例必须为数字|省级分红比例不能大于100'],
        ['region_city_rate', 'number|<=:100', '市级分红比例不能为空|市级分红比例必须为数字|市级分红比例不能大于100'],
        ['region_area_rate', 'number|<=:100', '县级分红比例不能为空|县级分红比例必须为数字|县级分红比例不能大于100'],
        ['is_global', 'require|boolean', '是否开启全球分红不能为空|是否开启全球分红值非法'],
        ['global_rate', 'number|<=:100', '全球分红比例不能为空|全球分红比例必须为数字|全球分红比例不能大于100'],
    ];

    protected $scene = [
        'update'      => ['is_open', 'level', 'is_open_self'],
        'agent_info'  => ['is_agent', 'is_open_range_agent'],
        'region_info' => ['is_region', 'is_open_range_region', 'region_province_rate', 'region_city_rate', 'region_area_rate'],
        'global_info' => ['is_global', 'global_rate'],
    ];
}
