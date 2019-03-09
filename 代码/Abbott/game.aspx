<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="game.aspx.cs" Inherits="Abbott.game" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
</html>
