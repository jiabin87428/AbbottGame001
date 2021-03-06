<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rank.aspx.cs" Inherits="Abbott.rank" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>云集有你 雅培添力</title>
		<script src="js/mui.js"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<link href="css/mui.css" rel="stylesheet"/>
		<link href="css/common.css" rel="stylesheet" />
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
		.point-title {
/* 			position: absolute;
			top: 0; */
			width: 100%;
		}
		.point-item-view {
			position: relative;
			width: 80%;
		}
		.point-item-bg {
			width: 100%;
		}
		.point-item-label {
			position: absolute;
			width: 50%;
			height: 30px;
			top: 50%;
			margin-top: -15px;
			left: 43.5%;
			padding: 5px 5px 5px 5px;
			border-radius: 30px;
			vertical-align: middle;
			text-align: center;
			color: #FFFA01;
			font-size: 18px;
			font-style: initial;
			font-weight: 700;
			background-color: rgba(203,103,254,0.5);
		}
		
		/* 设置了浏览器高度不大于1000px时 图片显示的宽度 */ 
		@media screen and (max-height: 1000px) { 
			.point-item-view {
				width: 100%;
			}
			.point-item-label {
				font-size: 16px;
			}
		}
		
		/* 设置了浏览器高度不大于800px时 图片显示的宽度 */ 
		@media screen and (max-height: 800px) { 
			.point-item-view {
				width: 90%;
			}
			.point-item-label {
				font-size: 16px;
			}
		}
		
		/* 设置了浏览器高度不大于800px时 图片显示的宽度 */ 
		@media screen and (max-height: 700px) { 
			.point-item-view {
				width: 80%;
			}
			.point-item-label {
				font-size: 14px;
			}
		}
		
		/* 设置了浏览器高度不大于800px时 图片显示的宽度 */ 
		@media screen and (max-height: 650px) { 
			.point-item-view {
				width: 75%;
			}
			.point-item-label {
				font-size: 14px;
			}
		}
		
		/* 设置了浏览器高度不大于630px时 图片显示的宽度 */ 
		@media screen and (max-height: 630px) { 
			.point-item-view {
				width: 70%;
			}
			.point-item-label {
				font-size: 10px;
				height: 20px;
				padding: 0px 0px 0px 0px;
			}
			.point-title {
				margin-top: -30px;
			}
		}
	</style>
	<body>
		<form id="form1" runat="server">
			<!--此图片必须放在body标签的最前面，且高度必须为屏幕宽度的80%  -->
			<img src="assets/chick.jpeg" style="display: none;" style="position:absolute; top:0; left:0;  width: 80%; z-index:-1;opacity: 0; ">
			<div class="baseViewColumn">
				<img class="point-title" src="assets/myPoint_title.png"/>
				<div class="point-item-view" onclick="pageJump('totalPoint.html?pageType=1','大胃萌宝抢奶喝')">
					<img class="point-item-bg" src="assets/myPoint_jz.png"/>
					<label id="rank1" class="point-item-label"></label>
				</div>
				<div class="point-item-view" onclick="pageJump('totalPoint.html?pageType=2','大胃萌宝抢奶喝')">
					<img class="point-item-bg" src="assets/myPoint_eml.png"/>
					<label id="rank2" class="point-item-label"></label>
				</div>
				<div class="point-item-view" onclick="pageJump('totalPoint.html?pageType=3','大胃萌宝抢奶喝')">
					<img class="point-item-bg" src="assets/myPoint_xas.png"/>
					<label id="rank3" class="point-item-label"></label>
				</div>
				<img class="btnImage" src="assets/btn_wyyw.png" onClick="pageJump('http://www.angelyang.net/rules.aspx','大胃萌宝抢奶喝')"></img>
			</div>
			<!--<div style="display: none;">
				<asp:Label ID="lbUserID" runat="server" Text="Label"></asp:Label>
				<br />
			</div>-->
		</form>
	</body>
	<script type="text/javascript">
		mui.init();
		
		var rank1 = ''; // 我的小安素排名
		var rank2 = ''; // 我的菁挚排名
		var rank3 = '';	// 我的恩美力排名
		
		var Score1JSON = '';	// 小安素总排名
		var Score2JSON = '';	// 菁挚总排名
		var Score3JSON = '';	// 恩美力总排名
		
		var username = ''	// 我的用户名
		var headurl = ''	// 我的头像url
		var score1 = ''		// 我的小安素分数
		var score2 = ''		// 我的菁挚分数
		var score3 = ''		// 我的恩美力分数
		
		var userId = "";			// 当前用户的ID
		
		$("body").ready(function () {
			//userId = document.getElementById("lbUserID").innerHTML;
			// 先清楚缓存
			localStorage.clear();
			
			rank1 = '<%=rank1 %>';
			rank2 = '<%=rank2 %>';
			rank3 = '<%=rank3 %>';
			
			//alert('<%=rank1 %>');
			
			$("#rank1").html('排名 No.' + rank2);
			$("#rank2").html('排名 No.' + rank3);
			$("#rank3").html('排名 No.' + rank1);
			
			Score1JSON = '<%=Score1JSON %>';
			Score2JSON = '<%=Score2JSON %>';
			Score3JSON = '<%=Score3JSON %>';
			
			username = '<%=username %>';
			headurl = '<%=headurl %>';
			
			score1 = '<%=score1 %>';
			score2 = '<%=score2 %>';
			score3 = '<%=score3 %>';
			
			
			// 再添加缓存
			localStorage.setItem('rank1',rank1);
			localStorage.setItem('rank2',rank2);
			localStorage.setItem('rank3',rank3);
			localStorage.setItem('Score1JSON', Score1JSON);
			localStorage.setItem('Score2JSON', Score2JSON);
			localStorage.setItem('Score3JSON', Score3JSON);
			localStorage.setItem('username', username);
			localStorage.setItem('headurl', headurl);
			localStorage.setItem('score1', score1);
			localStorage.setItem('score2', score2);
			localStorage.setItem('score3', score3);
			
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
			        link: 'http://www.angelyang.net/EnterRank.aspx', // 分享链接
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
			        link: 'http://www.angelyang.net/EnterRank.aspx', // 分享链接
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
		
		function backClick() {
			mui.back();
		}
		
		function pageJump(id, t, d){
			mui.openWindow({
				url: id,
				show:{
				  aniShow:'none',//页面显示动画，默认为”slide-in-right“；
				},
			});
		}
	</script>
</html>
