<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="KedSys35.ChangePassword" Title="Kadence | Change Password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta charset="utf-8" />
	<title>Kadence | Change Password</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->          
	<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES --> 
	<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2_metro.css" />
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME STYLES --> 
	<link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="assets/css/pages/login.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
</head>
<body class="login">
	<div class="logo">
		<img src="assets/img/logo-big.png" alt="" /> 
	</div>
	<div class="content">
		<form id="Form1" class="login-form" runat="server">
			<h3 class="form-title">Change Password</h3>
			<div class="form-group">
				<label class="control-label">Old Password</label>
				<div class="input-icon">
					<i class="icon-lock"></i>
					<asp:TextBox id="txtpassword" class="form-control placeholder-no-fix" TextMode="Password" autocomplete="off" placeholder="Password" 
					    EnableViewState="False" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">New Password</label>
				<div class="input-icon">
					<i class="icon-lock"></i>
					<asp:TextBox id="txtnewpassword" class="form-control placeholder-no-fix" TextMode="Password" autocomplete="off" placeholder="Password" 
					    EnableViewState="False" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">Re-type Your Password</label>
				<div class="controls">
					<div class="input-icon">
						<i class="icon-ok"></i>
						<asp:TextBox id="txtrpassword" class="form-control placeholder-no-fix" TextMode="Password" autocomplete="off" placeholder="Password" 
					    EnableViewState="False" runat="server"></asp:TextBox>
					</div>
				</div>
			</div>
			<div id="divalert" class="alert alert-danger" runat="server">
			    <strong><asp:Label id=lblalert class="has-error" runat="server"></asp:Label></strong>
			    
			</div>
			<div class="form-actions">
			    <asp:Label id="lblrelogin" class="has-error" runat="server"></asp:Label>
				<asp:Linkbutton id="btn_submit" name="btn_submit" type="submit" class="btn green pull-right" runat ="server" 
                    Text = "Change Password&nbsp;<i class='m-icon-swapright m-icon-white'></i>" 
                    onclick="btn_submit_Click">

                           </asp:Linkbutton>            
			</div>
		</form>
	</div>
	<div class="copyright">
		Kadence International
	</div>
	<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>	
	<script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>     
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="assets/scripts/app.js" type="text/javascript"></script>
	<%--<script src="assets/scripts/login.js" type="text/javascript"></script> --%>
	<!-- END PAGE LEVEL SCRIPTS --> 
	<script>
	    jQuery(document).ready(function() {
	        App.init();
	        //Login.init();
	    });
	    jQuery(document).ready(function() {
	    $("#<%= btn_submit.ClientID %>").click(function() {
	            $('#divalert').hide();
	            return $('form').valid();
	        })
	    });
	    
	    jQuery(document).ready(function() {
           $('.login-form').validate({
               errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	                <%= txtpassword.UniqueID %>: {required: true},
	                <%= txtnewpassword.UniqueID %>: {
	                    required: true,
	                    minlength: 6,
	                    maxlength: 15},
	                <%= txtrpassword.UniqueID %>: {
	                    required: true,
	                    equalTo: "#txtnewpassword"}
	            },

	            messages: {
	                <%= txtpassword.UniqueID %>: {required: "Old password is required."},
	                <%= txtpassword.UniqueID %>: {required: "New passowrd is required."},
	                <%= txtrpassword.UniqueID %>: {required: "Re-type password is required.",
	                                               equalTo: "Passwords do not match."}
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-error', $('.login-form')).show();
	                $('#divalert').hide();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $('#divalert').hide();
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                $('#divalert').hide();
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                $('#divalert').hide();
	                form.submit();
	            }
           });
       });
    </script>
</body>
</html>
