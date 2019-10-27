//初始化  
function changecoupons()
{
	init();
}

$(window).resize(function() {
	init();
});

function init()
{
	var wwidth=$(window).width()    
    //1、优惠券背景图高度处理
	$("#coupon_list").css("height",wwidth*0.36);	
	//2、优惠券处理
	$("#coupon_list ul li").css("height",wwidth*0.2);
	$("#coupon_list ul").css("margin-left",wwidth*0.12);	
	$("#coupon_list ul li").css("margin-top",wwidth*0.08);
	$(".discount_money").css("font-size",wwidth/375*24);
	$(".discount_money_tag").css("font-size",wwidth/375*8);
	$(".coupon-infotext").css("font-size",wwidth/375*8);
	$(".coupons_info").css("padding-top",wwidth*0.02);
	//限制折扣处理
	$(".discount_list").css("height",wwidth*0.46);	
	$(".discount_time").css("padding-top",wwidth*0.07);
	$(".discount_time").css("margin-left",wwidth*0.3)
	$(".discount_time").css("font-size",wwidth/375*12)	
	if(wwidth>=750)
	{
		$(".product-tag section").css("margin-top",wwidth*0.012);
	}
}