<?php
namespace app\common\model;

/*
 *  【会员资产日志日志模型】
 */
class UserAssetLogs extends BaseModel
{
    // 指定数据表
    protected $table = 'work_user_asset_logs';

    //类型转换
    protected $type = [
        'id'           => 'integer',
        'user_id'      => 'integer',
        'change_money' => 'float',
        'data_state'   => 'integer',
    ];

    // 获取器【symbol】
    public function getSymbolAttr($value, $data)
    {
        switch ($data['change_type']) {
            case 'user_drawcash':
                $result = '-';
                break;
            case 'user_drawcash_not_agree':
                $result = '+';
                break;
            case 'user_money_recharge':
                $result = '+';
                break;
            case 'user_pay':
                $result = '-';
                break;
            case 'user_pay_return':
                $result = '+';
                break;
            case 'user_get_commission':
                $result = '+';
                break;
            case 'user_get_bonus':
                $result = '+';
                break;
            default:
                $result = '';
                break;
        }

        return $result;
    }

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['symbol']    = '';
            $data[$key]['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['symbol']    = '';
            $data['user_info'] = '';
        }

        return $data;
    }
}
