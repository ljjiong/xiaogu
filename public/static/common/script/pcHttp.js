var httpCodeMapping = {
  100100: {
    reLogin: 0,
    info: '客户端类型参数缺失'
  },
  100101: {
    reLogin: 0,
    info: '客户端类型不存在'
  },
  100200: {
    reLogin: 0,
    info: '客户端类型参数缺失'
  },
  100201: {
    reLogin: 0,
    info: '账户类型不存在'
  },
  100300: {
    reLogin: 0,
    info: 'auth参数缺失'
  },
  100301: {
    reLogin: 0,
    info: 'auth错误'
  },
  100400: {
    reLogin: 1,
    info: 'token参数缺失'
  },
  100401: {
    reLogin: 1,
    info: 'token错误'
  },
  100402: {
    reLogin: 0,
    reToken: 1,
    info: 'token过期'
  },
  200100: {
    reLogin: 0,
    info: '路由映射不存在（配置api模块下config的路由映射）'
  },
  200101: {
    reLogin: 0,
    info: '权限集不存在（查看当前登录账号是否分配了角色，并且分配的角色是否配置了权限）'
  },
  200102: {
    reLogin: 0,
    info: '无访问权限'
  },
  200103: {
    reLogin: 0,
    info: '当前接口仅限测试环境调用'
  },
  200104: {
    reLogin: 0,
    info: '当前接口仅限管理员调用'
  },
  300100: {
    reLogin: 0,
    info: '当前系统不存在'
  },
  300101: {
    reLogin: 0,
    info: '当前系统永久关闭'
  },
  300102: {
    reLogin: 0,
    info: '当前系统临时维护，暂时关闭中'
  },

}

/**
 * 处理头部信息
 * @param {自定义头部} headers 
 */
function handleHeaders(headers) {
  headers = headers || {};
  var clientType = getClientType()
  if (clientType == 'admin') {
    headers['client-type'] = 'pc';
    headers['auth'] = 'Basic_Ivj6eZRxMTx2yiyunZvnG8R65';
  } else if (clientType == 'wap') {
    if (isWeiXin()) {
      headers['client-type'] = 'wechat';
      headers['auth'] = 'Basic_Ivj6eZRxMTx2yiyunZvnG8R68';
    } else {
      headers['client-type'] = 'wap';
      headers['auth'] = 'Basic_Ivj6eZRxMTx2yiyunZvnG8R66';
    }
  } else if (clientType == 'portal') {
    headers['client-type'] = 'pc';
    headers['auth'] = 'Basic_Ivj6eZRxMTx2yiyunZvnG8R65';
  }
  if (user) {
    headers.token = token.token
  }
  // 采用request payload 方式提交数据，具体参考https://blog.csdn.net/yiifaa/article/details/73468001
  headers['Content-type'] = 'application/json;charset=utf-8';
  return headers;
}

function httpRequest(method, router, params, fun, headers, notLoading) {
  jQuery.support.cors = true;
  if (notLoading !== false) {
    var loadIndex = layer.open({
      type: 3,
      shade: 0.01,
      content: '<div class="load er9 loader"><div class="loader-nine"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>'
    })
  };
  headers = handleHeaders(headers);
  $.ajax({
    type: method,
    url: host + router,
    data: JSON.stringify(params),
    headers: headers,
    timeout: 15000,
    // processData: false,
    success: function (resp) {
      layer.close(loadIndex);
      if (resp.code == 0) {
        layer.msg(resp.msg || '')
      } else if (resp.code == 1) {
        fun(resp);
      } else {
        // layer.msg('登录过期，请重新登录');
        if (httpCodeMapping[resp.code].reLogin || httpCodeMapping[resp.code].reToken) {
          // 重新登录
          rmStorage(getClientType() + 'User');
          rmStorage(getClientType() + 'Token');
          if (getClientType() == 'admin') {
            rmStorage('adminNavs');
            rmStorage('basic_info');
            location = location.origin + '/admin';
          } else if (getClientType() == 'wap') {
            location = location.origin + '/wap/index/login';
          } else if (getClientType() == 'portal') {
            location = location.origin + '/portal/index/login';
          }
        }
      }
    },
    error: function (err) {
      layer.close(loadIndex);
      console.log(router);
      console.log(err)
      // console.log(params);
    },
  })
}