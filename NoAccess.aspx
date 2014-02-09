<%@ Page Title="Kadence" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NoAccess.aspx.cs" Inherits="KedSys35.NoAccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <body class="login">
	    <%--<div class="logo">
		    <img src="assets/img/logo-big.png" alt="" /> 
	    </div>--%>
	    <div class="content">
		    <form id="Form1" class="login-form" runat="server">
			    <h3 class="form-title">You are not authorised to access this page.</h3>
		    </form>
	    </div>

	   <%-- <div class="copyright">
		    Kadence International
	    </div>--%>
 
    </body>
</asp:Content>
