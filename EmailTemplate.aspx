<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmailTemplate.aspx.cs" Inherits="KedSys35.EmailTemplate" 
Title="Kadence | Email Template" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
    <script type="text/javascript" src="assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
    <script type="text/javascript" src="assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <form id="formexrate" name="formexrate" class="form" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Masters
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="dashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="EmailTemplate.aspx">Email Template</a></li>
                <li id="brdliPageID">
                    <i class="icon-angle-right"></i>
                    <a id="brdPageID" href="#" runat="server"></a>
                </li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
        <asp:HiddenField ID="hidprot" runat="server" />
        <asp:HiddenField ID="hidtoaster" runat="server" />
    </div>
        
                <div id="portlet-control-grid" class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Email Template</div>
                    </div>
                    
                    <div id="portlet-detail-grid" class="portlet-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Template Name</label>
                                <div class="input-groupd">
                                <asp:DropDownList ID="ddTemplateName" class="form-control select2me" AutoPostBack="true"
                                     runat="server" OnSelectedIndexChanged="ddTemplateName_Changed"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Subject<span class="required">*</span></label>
                                <div class="input-groupd">
                                <asp:TextBox ID="txtTempaleSubject" CssClass="form-control" runat="server" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-11">
                            <div class="input-groupd">
                            <asp:TextBox id="TxtTempaleContent" runat="server" Rows="20" TextMode="MultiLine" CssClass="wysihtml5 form-control zcontent"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    
                   <%-- <div class="row">
                        <div class="col-md-11">--%>
                            <br />
                            <div class="alert alert-success">
                                <div class="row">
                                    <div class="col-md-11">
                                        <asp:Label id="lblTelmpateFields" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <br />
                                <strong>Note:Predefined fields shoud be enclosed with <></strong> 
                             </div>                        <%-- </div>                     </div>--%>

                    
                    <div class="form-actions right">
                        <asp:Button id="btn_submit" class="btn green" text="Submit" type="submit" runat="server" 
                            OnClientClick="return checkvalid();" onclick="btn_submit_Click" ></asp:Button> 
                    </div>
                    
                </div>
                </div>
                
    
    <script>
        function showtoastrr() {
            var data = $("#<%= hidtoaster.ClientID %>").val()
            var arr = data.split('|');
            if (arr.length >= 2) {
                var typ = arr[0];
                var msg = arr[1];
                toastr.options = {
                    closeButton: true,
                    timeOut: "6000",
                    positionClass: "toast-bottom-full-width",
                    onclick: null
                };
                var $toast = toastr[typ](msg, "Notification");
            }
            $("#<%= hidtoaster.ClientID %>").val("");
        }

        function checkvalid() {
            var resValid;
            resValid = true;
            var inputs = $('.zcontent');
            if ($(inputs).val().trim().length == 0 || $(inputs).val() == "") {
                resValid = false;
                $("#<%= hidtoaster.ClientID %>").val("warning|Content is required");
                showtoastrr();
            }
            return resValid;

        }

        jQuery(document).ready(function() {
            showtoastrr();

            if (jQuery().wysihtml5) {
                if ($('.wysihtml5').size() > 0) {
                    $('.wysihtml5').wysihtml5({
                        "stylesheets": ["assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
                    });
                }
            }
        });
        
        jQuery(document).ready(function() {
           $('form').validate({
               errorElement: 'span', //default input error message container
               errorClass: 'help-block', // default input error message class
               rules: {
                   <%= txtTempaleSubject.UniqueID %>: "required",
                   <%= TxtTempaleContent.UniqueID %>: "required"
               },

               messages: {
                   <%= txtTempaleSubject.UniqueID %>: "Subject is required.",
                   <%= TxtTempaleContent.UniqueID %>: "Content is required."
               },

               invalidHandler: function(event, validator) { //display error alert on form submit
                   //$('.alert-error', $('.form')).show();
                   toastr.options = {
                    closeButton: true,
                    timeOut: "6000",
                    positionClass: "toast-bottom-full-width",
                    onclick: null
                };
                var $toast = toastr["warning"]("Please correct the errors", "Validation Failed");
               },
               
                highlight: function (element) { // hightlight error inputs
	                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
	            },
	            
	            
	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },
               
               errorPlacement: function (error, element) {
                    error.insertAfter(element.closest('.input-groupd'));
	            },

               submitHandler: function(form) {
                   form.submit();
               }
           });
       });
    </script>
   </form>
</asp:Content>
