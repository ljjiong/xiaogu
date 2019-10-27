/**
 * 路由配置列表,需要登录配1，不需要登陆配0
 */
var allRouters = {
  "my_projects": 1, //我的项目
  "new_built": 1, //新建项目
  "projects_detail": 1, //项目详情
  "my_tasks": 1, //我的任务
  "my_file": 1, //相关文件
  "basic_data": 1, //基础信息
  "personnel_page": 1, //行政页
  "square": 1, //通知页
  "square_details": 1, //通知页
  "filelist": 1, //文件列表页
  "powergeneration": 1, //发电量页
  "transaction": 1, //事物申请
  "address_book": 1, //通讯录
  "wages": 1, //工资
  "performance": 1, //绩效
  "contract": 1, //合同
  "commonality": 1, //可申请的事物



  "login": 0, //登录
  "third_login_transition": 0, //第三方登录过渡页
  "register": 0, //注册
  "bind_mobile": 0, //绑定手机号
  "modify_mobile": 1, //修改手机号
  "account": 1, //账号安全
  "reset_password": 0, //重置密码
  "index": 0, //首页
  "goods_list": 0, //商品列表
  "goods_list_model": 0, //商品列表模板
  "goods_detail": 0, //商品详情
  "goods_spec_info_select": 0, //规格选择iframe
  "attr_view": 0, //商品属性查看
  "discount_page": 0, //限时折扣
  "order_confirm": 1, //订单确认
  "pay_select": 1, //选择支付方式
  "pay_waiting": 1, //支付等待
  "wallet": 1, //钱包
  "wallet_detail": 1, //钱包明细
  "bill_list": 1, //账单列表
  "balance": 1, //余额
  "recharge": 1, //充值
  "withdraw": 1, //提现
  "cart_list": 0, //购物车
  "cart_spec_info_select": 1, //购物车选择规格
  "home": 1, //个人中心
  "level": 1, //我的成长值
  "setting": 1, //设置
  "pay_success": 1, //商品支付
  "bind_third_setting": 1, //第三方账号绑定设置
  "address_list": 1, //地址列表
  "address_list_select": 1, //地址选择
  "address_edit": 1, //地址编辑
  "address_edit_select": 1, //地址编辑
  "order_list": 1, //订单
  "order_detail": 1, //订单详情
  "order_refund": 1, //订单退款
  "logistics": 1, //物流
  "collection_list": 1, //收藏
  "comment_list": 1, //评论
  "comment": 1,
  "comment_add": 1, //添加评论
  "idcard_auth": 1, //实名认证申请
  "idcard_info": 1, //实名认证信息
  "bankcard_list": 1, //银行卡列表
  "bankcard_add": 1, //银行卡列表
  "bankcard_edit": 1, //银行卡编辑
  "bankcard_list_select": 1, //银行卡列表选择
  "bankcard_edit_select": 1, //银行卡编辑选择
  "my_qrcode": 1, //我的二维码
  "coupon": 1, //优惠券领取
  "coupon_list": 1, //优惠券列表
  "help_and_option": 0, //帮助与反馈
  "notice_list": 0, //公告列表
  "notice_detail": 0, //公告详情
  "article_list": 0, //文章列表
  "article_detail": 0, //文章详情
  "search_page": 0, //搜索页
  "distribution_home": 1, //分销主页
  "distribution_withdraw_detail": 1, //分销申请详情
  "distribution_withdraw_apply": 1, //分销佣金提现
  "distribution_custs": 1, //我的客户
  "distribution_wallet": 1, //分销钱包
  "distribution_detail": 1, //分销详情
  "distribution_team": 1, //我的团队
  "distribution_orders": 1, //分销订单页
  "bonus_home": 1, //分红主页
  "bonus_wallet": 1, //分红钱包,
  "bonus_orders": 1, //分红订单
  "bonus_detail": 1, //分红明细
  "bonus_team": 1, //分红团队
  "bonus_custs": 1, //分红客户
  "bonus_withdraw_apply": 1, //分红申请提现
  "bonus_withdraw_detail": 1, //分红提现详情
  "distribution_and_bonus_apply": 1, //分红分销申请
  "handle_qrcode": 0, //扫码处理
  "complete_user_info": 1, //完善个人信息
  "my_receive_account": 1, //设置收款账户
  "score_shop": 1, //积分商城
  "score_goods_detail": 1, //积分商品
  "score_order_confirm": 1, //积分商品
  "score_order_list": 1, //积分订单
  "score_order_detail": 1, //积分订单详情
  "group_shop": 1, //团购商城
  "group_goods_detail": 1, //团购商品
  "group_order_confirm": 1, //团购订单确认
  "group_join_order_confirm": 1, //团购订单确认
  "group_order_list": 1, //团购订单
  "group_order_detail": 1, //团购订单详情
};

var tabRouters = ['index', 'goods_list', 'cart_list', 'home'];

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
      // location = 'http://wg.worktech.xyz' + '/' + getClientType() + '/index/login.html';
      // location = 'http://www.admin.sydzsd.com' + '/' + getClientType() + '/index/login.html';
      location = host + '/' + getClientType() + '/index/login.html';
    } else {
      //编码参数
      if (tabRouters.indexOf(router) != -1) {
        clearStorage(sessionStorage);
      }
      // location = 'http://wg.worktech.xyz' + '/' + getClientType() + '/index/' + router + '.html' + querystringStringify(params);
      // location = 'http://www.admin.sydzsd.com' + '/' + getClientType() + '/index/' + router + '.html' + querystringStringify(params);
      location = host + '/' + getClientType() + '/index/' + router + '.html' + querystringStringify(params);
    }
  } else {
    layer.msg('未配置路由,请在router.js里面配置路由参数' + router);
    return;
  }

}
/**
 * 固定wap路由
 * @param {路由} router 
 * @param {路由传参} params 
 */
function gotowap(router, params) {
  if (allRouters[router] == 0 || allRouters[router] == 1) {
    //如果进入需要登录的路由，则跳转到登陆页
    if (allRouters[router] && !user) {
      // location = 'http://wg.worktech.xyz' + '/' + getClientType() + '/index/login.html';
      // location = 'http://www.admin.sydzsd.com' + '/' + getClientType() + '/index/login.html';
      location = host + '/wap' + '/index/login.html';
    } else {
      //编码参数
      if (tabRouters.indexOf(router) != -1) {
        clearStorage(sessionStorage);
      }
      // location = 'http://wg.worktech.xyz' + '/' + getClientType() + '/index/' + router + '.html' + querystringStringify(params);
      // location = 'http://www.admin.sydzsd.com' + '/' + getClientType() + '/index/' + router + '.html' + querystringStringify(params);
      location = host + '/wap' + '/index/' + router + '.html' + querystringStringify(params);
    }
  } else {
    layer.msg('未配置路由,请在router.js里面配置路由参数' + router);
    return;
  }

}