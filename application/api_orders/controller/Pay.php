<?php
namespace app\api_orders\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

import('app.api_extend.extend.ali.AliPay');
import('app.api_extend.extend.wechat.WechatPay');

class Pay extends Rest
{
    protected $beforeActionList = [
        'checkClientType' => ['only' => 'pre_pay,money,touch_id_pay'],
        'checkAuth'       => ['only' => 'pre_pay,money,touch_id_pay'],
        'checkToken'      => ['only' => 'pre_pay,money,touch_id_pay'],
    ];

    /**
     * 【admin】订单预支付
     */
    public function pre_pay(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('pre_pay');
        if ($validate->scene('check')->check($data)) {

            import('app.api_extend.extend.order.OrderDeal');
            $OrderDeal = new \OrderDeal();
            $result    = $OrderDeal->checkOrder($data['order_id']);
            if ($result['code']) {
                $this->data['msg']  = '预支付校验成功';
                $this->data['data'] = $data;
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
     * 【admin】订单支付(余额支付)
     */
    public function money(Request $request)
    {
        $data               = $request->param();
        $data['user_id']    = $this->unique_id;
        $data['account_id'] = $this->account_id;

        $validate = Loader::validate('pay');
        if ($validate->scene('money')->check($data)) {

            $result = model('money_pay')->pay($data['order_no'], $this->unique_id);
            if ($result['code']) {
                import('app.api_extend.extend.order.OrderDeal');
                $OrderDeal = new \OrderDeal();
                $OrderDeal->update_goods_info($data['order_no']);

                $this->data['msg']  = '钱包支付成功';
                $this->data['data'] = $data;
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
     * 【admin】订单支付(指纹支付)
     */
    public function touch_id_pay(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('pay');
        if ($validate->scene('touch_id')->check($data)) {

            $result = model('money_pay')->pay($data['order_no'], $this->unique_id);
            if ($result['code']) {
                import('app.api_extend.extend.order.OrderDeal');
                $OrderDeal = new \OrderDeal();
                $OrderDeal->update_goods_info($data['order_no']);

                $this->data['msg']  = '支付成功';
                $this->data['data'] = $data;
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

    /*
    ==============================================
    ==============支付宝支付Begin=================
    ==============================================
     */

    /**
     * 【支付宝】APP版支付
     */
    public function ali_pay_app()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单已支付';
            } else {
                $ali_pay = new \AliPay();
                $result  = $ali_pay->app_pay_sign($order_no, $money, 'APP支付');

                $this->data['data'] = $result;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【支付宝】WAP版支付
     */
    public function ali_pay_wap()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单已支付';
                return $this->data;
            } else {
                $ali_pay = new \AliPay();
                $result  = $ali_pay->wap_pay($order_no, $money, 'WAP支付');

                echo $result;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
            return $this->data;
        }
    }

    /**
     * 【支付宝】WAP版支付跳转
     */
    public function ali_return_wap()
    {
        $this->redirect('wap/index/pay_waiting');
    }

    /**
     * 【支付宝】PC版支付
     */
    public function ali_pay_pc()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单已支付';
                return $this->data;
            } else {
                $ali_pay = new \AliPay();
                $result  = $ali_pay->pc_pay($order_no, $money, 'PC支付');

                echo $result;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
            return $this->data;
        }
    }

    /**
     * 【支付宝】PC版支付跳转
     */
    public function ali_return_pc()
    {
        $this->redirect('portal/index/pay_waiting');
    }

    /**
     * 【支付宝】扫码支付
     */
    public function ali_pay_qrcode()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单已支付';
            } else {
                $ali_pay = new \AliPay();
                $result  = $ali_pay->qrcode_pay($order_no, $money, '扫码支付');

                $this->data['data'] = $result;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【支付宝】支付回调
     */
    public function ali_notify(Request $request)
    {
        $params = $request->param();

        $ali_pay  = new \AliPay();
        $order_no = $ali_pay->notify_deal($params);
        if ($order_no) {
            // 商品订单支付回调
            if (strpos($order_no, 'N') !== false) {
                $order = model('orders')->findOne(['order_no' => $order_no]);
                if ($order) {
                    if ($order['is_pay'] == 0) {
                        $data = [
                            'id'         => $order['id'],
                            'is_pay'     => 1,
                            'pay_type'   => 1,
                            'status'     => 2,
                            'pay_time'   => date('Y-m-d H:i:s'),
                            'is_app_pay' => 0,
                        ];
                        $result = model('orders')->editOne($data);

                        if ($result !== false) {
                            import('app.api_extend.extend.order.OrderDeal');
                            $OrderDeal = new \OrderDeal();
                            $OrderDeal->update_goods_info($order_no);

                            echo 'success';
                        }
                    } elseif ($order['is_pay'] == 1) {
                        echo 'success';
                    }
                }
            }

            // 钱包充值订单支付回调
            if (strpos($order_no, 'R') !== false) {
                $order = model('user_recharges')->findOne(['order_no' => $order_no]);
                if ($order) {
                    if ($order['is_pay'] == 0) {
                        $data = [
                            'id'         => $order['id'],
                            'is_pay'     => 1,
                            'pay_type'   => 1,
                            'status'     => 3,
                            'pay_time'   => date('Y-m-d H:i:s'),
                            'is_app_pay' => 0,
                        ];
                        $result = model('user_recharges')->editOne($data);

                        if ($result !== false) {
                            model('user_assets')->moneyRecharge($order['user_id'], $order['money']);
                            echo 'success';
                        }
                    } elseif ($order['is_pay'] == 1) {
                        echo 'success';
                    }
                }
            }
        }
    }

    /**
     * 【支付宝】支付宝APP回调
     */
    public function ali_app_notify(Request $request)
    {
        $params = $request->param();

        $ali_pay  = new \AliPay();
        $order_no = $ali_pay->notify_deal($params);
        if ($order_no) {
            // 商品订单支付回调
            if (strpos($order_no, 'N') !== false) {
                $order = model('orders')->findOne(['order_no' => $order_no]);
                if ($order) {
                    if ($order['is_pay'] == 0) {
                        $data = [
                            'id'         => $order['id'],
                            'is_pay'     => 1,
                            'pay_type'   => 1,
                            'status'     => 2,
                            'pay_time'   => date('Y-m-d H:i:s'),
                            'is_app_pay' => 1,
                        ];
                        $result = model('orders')->editOne($data);

                        if ($result !== false) {
                            import('app.api_extend.extend.order.OrderDeal');
                            $OrderDeal = new \OrderDeal();
                            $OrderDeal->update_goods_info($order_no);

                            echo 'success';
                        }
                    } elseif ($order['is_pay'] == 1) {
                        echo 'success';
                    }
                }
            }

            // 钱包充值订单支付回调
            if (strpos($order_no, 'R') !== false) {
                $order = model('user_recharges')->findOne(['order_no' => $order_no]);
                if ($order) {
                    if ($order['is_pay'] == 0) {
                        $data = [
                            'id'         => $order['id'],
                            'is_pay'     => 1,
                            'pay_type'   => 1,
                            'status'     => 3,
                            'pay_time'   => date('Y-m-d H:i:s'),
                            'is_app_pay' => 1,
                        ];
                        $result = model('user_recharges')->editOne($data);

                        if ($result !== false) {
                            model('user_assets')->moneyRecharge($order['user_id'], $order['money']);
                            echo 'success';
                        }
                    } elseif ($order['is_pay'] == 1) {
                        echo 'success';
                    }
                }
            }
        }
    }

    /**
     * 【支付宝】退款
     */
    public function ali_refund()
    {
        $order_no = input('order_no');

        $order = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            if ($order['is_pay'] == 1) {
                $ali_pay = new \AliPay();
                $result  = $ali_pay->refund($order_no, $order['total_money'], '申请退款');

                $this->data['data'] = $result;
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前订单未支付';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【支付宝】退款查询
     */
    public function ali_refund_query()
    {
        $order_no       = input('order_no');
        $out_request_no = input('out_request_no');

        $order = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            if ($order['is_pay'] == 1) {
                $ali_pay = new \AliPay();
                $result  = $ali_pay->refund_query($order_no, $out_request_no);

                $this->data['data'] = $result;
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前订单未支付';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /*
    ==============================================
    ==============支付宝支付End===================
    ==============================================
     */

    /*
    ==============================================
    ================微信支付Begin=================
    ==============================================
     */

    /**
     * 【微信】JSAPI支付
     */
    public function wechat_pay_jsapi()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                echo "<script>alert('订单已支付')</script>";
            } else {
                // jsapi支付
                $wechat_pay = new \WechatPay();
                $result     = $wechat_pay->jsapi_pay($order_no, $money, 'jsapi支付');

                $this->assign('params', $result);

                return view();
            }
        } else {
            echo "<script>alert('订单不存在')</script>";
        }
    }

    /**
     * 【微信】H5支付
     */
    public function wechat_pay_h5()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单已支付';
            } else {
                // h5支付
                $request = Request::instance();
                $ip      = $request->ip();

                $wechat_pay = new \WechatPay();
                $result     = $wechat_pay->h5_pay($order_no, $money, $ip, 'h5支付');

                $this->data['data'] = $result;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【微信】APP支付
     */
    public function wechat_pay_app()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单已支付';
            } else {
                // APP支付
                $request = Request::instance();
                $ip      = $request->ip();

                $wechat_pay = new \WechatPay();
                $result     = $wechat_pay->app_pay($order_no, $money, $ip, 'APP支付');

                $this->data['data'] = $result;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【微信】H5支付跳转
     */
    public function wechat_return()
    {
        $this->redirect(get_host() . '/wap/index/pay_waiting');
    }

    /**
     * 【微信】二维码支付
     */
    public function wechat_pay_qrcode()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单已支付';
            } else {
                $wechat_pay = new \WechatPay();
                $result     = $wechat_pay->qrcode_pay($order_no, $money, '二维码支付');

                $this->data['data'] = $result;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【微信】小程序支付
     */
    public function wechat_pay_applet()
    {
        $order_no = input('order_no');

        if (strpos($order_no, 'N') !== false) {
            $order = model('orders')->findOne(['order_no' => $order_no]);
            $money = $order['total_money'];
        } elseif (strpos($order_no, 'R') !== false) {
            $order = model('user_recharges')->findOne(['order_no' => $order_no]);
            $money = $order['money'];
        }

        if ($order) {
            if ($order['is_pay'] == 1) {
                $this->data['code'] = 0;
                $this->data['msg']  = '订单已支付';
            } else {
                // 获取code
                $code = input('code');
                if (!$code) {
                    $this->data['code'] = 0;
                    $this->data['msg']  = 'code缺失';
                    return $this->data;
                }

                // 获取ip
                $request = Request::instance();
                $ip      = $request->ip();

                $wechat_pay = new \WechatPay();
                $result     = $wechat_pay->applet_pay($code, $order_no, $money, $ip, '小程序支付');

                $this->data['data'] = $result;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【微信】支付回调(Web端)
     */
    public function wechat_notify()
    {
        // 获取返回的post数据包
        $params = file_get_contents("php://input");

        $wechat_pay = new \WechatPay();
        $order_no   = $wechat_pay->notify_deal($params);

        if ($order_no) {
            // 商品订单支付回调
            if (strpos($order_no, 'N') === 0) {
                $order = model('orders')->findOne(['order_no' => $order_no]);
                if ($order) {
                    if ($order['is_pay'] == 0) {
                        $data = [
                            'id'         => $order['id'],
                            'is_pay'     => 1,
                            'pay_type'   => 2,
                            'status'     => 2,
                            'pay_time'   => date('Y-m-d H:i:s'),
                            'is_app_pay' => 0,
                        ];
                        $result = model('orders')->editOne($data);

                        if ($result !== false) {
                            import('app.api_extend.extend.order.OrderDeal');
                            $OrderDeal = new \OrderDeal();
                            $OrderDeal->update_goods_info($order_no);

                            return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                        }
                    } elseif ($order['is_pay'] == 1) {
                        return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                    }
                }
            }

            // 钱包充值订单支付回调
            if (strpos($order_no, 'R') !== false) {
                $order = model('user_recharges')->findOne(['order_no' => $order_no]);
                if ($order) {
                    if ($order['is_pay'] == 0) {
                        $data = [
                            'id'         => $order['id'],
                            'is_pay'     => 1,
                            'pay_type'   => 2,
                            'status'     => 3,
                            'pay_time'   => date('Y-m-d H:i:s'),
                            'is_app_pay' => 0,
                        ];
                        $result = model('user_recharges')->editOne($data);

                        if ($result !== false) {
                            model('user_assets')->moneyRecharge($order['user_id'], $order['money']);
                            return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                        }
                    } elseif ($order['is_pay'] == 1) {
                        return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                    }
                }
            }
        }
    }

    /**
     * 【微信】支付回调（APP端）
     */
    public function wechat_app_notify()
    {
        // 获取返回的post数据包
        $params = file_get_contents("php://input");

        $wechat_pay = new \WechatPay();
        $order_no   = $wechat_pay->notify_deal($params);

        if ($order_no) {
            // 商品订单支付回调
            if (strpos($order_no, 'N') !== false) {
                $order = model('orders')->findOne(['order_no' => $order_no]);
                if ($order) {
                    if ($order['is_pay'] == 0) {
                        $data = [
                            'id'         => $order['id'],
                            'is_pay'     => 1,
                            'pay_type'   => 2,
                            'status'     => 2,
                            'pay_time'   => date('Y-m-d H:i:s'),
                            'is_app_pay' => 1,
                        ];
                        $result = model('orders')->editOne($data);

                        if ($result !== false) {
                            import('app.api_extend.extend.order.OrderDeal');
                            $OrderDeal = new \OrderDeal();
                            $OrderDeal->update_goods_info($order_no);

                            return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                        }
                    } elseif ($order['is_pay'] == 1) {
                        return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                    }
                }
            }

            // 钱包充值订单支付回调
            if (strpos($order_no, 'R') !== false) {
                $order = model('user_recharges')->findOne(['order_no' => $order_no]);
                if ($order) {
                    if ($order['is_pay'] == 0) {
                        $data = [
                            'id'         => $order['id'],
                            'is_pay'     => 1,
                            'pay_type'   => 2,
                            'status'     => 3,
                            'pay_time'   => date('Y-m-d H:i:s'),
                            'is_app_pay' => 1,
                        ];
                        $result = model('user_recharges')->editOne($data);

                        if ($result !== false) {
                            model('user_assets')->moneyRecharge($order['user_id'], $order['money']);
                            return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                        }
                    } elseif ($order['is_pay'] == 1) {
                        return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                    }
                }
            }
        }
    }

    /**
     * 【微信】退款
     */
    public function wechat_refund()
    {
        $order_no = input('order_no');

        $order = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            if ($order['is_pay'] == 1) {
                $wechat_pay = new \WechatPay();
                $result     = $wechat_pay->refund($order_no, $order['total_money'], '申请退款');

                $this->data['code'] = $result['code'];
                $this->data['msg']  = $result['msg'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前订单未支付';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

    /**
     * 【微信】退款查询
     */
    public function wechat_refund_query()
    {
        $order_no = input('order_no');

        $order = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            if ($order['is_pay'] == 1) {
                $wechat_pay = new \WechatPay();
                $result     = $wechat_pay->refund_query($order_no);

                $this->data['data'] = $result;
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '当前订单未支付';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '订单不存在';
        }

        return $this->data;
    }

}
