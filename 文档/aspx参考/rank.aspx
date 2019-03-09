<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rank.aspx.cs" Inherits="WebRoot.rank" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
	<title>上海新天地 春·夏</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="full-screen" content="true"/>
    <meta name="screen-orientation" content="portrait"/>
    <meta name="x5-fullscreen" content="true"/>
    <meta name="360-fullscreen" content="true"/>
    
    <script  src="assets/javascript/jquery-2.1.1.min.js"></script>
    <script  src="assets/javascript/jquery.touchSwipe.min.js"></script>
    <script  src="assets/javascript/mainofrank.js"></script>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<img src="assets/images/karl-slogen.png" id = 'karl-slogen' class='left'>
	<img src="assets/images/step15-tip.png" class='step-right'>
	<img src='assets/images/tips-toshare.png' class='tips-confirm hide' id ='rank-tips'>
	
	<div class='bottom-bar'>
    		<img src="assets/images/dot.png" class='dot'>
    		</div>
    <form id="form1" runat="server">
    <div class='ranklist'>
    	<div id='btn-rank'></div>
        <asp:Button ID="btnMale" runat="server" OnClick="btnMale_Click" Text="男生排名" />
        <asp:Button ID="btnFemale" runat="server" OnClick="btnFemale_Click" Text="女生排名" />
        <br />

        <div class='tops'>
        	<table id='tb-ranklist'>
        <asp:ListView ID="lvRank" runat="server">
        
            <ItemTemplate>
				
				<tr>
					<td class='rank-num'><%# Container.DataItemIndex+1 %></td>
					<td class='rank-name'><%# Eval("name")%></td>
					<td class='vote-num'><%# Eval("votenum")%> 票</td>
				</tr>
                
        </ItemTemplate>
        
        </asp:ListView>
        		
        </table>
        
        
        
		
        </div>
        
    </div>
    </form>
    	<div id='myrank' class='hide'>
			我的排名:<asp:Label id="lbRank" runat="server"></asp:Label>
		</div>
		<a href="http://karl.cabenn.cn/wechatOath.aspx" id='btn-gogogo'>我也要玩</a>
    <script>
    	$(document).ready(function(){
    		if(<%=gender %> == 0){
    			$("#btnFemale").addClass("inv-color");
    		}else{
    			$("#btnMale").addClass("inv-color");
    		}
    		if($("#tb-ranklist").children().length < 1){
    			//$("#btnMale").click();
    		}
    		
    		if($("#lbRank").html() == ""){
    			$("#myrank").addClass('hide');
    			$("#rank-tips").addClass('hide');
    			$("#btn-gogogo").removeClass('hide');
    		}else{
    			$("#myrank").removeClass('hide');
    			$("#rank-tips").removeClass('hide');
    			$("#btn-gogogo").addClass('hide');
    		}
    	})
    	
    </script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script>
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
                title: '我在新天地和时尚教父KARL LAGERFELD合影啦!一起去看秀！', // 分享标题
                desc: '来新天地 一起玩吧', // 分享描述
                link: 'http://karl.cabenn.cn/rank.aspx', // 分享链接
                imgUrl: 'http://karl.cabenn.cn/assets/images/ico-share.jpg', // 分享图标
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
            	 title: '我在新天地和时尚教父KARL LAGERFELD合影啦!一起去看秀！', // 分享标题
                desc: '来新天地 一起玩吧', // 分享描述
                link: 'http://karl.cabenn.cn/rank.aspx', // 分享链接
                imgUrl: 'http://karl.cabenn.cn/assets/images/ico-share.jpg', // 分享图标
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
</script>
</body>
</html>
