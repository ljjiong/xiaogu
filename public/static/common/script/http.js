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

// 添加请求拦截器
axios.interceptors.request.use(function (config) {
  // 在发送请求之前做些什么
  return config;
}, function (error) {
  // 对请求错误做些什么
  return Promise.reject(error);
});

// 添加响应拦截器
axios.interceptors.response.use(function (response) {
  // 对响应数据做点什么
  return response;
}, function (error) {
  // 对响应错误做点什么
  return Promise.reject(error);
});

/**
 * 处理头部信息
 * @param {自定义头部} headers 
 */
function handleHeaders(headers) {
  headers = headers || {};
  headers.auth = auth;
  var clientType = getClientType()
  if (clientType == 'admin') {
    headers['client-type'] = 'pc';
  } else if (clientType == 'wap') {
    if (isWeiXin()) {
      headers['client-type'] = 'wechat';
    } else {
      headers['client-type'] = 'wap';
    }
  } else if (clientType == 'portal') {
    headers['client-type'] = 'pc';
  }
  if (user) {
    headers.token = token.token
  }
  return headers;
}

/**
 * 公用http请求方法
 * @param {请求类型} method 
 * @param {请求路由} router 
 * @param {请求参数} params 
 * @param {回调方法} fun 
 * @param {头部信息} headers
 * @param {是否需要大菊花加载} notLoading 
 */
function httpRequest(method, router, params, fun, headers, notLoading) {
  if (notLoading !== false) {
    var loadIndex = layer.open({
      type: 3,
      shade: 0.01,
      content: '<div class="loader9 loader"><div class="loader-nine"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>'
    })
  };
  headers = handleHeaders(headers);
  axios.request({
    url: host + router,
    method: method,
    data: params,
    headers: headers,
    timeout: 15000
  }).then(function (resp) {
    layer.close(loadIndex)
    if (resp.status == 200) {
      if (resp.data.code == 1) {
        fun(resp.data);
      } else if (resp.data.code == 0) {
        layer.msg(resp.data.msg);
      } else {
        layer.msg(httpCodeMapping[resp.data.code].info)
        if (httpCodeMapping[resp.data.code].info.reLogin) {
          // 重新登录
          rmStorage(getClientType() + 'User');
          rmStorage(getClientType() + 'Token');
          rmStorage('adminNavs');
          rmStorage('basic_info');
          location = location.origin + '/admin';
        } else if (httpCodeMapping[resp.data.code].info.reToken) {
          // 刷新token
          refreshToken();
        }
      }
    }
  }).catch(function (e) {
    layer.close(loadIndex)
    console.log(e);
    layer.msg('网络连接错误,请检查网络设置' + router)
  })
}