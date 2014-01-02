<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KedSys35.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>Login</title>
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
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<img src="assets/img/logo-big.png" alt="" /> 
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
	
		<!-- BEGIN LOGIN FORM -->
		<form id="loginform" name="form" runat="server">
		<div class="login-form">
			<h3 class="form-title">Login to your account</h3>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Username</label>
				<div class="input-icon">
					<i class="icon-user"></i>
<%--					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username"/>--%>
					<asp:TextBox id="txtusername" class="form-control placeholder-no-fix" type="text" 
                        autocomplete="off" placeholder="Username" name="username" 
                        runat="server" EnableViewState="False" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<div class="input-icon">
					<i class="icon-lock"></i>
					<asp:TextBox id="txtpassword" class="form-control placeholder-no-fix" TextMode="Password" autocomplete="off" placeholder="Password" 
					    EnableViewState="False" runat="server"></asp:TextBox>
					<%--<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password"/>--%>
				</div>
			</div>
			<div id="divalert" class="alert alert-danger" runat="server">
			    <strong><asp:Label id=lblalert class="has-error" runat="server"></asp:Label></strong>
			</div>
			<div class="form-actions">
				<label class="checkbox">
				<asp:CheckBox id="chkRemember" runat="server"/>
				<%--<input type="checkbox" name="remember" value="1"/>--%> Remember me
				</label>
				<%--<button type="submit" class="btn green pull-right">
				Login <i class="m-icon-swapright m-icon-white"></i>
				</button>--%>
				<asp:Linkbutton id="btn_submit" name="btn_submit" type="submit" class="btn green pull-right" runat ="server" 
                                
                    Text = "Login&nbsp;<i class='m-icon-swapright m-icon-white'></i>" 
                    onclick="btn_submit_Click">
                           </asp:Linkbutton>            
			</div>
			<div class="forget-password">
				<h4>Forgot your password ?</h4>
				<p>
					no worries, click <a href="javascript:;"  id="forget-password">here</a>
					to reset your password.
				</p>
			</div>
			
		</div>
		<!-- END LOGIN FORM -->        
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<div class="forget-form">
			<h3 >Forget Password ?</h3>
			<p>Enter your e-mail address below to reset your password.</p>
			<div class="form-group">
			    <div class="input-icon">
					<i class="icon-envelope"></i>
					<asp:TextBox id="usremail" class="form-control placeholder-no-fix" type="text" 
                        autocomplete="off" placeholder="Email" name="email" 
                        runat="server" EnableViewState="False" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
				<i class="m-icon-swapleft"></i> Back
				</button>
				<asp:Linkbutton id="btnReset" name="btnReset" class="btn green pull-right" runat ="server" 
                    Text = "submit&nbsp;<i class='m-icon-swapright m-icon-white'></i>" 
                    onclick="btn_reset_Click">
                           </asp:Linkbutton>
			</div>
		</div>
		</form>
		<!-- END FORGOT PASSWORD FORM -->
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">
		Kadence International
	</div>
	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->   
	<!--[if lt IE 9]>
	<script src="assets/plugins/respond.min.js"></script>
	<script src="assets/plugins/excanvas.min.js"></script> 
	<![endif]-->   
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
	            return $('form').valid();
	        })
	        
        $("#<%= btnReset.ClientID %>").click(function() {
            return $('form').valid();
        })
        
        $('#loginform input').keypress(function (e) {
            if (e.which == 13) {
                if ($('#loginform').validate().form() && jQuery('.login-form').is(':visible')) {
                    document.getElementById('<%= btn_submit.ClientID %>').click();
                }
                return false;
            }
        });
	    });
	    
	    jQuery('#forget-password').click(function () {
            jQuery('.login-form').hide();
            jQuery('.forget-form').show();
        });
        
        jQuery('#back-btn').click(function () {
            jQuery('.login-form').show();
            jQuery('.forget-form').hide();
        });
	    
	    jQuery(document).ready(function() {
           $('#loginform').validate({
               errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	                <%= txtusername.UniqueID %>: {
	                    required: true
	                },
	                <%= txtpassword.UniqueID %>: {
	                    required: true
	                },
	                <%= usremail.UniqueID %>: {
	                    required: true,
	                    email:true
	                },
	                remember: {
	                    required: false
	                }
	            },

	            messages: {
	                <%= txtusername.UniqueID %>: {
	                    required: "Username is required."
	                },
	                <%= txtpassword.UniqueID %>: {
	                    required: "Password is required."
	                },
	                <%= usremail.UniqueID %>: {
	                    required: "Email is required."
	                },
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-error', $('.login-form')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                form.submit();
	            }
           });
       });
    </script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>