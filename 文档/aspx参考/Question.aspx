<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="WebRoot.Question" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta name="apple-touch-fullscreen" content="YES" />
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="pragram" content="no-cache" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1" />
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
<head>
    <title>探索F1星世界</title>
    <link href="html/css/data.css?v=142" rel="stylesheet">
</head>
<body style="-webkit-user-select: none;">
    <form runat="server">
    <div  id="result_bg">
 
        
        <!--<div class="button">

            <img id="consume" src="images/tp1/bt.png" />
        </div>-->
        <div id="result1"></div>
        <div id="result2"></div>
        <div id="result3"></div>
         <div id="yc" style="display:none">
         <asp:Button ID="btnAnswer1" runat="server"  OnClick="btnAnswer1_Click"  />
        <asp:Button ID="btnAnswer2" runat="server"  OnClick="btnAnswer2_Click" />
        <asp:Button ID="btnAnswer3" runat="server"  OnClick="btnAnswer3_Click" />
             </div>
    <script src="html/js/jquery.js" type="text/javascript"></script>
    <script src="html/js/consume.js?v=84"></script>
        </form>
</body> 
</html>
<script>
    $("body").ready(function () {
        var result = GetQueryString("qid");
       
        if (result == "1")
        {
           // alert(result);
            $("#result_bg").addClass("parentq1");
        }
        if (result == "2") {
            // alert(result);
            $("#result_bg").addClass("parentq2");
        }
        if (result == "3") {
            // alert(result);
            $("#result_bg").addClass("parentq3");
        }
        $("#result1").click(function () {
         
                document.getElementById("<%=btnAnswer1.ClientID %>").click();
            
           
        })
        $("#result2").click(function () {
            document.getElementById("<%=btnAnswer2.ClientID %>").click();
          
        })
        $("#result3").click(function () {
            document.getElementById("<%=btnAnswer3.ClientID %>").click();
          
        })
    });
  function GetQueryString(name) {                                         ///获取URL参数
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        // alert(r);
        if (r != null) return decodeURI(r[2]); null;
    }
</script>