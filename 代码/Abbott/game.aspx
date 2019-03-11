<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game.aspx.cs" Inherits="Abbott.game" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--禁止双击放大页面-->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>云集有你 雅培添力</title>

<script src="js/mui.js"></script>
<link href="css/mui.min.css" rel="stylesheet"/>

<link href="css/common.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/time_js.js"></script>

<!--快速点击-->
<script type="application/javascript" src="js/fastclick.js"></script>

<!--抛物线-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/parabola.js"></script>

<link type="text/css" rel="stylesheet" href="css/time_css.css" />
<link href="css/mui.css" rel="stylesheet" />

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script>
	var _hmt = _hmt || [];
	(function() {
	var hm = document.createElement("script");
	hm.src = "https://hm.baidu.com/hm.js?50be6c11b00fe4165f77dfe57c6093ee";
	var s = document.getElementsByTagName("script")[0]; 
	s.parentNode.insertBefore(hm, s);
	})();
</script>
</head>

<style>
	.boll {
		width: 50px;
		height: 50px;
		background-color: #ff3333;
		position: absolute;
		top: 40%;
		left: 50%;
		margin:-25px 0 0 -25px;
		-moz-border-radius: 50px;
		-webkit-border-radius: 50px;
		border-radius: 50px;
	}
	.jumpImg{
		width: 20%;
		/* height: 50px; */
		position: absolute;
		top: 55%;
		bottom: 250px;
		left: 50%;
		margin:-25px 0 0 -25px;
	}
	
	.btnReadyClass {
		position: absolute;
		width: 200px;
		height: 144px;
		/* height: 173px; */
		bottom: 0px;
		left: 50%;
		margin-left: -100px;
		background-size: 100% 100%;
		background-color:transparent;
		border-color: transparent;
		color: #FFFFFF;
		font-size: 26px;
		text-align: center;
		line-height:150px;
		
		background-image:url(assets/btn_game_ready.png);/*背景图片*/
	}
	
	.btnClass {
		position: absolute;
		width: 200px;
		height: 144px;
		bottom: 0px;
		left: 50%;
		margin-left: -100px;
		background-size: 100% 100%;
		background-color:transparent;
		border-color: transparent;
		color: #FFFFFF;
		font-size: 26px;
		text-align: center;
		line-height:150px;
		
		background-image:url(assets/btn_game_press.png);/*背景图片*/
	}
	
	.btnClass:active {
		background-image:url(assets/btn_game_pressDown.png);/*背景图片*/
	}
	
	.numClass {
		position: absolute;
		display: none;
		right: 10px;
		top: 10px;
	}
	.scoreView {
		position: absolute;
		width: 70%;
		top: 20px;
		right: 5px;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-around;/*水平居中*/
	}
	.scoreItem {
		position: relative;
		width: 100%;
	}
	.scoreImg {
		width: 100%;
	}
	.scoreText {
		/*background-color: #007AFF; */
		position: absolute;
		bottom: 15%;
		right: 0px;
		width: 50%;
		color: #FFFFFF;
		font-size: 14px;
		text-align: left;
		font-style: italic;
		font-weight: 700;
	}
	
	.boxView {
		position: absolute;
		bottom: 10%;
		width: 100%;
	}
	
	/* 设置了浏览器高度不大于1000px时 图片显示的宽度 */ 
	@media screen and (max-height: 1000px) { 
		.maskSubView {
			width: 80%;
		} 
		.shareSubView {
			width: 80%;
		}
	}
	
	/* 设置了浏览器高度不大于800px时 图片显示的宽度 */ 
	@media screen and (max-height: 800px) { 
		.maskSubView {
			width: 90%;
		} 
		.boxView {
			bottom: 10%;
		}
		.shareSubView {
			width: 80%;
		}
	}
	
	/* 设置了浏览器高度不大于600px时 图片显示的宽度 */ 
	@media screen and (max-height: 600px) { 
		.maskSubView {
			width: 60%;
		} 
		.boxView {
			bottom: 15%;
		}
		.shareSubView {
			width: 80%;
		}
		.scoreText {
			font-size: 12px;
		}
	}
	
	/* music */
