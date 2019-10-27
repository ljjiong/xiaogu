<?php
/**
 *  支付宝支付
 **/
class AliPay
{
    // 请配置参数
    private $appid       = '';
    private $public_key  = '';
    private $private_key = '';

    // 支付回调
    public $notify_url = '';
    // APP支付回调
    public $app_notify_url = '';

    // 支付跳转
    public $return_url = '';

    public function __construct()
    {
        $data    = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $ali_pay = $data['pay']['ali'];

        $this->appid          = $ali_pay['appid'];
        $this->public_key     = $ali_pay['public_key'];
        $this->private_key    = $ali_pay['private_key'];
        $this->notify_url     = $ali_pay['notify_url'];
        $this->app_notify_url = $ali_pay['app_notify_url'];
        $this->wap_return_url = $ali_pay['wap_return_url'];
        $this->pc_return_url  = $ali_pay['pc_return_url'];
    }

    /**
     * 【支付宝】APP支付签名
     */
    public function app_pay_sign($order_no, $money, $subject)
    {
        import('ali_pay_app.aop.AopClient');
        import('ali_pay_app.aop.request.AlipayTradeAppPayRequest');

        $aop                     = new \AopClient();
        $aop->gatewayUrl         = 'https://openapi.alipay.com/gateway.do';
        $aop->appId              = $this->appid;
        $aop->rsaPrivateKey      = $this->private_key;
        $aop->alipayrsaPublicKey = $this->public_key;
        $aop->apiVersion         = '1.0';
        $aop->postCharset        = 'utf-8';
        $aop->format             = 'json';
        $aop->signType           = 'RSA2';
        $request                 = new \AlipayTradeAppPayRequest();

        //异步地址传值方式
        $request->setNotifyUrl($this->app_notify_url);

        $str = json_encode([
            'out_trade_no' => $order_no,
            'total_amount' => $money,
            'product_code' => 'QUICK_MSECURITY_PAY',
            'subject'      => $subject,
        ]);

        $request->setBizContent($str);
        $result = $aop->sdkExecute($request);

        return $result;
    }

    /**
     * 【支付宝】WAP版支付
     */
    public function wap_pay($order_no, $money, $subject, $body = '')
    {
        import('ali_pay_wap.wappay.service.AlipayTradeService');
        import('ali_pay_wap.wappay.buildermodel.AlipayTradeWapPayContentBuilder');

        $payRequestBuilder = new \AlipayTradeWapPayContentBuilder();
        $payRequestBuilder->setBody($body);
        $payRequestBuilder->setSubject($subject);
        $payRequestBuilder->setOutTradeNo($order_no);
        $payRequestBuilder->setTotalAmount($money);
        $payRequestBuilder->setTimeExpress('1m');

        $config = [
            'app_id'               => $this->appid,
            'merchant_private_key' => $this->private_key,
            'notify_url'           => $this->notify_url,
            'return_url'           => $this->wap_return_url,
            'charset'              => "UTF-8",
            'sign_type'            => "RSA2",
            'gatewayUrl'           => "https://openapi.alipay.com/gateway.do",
            'alipay_public_key'    => $this->public_key,
        ];

        $payResponse = new \AlipayTradeService($config);
        $result      = $payResponse->wapPay($payRequestBuilder, $config['return_url'], $config['notify_url']);

        return $result;
    }

