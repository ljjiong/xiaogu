/**
 * 路由配置列表,需要登录配1，不需要登陆配0
 */
var allRouters = {
  "login": 0, //登录
  "third_login_transition": 0,    //第三方登录过渡页
  "register": 0,  //注册
  "bind_mobile": 0,    //绑定手机号
  "modify_mobile": 1, //修改手机号
  "account": 1,//账号安全
  "reset_password": 0,    //重置密码
  "index": 0, //首页
  "goods_list": 0, //商品列表
  "goods_list_model": 0,  //商品列表模板
  "goods_detail": 0,  //商品详情
  "goods_spec_info_select": 0,    //规格选择iframe
  "attr_view": 0, //商品属性查看
  "discount": 0,  //限时折扣
  "order_confirm": 1, //订单确认
  "pay_select": 1,    //选择支付方式
  "pay_waiting": 1,  //支付等待
  "pay_qrcode": 1,  //支付等待
  "wallet": 1,    //钱包
  "wallet_detail": 1, //钱包明细
  "bill_list": 1, //账单列表
  "balance": 1,   //余额
  "recharge": 1,   //充值
  "withdraw": 1,   //提现
  "cart_list": 1,   //购物车
  "cart_spec_info_select": 1,  //购物车选择规格
  "home": 1,   //个人中心
  "level": 1,   //我的成长值
  "setting": 1,    //设置
  "pay_success": 1, //商品支付
  "bind": 0, //第三方绑定
  "bind_third_setting": 1,    //第三方账号绑定设置
  "address_list": 1, //地址列表
  "address_list_select": 1,    //地址选择
  "address_edit": 1,  //地址编辑
  "address_edit_select": 1,    //地址编辑
  "order_list": 1,   //订单
  "order_detail": 1,   //订单详情
  "order_refund": 1,  //订单退款
  "logistics": 1, //物流
  "collection_list": 1,   //收藏
  "comment_list": 1,   //评论
  "comment": 1,
  "comment_add": 1,   //添加评论
  "idcard_auth": 1,   //实名认证申请
  "idcard_info": 1,   //实名认证信息
  "bankcard_list": 1, //银行卡列表
  "bankcard_add": 1, //银行卡列表
  "bankcard_edit": 1, //银行卡编辑
  "bankcard_list_select": 1, //银行卡列表选择
  "bankcard_edit_select": 1, //银行卡编辑选择
  "my_qrcode": 1,   //我的二维码
  "coupon": 1,   //优惠券领取
  "coupon_list": 1,   //优惠券列表
  "help_and_option": 0,   //帮助与反馈
  "notice_list": 0,   //公告列表
  "notice_detail": 0, //公告详情
  "article_list": 0,   //文章列表
  "article_detail": 0, //文章详情
  "search_page": 0,  //搜索页
  "my_coupon_list": 1, //我的优惠券
  "reset_paypassword": 1,//设置支付密码
  "reset_model": 1,//设置支付密码
  "search_list": 0,//搜索
  "third_login": 0,//第三方绑定调整页面
  "bind_mobile": 0,//第三方绑定手机页面
  "article": 0
};

/**
 * 自执行函数，判断当前路由是否需要登陆
 */
(function isNeedLogin() {
  for (var key in allRouters) {
    if (location.pathname.indexOf(key) != -1 && (allRouters[key] == 1) && !user) {
      layer.msg('请先登录');
      setTimeout(function () {
        goto('login')
      }, 800)
    }
  }
})();

/**
 * 路由拦截器
 * @param {路由} router 
 * @param {路由传参} params 
 */
function goto(router, params) {
  if (allRouters[router] == 0 || allRouters[router] == 1) {
    //如果进入需要登录的路由，则跳转到登陆页
    if (allRouters[router] && !user) {
      layer.msg('请先登录');
      setTimeout(function () {
        goto('login')
      }, 800)
    } else {
      // window.location.href = location.origin + '/' + getClientType() + '/index/' + router + '.html' + querystringStringify(params);
      location = location.protocol + '//' + location.hostname + ':' + location.port + '/index.php/portal/index/' + router + '.html' + querystringStringify(params);;
    }
  } else {
    layer.msg('未配置路由,请在pcrouter.js里面配置路由参数' + router);
    return;
  }
}