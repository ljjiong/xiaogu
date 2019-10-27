<?php
namespace app\common\model;

/*
 *  【拼团团队信息】
 */
class GroupBuyTeams extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_group_buy_teams';

    //类型转换
    protected $type = [
        'id'                  => 'integer',
        'group_buy_type'      => 'integer',
        'goods_id'            => 'integer',
        'group_buy_order_pid' => 'integer',
        'person_num'          => 'integer',
        'info'                => 'json',
        'sort'                => 'integer',
        'status'              => 'integer',
        'data_state'          => 'integer',
    ];

    // 获取器【goods_info】
    public function getGoodsInfoAttr($value, $data)
    {
        return model('goods')->getOneBasicInfo($data['goods_id']);
    }

    // 结束时间的时间戳【end_time_stamp】
    public function getEndTimeStampAttr($value, $data)
    {
        return strtotime($data['end_time']);
    }

    // 获取器【group_buy_info】
    public function getGroupBuyInfoAttr($value, $data)
    {
        switch ($data['group_buy_type']) {
            case 1:
                # 系统拼团
                return model('group_buy_system_goods')->getBasicInfoByGoodsId($data['goods_id']);
                break;
            case 2:
                # 会员拼团
                return model('group_buy_user_goods')->getBasicInfoByGoodsId($data['goods_id']);
                break;
            default:
                return [];
                break;
        }
    }

    // 获取器【info】
    public function getInfoAttr($value, $data)
    {
        $info = json_decode($value, true);
        foreach ($info as $k => $v) {
            $info[$k]['user_info']  = model('users')->getUserBasicInfo($v['user_id']);
            $info[$k]['order_info'] = model('orders')->getOrderBasicInfo($v['order_id']);
        }

        return $info;
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        $this->deal_group_buy_limit();

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('sort desc,id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('sort desc,id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['group_buy_info'] = '';
            $data[$key]['goods_info']     = '';
            $data[$key]['end_time_stamp'] = '';
        }

        return $data;
    }

    // 查询全部(含分页)
    public function getTeam($where = [], $page_num = '', $page_limit = '')
    {
        $this->deal_group_buy_limit();

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id asc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id asc')->select();
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $this->deal_group_buy_limit();

        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['group_buy_info'] = '';
            $data['goods_info']     = '';
            $data['end_time_stamp'] = '';
        }

        return $data;
    }

    // 处理拼团时限
    private function deal_group_buy_limit()
    {
        import('app.api_extend.extend.order.GroupBuy');
        $GroupBuy = new \GroupBuy();
        $GroupBuy->deal_group_buy_limit();
        $GroupBuy->deal_group_buy_return_money();
    }
}
