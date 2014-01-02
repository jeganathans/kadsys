<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Accounts.aspx.cs" Inherits="KedSys35.WebForm3" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="formaccount" name="formaccount" class="form" runat="server">
    <!-- BEGIN PAGE -->
    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="false">
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
                    <%--<div class="tools">
                        <a href="javascript:;" class="expand"></a><a href="javascript:;" class="reload">
                        </a>
                    </div>--%>
                <li><a href="#">Accounts</a></li>
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
                    <div class="caption"> Accounts</div>
                    <%-- <button id=btncan type="button" class="btn default">
                                Cancel</button>--%>
                    </div>
                
                <div id="portlet-detail" class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div action="#" class="horizontal-form">
                    <div class="form-body">
                    <asp:HiddenField ID="hidUID" runat="server"  enableviewstate="true" />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for"txtaccid"> Account ID<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtaccid"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Account Name<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtaccname" name="txtaccname" class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Account Type</label>
                                    <asp:DropDownList ID="ddacctype" name ="ddacctype" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Addrss Billing</label>
                                    <asp:TextBox id = "txtaccbill" name="txtaccbill" class="form-control" TextMode="multiline" rows ="3" type="textarea" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">City</label>
                                    <asp:TextBox id = "txtcity" name="txtcity" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Country</label>
                                    <asp:TextBox id = "txtcountry" name="txtcountry" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for"txtemail"> EMail</label>
                                    <div class="input-groupd"><div class="input-group">
                                        <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                        <asp:TextBox id = "txtemail" name="txtemail" class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div></div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Website</label>
                                    <asp:TextBox id = "txtwebsite" name="txtwebsite" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Tax No</label>
                                    <asp:TextBox id = "txttaxno" name="txttaxno" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Sector</label>
                                    <asp:DropDownList ID="ddsector" name ="ddsector" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Phone</label>
                                    <asp:TextBox id = "txtphone" name="txtphone" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Fax</label>
                                    <asp:TextBox id = "txtfax" name="txtfax" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Annual Revinue</label>
                                    <asp:TextBox id = "txtannrev" name="txtannrev" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">No of Employees</label>
                                    <asp:TextBox id = "txtnoemp" name="txtnoemp" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Notes</label>
                                    <asp:TextBox id = "txtnotes" name="txtnotes" class="form-control" TextMode="multiline" rows ="3" type="textarea" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Primary Contact</label>
                                    <asp:DropDownList ID="ddcontact" name ="ddcontact" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="form-actions right">
                            <%--<script>
        jQuery(document).ready(function() {
            jQuery('#btncan').click(function() {
                $(':input').each(function() {
                    var input = $(this);
                    var type = this.type;
                    var tag = this.tagName.toLowerCase();

                    if (type == 'text' || type == 'password' || tag == 'textarea')
                        this.value = input.attr('placeholder');

                    else if (type == 'checkbox' || type == 'radio')

                        this.checked = false;

                    // select elements need to have their 'selectedIndex' property set to -1

                    // (this works for both single and multiple select elements)

                    else if (tag == 'select')

                        this.selectedIndex = 0;

                });

            });
        });
    </script>--%>
                            <asp:Button id="btn_cancel" class="cancel btn default" text="Cancel" type="cancel" runat="server" onclick="btn_cancel_Click"></asp:Button>
                            <asp:Button id="btn_submit" class="btn green" text="Submit" type="submit" runat="server" onclick="btn_submit_Click"></asp:Button>
                        </div>
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
                    <div class="caption"> Accounts</div>
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
                                    <asp:Label ID="UID" CssClass="" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblAccountID" runat="server" Text="Account Id"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtaccid" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="AccountID" CommandArgument="AccountID"></asp:linkbutton>
                                        <a href="#" id="fltaccid" data-filterex="AccountID"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="AccountID" CssClass="" runat="server" Text='<%#Eval("AccountID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblAccountName" runat="server" Text="Account Name"></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtAccountName" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="AccountName" CommandArgument="AccountName"></asp:LinkButton>
                                        <a href="#" id="fltAccountName" data-filterex="AccountName"><i class="icon-filter"></i>
                                        </a>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="AccountName" CssClass="" runat="server" Text='<%#Eval("AccountName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblAccountType" runat="server" Text="Account Type"></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtAccountType" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="AccountType" CommandArgument="AccountType"></asp:LinkButton>
                                        <a href="#" id="fltAccountType" data-filterex="AccountType"><i class="icon-filter"></i>
                                        </a>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="AccountType" CssClass="" runat="server" Text='<%#Eval("AccountType")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtCity" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="City" CommandArgument="City"></asp:LinkButton>
                                        <a href="#" id="fltCity" data-filterex="City"><i class="icon-filter"></i>
                                        </a>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="City" CssClass="" runat="server" Text='<%#Eval("City")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtCountry" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="Country" CommandArgument="Country"></asp:LinkButton>
                                        <a href="#" id="fltCountry" data-filterex="Country"><i class="icon-filter"></i>
                                        </a>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Country" CssClass="" runat="server" Text='<%#Eval("Country")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblSector" runat="server" Text="Sector"></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtSector" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="Sector" CommandArgument="Sector"></asp:LinkButton>
                                        <a href="#" id="fltSector" data-filterex="Sector"><i class="icon-filter"></i></a>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Sector" CssClass="" runat="server" Text='<%#Eval("Sector")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblannual_rev" runat="server" Text="Annual Rev."></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtannual_rev" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="annual_rev" CommandArgument="annual_rev"></asp:LinkButton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="annual_rev" CssClass="" runat="server" Text='<%#Eval("annual_rev")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblNoOfEmp" runat="server" Text="# Employees"></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtNoOfEmp" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="NoOfEmp" CommandArgument="NoOfEmp"></asp:LinkButton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="NoOfEmp" CssClass="" runat="server" Text='<%#Eval("NoOfEmp")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblPrimaryContactID" runat="server" Text="Primary Contact"></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtPrimaryContactID" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="PrimaryContactID" CommandArgument="PrimaryContactID"></asp:LinkButton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="PrimaryContactID" CssClass="" runat="server" Text='<%#Eval("PrimaryContactID")%>'></asp:Label>
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
           //alert($("#<%= hidprot.ClientID %>").val());
           if ($("#<%= hidprot.ClientID %>").val() == "portlet-control-grid") {
               $("#portlet-control-grid").show();
               $("#portlet-control").hide();
           }
           else {
               $("#portlet-control").show();
               $("#portlet-control-grid").hide();
           }
           
           var totalRows = $("#<%=GridView1.ClientID %> tr").length;
           if (totalRows=="0")
               $("#lblgridnot").show();
           else
               $("#lblgridnot").hide();

           //           jQuery('#portlet-detail').slideUp(200);
           //           jQuery('#portlet-control').children(".expand").removeClass("collapse").addClass("expand");
           
           $('[data-high]').click(function() {
                $('[data-high]').removeClass('active');
           });
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
                   <%= txtaccid.UniqueID %>: {
                       required: true
                   },
                   <%= txtaccname.UniqueID %>: "required",
                   <%= txtemail.UniqueID %>: "email"
               },

               messages: {
                   <%= txtaccid.UniqueID %>: {
                       required: "Account ID is required."
                   },
                   <%= txtaccname.UniqueID %>: "Account Name is required."

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
	                //$(element).closest('.form-group').closest('.col-md-6').addClass('has-error');
	                //$(element).addClass('form-group').addClass('has-error');
	            },
	            
	            
	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },
               
               errorPlacement: function (error, element) {
//                    if(element.attr("name") == "<%= txtemail.UniqueID %>") 
//                        error.insertAfter(element.closest('.input-group'));
//                    else
//                        error.insertAfter(element.closest('.form-group'));
                    error.insertAfter(element.closest('.input-groupd'));
	                    
	            },
	            
               submitHandler: function(form) {
                   form.submit();
               }
           });
       });

   </script>
    
   </form>  
    <%--                   <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUID" runat="server" Text='<%# Eval("UID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>--%> 
</asp:Content>



         <%--                   <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUID" runat="server" Text='<%# Eval("UID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
        <%--                            <asp:BoundField DataField="AccountID" HeaderText="Account ID" Visible="True" SortExpression="AccountID"/>--%>