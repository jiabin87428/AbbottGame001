<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rules.aspx.cs" Inherits="Abbott.rules" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>云集有你 雅培添力</title>
    <script src="js/mui.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
    <link href="css/mui.css" rel="stylesheet"/>
	<link href="css/common.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8">
		mui.init();
		
		var showAlert = 1;	//  显示产品信息-1 2 3 4
		var rule = 1;	// 	显示游戏规则-1 2 3
		
		$("body").ready(function () {
			$("#provBtn_opi").css("visibility","hidden");
			$("#provBtn_rule").css("visibility","hidden");
			
			var tid = getUrlParam("tid");
			if(tid != null && tid != ""){// 助力页
				$("#joinBtn").hide();
				$("#helpBtn").show();
			}else {// 非助力页
				$("#joinBtn").show();
				$("#helpBtn").hide();
			}
			
			
			$("#maskView").hide();
			$("#ruleMask").hide();
			$("#joinBtn").click(function () {
				document.getElementById("<%=btnAgree.ClientID %>").click();
		    })
			$("#helpBtn").click(function () {
				document.getElementById("<%=btnAgree.ClientID %>").click();
			})
		})
		
		/**
		 * 打开新窗口
		 * @param {String} id	加载的页面地址，也用作窗口标识
		 * @param {String} t    页面的标题
		 * @param {String} d	文档页面文件名称（doc目录下），不传入则使用页面的标题
		 */
		function clicked(id, t, d){
// 			mui.showLoading("正在加载..","div");
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
           /* background:green;
           padding-top: constant(safe-area-inset-top); */
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
	
	.maskBtnView {
		width: 80%;
		
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-around;
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
	}
	
	/* 设置了浏览器高度不大于800px时 图片显示的宽度 */ 
	@media screen and (max-height: 700px) { 
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
	}
	
	/* 设置了浏览器高度不大于900px时 图片显示的宽度 */ 
	@media screen and (max-height: 600px) { 
		.titleImage {
			width: 85%;
		} 
		.subTitleImage {
			width: 75%;
		}
		.ruleImage {
			
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
			
			<div class="columnView">
				<img class="titleImage" src="assets/logo.png"/>
				<img class="subTitleImage" src="assets/chick.png" onclick="showProduct()"/>
				<!--<img class="btnImage" src="assets/btn_join.png" onclick="clicked('menu.html?targetId=andy','大胃萌宝抢奶喝')"></img>
				<img class="btnImage" src="assets/btn_join.png" onclick="clicked('menu.html','大胃萌宝抢奶喝')"></img>-->
				<img id="joinBtn" class="btnImage" src="assets/btn_join.png"></img>
				<img id="helpBtn" class="btnImage" src="assets/btn_wlzl.png"></img>
			</div>
			<img class="bgImg" src="assets/bg.jpg" />
			
			<img class="ruleImage" src="assets/gz.png" onclick="showRule()"/>
		</div>
		<div style="display:none">
			<asp:Button ID="btnAgree" runat="server" Text="同意游戏" OnClick="btnAgree_Click" />
			<asp:Button ID="btnTest" runat="server" Text="测试添加用户" OnClick="btnTest_Click" />
		</div>
	</form>
</body>
</html>
