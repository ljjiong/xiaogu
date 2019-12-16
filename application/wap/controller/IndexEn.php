<?php
// +----------------------------------------------------------------------
// | Minishop [ Easy to handle for Micro businesses ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.qasl.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: YiYun <http://www.ixiaoquan.com>
// +----------------------------------------------------------------------

namespace app\wap\controller;

use think\Controller;

/**
 * 网站首页控制器
 * @author  YiYun <jianhaihao@gmail.com>
 */
class IndexEn extends Controller
{
    // 搜索项目
    public function index()
    {
        // // $host = $_SERVER['HTTP_HOST'];
        
        $url  = $_SERVER["REQUEST_URI"];
        $url  = substr($url, -24);
        if ($url != "/wap/index_en/index.html") {
            echo "<script>location.href='/wap/index_en/index.html';</script>";
        }
        $banners = model('banners')->getAll(['status'=>1], 1, 7);
        $articles_hxjs_3d=model('articleshxjs')->getAll(['class_id'=>1,'type_id'=>65,'status'=>1]);
        $articles_hxjs_2d=model('articleshxjs')->getAll(['class_id'=>1,'type_id'=>66,'status'=>1]);
        $commonality=model('commonality')->getAll(['type_id'=>57]);
        $goods_list=model('goods')->getAll(['status'=>1],1,4);
        
        $this->assign('award',$banners);
        $this->assign('articles_hxjs_2d',$articles_hxjs_2d);
        $this->assign('articles_hxjs_3d',$articles_hxjs_3d);
        $this->assign('commonality',$commonality);
        $this->assign('goods_list',$goods_list);

        return view();
    }
    // 我的项目
    public function my_projects()
    {
        return view();
    }
    // 新建项目
    public function new_built()
    {
        return view();
    }
    // 项目详情
    public function projects_detail()
    {
        return view();
    }
    // 我的任务
    public function my_tasks()
    {
        return view();
    }
    // 相关文件
    public function my_file()
    {
        return view();
    }
    // 基础信息
    public function basic_data()
    {
        return view();
    }
    // 行政页
    public function personnel_page()
    {
        return view();
    }
    // 广场页
    public function square()
    {
        return view();
    }
    // 文件列表页
    public function filelist()
    {
        return view();
    }
    // 发电量页
    public function powergeneration()
    {
        return view();
    }
    // 通知详情页
    public function square_details()
    {
        return view();
    }
    // 事物申请
    public function transaction()
    {
        return view();
    }
    // 通讯录
    public function address_book()
    {
        return view();
    }
    // 工资
    public function wages()
    {
        return view();
    }
    // 绩效
    public function performance()
    {
        return view();
    }
    //劳动合同
    public function contract()
    {
        return view();
    }
    //可申请的 事物
    public function commonality()
    {
        return view();
    }

