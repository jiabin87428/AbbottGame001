const config = require('./config')
// 展示进度条的网络请求
// url:网络请求的url
// params:请求参数
// message:进度条的提示信息
// success:成功的回调函数
// fail：失败的回调
const requestLoading = function(url, params, message, success, fail, complete) {
	if (message != "") {
	  uni.showLoading({
	  	title: message,
	  });
	}
	console.log('request.js :' + url);
	mui.mui.ajax(url,{
		data: params,
		dataType: 'json',//服务器返回json格式数据
		type: 'POST',//HTTP请求类型
		timeout: 10000,//超时时间设置为10秒；
		success: function(data){
			if (message != "") {
			  uni.hideLoading()
			}
			
			// console.log('' + JSON.stringify(res));
			if (res.data.success == 'true') {
				success(res.data)
			} else {
				fail()
			}
		},
		error: function(xhr,type,errorThrown){
			// console.log('' + JSON.stringify(res))
			if (message != "") {
			  uni.hideLoading()  
			}
			fail()
		}
	});
}

export default {
    requestLoading
}