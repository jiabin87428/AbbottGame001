<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Abbott.index" %>

<!DOCTYPE html>

<html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>云集有你 雅培添力</title>
    <script src="js/mui.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <link href="css/mui.css" rel="stylesheet"/>
	<link href="css/common.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8">
		mui.init();
		
		var showAlert = 1;	//  显示产品信息-1 2 3 4
		var rule = 1;	// 	显示游戏规则-1 2 3
		
		//var targetID = getUrlParam("targetId"); 
		var userId = "";			// 当前用户的ID
		var count = 0;				// 剩余游戏机会
		
		// 助力页用
		var targetID = "";			// 发起者的ID
		var targetusername = "";	// 发起者的昵称
		var targetrank1 = "";		// 发起者的小安素排名
		var targetrank2 = "";		// 发起者的菁挚排名
		var targetrank3 = "";		// 发起者的恩美力排名
		var targetcount = "";		// 有多少人为发起者助力
		
		$("body").ready(function () {
			userId = document.getElementById("lbUserID").innerHTML;
			count = document.getElementById("lbCount").innerHTML;
			$("#timeLabel").html('剩余游戏机会：' + count + '次（为朋友助力不扣游戏次数哦）');
			
			targetID = document.getElementById("lbTargetID").innerHTML;
			targetusername = '<%=targetusername %>';
			targetrank1 = '<%=targetrank1 %>';
			targetrank2 = '<%=targetrank2 %>';
			targetrank3 = '<%=targetrank3 %>';
			targetcount = '<%=targetcount %>';
			
			if(targetusername.length >= 3) {
				var first = targetusername.substring(0,1);
				var last = targetusername.substring(targetusername.length-1, targetusername.length);
				targetusername = first + '**' + last;
			}
			
			//alert('tatgetId:' + targetID);
			$("#provBtn_opi").css("visibility","hidden");
			$("#provBtn_rule").css("visibility","hidden");
			
			$("#maskView").hide();
			$("#ruleMask").hide();
			$("#shareMask").hide();
			if (targetID == "" || targetID == null) {
				$("#help1").hide();
				$("#help2").hide();
				$("#help3").hide();
				//alert('没有传过来的ID，此页为用户自己的游戏页');
			}else {
				$("#play1").hide();
				$("#play2").hide();
				$("#helpLabel").html('已有' + targetcount + '人为' + targetusername + '助力');
				var maxRank = Math.min(targetrank1, targetrank2, targetrank3);
				$("#help1").html(targetusername + '目前最高排名：' + 'No.' + maxRank);
				//alert('传过来的ID:' + targetID + '此页为助力页');
			}
			
			//$("#play1").click(function () {
				//document.getElementById("<%=btnGame.ClientID %>").click();
			//})
			
			//var s = document.getElementById("<%=lbUserID.ClientID %>").html();
			
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
		})
		
		window.addEventListener('pageshow', function (e) {
			if (e.persisted) {
				//window.location.reload();
				//form1.submit();
				 //window.location.replace(document.referrer);
				  
				var restCount = localStorage.getItem('RestCount');
				if (restCount != null) {
					$("#timeLabel").html('剩余游戏机会：' + restCount + '次（为朋友助力不扣游戏次数哦）');
					// 取完值马上清除
					localStorage.removeItem('RestCount');
				}
			}
		})
		
		// 点击即刻参与
		function playGame() {			
			if(count <= 0) {
				alert('您已无游戏机会，可以邀请好友助力增加游戏机会哦！')
			}else{
				document.getElementById("<%=btnGame.ClientID %>").click();
			}
		}
		
		// 点击为Ta助力
		function helpClick() {
			var isHelped = document.getElementById("lbIsT").innerHTML;
			if(isHelped == '1') {// 已为Ta助过力,弹出提示
				alert('您已经为Ta助过力啦！')
			}else if (isHelped == '0') {// 未为Ta助过力,进入游戏页
				document.getElementById("<%=btnGame.ClientID %>").click();
			}
		}
		
		function jumpPage(url) {
			mui.openWindow({
				//url: 'https://www.baidu.com',
				url: 'http://www.angelyang.net/' + url,
				show:{
				  aniShow:'none',//页面显示动画，默认为”slide-in-right“；
				},
			});
		}
		
		/**
		 * 打开新窗口
		 * @param {String} id	加载的页面地址，也用作窗口标识
		 * @param {String} t    页面的标题
		 * @param {String} d	文档页面文件名称（doc目录下），不传入则使用页面的标题
		 */
		function clicked(id, t, d){
// 			mui.showLoading("正在加载..","div");
			mui.openWindow({
				url: 'http://www.angelyang.net/' + id,
				show:{
				  aniShow:'none',//页面显示动画，默认为”slide-in-right“；
				},
			});
		}
		// 跳转排行榜
		function showRank() {
			mui.openWindow({
				url: id,
				show:{
				  aniShow:'none',//页面显示动画，默认为”slide-in-right“；
				},
			});
		}
		
		// 展示产品
		function showProduct() {
			$("#maskView").animate(
			　　{opacity:'toggle'},
			　　"slow",
			　　null,
			　　function(){
			　　　　$("#maskView").show();
			　　}
			);
			$("#provBtn_opi").css("visibility","hidden");
			$("#nextBtn_opi").css("visibility","visible");
		}
		// 隐藏产品
		function hideProduct() {
			$("#maskView").animate(
			　　{opacity:'toggle'},
			　　"slow",
			　　null,
			　　function(){
					$("#maskView").hide();
					showAlert = 1;
					setMaskState('opi', showAlert);
			　　}
			);
		}
		
		// 展示规则
		function showRule () {
			$("#ruleMask").animate(
			　　{opacity:'toggle'},
			　　"slow",
			　　null,
			　　function(){
					$("#ruleMask").show();
			　　}
			);
			$("#provBtn_rule").css("visibility","hidden");
			$("#nextBtn_rule").css("visibility","visible");
		}
		
		// 隐藏规则
		function hideRule() {
			$("#ruleMask").animate(
			　　{opacity:'toggle'},
			　　"slow",
			　　null,
			　　function(){
					$("#ruleMask").hide();
					rule = 1;
					setMaskState('rule', rule)
			　　}
			);
		}
		
		function scrollToProv(type) {
			if (type == 'opi') {// 产品
				if (showAlert > 1) {
					showAlert--;
					if (showAlert == 1) {
						$("#provBtn_opi").css("visibility","hidden");
					}
				}
				if(showAlert < 4) {
					$("#nextBtn_opi").css("visibility","visible");
				}
				setMaskState('opi', showAlert);
			}else {// 规则
				if (rule > 1) {
					rule--;
					if (rule == 1) {
						$("#provBtn_rule").css("visibility","hidden");
					}
				}
				if(rule < 3) {
					$("#nextBtn_rule").css("visibility","visible");
				}
				setMaskState('rule', rule);
			}
		}
		function scrollToNext(type) {
			if (type == 'opi') {// 产品
				if (showAlert < 4) {
					showAlert++;
					if (showAlert == 4) {
						$("#nextBtn_opi").css("visibility","hidden");
					}
				}
				if(showAlert > 1) {
					$("#provBtn_opi").css("visibility","visible");
				}
				setMaskState('opi', showAlert);
			}else {// 规则
				if (rule < 3) {
					rule++;
					if (rule == 3) {
						$("#nextBtn_rule").css("visibility","hidden");
					}
				}
				if(rule > 1) {
					$("#provBtn_rule").css("visibility","visible");
				}
				setMaskState('rule', rule);
			}
		}
		
		// 展示分享方法
		function showShare() {
			$("#shareMask").animate(
			　　{opacity:'toggle'},
			　　"slow",
			　　null,
			　　function(){
			　　　　$("#shareMask").show();
			　　}
			);
		}
		// 隐藏分享方法
		function hideShare() {
			$("#shareMask").animate(
			　　{opacity:'toggle'},
			　　"slow",
			　　null,
			　　function(){
			　　　　$("#shareMask").hide();
			　　}
			);
		}
		
		// 设置mask图片 type：'rule'/'opi'
		function setMaskState(type, num) {
			var src = "";
			var key = "";
			if(type == 'opi') {// opi为产品
				key = "#opiImg"
				src = "assets/opi_" + num + ".png";
			}else {// 规则
				key = "#ruleImg"
				src = "assets/rule_" + num + ".png";
				console.log(src)
			}
			$(key).animate(
			　　{opacity:'toggle'},
			　　"fast",
			　　null,
			　　function(){
			　　　　$(key).attr("src",src);
			　　　　$(key).animate({opacity:'toggle'},"fast");
			　　}
			);
		}
    </script>
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
	body {
           /* background:green; */
           /* padding-top: constant(safe-area-inset-top); */
           /*padding-left: constant(safe-area-inset-left);*/            
           /*padding-right: constant(safe-area-inset-right);*/            
           /*padding-bottom: constant(safe-area-inset-bottom);*/        
       }
	
	.baseView {
		position: absolute;
		width: 100%;
		height: 100%;
	}
	.bgImg {
		width: 100%;
		height: 100%;
	}
	.columnView {
		position: absolute;
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.titleImage {
		/* margin-top: 40px; */
	}
	.subTitleImage {
		margin-top: 0px;
	}
	
	.ruleImage {
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	.maskView {
		position: absolute;
		width: 100%;
		height: 100%;
		z-index: 999;
		background-color: rgba(0,0,0,0.8);
		
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;/*水平居中*/
	}
	
	.targetRanking {
		padding: 2px 20px 2px 20px;
		border-radius: 30px;
		vertical-align: middle;
		text-align: center;
		color: #FFFFFF;
		font-size: 14px;
		font-weight: 700;
		background-color: rgba(203,103,254,0.7);
	}
	.helpView {
		padding: 5px 5px 5px 5px;
		border-radius: 10px;
		background-color: rgba(255,255,255,0.8);
		
		width: 80%;
		/* height: 200px; */
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;/*水平居中*/
	}
	.helpImg {
		width: 100%;
	}
	.helpLabel {
		vertical-align: middle;
		text-align: center;
		color: #8403FD;
		font-size: 14px;
		font-weight: 700;
	}
	.timeLabel {
		width: 90%;
		line-height: 20px;
		word-wrap:break-word;
		font-size: 12px;
		text-align: center;
		vertical-align: middle;
		color: #FFFFFF;
	}
	
	.maskBtnView {
		width: 80%;
		
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-around;
	}
	
	/* 设置了浏览器高度不大于1000px时 图片显示的宽度 */ 
	@media screen and (max-height: 1000px) { 
		.titleImage {
			width: 100%;
		} 
		.subTitleImage {
			width: 100%;
		}
		.btnImage {
			margin-top: 20px;
		}
		.ruleImage {
			
		}
	}
	
	/* 设置了浏览器高度不大于800px时 图片显示的宽度 */ 
	@media screen and (max-height: 800px) { 
		.titleImage {
			width: 100%;
		} 
		.subTitleImage {
			width: 100%;
		}
		.btnImage {
			margin-top: 20px;
		}
		.ruleImage {
			
		}
		.shareSubView {
			width: 80%;
		}
	}
	
	/* 设置了浏览器高度不大于800px时 图片显示的宽度 */ 
	@media screen and (max-height: 700px) { 
		.titleImage {
			width: 100%;
		} 
		.subTitleImage {
			width: 100%;
		}
		.btnImage {
			margin-top: 20px;
		}
		.ruleImage {
			
		}
		.shareSubView {
			width: 80%;
		}
	}
	
	/* 设置了浏览器高度不大于800px时 图片显示的宽度 */ 
	@media screen and (max-height: 650px) { 
		.titleImage {
			width: 90%;
		} 
		.subTitleImage {
			width: 80%;
		}
		.btnImage {
			margin-top: 20px;
		}
		.ruleImage {
			
		}
		.shareSubView {
			width: 80%;
		}
	}
	
	/* 设置了浏览器高度不大于900px时 图片显示的宽度 */ 
	@media screen and (max-height: 630px) { 
		.titleImage {
			width: 80%;
		} 
		.subTitleImage {
			width: 70%;
		}
		.ruleImage {
			
		}
		.shareSubView {
			width: 80%;
		}
	}
	
</style>
<body>
	<form id="form1" runat="server">
		<div class="baseView">
			<div id="maskView" class="maskView">
				<img class="closeBtn" src="assets/close.png"  onclick="hideProduct()"/>
				<img id="opiImg" class="opiImg" src="assets/opi_1.png"/>
				<!--<img id="downBtn_opi" class="downBtn" src="assets/btn_down.png" onclick="scrollToNext('opi')" />-->
				<div class="maskBtnView">
					<img id="provBtn_opi" class="btnImage" src="assets/btn_prov.png" onclick="scrollToProv('opi')"/>
					<img id="nextBtn_opi" class="btnImage" src="assets/btn_next.png" onclick="scrollToNext('opi')"/>
				</div>
			</div>
			
			<div id="ruleMask" class="maskView">
				<img class="closeBtn" src="assets/close.png"  onclick="hideRule()"/>
				<img id="ruleImg" class="noticeImg" src="assets/rule_1.png"/>
				<!--<img id="downBtn_rule" class="downBtn" src="assets/btn_down.png" onclick="scrollToNext('rule')" />-->
				<div class="maskBtnView">
					<img id="provBtn_rule" class="btnImage" src="assets/btn_prov.png" onclick="scrollToProv('rule')"/>
					<img id="nextBtn_rule" class="btnImage" src="assets/btn_next.png" onclick="scrollToNext('rule')"/>
				</div>
			</div>
			
			<div id="shareMask" class="shareMask" onclick="hideShare()">
				<div class="shareMaskView">
					<img class="shareSubView" src="assets/helpBg.png" >
				</div>
			</div>
			
			<div class="columnView">
				<img class="titleImage" src="assets/logo.png"/>
				<label id="help1" class="targetRanking"></label>
				<img class="subTitleImage" src="assets/chick.png" onclick="showProduct()"/>
				<div id="help2" class="helpView">
					<label id="helpLabel" class="helpLabel"></label>
					<img class="helpImg" src="assets/helpChicks.png"/>
				</div>
				<img id="play1" class="btnImage" src="assets/btn_play.png" onclick="playGame()"/>
				<div id="play2" class="rowBtnView">
					<img class="btnImage" src="assets/btn_help.png" onclick="showShare()"/>
					<img class="btnImage" src="assets/btn_point.png" onclick="jumpPage('YJCode.html')"/>
				</div>
				<div id="help3" class="rowBtnView">
					<img id="play1" class="btnImage" src="assets/btn_wtzl.png" onclick="helpClick()"/>
					<img class="btnImage" src="assets/btn_wyyw.png" onclick="clicked('rules.aspx','大胃萌宝抢奶喝')"/>
				</div>
				<label id="timeLabel" class="timeLabel"></label>
			</div>
			<img class="bgImg" src="assets/bg.jpg" />
			<img class="ruleImage" src="assets/gz.png" onclick="showRule()"/>
			
			<div style="display: none;">
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
                <asp:Button ID="btnGame" runat="server" Text="开始游戏" OnClick="btnGame_Click" />
				<br />
				<asp:Label ID="lbIsT" runat="server" Text="Label"></asp:Label>
                <br />
			</div>
		</div>
	</form>
</body>
</html>