@-webkit-keyframes reverseRotataZ{
    0%{-webkit-transform: rotateZ(0deg);}
    100%{-webkit-transform: rotateZ(-360deg);}
}
@-webkit-keyframes rotataZ{
    0%{-webkit-transform: rotateZ(0deg);}
    100%{-webkit-transform: rotateZ(360deg);}
}
#musicControl { position:fixed;right:5px;top:70px;margin-top:0;display:inline-block;z-index:99999999}
#musicControl a { display:inline-block;width:25px;height:25px;overflow:hidden;background:url('assets/play.png') no-repeat;background-size:100%;}
#musicControl a audio{width:100%;height:56px;}
#musicControl a.stop { background-position:left bottom;}
#musicControl a.on { background-position:0px 1px;-webkit-animation: reverseRotataZ 1.2s linear infinite;}
#music_play_filter{width:100%;height:100%;overflow:hidden;position:fixed;top:0;left:0;z-index:99999998;}
	
</style>

<body>
	<form id="form1" runat="server">
		<div id="baseView" class="gameBaseView">
			<div class="scoreView">
				<div id="scoreItem" class="scoreItem">
					<img class="scoreImg" src="assets/xas.png" >
					<label id="score0" class="scoreText">X0</label>
				</div>
				<div id="scoreItem" class="scoreItem">
					<img class="scoreImg" src="assets/jz.png" >
					<label id="score1" class="scoreText">X0</label>
				</div>
				<div id="scoreItem" class="scoreItem">
					<img class="scoreImg" src="assets/eml.png" >
					<label id="score2" class="scoreText">X0</label>
				</div>
			</div>
			<div class="game_time">
				<img class="bgClock" src="assets/clockBg.png"/>
				<div class="hold">
					<div class="pie pie1"></div>
				</div>
				<div class="hold">
					<div class="pie pie2"></div>
				</div>
				<div class="bg"> </div>
				<!-- <div class="time">10s</div> -->
				<img class="time" src="assets/10.png"/>
			</div>
			<div class="gameView">
				<img class="boxView" src="assets/gameBox.png" />
				<img id="readyImg" style="display:none" class="readyImg" src="assets/3.png"/>
				<div id="readyTap" class="btnReadyClass" onclick="readyClick()"></div>
				<div id="btnTap" style="display:none"  class="btnClass"></div>
				<audio id="clickAudio" src="assets/click.mp3" style="display:none"></audio>
				<audio id="countDownAudio" src="assets/countDown.mp3" style="display:none"></audio>
				<audio id="startAudio" src="assets/start.mp3" type="audio/mpeg" style="display:none"></audio>
				<audio id="finishAudio" src="assets/finish.mp3" style="display:none"></audio>
			</div>
			<div class="numClass" id="num"></div>
			
			<div id="mask" class="mask">
				<div class="gameOverMaskView">
					<img class="maskSubView" src="assets/subBg.png" onclick="jumpUrl('https://m.yj.ink/pzWuDz')">
					<div id="resultLabelView" class="resultLabelView">
						<label id="resultLabel" class="resultLabel"></label>
					</div>
					<!-- <button id="playAgain" type="button" style="width: 200px;height: 60px;" class="mui-btn mui-btn-warning" onclick="playAgain()">再玩一次</button> -->
					<img id="play1" class="btnImage" src="assets/btn_play_again.png" onclick="playAgain()"/>
					<img id="help" class="btnImage" src="assets/btn_wyyw.png" onclick="playSelf()"/>
					<div id="play2" class="rowBtnView">
						<img class="btnImage" src="assets/btn_help.png" onclick="showShare()"/>
						<img class="btnImage" src="assets/btn_point.png" onclick="jumpPage('rank.aspx','大胃萌宝抢奶喝')"/>
					</div>
					<label id="timeLabel" class="resultLabel"></label>
				</div>
			</div>
			
			<div id="shareMask" class="shareMask" onclick="hideShare()">
				<div class="shareMaskView">
					<img class="shareSubView" src="assets/helpBg.png" >
				</div>
			</div>
			
			<span id="musicControl">
				<a id="mc_play" class="on" onclick="play_music();">
					<audio id="musicfx" loop="loop" autoplay="autoplay">
						<source src="assets/bgm.mp3" type="audio/mpeg">
					</audio>
				</a>
			</span>
		</div>
		<div style="display:none">
			<label id="textScore1" runat="server"></label>
			<label id="textScore2" runat="server"></label>
			<label id="textScore3" runat="server"></label>
		</div>
		<!--<img class="bgImg" src="assets/gamebg.jpg" />-->
		<div style="display:none">
			<asp:Label ID="lbUserID" runat="server" Text="Label"></asp:Label>
			<br />
			<asp:Label ID="lbUserName" runat="server" Text="Label"></asp:Label>
			<br />
			<asp:Label ID="lbUserHeadUrl" runat="server" Text="Label"></asp:Label>
			<br />
			<asp:Label ID="lbCount" runat="server" Text="Label"></asp:Label>
			<br />
			<asp:Label ID="lbTargetID" runat="server" Text="Label"></asp:Label>
			<br />
			<asp:TextBox ID="txtScore1" runat="server" Text="0"></asp:TextBox>
			<asp:TextBox ID="txtScore2" runat="server" Text="0"></asp:TextBox>
			<asp:TextBox ID="txtScore3" runat="server" Text="0"></asp:TextBox>
			<asp:Button ID="btnSubmit" runat="server" Text="提交分数" OnClick="btnSubmit_Click" />
		</div>
	</form>
