<?php
namespace app\common\model;

/*
 *  【会员积分日志日志模型】
 */
class ScoreLogs extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_score_logs';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'user_id'    => 'integer',
        'change_num' => 'float',
        'data_state' => 'integer',
    ];

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
    }

    // 获取器【symbol】
    public function getSymbolAttr($value, $data)
    {
        switch ($data['change_type']) {
            case 'login':
                $symbol = '+';
                break;
            case 'shop':
                $symbol = '+';
                break;
            case 'score_shop':
                $symbol = '-';
                break;
            case 'sign_in':
                $symbol = '+';
                break;
            case 'admin_recharge_score':
                $symbol = '+';
                break;
            default:
                $symbol = '';
                break;
        }

        return $symbol;
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

    public function addScoreByLogin($user_id)
    {
        $result = model('user_assets')->where(['user_id' => $user_id])->setInc('score', 1);

        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $score_log_data = [
                'user_id'     => $user_id,
                'change_type' => 'login',
                'change_num'  => 1,
                'intro'       => '会员登录',
                'desc'        => '会员登录，登录时间' . date('Y-m-d H:i:s'),
            ];
            $this->addOne($score_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }

    // 按购买金额比例赠送积分
    // public function addScoreByShop($order_id)
    // {
    //     $money = model('order_goods')->where(['order_id' => $order_id, 'return_goods_status' => ['neq', 3]])->sum('real_price');
    //     $order = model('orders')->getOne($order_id);

    //     if ($order && $money > 0) {
    //         $user_id = $order['user_id'];
    //     } else {
    //         return;
    //     }

    //     $rate       = get_config_file('score')['money_to_score_rate'];
    //     $change_num = round($money * 0.01 * floatval($rate), 2);
    //     if ($change_num <= 0) {
    //         return;
    //     }

    //     $result = model('user_assets')->where(['user_id' => $user_id])->setInc('score', $change_num);

    //     if (false === $result) {
    //         return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
    //     } else {
    //         $score_log_data = [
    //             'user_id'     => $user_id,
    //             'change_type' => 'shop',
    //             'change_num'  => $change_num,
    //             'intro'       => '会员完成购物',
    //             'desc'        => '会员完成购物，购物时间' . date('Y-m-d H:i:s'),
    //         ];
    //         $this->addOne($score_log_data);

    //         return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
    //     }
    // }

    // 按商品设置积分赠送积分
    public function addScoreByShop($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order) {
            $user_id = $order['user_id'];
        } else {
            return;
        }

        $order_goods = model('order_goods')->getAll(['order_id' => $order_id, 'return_goods_status' => ['neq', 3]]);

        $score = 0;
        foreach ($order_goods as $key => $value) {
            $goods_id = $value['goods_id'];
            $goods    = model('goods')->getOne($goods_id);
            $score += floatval($goods['buy_get_score']) * intval($value['num']);
        }

        $score = round($score, 2);
        if ($score <= 0) {
            return;
        }

        $result = model('user_assets')->where(['user_id' => $user_id])->setInc('score', $score);

        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $score_log_data = [
                'user_id'     => $user_id,
                'change_type' => 'shop',
                'change_num'  => $score,
                'intro'       => '会员完成购物',
                'desc'        => '会员完成购物，购物时间' . date('Y-m-d H:i:s'),
            ];
            $this->addOne($score_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }

    // 积分兑换
    public function ScoreShop($user_id, $score)
    {
        if ($score == 0) {
            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }

        if ($score < 0) {
            return ['code' => 0, 'data' => [], 'msg' => '积分值不可小于0'];
        }

        $user_asset = model('user_assets')->findOne(['user_id' => $user_id]);
        if ($user_asset) {
            if ($user_asset['score'] < $score) {
                return ['code' => 0, 'data' => [], 'msg' => '会员积分不足'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '会员资产信息异常'];
        }

        $result = model('user_assets')->where(['user_id' => $user_id])->setDec('score', $score);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $score_log_data = [
                'user_id'     => $user_id,
                'change_type' => 'score_shop',
                'change_num'  => $score,
                'intro'       => '积分兑换',
                'desc'        => '积分兑换商品，购物时间' . date('Y-m-d H:i:s'),
            ];
            $this->addOne($score_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }

    // 增加签到积分日志
    public function addScoreBySignIn($user_id)
    {
        $score = get_config_file('score')['sign_in'];

        // 积分异常不处理
        if ($score <= 0) {
            return;
        }

        // 添加积分
        $result = model('user_assets')->where(['user_id' => $user_id])->setInc('score', $score);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            // 添加签到记录
            $score_log_data = [
                'user_id'     => $user_id,
                'change_type' => 'sign_in',
                'change_num'  => $score,
                'intro'       => '会员签到',
                'desc'        => '会员签到，签到时间' . date('Y-m-d H:i:s'),
            ];
            $this->addOne($score_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }
}
