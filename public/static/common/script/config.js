/**
 * 全局配置文件
 */
var domain = location.origin; //协议+域名+端口
var host = domain + '/index.php/';
var auth = 'Basic_Ivj6eZRxMTx2yiyunZvnG8R65'; //认证
var user = getStorage(getClientType() + 'User'); //用户信息
var token = getStorage(getClientType() + 'Token'); //用户登录获取的token
var querystring = querystringParse(location.search); //路由传递过来的参数，对象，格式?a=b&c=d
var is_do_refresh_token = 0;

var goodsImagesPath = '/public/upload/goods_images/';
var userImagePath = '/public/upload/user_images/';
var articleImagePath = '/public/upload/article_images/';
var othenImagePath = '/public/upload/othen_images/';
// document.addEventListener('plusready', function () {
//     console.log("所有plus api都应该在此事件发生后调用，否则会出现plus is undefined。"
//     var pinf = plus.push.getClientInfo();
//     var cid = pinf.clientid; //客户端标识  
//     console.log(cid);
//     var options = {
//     	cover: false
//     };
//     var str = dateToStr(new Date());
//     str += ": 欢迎使用Html5 Plus创建本地消息！";
//     plus.push.createMessage('欢迎使用Html5 Plus创建本地消息！');
// });