<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="temp.aspx.cs" Inherits="KedSys35.temp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" TextMode="multiline" Width="100%" rows ="15" type="textarea" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="btnupdate_Click" />
    </div>
    </form>
</body>
</html>