    /**
     * 【支付宝】PC版支付
     */
    public function pc_pay($order_no, $money, $subject, $body = '')
    {
        import('ali_pay_pc.pagepay.service.AlipayTradeService');
        import('ali_pay_pc.pagepay.buildermodel.AlipayTradePagePayContentBuilder');

        //构造参数
        $payRequestBuilder = new \AlipayTradePagePayContentBuilder();
        $payRequestBuilder->setBody($body);
        $payRequestBuilder->setSubject($subject);
        $payRequestBuilder->setTotalAmount($money);
        $payRequestBuilder->setOutTradeNo($order_no);

        $config = [
            'app_id'               => $this->appid,
            'merchant_private_key' => $this->private_key,
            'notify_url'           => $this->notify_url,
            'return_url'           => $this->pc_return_url,
            'charset'              => "UTF-8",
            'sign_type'            => "RSA2",
            'gatewayUrl'           => "https://openapi.alipay.com/gateway.do",
            'alipay_public_key'    => $this->public_key,
        ];

        $aop      = new \AlipayTradeService($config);
        $response = $aop->pagePay($payRequestBuilder, $config['return_url'], $config['notify_url']);

        return $response;
    }

    /**
     * 【支付宝】扫码支付
     */
    public function qrcode_pay($order_no, $money, $subject)
    {
        import('ali_pay_app.aop.AopClient');
        import('ali_pay_app.aop.request.AlipayTradePrecreateRequest');

        $aop                     = new \AopClient();
        $aop->gatewayUrl         = 'https://openapi.alipay.com/gateway.do';
        $aop->appId              = $this->appid;
        $aop->rsaPrivateKey      = $this->private_key;
        $aop->alipayrsaPublicKey = $this->public_key;
        $aop->apiVersion         = '1.0';
        $aop->signType           = 'RSA2';
        $aop->postCharset        = 'utf-8';
        $aop->format             = 'json';
        $request                 = new \AlipayTradePrecreateRequest();

        $str = json_encode([
            'out_trade_no' => $order_no,
            'total_amount' => $money,
            'subject'      => $subject,
        ]);
        $request->setBizContent($str);
        $result = $aop->execute($request);

        return $result;
    }

    /**
     * 【支付宝】支付回调处理
     */
    public function notify_deal($params)
    {
        import('ali_pay_app.aop.AopClient');

        $aop                     = new \AopClient;
        $aop->alipayrsaPublicKey = $this->public_key;
        $flag                    = $aop->rsaCheckV1($params, null, "RSA2");

        $order_no     = $params['out_trade_no'];
        $trade_status = $params['trade_status'];

        if ($trade_status == 'TRADE_SUCCESS') {
            return $order_no;
        } else {
            return 0;
        }
    }

    /**
     * 【支付宝】退款
     */
    public function refund($order_no, $out_request_no, $refund_money, $refund_reason = '')
    {
        import('ali_pay_pc.pagepay.service.AlipayTradeService');
        import('ali_pay_pc.pagepay.buildermodel.AlipayTradeRefundContentBuilder');

        //构造参数
        $RequestBuilder = new \AlipayTradeRefundContentBuilder();
        $RequestBuilder->setOutTradeNo($order_no);
        $RequestBuilder->setRefundAmount($refund_money);
        $RequestBuilder->setOutRequestNo($out_request_no);
        $RequestBuilder->setRefundReason($refund_reason);

        $config = [
            'app_id'               => $this->appid,
            'merchant_private_key' => $this->private_key,
            'charset'              => "UTF-8",
            'sign_type'            => "RSA2",
            'gatewayUrl'           => "https://openapi.alipay.com/gateway.do",
            'alipay_public_key'    => $this->public_key,
        ];

        $aop      = new \AlipayTradeService($config);
        $response = $aop->Refund($RequestBuilder);

        if ($response->code == 10000) {
            return ['code' => 1, 'msg' => '退款成功'];
        } else {
            return ['code' => 0, 'msg' => $response->sub_msg];
        }
    }

