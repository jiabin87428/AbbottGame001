// config.js
/**
  * 接口配置文件
  */
var host = "http://192.168.1.100:8080/boeb9"  

 
var config = {

	// 下面的地址配合 Server 工作
	host,
	// 获取微信用户信息
	getWeUserInfo: '',

};
//对外把对象config返回
module.exports = config