</body>

<script type="text/javascript">
	var userId = "";		// 用户ID
	var targetId = "";		// 发起者ID,助力用
	var count = 0;			// 剩余游戏机会
	
	var result = [
		{'name': '小安素', 'num': 0},
		{'name': '菁挚', 'num': 0},
		{'name': '恩美力', 'num': 0},
	];
	mui.init();
	mask.style.display = "none";
	shareMask.style.display = "none";
	// mask.style.left = '100%';
	btnTap.addEventListener('tap', function(event) {
		let num = randomNum(0,2);
		var para = createAnimat(num);
		// showSound("assets/click.mp3");
		clickAudio.play();
		if(para != null) {
			para.start();
		}
	},false);
	
	$("body").ready(function () {
		userId = document.getElementById("lbUserID").innerHTML;
		
		count = document.getElementById("lbCount").innerHTML;
		
		targetId = document.getElementById("lbTargetID").innerHTML;
	})

	/**
	 * 产生音效
	 * @param audioSrc ：音频路径
	 */
	function showSound(audioSrc) {
		/**因为音效元素是追加的，所以每次生成之前，将原来的删除掉*/
		$("#hint").remove();
		/**创建audio标签的Jquery对象，然后追加到body进行播放即可*/
		let audioJQ = $("<audio src='" + audioSrc + "' autoplay id='hint'/>");
		audioJQ.appendTo("body");
	}
	
	var itemId = 100;
	var idNum = 0;
	
	var readyTime = 3; //准备倒计时，3秒  
	var readyTimer;
	var isGaming = false; // 是否可以游戏,准备阶段和未点击准备按钮阶段为false
	
	// 准备开始,倒计时3秒
	function readyClick() {
		if(count <= 0) {
			alert('您已无游戏机会，可以邀请好友助力增加游戏机会哦！');
			return;
		}
		
		isGaming = false;
		readyTime = 3;
		readyTimer = setInterval("readyCountDown()", 1000); 
		var play = setTimeout("countDownAudio.play()",0);
		//var start = setTimeout("startAudio.play()",4100);
		readyTap.style.display = "none";
		btnTap.style.display = "";
	}
	
	function readyCountDown() {
		if (readyTime >= 0) {
			isGaming = false;
			readyImg.style.display=""
			if (readyTime == 3) {
				readyImg.src = "assets/3.png";
			}else if (readyTime == 2) {
				readyImg.src = "assets/2.png";
			}else if (readyTime == 1) {
				readyImg.src = "assets/1.png";
			}else {
				readyImg.src = "assets/go.png";
				//var start = setTimeout("startAudio.play()",10);
				document.addEventListener("WeixinJSBridgeReady", function () { 
				    document.getElementById('startAudio').play(); 
				    // document.getElementById('video').play(); 
				}, false);
			}
			minutes = Math.floor(readyTime / 60);
			seconds = Math.floor(readyTime % 60);
			--readyTime;
			console.log(readyTime)
		} else{
			clearInterval(readyTimer);
			// alert("时间到，结束!");
			readyImg.style.display="none"
			isGaming = true;
			countDown(function() {
				finishAudio.play();
				// resultLabel.innerHTML = '游戏结束 共点击了：\n' + idNum + "次";
				let xasNum = result[0].num;
				let jzNum = result[1].num;
				let emlNum = result[2].num;
				
				if(targetId == null || targetId == "") {// 非助力
					resultLabel.innerHTML = '恭喜你获得' + xasNum + '罐小安素，' + jzNum + '罐菁挚，' + emlNum + '罐恩美力<br>离大奖就差一点点了<br>快分享给好友，为你助力吧！';
				}else {// 助力
					resultLabel.innerHTML = '恭喜帮Ta获得' + xasNum + '罐小安素，' + jzNum + '罐菁挚，' + emlNum + '罐恩美力<br>';
				}
				isGaming = false;
				
				mask.style.display = "";
				if(targetId == null || targetId == "") {// 非助力
					$("#help").hide();
					$("#play1").show();
					$("#play2").show();
					$("#timeLabel").show();
				}else {// 助力
					$("#play1").hide();
					$("#play2").hide();
					$("#help").show();
					$("#timeLabel").hide();
				}
				
				//alert('targetID:' + targetID);
				
				// 给TextBox赋值
				//document.getElementById('<%=textScore1.ClientID%>').innerHTML= xasNum ;
				//document.getElementById('<%=textScore2.ClientID%>').innerHTML= jzNum ;
				//document.getElementById('<%=textScore3.ClientID%>').innerHTML= emlNum ;
				//$('<%=txtScore1.ClientID %>').innerHTML = xasNum;	// txtScore1为小安素的分数
				//$('<%=txtScore2.ClientID %>').innerHTML = jzNum;	// txtScore1为菁挚的分数
				//$('<%=txtScore3.ClientID %>').innerHTML = emlNum;	// txtScore1为恩美力素的分数 
				//form1.submit()
				
				// 调用上传方法
				//document.getElementById("<%=btnSubmit.ClientID %>").click();
				
				mui.showLoading("正在上传成绩..","div");
				submitScores(xasNum, jzNum, emlNum);
			});
		}
	}
	
	// 游戏结束,提交游戏数据
	function submitScores(score1, score2, score3) {
		var isTargeted = 0;	// 0是非助力,1是助力
		if (targetId == "" || targetId == null) {// 非助力
			isTargeted = 0;
		}else {
			isTargeted = 1;
		}
		
		var params = {
			'userid': userId,
			'isTargeted': isTargeted,
			'targetUserid': targetId,
			'score1': score1,
			'score2': score2,
			'score3': score3,
		}
		
		//alert('请求参数：' + JSON.stringify(params));
		
		mui.ajax('http://www.angelyang.net/uploadScore.ashx',{
			data: params,
			dataType:'json',//服务器返回json格式数据
			type:'post',//HTTP请求类型
			timeout:10000,//超时时间设置为10秒；
			headers:{'Content-Type':'application/json'},	              
			success:function(data){
				mui.hideLoading();
				count = data.Count;
				$("#timeLabel").html('您剩余的游戏机会：' + data.Count + '次。');
			},
			error:function(xhr,type,errorThrown){
				mui.toast();
				mui.hideLoading();
				//异常处理；
				console.log(type);
			}
		});
	}
	
	function removeBoll(bollId) {
		var child=document.getElementById(bollId);
		var bassView=document.getElementById("baseView");
		bassView.removeChild(child)
	}
	
	function createAnimat(index) {
		console.log(index)
		if (isGaming == false) {
			return null;
		}
		
		var src = "";
		if (index == 0) {
			src = "assets/jump_xas.png"
		}else if (index == 1) {
			src = "assets/jump_jz.png"
		}else if (index == 2) {
			src = "assets/jump_eml.png"
		}
		var resultItem = result[index];
		resultItem.num++;
		$("#score" + index).html("X" + resultItem.num);
		
// 		var div = document.createElement("div");  
// 		div.id = itemId + idNum + "";
// 		div.className = 'boll';
		var div = document.createElement("img");  
		div.id = itemId + idNum + "";
		div.className = 'jumpImg';
		div.src = src;
		div.style.width = randomNum(10,20) + "%";
		div.style.transform = "rotate(" + randomNum(-30,30) + "deg)";
		idNum++;
		
		num.innerHTML = '点击次数：' + idNum;
		var bassView=document.getElementById("baseView");
		bassView.appendChild(div);
		let leftOrRight = randomNum(1,2) // 随机左右方向,1是左,2是右
		let rdNum1 = leftOrRight == 1 ? randomNum(-100,-50) : randomNum(50,100);
		let rdNum2 = randomNum(-100,-200);
		
		var boll = new Parabola({
				el: "#" + div.id,
				offset: [rdNum1, rdNum2],
				curvature: 0.01,
				duration: 200,
				callback:function(){
					// alert("完成后回调")
					removeBoll(div.id);
				},
				stepCallback:function(x,y,alpha){
					// console.log(alpha);
					div.style.opacity = alpha; 
					//$("<div>").appendTo("body").css({
						//"position": "absolute",
						//"top": this.elOriginalTop + y,
						//"left":this.elOriginalLeft + x,
						//"background-color":"#CDCDCD",
						// 抛物线
		// 				"width":"5px",
		// 				"height":"5px",
		// 				"border-radius": "5px"
					//});
				}
			});
		return boll;
	}
	
	// 展示分享方法
	function showShare() {
		shareMask.style.display = "";
	}
	// 隐藏分享方法
	function hideShare() {
		shareMask.style.display = "none";
	}
	
	// 再玩一次
	function playAgain() {
		if(count <= 0) {
			alert('您已无游戏机会，可以邀请好友助力增加游戏机会哦！');
			return;
		}
		gameInit();
	}
	// 我也要玩
	function playSelf() {
		mui.openWindow({
			url: 'http://www.angelyang.net/rules.aspx',
			show:{
			  aniShow:'none',//页面显示动画，默认为”slide-in-right“；
			},
		});
	}
	
	// 游戏初始化
	function gameInit() {
		itemId = 100;
		idNum = 0;
		readyTime = 3;
		isGaming = false;
		
		readyTap.style.display = "";
		btnTap.style.display = "none";
		
		num.innerHTML = '点击次数：0';
		
		resetCount();
		mask.style.display = "none";
		
		$(".time").attr("src","assets/10.png");
		
		result = [
			{'name': '小安素', 'num': 0},
			{'name': '菁挚', 'num': 0},
			{'name': '恩美力', 'num': 0},
		];
		$("#score0").html("X0");
		$("#score1").html("X0");
		$("#score2").html("X0");
	}
	
	// 跳转页面
	function jumpPage(id, t, d){
		mui.openWindow({
			url: 'http://www.angelyang.net/' + id,
		});
	}
	// 跳转第三方url
	function jumpUrl(url) {
		mui.openWindow({
			url: url
		});
	}
	
	//生成从minNum到maxNum的随机数
	function randomNum(minNum,maxNum){ 
		switch(arguments.length){ 
			case 1: 
				return parseInt(Math.random()*minNum+1,10); 
			break; 
			case 2: 
				return parseInt(Math.random()*(maxNum-minNum+1)+minNum,10); 
			break; 
				default: 
					return 0; 
				break; 
		} 
	} 
