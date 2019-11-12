<?php
namespace app\Portal\controller;

use think\Controller;
use think\Request;

class Index extends Controller
{
    public function index()
    {
        // return $view;
        if (Request::instance()->isMobile()) {
            return redirect('Wap/index/index');
        } else {
            return view();
        }
    }
    // 登录页
    public function login(){
        return view();
    }
    // 绑定第三方
    public function bind(){
        return view();
    }
    // model
    public function model(){
        return view();
    }
    // 银行卡列表
    public function bankcard_list(){
        return view();
    }
    //添加银行卡
    public function bankcard_add(){
        return view();
    }
    //注册
    public function register(){
        return view();
    }
    //找回密码
    public function reset_password(){
        return view();
    }

    //设置基本资料
    public function setting(){
        return view();
    }

    //优惠卷
    public function coupon(){
        return view();
    }
    //限时折扣
    public function discount(){
        return view();
    }
    //无搜索结果
    public function search_none(){
        return view();
    }
    //搜索列表
    public function search_list(){
        return view();
    }
    //无订单
    public function no_order(){
        return view();
    }
    //订单列表页
    public function order_list(){
        return view();
    }

    //个人中心-无
    public function setting_null(){
        return view();
    }
    public function home(){
        return view();
    }
    //个人中心通告公告
    public function article_detail(){

        return view();
    }
    //通告公告列表页
    public function article_list(){
        return view();
    }
    //成长值
    public function level(){
        return view();
    }
    //我的钱包
    public function wallet(){
        return view();
    }
    // 充值
    public function recharge(){
        return view();
    }
    // 提现
    public function withdraw(){
        return view();
    }
    // 账号安全
    public function account(){
        return view();
    }
    // 修改绑定手机
    public function reset_model(){
        return view();
    }
    // 修改登录密码
    public function reset_paypassword(){
        return view();
    }
    //地址
    public function addresses(){
        return view();
    }
    // 身份验证
    public function idcard_auth(){
        return view();
    }
    // 我的收藏

    public function collection_list(){

        return view();
    }
     // 购物车
     public function cart_list(){
        return view();
    }
    // 地址
    public function address_list(){
        return view();
    }
    //二维码
    public function my_qrcode(){
        return view();
    }
    //商品详情
    public function goods_detail(){
        return view();
    }
    // 提交订单
    public function order_confirm(){
        return view();
    }
    // 购买商品选择支付
    public function pay_select(){
        return view();
    }
    // 支付
    public function pay(){
        return view();
    }
    // 支付
    public function pay_qrcode(){
        return view();
    }
    // 商品支付成功
    public function pay_success(){
        return view();
    }
    // 我的优惠券
    public function my_coupon_list(){
        return view();
    }
    //评论列表
    public function comment(){
        return view();
    }
    // 评论列表
    public function comment_list(){
        return view();
    }
    //订单详情
    public function order_detail(){
        return view();
    }
    // 微信支付
    public function pay_waiting(){
        return view();
    }
    //取消订单
    public function order_refund(){
        return view();
    }
    // 绑定第三方
    public function third_login(){
        return view();
    }
    // 第三方绑定手机
    public function bind_mobile(){
        return view();
    }
    // 通用文章详情页
    public function article(){
        return view();
    }
    // 档案
    public function files_home(){
        return view();
    }
}
