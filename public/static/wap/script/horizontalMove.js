/*
================================    
调用方法
horizontalMove({
    innerId: innerId,//滑动元素id 如"#inner"
    warpId: warpId,  //滑动元素外围容器id 如"#warp"
    speed:speed      //滑动参数0-1 0滑动幅度越小，1滑动幅度越大
    });
================================
*/
function horizontalMove(options) {
  //初始化数据
  var speed = 0.5;
  var startX;//触摸时的X坐标
  var x = 0;//X轴滑动的距离
  var aboveX = 0; // 设一个全局变量记录上一次内部块滑动的位置

  options = options || {}
  speed = options.speed;

  if (options.innerId && options.warpId) {
    var documentWidth = $(options.innerId).width();//内部滑动模块的高度
    var wapperWidth = $(options.warpId).width(); //外部框架的高度
    var inner = $(options.innerId);
    var warp = $(options.warpId)[0]

    function touchStart(e) {//触摸开始
      // e.preventDefault();
      var touch = e.touches[0];
      startX = touch.pageX;   //刚触摸时的坐标                       
    }

    function touchMove(e) {//滑动
      e.preventDefault();
      var touch = e.touches[0];
      x = touch.pageX - startX;//滑动的距离 
      inner.css({ left: aboveX + x * speed });
    }

    function touchEnd(e) {//手指离开屏幕                         
      aboveX = parseInt(inner.css("left"));//touch结束后记录内部滑块滑动的位置 在全局变量中体现 一定要用parseInt()将其转化为整数字;
      if (x > 0 && aboveX > 0) {//当滑动到最顶端时候不能再网上滑动
        //inner.style.top=0;
        inner.animate({ left: 0 }, 200);
        aboveX = 0;
      }

      if (x < 0 && (aboveX < (-(documentWidth - wapperWidth)))) {//当滑动到最底部时候不能再网下滑动
        // inner.style.top=-(documentHeight-wapperHeight)+"px";
        inner.animate({ left: -(documentWidth - wapperWidth) }, 200);
        aboveX = -(documentWidth - wapperWidth);
      }
    }//
    warp.addEventListener('touchstart', touchStart, false);
    warp.addEventListener('touchmove', touchMove, false);
    warp.addEventListener('touchend', touchEnd, false);

  }


}