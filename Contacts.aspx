<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="KedSys35.WebForm4" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form id="formcontact" name="formcontact" class="form" runat="server">
    <!-- BEGIN PAGE -->
    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    </button>
                    <h4 class="modal-title">
                        Modal title</h4>
                </div>
                <div class="modal-body">
                    Widget settings form goes here
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn blue">
                        Save changes</button>
                    <button type="button" class="btn default" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <!-- BEGIN PAGE HEADER-->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Masters
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="dashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <%--<li><a href="#">Masters</a> <i class="icon-angle-right"></i></li>--%>
                <li><a href="#">Contacts</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
        <asp:HiddenField ID="hidprot" runat="server" />
        <asp:HiddenField ID="hidtoaster" runat="server" />
    </div>
    <!-- END PAGE HEADER-->
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->
            <div id="portlet-control" class="portlet box green" style="display:none">
                <div class="portlet-title">
                    <div class="caption"> Contacts</div>
                </div>
                <div id="portlet-detail" class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div action="#" class="horizontal-form">
                    <div class="form-body">
                    <asp:HiddenField ID="hidUID" runat="server"  enableviewstate="true" />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Contact ID<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtContactID"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">First Name<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtContactFName" class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Last Name<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtContactLName" class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Title</label>
                                    <asp:TextBox id = "txtTitle" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Department</label>
                                    <asp:TextBox id = "txtDepartment" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Mobile No.</label>
                                    <asp:TextBox id = "txtMobileNo" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Work Phone No.</label>
                                    <asp:TextBox id = "txtWorkPhoneNo" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">EMail</label>
                                    <div class="input-groupd"> <div class="input-group">
                                        <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                        <asp:TextBox id = "txtEmailAddress" name="txtEmailAddress" class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div> </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Birthday</label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtBirthday" name="txtBirthday" class="form-control form-control-inline date-picker" runat="server"></asp:TextBox>
                                    </div>
                   <%--                 <div class="input-group date form_datetime">
                                        <asp:TextBox id = "txtBirthday" name="txtBirthday" readonly class="form-control" type="text" runat="server"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button class="btn default date-set" type="button">
                                                <i class="icon-calendar"></i>
                                            </button>
                                        </span>
                                    </div>--%>
                                    <!-- /input-group -->
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">AccountRefID</label>
                                    <asp:TextBox id = "txtAccountRefID" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Notes</label>
                                    <asp:TextBox id = "txtNotes" class="form-control" TextMode="multiline" rows ="3" type="textarea" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        </div>
                        <div class="form-actions right">
                            <asp:Button id="btn_cancel" class="cancel btn default" text="Cancel" type="cancel" runat="server" onclick="btn_cancel_Click"></asp:Button>
                            <asp:Button id="btn_submit" class="btn green" text="Submit" type="submit" runat="server" onclick="btn_submit_Click"></asp:Button>
                        </div>
                    </div>
                    </div>                    
                    </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
    </div>
    <!-- END PAGE CONTENT -->
    <!-- END PAGE -->
    
                   
                    <!-- END FORM-->
                <div id="portlet-control-grid" class="portlet box green" style="display:none">
               <div class="portlet-title">
                    <div class="caption"> Contacts</div>
                    <div class="pull-right">
                    <asp:LinkButton ID="btnRemoveFilter" class="btn btn-xs red" Text= "Remove Filter <i class='icon-filter'></i>" runat="server"
                    OnClick = "btnRemoveFilter_Click">
                    </asp:LinkButton>
                    <a href="#" id="btnadd" class="btn btn-xs default">Add <i class="icon-plus"></i></a>
                    </div>
                    </div>
                <div id="portlet-detail-grid" class="portlet-body">
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" 
                        AllowPaging="true" OnPageIndexChanging = "OnPaging" PageSize = "10"
                        AllowSorting="true" OnSorting = "OnSorting" 
                        OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                        class="table table-striped table-bordered table-hover">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUID" runat="server" Text='<%# Eval("UID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblContactID" runat="server" Text="Contact ID"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtContactID" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="ContactID" CommandArgument="ContactID"></asp:linkbutton>
                                        <a href="#" id="fltContactID" data-filterex="ContactID"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ContactID" CssClass="" runat="server" Text='<%#Eval("ContactID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblContactFName" runat="server" Text="First Name"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtContactFName" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="ContactFName" CommandArgument="ContactFName"></asp:linkbutton>
                                        <a href="#" id="fltContactFName" data-filterex="ContactFName"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ContactFName" CssClass="" runat="server" Text='<%#Eval("ContactFName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblContactLName" runat="server" Text="Last Name"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtContactLName" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="ContactLName" CommandArgument="ContactLName"></asp:linkbutton>
                                        <a href="#" id="fltContactLName" data-filterex="ContactLName"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ContactLName" CssClass="" runat="server" Text='<%#Eval("ContactLName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtTitle" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Title" CommandArgument="Title"></asp:linkbutton>
                                        <a href="#" id="fltTitle" data-filterex="Title"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Title" CssClass="" runat="server" Text='<%#Eval("Title")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtDepartment" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Department" CommandArgument="Department"></asp:linkbutton>
                                        <a href="#" id="fltDepartment" data-filterex="Department"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Department" CssClass="" runat="server" Text='<%#Eval("Department")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblMobileNo" runat="server" Text="Mobile"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtMobileNo" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="MobileNo" CommandArgument="MobileNo"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="MobileNo" CssClass="" runat="server" Text='<%#Eval("MobileNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblWorkPhoneNo" runat="server" Text="Work Phone"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtWorkPhoneNo" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="WorkPhoneNo" CommandArgument="WorkPhoneNo"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="WorkPhoneNo" CssClass="" runat="server" Text='<%#Eval("WorkPhoneNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblEmailAddress" runat="server" Text="Email"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtEmailAddress" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="EmailAddress" CommandArgument="EmailAddress"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="EmailAddress" CssClass="" runat="server" Text='<%#Eval("EmailAddress")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblBirthday" runat="server" Text="Birthday"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtBirthday" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Birthday" CommandArgument="Birthday"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Birthday" CssClass="" runat="server" Text='<%#Eval("Birthday", "{0:dd/M/yyyy}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblAccountRefID" runat="server" Text="Account"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtAccountRefID" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="AccountRefID" CommandArgument="AccountRefID"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="AccountRefID" CssClass="" runat="server" Text='<%#Eval("AccountRefID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" >
                                <ItemTemplate>
                                    
                                    <asp:Linkbutton id="btn_select" name="btn_select" type="submit" class="btn red btn-xs" ToolTip="Edit" runat ="server" 
                                                    
                                        Text="<i class='icon-edit'></i>" onclick="btn_select_Click">
                                               </asp:Linkbutton> 
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>
                            <div class="form-actions-half">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div class="btn-group">
                                            <asp:LinkButton ID="pgprev" runat="server" ToolTip="Previous" CssClass="btn btn-default" Text="<" OnClick="OnPaging"></asp:LinkButton>
                                            <asp:LinkButton ID="pgfirst" data-high="1" runat="server" CssClass="btn btn-default" Text="1" OnClick="OnPaging"></asp:LinkButton>
                                            <asp:LinkButton ID="pgsecond" data-high="1" runat="server" CssClass="btn btn-default" Text="2" Visible="false" OnClick="OnPaging"></asp:LinkButton>
                                            <asp:LinkButton ID="pgthird" data-high="1" runat="server" CssClass="btn btn-default" Text="3" Visible="false" OnClick="OnPaging"></asp:LinkButton>
                                            <asp:LinkButton ID="pgfourth" data-high="1" runat="server" CssClass="btn btn-default" Text="4" Visible="false" OnClick="OnPaging"></asp:LinkButton>
                                            <asp:LinkButton ID="pgfifth" data-high="1" runat="server" CssClass="btn btn-default" Text="5" Visible="false" OnClick="OnPaging"></asp:LinkButton>
                                            <asp:LinkButton ID="pgnext" runat="server" ToolTip="Next" CssClass="btn btn-default" Text=">" OnClick="OnPaging"></asp:LinkButton>
                                        </div>
                                        
                                            <asp:Label ID="pagelabelinfo" CssClass="control-label" runat="server" />
                                            <asp:Label ID="Label1" CssClass="control-label pull-right lblmartop" Text="Pages per Page" runat="server" />
                                            <div class="col-md-2 pull-right">
                                                <asp:DropDownList ID="ddpagesize" class="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="PageSize_Changed">
                                                </asp:DropDownList>
                                            </div> 
                                        
                                    </div>
                                </div>
                            </div>
                        </PagerTemplate>
                    </asp:GridView>
                <div>
                    <label ID="lblgridnot" name="lblgridnot" class="label-danger" style="display:none">Details not available, Please remove filter, if applied</label> 
                    </div>
                    
                </div>
                </div>
                
  <div id="overlay_form" style="display: none" class="modal-content">
      <div class="modal-body">
          <asp:HiddenField ID="hidfilterex" runat="server" />
          <div id="txtDiv" class="row">
              <div class="col-md-9">
                  <asp:TextBox ID="txtFilter" class="form-control" runat="server"></asp:TextBox>
              </div>
              <div class="btn-group btn-group btn-group-solid ">
                  <asp:Button ID="btnFilterOk" class="btn green" runat="server" Text="Ok" OnClick="btnFilterOk_Click" />
                  <input id="btnFilterCancel" type="button" class="btn default dark-stripe" onclick="$('#overlay_form').hide();"
                      value="Cancel" />
              </div>
          </div>
      </div>
  </div>
    
   <script>

       jQuery(document).ready(function() {
           if ($("#<%= hidprot.ClientID %>").val() == "portlet-control-grid") {
               $("#portlet-control-grid").show();
               $("#portlet-control").hide();
           }
           else {
               $("#portlet-control").show();
               $("#portlet-control-grid").hide();
           }
           
           
           $('[data-high]').click(function() {
                $('[data-high]').removeClass('active');
           });
           
           var totalRows = $("#<%=GridView1.ClientID %> tr").length;
           if (totalRows=="0")
               $("#lblgridnot").show();
           else
               $("#lblgridnot").hide();
               
           if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    autoclose: true,
                    endDate: '-1d'
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
               
       });
       
       jQuery(document).ready(function() {
           jQuery('#btnadd').click(function() {
               $("#portlet-control").show();
               $("#portlet-control-grid").hide();
               $("#<%= hidprot.ClientID %>").val("portlet-control");
           });
       });

       jQuery(document).ready(function() {
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
       });
       
        $(document).ready(function() {
            $('[id^="flt"]').click(function() {
                var eWidth, eHeight, eTop, eLeft, ePos;
                ctrls = $(this);
                if (ctrls != undefined && ctrls.length > 0)
                    ctrl = ctrls[0];
                if (ctrl != undefined) {
                    eWidth = 550;
                    eHeight = 75;
                    eTop = getY(ctrl) + ctrl.offsetHeight + 10;
                    eLeft = getX(ctrl.offsetParent);
                    ePos = "absolute";
                    $("#overlay_form").css({ position: ePos, left: eLeft, top: eTop, width: eWidth, height: eHeight });
                    //$("#overlay_form").css({ position: ePos, left: eLeft, top: eTop });
                    $("#overlay_form").fadeIn(1000);
                    $("#<%= hidfilterex.ClientID %>").val(ctrls.data('filterex'));
                    $("#<%= txtFilter.ClientID %>").focus();
                }
            });
        });
       
       jQuery(document).ready(function() {
           $('form').validate({
               errorElement: 'span', //default input error message container
               errorClass: 'help-block', // default input error message class
               rules: {
                   <%= txtContactID.UniqueID %>: "required",
                   <%= txtContactFName.UniqueID %>: "required",
                   <%= txtContactLName.UniqueID %>: "required",
                   <%= txtEmailAddress.UniqueID %>: "email",
                   <%= txtBirthday.UniqueID %>: "date"
                   
               },

               messages: {
                   <%= txtContactID.UniqueID %>: "Contact ID is required.",
                   <%= txtContactFName.UniqueID %>: "First Name is required.",
                   <%= txtContactLName.UniqueID %>: "Last Name is required."
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
