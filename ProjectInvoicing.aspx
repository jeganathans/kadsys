<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectInvoicing.aspx.cs" Inherits="KedSys35.ProjectInvoicing" Title="Kadence | Project Invoicing"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery.formatCurrency-1.4.0.min.js"></script>
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
                Project Invoicing
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="ProjectDashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <%--<li><a href="#">Masters</a> <i class="icon-angle-right"></i></li>--%>
                <li><a href="ProjectInvoicing.aspx">Project Invoicing</a></li>
                <li id="brdliProjectID">
                    <i class="icon-angle-right"></i>
                    <a id="brdProjectID" href="Projects.aspx" runat="server"></a>
                </li>
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
                    <div class="caption">Project Invoicing</div>
                </div>
                <div id="portlet-detail" class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div action="#" class="horizontal-form">
                    <div class="form-body">
                    <asp:HiddenField ID="hidUID" runat="server"  enableviewstate="true" />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Project ID</label>
                                    <div class="input-groupd">
                                        <asp:TextBox ID="txtProjectID" Enabled="false" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Project Name</label>
                                    <div class="input-groupd">
                                        <asp:TextBox ID="txtProjectName" Enabled="false" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Proposal ID</label>
                                    <div class="input-groupd">
                                        <asp:TextBox ID="txtProposalID" Enabled="false" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Project Description</label>
                                    <div class="input-groupd">
                                        <asp:TextBox id = txtProjectDesc Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Billing Currency<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddBillingCurrency" Enabled="false" CssClass="form-control select2me" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Invoice Amount<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtBillingAmount" Enabled="false" CssClass="form-control dcurr" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Invoice Date<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtPaymentTerms" class="form-control" type="text" Visible="false" runat="server"></asp:TextBox>
                                    <asp:TextBox id = "txtProjectInvoice" Enabled="false" CssClass="form-control date-picker" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Base Currency<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddBaseCurrency" CssClass="form-control select2me" Enabled="false" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Base Amount<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtBaseAmount" CssClass="form-control dcurr" Enabled="false" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Received Amount<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtReceivedAmount" class="form-control dcurr" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Received Date<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtReceivedDate" class="form-control date-picker" type="text" runat="server"></asp:TextBox>
                                    </div>
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
                    <div class="caption">Project Invoicing</div>
                    <div class="pull-right">
                    <asp:LinkButton ID="btnRemoveFilter" class="btn btn-xs red" Text= "Remove Filter <i class='icon-filter'></i>" runat="server"
                    OnClick = "btnRemoveFilter_Click">
                    </asp:LinkButton>
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
                                    <asp:Label ID="lblProjectID" runat="server" Text="Project ID"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtProjectID" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="ProjectID" CommandArgument="ProjectID"></asp:linkbutton>
                                        <a href="#" id="fltProjectID" data-filterex="ProjectID"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ProjectID" CssClass="" runat="server" Text='<%#Eval("ProjectID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblProjectName" runat="server" Text="Project Name"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtProjectName" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="ProjectName" CommandArgument="ProjectName"></asp:linkbutton>
                                        <a href="#" id="fltProjectName" data-filterex="ProjectName"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ProjectName" CssClass="" runat="server" Text='<%#Eval("ProjectName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtStartDate" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="StartDate" CommandArgument="StartDate"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="StartDate" CssClass="" runat="server" Text='<%#Eval("StartDate")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblEndDate" runat="server" Text="End Date"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtEndDate" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="EndDate" CommandArgument="EndDate"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="EndDate" CssClass="" runat="server" Text='<%#Eval("EndDate")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtStatus" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Status" CommandArgument="Status"></asp:linkbutton>
                                        <a href="#" id="fltStatus" data-filterex="Status"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Status" CssClass="" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblResearchAnalyst" runat="server" Text="Coordinator"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtResearchAnalyst" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="ResearchAnalyst" CommandArgument="ResearchAnalyst"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ResearchAnalyst" CssClass="" runat="server" Text='<%#Eval("ResearchAnalyst")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblBillingCurrency" runat="server" Text="Billing Currency"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="BillingCurrency" CssClass="" runat="server" Text='<%#Eval("BillingCurrency")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lblBillingAmount" runat="server" Text="Billing Amount"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="BillingAmount" CssClass="" runat="server" Text='<%#Eval("BillingAmount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false" >
                                <HeaderTemplate>
                                    <asp:Label ID="lblReceivedAmount" runat="server" Text="Received Amount"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ReceivedAmount" CssClass="" runat="server" Text='<%#Eval("ReceivedAmount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    <asp:Label ID="lblReceivedDate" runat="server" Text="Received Date"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ReceivedDate" CssClass="" runat="server" Text='<%#Eval("ReceivedDate")%>'></asp:Label>
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
               $("#brdliProjectID").hide();
           }
           else {
               $("#portlet-control").show();
               $("#portlet-control-grid").hide();
               $("#brdliProjectID").show();
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
                $(".date-picker")
                .datepicker({
                    dateFormat: "mm/dd/yyyy",
                    rtl: App.isRTL(),
                    autoclose: true,
                    forceParse: true,
                    endDate: "0d"
                })
           }
               
           $('.dcurr').change(function() {
                $(this).val($(this).asNumber());
                if (!$.isNumeric($(this).val()))
                    $(this).val(0);
                $(this).formatCurrency({roundToDecimalPlace:2,symbol:''});
           });
           
           $('.dcurr').formatCurrency({roundToDecimalPlace:2,symbol:''});
              
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
                   <%= ddBillingCurrency.UniqueID %>: "required",
                   <%= txtBillingAmount.UniqueID %>: "required",
                   <%= txtPaymentTerms.UniqueID %>: "required",
                   <%= ddBaseCurrency.UniqueID %>: "required",
                   <%= txtBaseAmount.UniqueID %>: "required",
                   <%= txtReceivedAmount.UniqueID %>: "required",
                   <%= txtReceivedDate.UniqueID %>: "required"
                   
               },

               messages: {
                   <%= ddBillingCurrency.UniqueID %>: "Billing Currency is required.",
                   <%= txtBillingAmount.UniqueID %>: "Billing Amount is required.",
                   <%= txtPaymentTerms.UniqueID %>: "Payment Terms is required.",
                   <%= ddBaseCurrency.UniqueID %>: "Base Currency is required.",
                   <%= txtBaseAmount.UniqueID %>: "Base Amount is required.",
                   <%= txtReceivedAmount.UniqueID %>: "Received Amount is required.",
                   <%= txtReceivedDate.UniqueID %>: "Received Date is required."
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
