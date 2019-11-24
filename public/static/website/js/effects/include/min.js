define(function(require, exports, module) {
	var common = require('common');   		//公用类
	
	/*繁体中文*/
	var StranBody = $(".StranBody");        	
	if(StranBody.length>0){
		require.async('effects/ch/ch');
	}
	
	if($("form.ui-from").length>0){
		require.async('effects/form/form');
	}
	/*产品模块*/
	if(met_module==3){
		require.async('effects/product/product');
	}
	/*图片模块*/
	if(met_module==5){
		require.async('effects/img/img');
	}
	/*
		列表页
	*/
	if(MetpageType==2){
	
		/*分页*/
		var metPage = $(".met_pager");
		if(metPage.length>0){
			var metPageT = $("#metPageT"),metPageV = metPageT.attr("value");
			metPageT.on("click",function(){$(this).select()});
			$("#metPageB").on("click",function(){mPage(metPageT,metPageV)});
			$(document).keydown(function(e){
				if(!e) var e = window.event;  
				if(e.keyCode == 13){mPage(metPageT,metPageV);}
			})
			function mPage(mett,metv){
				var metPageI = mett.attr("value"),metPageNums = parseInt(metPageI);
				//var metPageNums = parseInet(document.getElementById(metPageT).value);
				if(metPageNums){
					var pageData = mett.data("pageurl");	
					PageStr=pageData.split("|");
					//PageStr0=PageStr[0].split("."); 
					var url = window.location.href.split("/");
					var folder = url[url.length-2];
					if(metPageNums<0){
						var pageUrl = met_weburl + folder + "/" +  PageStr[0] + "1" + PageStr[1];
						window.location.href = pageUrl;
					}else if(metPageNums>PageStr[2]){
						var pageUrl = met_weburl + folder + "/" +  PageStr[0] + PageStr[2] + PageStr[1];
						window.location.href = pageUrl;
					}else{
						var pageUrl = met_weburl + folder + "/" + PageStr[0] + metPageNums + PageStr[1];
						window.location.href = pageUrl;
					}
				}else{metPageT.attr("value",metv);}
			}        
		}
		
	}//列表页结束
	
	/*
		详情页
	*/
	if(MetpageType==3){
		
		if($('#page_break').length>0){//编辑器分页
			$('#page_break .num li:first').addClass('on');
			$('#page_break .num li').click(function(){
				$('#page_break').find("div[id^='page_']").hide();
				if ($(this).hasClass('on')) {
					$('#page_break #page_' + $(this).text()).show();
				} else {
					$('#page_break').find('.num li').removeClass('on'); 
					$(this).addClass('on'); 
					$('#page_break').find('#page_' + $(this).text()).show(); 
				} 
			});
		}
		
		if(met_module==4){
			$("#showdownload .paralist li").height(function(){
				if($(this).height()<$(this).find('span').height()){
					return $(this).find('span').height();
				}
			});
			$("#showdownload .paralist").css('visibility','visible');
		}
		if(met_module==6){
			$("#showjob .paralist li").height(function(){
				if($(this).height()<$(this).find('span').height()){
					return $(this).find('span').height();
				}
			});
			$("#showjob .paralist").css('visibility','visible');
		}
		
		/*点击次数*/
		var metClicks = $(".met_Clicks");
		if(metClicks.length>0){
			var modulename = '';
			switch(met_module){
				case 2: 
					modulename = 'news';
				break;
				case 3: 
					modulename = 'product';
				break;
				case 4: 
					modulename = 'download';
				break;
				case 5: 
					modulename = 'img';
				break;
			}
			var urlw = met_weburl+'include/hits.php?type='+modulename+'&id='+id+'&metinfover=v1';
			$.ajax({
				type: "POST",
				url: urlw,
				dataType:"text",
				success: function(msg){
					metClicks.html(msg);
				}
			});
		}
	
	}//详情页结束

	
	/*视频*/
	var video = $(".metvideobox");        		
	if(video.length>0){
		require.async('effects/video-js/ini');
	}
	
	
	
});