    // 登录页
    public function login()
    {
        return view();
    }
    // 第三方登录过渡页
    public function third_login_transition()
    {
        return view();
    }
    // 注册页
    public function register()
    {
        return view();
    }
    // 绑定手机号
    public function bind_mobile()
    {
        return view();
    }
    // 修改手机号
    public function modify_mobile()
    {
        return view();
    }
    // 重置密码页
    public function reset_password()
    {
        return view();
    }
    // 个人中心页
    public function home()
    {
        return view();
    }
    // 我的成长值
    public function level()
    {
        return view();
    }
    // 商品列表页
    public function goods_list()
    {
        return view();
    }
    // 商品列表模板页
    public function goods_list_model()
    {
        return view();
    }
    // 商品详情页
    public function goods_detail()
    {
        return view();
    }
    // 商品属性查看
    public function goods_attr_info()
    {
        return view();
    }
    // 规格选择iframe
    public function goods_spec_info_select()
    {
        return view();
    }
    // 限时折扣
    public function discount_page()
    {
        return view();
    }
    // 订单确认
    public function order_confirm()
    {
        return view();
    }
    // 选择营销活动
    public function select_market_activity()
    {
        return view();
    }
    // 支付方式选择
    public function pay_select()
    {
        return view();
    }
    // 支付结果等待
    public function pay_waiting()
    {
        return view();
    }
    // 钱包页
    public function wallet()
    {
        return view();
    }
    // 钱包明细
    public function wallet_detail()
    {
        return view();
    }
    // 账单列表页
    public function bill_list()
    {
        return view();
    }
    // 余额
    public function balance()
    {
        return view();
    }
    // 提现
    public function withdraw()
    {
        return view();
    }
    // 充值
    public function recharge()
    {
        return view();
    }
    // 购物车页
    public function cart_list()
    {
        return view();
    }
    // 购物车选择规格
    public function cart_spec_info_select()
    {
        return view();
    }
    // 个人设置页
    public function setting()
    {
        return view();
    }
    // 第三方账号绑定设置
    public function bind_third_setting()
    {
        return view();
    }
    // 地址页
    public function address_list()
    {
        return view();
    }
    // 地址编辑页
    public function address_edit()
    {
        return view();
    }
    // 地址选择列表
    public function address_list_select()
    {
        return view();
    }
    // 地址选择编辑
    public function address_edit_select()
    {
        return view();
    }
    // 订单页
    public function order_list()
    {
        return view();
    }
    // 订单详情页
    public function order_detail()
    {
        return view();
    }
    // 订单退款
    public function order_refund()
    {
        return view();
    }
    // 物流页面
    public function logistics()
    {
        return view();
    }
    // 收藏夹页
    public function collection_list()
    {
        return view();
    }
    // 评论页
    public function comment_list()
    {
        return view();
    }
    // 添加评论
    public function comment_add()
    {
        return view();
    }
    // 身份认证提交页
    public function idcard_auth()
    {
        return view();
    }
    // 身份认证信息页
    public function idcard_info()
    {
        return view();
    }
    // 银行卡列表页
    public function bankcard_list()
    {
        return view();
    }
    // 银行卡列表选择页
    public function bankcard_list_select()
    {
        return view();
    }
    // 银行卡编辑页
    public function bankcard_edit()
    {
        return view();
    }
    // 银行卡选择编辑页
    public function bankcard_edit_select()
    {
        return view();
    }
    // 我的二维码页
    public function my_qrcode()
    {
        return view();
    }
    // 领取优惠券
    public function coupon()
    {
        return view();
    }
    // 优惠券列表
    public function coupon_list()
    {
        return view();
    }
    // 帮助与反馈页
    public function help_and_option()
    {
        return view();
    }
    // 公告列表页
    public function notice_list()
    {
        return view();
    }
    // 公告详情页
    public function notice_detail()
    {
        return view();
    }
    // 文章列表页
    public function article_list()
    {
        return view();
    }
    // 文章详情页
    public function article_detail()
    {
        return view();
    }
    // 搜索页
    public function search_page()
    {
        return view();
    }
    // 分销主页
    public function distribution_home()
    {
        return view();
    }
    // 分销申请详情
    public function distribution_withdraw_detail()
    {
        return view();
    }
    // 分销佣金提现
    public function distribution_withdraw_apply()
    {
        return view();
    }
    // 我的客户
    public function distribution_custs()
    {
        return view();
    }
    // 分销钱包
    public function distribution_wallet()
    {
        return view();
    }
    // 分销详情
    public function distribution_detail()
    {
        return view();
    }
    // 我的团队
    public function distribution_team()
    {
        return view();
    }
    // 分销订单页
    public function distribution_orders()
    {
        return view();
    }
    //分红主页
    public function bonus_home()
    {
        return view();
    }
    //分红钱包
    public function bonus_wallet()
    {
        return view();
    }
    //分红订单
    public function bonus_orders()
    {
        return view();
    }
    // 分红明细
    public function bonus_detail()
    {
        return view();
    }
    //分红团队
    public function bonus_team()
    {
        return view();
    }
    //分红客户
    public function bonus_custs()
    {
        return view();
    }
    // 分红申请
    public function bonus_withdraw_apply()
    {
        return view();
    }
    // 分红提现详情
    public function bonus_withdraw_detail()
    {
        return view();
    }
    // 分红分销申请
    public function distribution_and_bonus_apply()
    {
        return view();
    }
    // 扫码处理
    public function handle_qrcode()
    {
        return view();
    }
    // 完善个人信息
    public function complete_user_info()
    {
        return view();
    }
    // 收款账户
    public function my_receive_account()
    {
        return view();
    }
    // 代理微信code
    public function handle_wechat_code()
    {
        return view();
    }
    // 积分商城
    public function score_shop()
    {
        return view();
    }
    public function score_goods_detail()
    {
        return view();
    }
    public function score_order_confirm()
    {
        return view();
    }
    public function score_goods_spec_info_select()
    {
        return view();
    }
    public function score_goods_attr_info_view()
    {
        return view();
    }
    public function score_order_list()
    {
        return view();
    }
    public function score_order_detail()
    {
        return view();
    }
    // 团购
    public function group_shop()
    {
        return view();
    }
    public function group_goods_detail()
    {
        return view();
    }
    public function group_order_confirm()
    {
        return view();
    }
    public function group_join_order_confirm()
    {
        return view();
    }
    public function group_create_goods_spec_info_select()
    {
        return view();
    }
    public function group_join_goods_spec_info_select()
    {
        return view();
    }
    public function group_only_goods_spec_info_select()
    {
        return view();
    }
    public function group_goods_attr_info_view()
    {
        return view();
    }
    public function group_order_list()
    {
        return view();
    }
    public function group_order_detail()
    {
        return view();
    }
    // 积分或团购商品的属性信息
    public function score_or_group_goods_attr_info()
    {
        return view();
    }
    public function group_shop_share()
    {
        return view();
    }
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    // 官网！！！！
    public function news()
    {
        return view();
    }
    public function download_2()
    {
        return view();
    }
    public function aboutus_cn_2()
    {
        return view();
    }
    public function all_list()
    {
        return view();
    }
    public function cn_26()
    {
        return view();
    }
    public function cn_27()
    {
        return view();
    }
    public function cn_28()
    {
        return view();
    }
    public function cn_29()
    {
        return view();
    }
    public function cn_30()
    {
        return view();
    }
    public function cn_31_2()
    {
        return view();
    }
    public function cn_32()
    {
        return view();
    }
    public function cn_33()
    {
        return view();
    }
    public function cn_34()
    {
        return view();
    }
    public function contact_cn_2()
    {
        return view();
    }
    public function job()
    {
        return view();
    }
    public function list_2d_cn_2()
    {
        return view();
    }
    public function list_3d()
    {
        return view();
    }
    public function list_3_2_cn()
    {
        return view();
    }
    public function list_4_cn()
    {
        return view();
    }
    public function list_5_cn()
    {
        return view();
    }
    public function list_101_cn()
    {
        return view();
    }
    public function list_103_cn()
    {
        return view();
    }
    public function list_112_cn()
    {
        return view();
    }
    public function list_113_cn()
    {
        return view();
    }
    public function list_117_cn()
    {
        return view();
    }
    public function list_123_cn()
    {
        return view();
    }
    public function list_126_cn()
    {
        return view();
    }
    public function news_2()
    {
        return view();
    }
    public function partner_2()
    {
        return view();
    }
    public function partner()
    {
        return view();
    }
    public function privacy_cn_2()
    {
        return view();
    }
    public function product_2()
    {
        return view();
    }
    public function product_4()
    {
        return view();
    }
    public function product()
    {
        return view();
    }
    public function register_include()
    {
        return view();
    }
    public function solutions_2()
    {
        return view();
    }
    public function alphalook3d_cn()
    {
        return view();
    }
}
