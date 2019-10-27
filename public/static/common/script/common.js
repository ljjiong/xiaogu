/**
 * 刷新token
 */
function refreshToken() {
  if (is_do_refresh_token) {
    return;
  }

  is_do_refresh_token = 1;

  httpRequest('POST', 'api_systems/helper/refresh_token', {
    token: token.token,
    refresh_token: token.refresh_token
  }).then(function (resp) {
    token.token = resp.data.token;
    token.refresh_token = resp.data.refresh_token;
    setStorage(getClientType() + 'Token', token);
    setTimeout(function () {
      location.reload();
    }, 300);
  })
}

/**
 * 校验手机号
 * @param {*} telephone 
 */
function variTelephone(telephone) {
  return /^1\d{10}$/.test(telephone);
}
/**
 * 校验密码
 * @param {*} password 
 */
function variPassword(password) {
  return /^[A-Za-z0-9]{6,20}$/.test(password)
}

/**
 * 轮播初始化
 * @param {元素id} id 
 * @param {轮播图张数} num 
 * @param {是否自动播放} yesorno 
 */
function carouselInit(id, num) {
  $(id).owlCarousel({
    loop: true,
    margin: 0,
    nav: false,
    autoplay: true,
    // animateOut: 'fadeOut',
    autoplayTimeout: 4000,
    // mouseDrag: false,
    // touchDrag: false,
    responsive: {
      0: {
        items: num
      },
      600: {
        items: num
      },
      1000: {
        items: num
      }
    }
  });
}
/**
 * 轮播初始化
 * @param {元素id} id 
 * @param {轮播图张数} num 
 * @param {是否自动播放} yesorno 
 */
function carouselInit1(id, num) {
  $(id).owlCarousel({
    loop: false,
    margin: 0,
    nav: true,
    dots: false,
    navText: ["<img src='/public/static/wap/img/left-icon1.png'>", "<img src='/public/static/wap/img/right-icon1.png'>"],
    autoplayTimeout: 4000,
    responsive: {
      0: {
        items: num
      },
      600: {
        items: num
      },
      1000: {
        items: num
      }
    }
  });
}

/**
 * 判断当前浏览器是否为微信浏览器
 */
function isWeiXin() {
  //window.navigator.userAgent属性包含了浏览器类型、版本、操作系统类型、浏览器引擎类型等信息，这个属性可以用来判断浏览器类型
  var ua = window.navigator.userAgent.toLowerCase();
  //通过正则表达式匹配ua中是否含有MicroMessenger字符串
  if (ua.match(/MicroMessenger/i) == 'micromessenger') {
    return true;
  } else {
    return false;
  }
}

/**
 * 获得当前客户端类型
 */
function getClientType() {
  if (location.href.indexOf('admin') != -1) {
    return 'admin';
  } else if (location.href.indexOf('wap') != -1 || /mobile/ig.test(navigator.userAgent)) {
    return 'wap';
  } else {
    return 'portal';
  }
}

/**
 * 存储本地数据,支持对象存储
 * @param {键} key 
 * @param {值} value
 * @param {存储器类型} storageType //localStorage 默认 || sessionStorage
 */
function setStorage(key, value, storageType) {
  var v = value;
  if (typeof v == 'object') {
    v = JSON.stringify(v);
    v = 'obj-' + v;
  } else {
    v = 'str-' + v;
  }
  var ls = storageType || window.localStorage;
  if (ls) {
    ls.setItem(key, v);
  }
}
/**
 * 取本地数据,支持对象存储
 * @param {键} key 
 * @param {存储器类型} storageType //localStorage 默认 || sessionStorage
 */
function getStorage(key, storageType) {
  var ls = storageType || window.localStorage;
  if (ls) {
    var v = ls.getItem(key);
    if (!v) {
      return;
    }
    if (v.indexOf('obj-') === 0) {
      v = v.slice(4);
      return JSON.parse(v);
    } else if (v.indexOf('str-') === 0) {
      return v.slice(4);
    }
  }
};
/**
 * 移除key对应的数据
 * @param {键} key 
 * @param {存储器类型} storageType //localStorage 默认 || sessionStorage
 */
function rmStorage(key, storageType) {
  var ls = storageType || window.localStorage;
  if (ls && key) {
    ls.removeItem(key);
  }
};
/**
 * 
 * @param {存储器类型} storageType //localStorage 默认 || sessionStorage
 */
function clearStorage(storageType) {
  var ls = storageType || window.localStorage
  if (ls) {
    ls.clear();
  }
};


/**
 * 判断是否为空对象
 * @param {对象} obj 
 */