</script>

<!-- music -->
<script>
	var play_filter=document.getElementById('music_play_filter');
	$("body").ready(function () {
		wx.config({
		    debug: false,
		    appId: '<%=appId %>', 
		    timestamp: <%=timestamp %>,
		    nonceStr: '<%=nonceStr %>',
		    signature: '<%=signature %>',
		    jsApiList: [
		      'onMenuShareTimeline',
		      'onMenuShareAppMessage',
		      'hideMenuItems',
		      'showMenuItems',
		      'hideAllNonBaseMenuItem',
		      'showAllNonBaseMenuItem',
		      
		    ]
		  });
		
		wx.ready(function () {
		     wx.onMenuShareAppMessage({
		        title: '云集有你 雅培添力', // 分享标题
		        desc: '呼朋唤友来助力 惊喜好礼抢不停', // 分享描述
		        link: 'http://www.angelyang.net/rules.aspx?tid=' + userId, // 分享链接
		        imgUrl: 'http://www.angelyang.net/chick.jpeg', // 分享图标
		        type: 'link', // 分享类型,music、video或link，不填默认为link
		        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
		        success: function () { 
		            // 用户确认分享后执行的回调函数
		            
		        },
		        cancel: function () { 
		            // 用户取消分享后执行的回调函数
		        }
		    });
		    wx.onMenuShareTimeline({
		    	 title: '云集有你 雅培添力', // 分享标题
		        desc: '呼朋唤友来助力 惊喜好礼抢不停', // 分享描述
		        link: 'http://www.angelyang.net/rules.aspx?tid=' + userId, // 分享链接
		        imgUrl: 'http://www.angelyang.net/chick.jpeg', // 分享图标
		        type: 'link', // 分享类型,music、video或link，不填默认为link
		        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
		        success: function () { 
		            // 用户确认分享后执行的回调函数
		            
		        },
		        cancel: function () { 
		            // 用户取消分享后执行的回调函数
		        }
		    });
		});
		
		//musicfx.play();
		//clickAudio.play();
		
 		play_filter.addEventListener('click', function(){
 		    just_play(1);
 		});
 		play_filter.addEventListener('touchstart', function(){
 		    just_play(1);
 		});
 		play_filter.addEventListener('touchend', function(){
 		    just_play(1);
 		});
 		play_filter.addEventListener('touchmove', function(){
 		    just_play(1);
 		});
 		play_filter.addEventListener('mousedown', function(){
 		    just_play(1);
 		});
 		play_filter.addEventListener('mouseup', function(){
 		    just_play(1);
 		});
 		play_filter.addEventListener('mousemove',function(){
 		    just_play(1);
 		});
	})
	
	function play_music(){
        if ($('#mc_play').hasClass('on')){
            $('#mc_play audio').get(0).pause();
            $('#mc_play').attr('class','stop');
        }else{
            $('#mc_play audio').get(0).play();
            $('#mc_play').attr('class','on');
        }
        $('#music_play_filter').hide();
        event.stopPropagation(); //阻止冒泡
    }
    function just_play(id){
        $('#mc_play audio').get(0).play();
        $('#mc_play').attr('class','on');
        if (typeof(id)!='undefined'){
            $('#music_play_filter').hide();
        }
        event.stopPropagation(); //阻止冒泡
    }
    function is_weixn(){
        return false;
        var ua = navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i)=="micromessenger") {
            return true;
        } else {
            return false;
        }
    }
    window.onload=function(){
         if (!is_weixn()){
             //just_play();
         }
		//just_play();
    }
</script>
<!--<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script> -->
<script type="text/javascript">
    document.addEventListener("WeixinJSBridgeReady", function () { 
        document.getElementById('musicfx').play(); 
        // document.getElementById('video').play(); 
    }, false);
</script>

</html>