    /**
     * 【支付宝】退款查询
     */
    public function refund_query($order_no, $out_request_no = '')
    {
        import('ali_pay_pc.aop.AopClient');
        import('ali_pay_pc.aop.request.AlipayTradeFastpayRefundQueryRequest');

        $aop                     = new \AopClient();
        $aop->gatewayUrl         = 'https://openapi.alipay.com/gateway.do';
        $aop->appid              = $this->appid;
        $aop->rsaPrivateKey      = $this->private_key;
        $aop->alipayrsaPublicKey = $this->public_key;
        $aop->apiVersion         = '1.0';
        $aop->signType           = 'RSA2';
        $aop->postCharset        = 'GBK';
        $aop->format             = 'json';
        $request                 = new \AlipayTradeFastpayRefundQueryRequest();
        $str                     = json_encode([
            'out_trade_no'   => $order_no,
            'out_request_no' => $out_request_no,
        ]);
        $request->setBizContent($str);
        $result = $aop->execute($request);

        return $result;

        // $responseNode = str_replace(".", "_", $request->getApiMethodName()) . "_response";
        // $resultCode   = $result->$responseNode->code;
        // if (!empty($resultCode) && $resultCode == 10000) {
        //     echo "成功";
        // } else {
        //     echo "失败";
        // }
    }

    /**
     * 【支付宝】企业付款
     */
    public function org_pay($order_no, $user_account, $money, $user_name, $remark)
    {
        if ($money > 0.01) {
            return ['code' => 0, 'msg' => '支付宝打款暂限0.01元'];
        }

        import('ali_pay_app.aop.AopClient');
        import('ali_pay_app.aop.request.AlipayFundTransToaccountTransferRequest');

        $aop                     = new \AopClient();
        $aop->gatewayUrl         = 'https://openapi.alipay.com/gateway.do';
        $aop->appId              = $this->appid;
        $aop->rsaPrivateKey      = $this->private_key;
        $aop->alipayrsaPublicKey = $this->public_key;
        $aop->apiVersion         = '1.0';
        $aop->postCharset        = 'utf-8';
        $aop->format             = 'json';
        $aop->signType           = 'RSA2';
        $request                 = new \AlipayFundTransToaccountTransferRequest();

        $str = json_encode([
            'out_biz_no'      => $order_no,
            'payee_type'      => 'ALIPAY_LOGONID',
            'payee_account'   => $user_account,
            'amount'          => $money,
            'payer_show_name' => '网开创',
            'payee_real_name' => $user_name,
            'remark'          => $remark,
        ]);

        $request->setBizContent($str);
        $result = $aop->execute($request);

        // return $result;

        $responseNode = str_replace(".", "_", $request->getApiMethodName()) . "_response";
        $resultCode   = $result->$responseNode->code;
        if (!empty($resultCode) && $resultCode == 10000) {
            return ['code' => 1, 'msg' => '打款成功'];
        } else {
            return ['code' => 0, 'msg' => $result->$responseNode->sub_msg];
        }
    }

    /**
     * 【支付宝】企业付款查询
     */
    public function org_pay_query($order_no)
    {
        import('ali_pay_app.aop.AopClient');
        import('ali_pay_app.aop.request.AlipayFundTransOrderQueryRequest');

        $aop                     = new \AopClient();
        $aop->gatewayUrl         = 'https://openapi.alipay.com/gateway.do';
        $aop->appId              = $this->appid;
        $aop->rsaPrivateKey      = $this->private_key;
        $aop->alipayrsaPublicKey = $this->public_key;
        $aop->apiVersion         = '1.0';
        $aop->postCharset        = 'utf-8';
        $aop->format             = 'json';
        $aop->signType           = 'RSA2';
        $request                 = new \AlipayFundTransOrderQueryRequest();

        $str = json_encode([
            'out_biz_no' => $order_no,
        ]);

        $request->setBizContent($str);
        $result = $aop->execute($request);

        // return $result;

        $responseNode = str_replace(".", "_", $request->getApiMethodName()) . "_response";
        $resultCode   = $result->$responseNode->code;
        if (!empty($resultCode) && $resultCode == 10000) {
            return ['code' => 1, 'msg' => $result->$responseNode->status];
        } else {
            return ['code' => 0, 'msg' => $result->$responseNode->sub_msg];
        }
    }
}
