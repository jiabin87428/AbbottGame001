var appid = "wx036d1bc6ff7ca80b";
var GWC = {
	version: '1.1.1',
	urlParams: {},
	appendParams: function(url, params) {
		if (params) {
			var baseWithSearch = url.split('#')[0];
			var hash = url.split('#')[1];
			for (var key in params) {
				var attrValue = params[key];
				if (attrValue !== undefined) {
					var newParam = key + "=" + attrValue;
					if (baseWithSearch.indexOf('?') > 0) {
						var oldParamReg = new RegExp('^' + key + '=[-%.!~*\'\(\)\\w]*', 'g');
						if (oldParamReg.test(baseWithSearch)) {
							baseWithSearch = baseWithSearch.replace(oldParamReg, newParam);
						} else {
							baseWithSearch += "&" + newParam;
						}
					} else {
						baseWithSearch += "?" + newParam;
					}
				}
			}

			if (hash) {
				url = baseWithSearch + '#' + hash;
			} else {
				url = baseWithSearch;
			}
		}
		return url;
	},
	getUrlParams: function() {
		var pairs = location.search.substring(1).split('&');
		for (var i = 0; i < pairs.length; i++) {
			var pos = pairs[i].indexOf('=');
			if (pos === -1) {
				continue;
			}
			GWC.urlParams[pairs[i].substring(0, pos)] = decodeURIComponent(pairs[i].substring(pos + 1));
		}
	},
	doRedirect: function() {
		var code = GWC.urlParams['index'];
		var appId = GWC.urlParams['appid'];
		var scope = GWC.urlParams['scope'] || 'snsapi_base';
		var state = GWC.urlParams['state'];
		var redirectUri;

		if (!code) {
			alert("http://"+window.location.host+"/notify.html");
			//第一步，没有拿到code，跳转至微信授权页面获取code
			redirectUri = GWC.appendParams('https://open.weixin.qq.com/connect/oauth2/authorize#wechat_redirect', {
				'appid': appid,
				'redirect_uri': encodeURIComponent("http://"+window.location.host+"/notify.html"),
				'response_type': 'code',
				'scope': 'snsapi_userinfo',
				'state': 'STATE',
			});
		} else {
			//第二步，从微信授权页面跳转回来，已经获取到了code，再次跳转到实际所需页面
			redirectUri = GWC.appendParams(GWC.urlParams['redirect_uri'], {
				'code': code,
				'state': state
			});
		}

		location.href = redirectUri;
	}
};