function isEmptyObject(obj) {
  for (var key in obj) {
    return false;
  }
  return true;
}

/**
 * 解析 URL 查询字符串
 * @param {解析字符串} str 
 */
function querystringParse(str) {
  str = str.substr(1);
  var obj = {};
  str.split('&').forEach(function (item) {
    var objArr = item.split('=');
    obj[objArr[0]] = objArr[1];
  });
  return obj;
}
/**
 * 格式化 URL 查询字符串, 格式 ?a=b&c=d
 * @param {解析对象} obj 
 */
function querystringStringify(obj) {
  var returnStr = '';
  for (var key in obj) {
    returnStr += (key + '=' + obj[key] + '&');
  }
  //第一个字符加上? 去掉最后一个&
  return returnStr ? ('?' + returnStr.substr(0, returnStr.length - 1)) : '';
}

/**
 * 图片处理
 * @param {base64编码} path 
 * @param {回调处理} callback 
 * @param {压缩后的宽度} width 
 * @param {压缩后的长度} height 
 * @param {压缩比率} quality
 */
function dealImage(path, callback, width, height, quality) {
  var img = new Image();
  img.src = path;
  img.onload = function () {
    //默认按比例压缩    
    var w = width || 500;
    var h = height || 500;
    var quality = quality || 1;

    //生成canvas    
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');

    // 创建属性节点    
    canvas.setAttribute("width", w);
    canvas.setAttribute("height", h);

    ctx.drawImage(this, 0, 0, w, h);
    // quality值越小，所绘制出的图像越模糊    
    var base64 = canvas.toDataURL('image/jpeg', quality);
    // 回调函数返回base64的值    
    callback(base64);
  };
};

/**
 * 对象深拷贝
 * @param {原对象} p 
 * @param {目标对象} c 
 */
function deepCopy(p, c) {
  // var c = c || (p.constructor === Array ? [] : {});
  // for (var i in p) {
  //   if (typeof p[i] === 'object' && p[i] !== null) {
  //     c[i] = (p[i].constructor === Array) ? [] : {};
  //     deepCopy(p[i], c[i]);
  //   } else {
  //     c[i] = p[i];
  //   }
  // }
  // return c;

  return JSON.parse(JSON.stringify(p))
}

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
// 例子： 
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 

Date.prototype.format = function (fmt) {
  var o = {
    "M+": this.getMonth() + 1,
    "d+": this.getDate(),
    "H+": this.getHours(),
    "m+": this.getMinutes(),
    "s+": this.getSeconds(),
    "S+": this.getMilliseconds()
  };

  //因位date.getFullYear()出来的结果是number类型的,所以为了让结果变成字符串型，下面有两种方法：
  if (/(y+)/.test(fmt)) {
    //第一种：利用字符串连接符“+”给date.getFullYear()+""，加一个空字符串便可以将number类型转换成字符串。
    fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  }
  for (var k in o) {
    if (new RegExp("(" + k + ")").test(fmt)) {
      //第二种：使用String()类型进行强制数据类型转换String(date.getFullYear())，这种更容易理解。
      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(String(o[k]).length)));
    }
  }
  return fmt;
};

/**
 * 组装级联数据项
 * @param {级联数据} data 
 */
function packageCascaderData(data) {
  var cData = [];
  data.forEach(function (item) {
    var cate = {
      value: item.id,
      label: item.name
    }
    if (item._child) {
      cate.children = packageCascaderData(item._child)
    }
    cData.push(cate);
  })
  return cData;
}

/**
 * 组装选中级联数据
 * @param {级联数据} types 
 * @param {选中级联id} typeId 
 */
function packageCascaderSelecteData(types, typeId, resultData) {
  resultData = resultData || '';
  for (var i = 0; i < types.length; i++) {
    if (types[i].value == typeId) {
      resultData += typeId
      return resultData.split(',').map(function (item) {
        return Number(item);
      });
    } else if (types[i].children) {
      var result = packageCascaderSelecteData(types[i].children, typeId, resultData + types[i].value + ',');
      if (result) {
        return result;
      }
    } else {
      continue;
    }
  }
}

/**
 * 组装element树数据
 * @param {待组装数据对象} data 
 */
function packageTreeData(data) {
  var tData = [];
  data.forEach(function (item) {
    var cItem = {
      id: item.id,
      label: item.name
    }
    if (item._child) {
      cItem.children = packageTreeData(item._child);
    }
    tData.push(cItem);
  })
  return tData;
}


/**
 * 自动执行函数
 */
(function () {
  //离开页面监听事件
  window.addEventListener('beforeunload', function (event) {

  });
}());