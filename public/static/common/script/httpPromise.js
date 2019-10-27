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
  return headers;
}

// 封装请求
function AjaxRequest(_url, _type, _data, _async, _successfunc) {
  var headers = handleHeaders(headers);
  // if (_headers == undefined) {
  //     headers
  // }
  $.ajax({
    type: _type,
    url: _url,
    data: _data,
    dataType: 'json',
    headers: headers,
    json: 'json',
    async: _async,
    success: function (data) {
      switch (data.code) {
        case 100402:
          goto('verification');
          break;
        case 400100:
          goto('verification');
          break;
        default:
          _successfunc(data);
          break;
      }
    },
    error: function (r) {
      layer.msg('网络出错！');
    }
  });
};



/**
 * 公用http请求方法
 * @param {请求类型} method 
 * @param {请求路由} router 
 * @param {请求参数} params 
 * @param {头部信息} headers
 * @param {是否需要大菊花加载} notLoading 
 */
function httpRequest(method, router, params, headers, notLoading) {
  if (notLoading !== false) {
    var loadIndex = layer.open({
      type: 3,
      shade: 0.01,
      content: '<div class="loader9 loader"><div class="loader-nine"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>'
    })
  };
  headers = handleHeaders(headers);

  // 利用Promise包装ajax请求函数，回调统一用then处理
  return axios.request({
    url: host + router,
    // url: 'http://www.admin.sydzsd.com/index.php/' + router,
    // url: 'http://wg.worktech.xyz/index.php/' + router,
    method: method,
    data: params,
    headers: headers,
    timeout: 15000
  }).then(function (resp) {
    console.log(resp)
    layer.close(loadIndex)
    if (resp.status == 200) {
      if (resp.data.code == 1) {
        return resp.data;
      } else if (resp.data.code == 0) {
        return Promise.reject(resp.data);
      } else {
        // console.log(httpCodeMapping[resp.data.code])
        if (httpCodeMapping[resp.data.code].reLogin) {
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
        } else if (httpCodeMapping[resp.data.code].reToken) {
          // 刷新token
          refreshToken();
        } else {
          return Promise.reject(resp.data);
        }
      }
    } else {
      return Promise.reject(new Error(resp));
    }
  }).catch(function (e) {
    if (e.__proto__ === Error.prototype) {
      layer.msg('哎呀，网络走神了~');
    } else {
      layer.msg(e.msg)
    }
    layer.close(loadIndex)
    return Promise.reject(e);
  })
}