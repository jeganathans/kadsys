<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CommonMaster.aspx.cs" Inherits="KedSys35.WebForm7" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="assets/plugins/jquery.formatCurrency-1.4.0.min.js"></script>
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
                <%--<li><a href="#">Masters</a> <i class="icon-angle-right"></i></li>--%>
                <li><a id="brdliPageHeader" href="CommonMaster.aspx" runat="server"></a></li>
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
    <!-- END PAGE HEADER-->
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->
            <div id="portlet-control" class="portlet box green" style="display:none">
                <div class="portlet-title">
                    <div class="caption"> <asp:Label id="porthead1" Text="test" runat="server"></asp:Label></div>
                    <%--<div class="tools">
                        <a href="javascript:;" class="expand"></a><a href="javascript:;" class="reload">
                        </a>
                    </div>--%>
                    </div>
                
                <div id="portlet-detail" class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div action="#" class="horizontal-form">
                    <div class="form-body">
                    <asp:HiddenField ID="hidUID" runat="server"  enableviewstate="true" />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label id="lblListval1" class="control-label" runat="server"></label>
                                    <asp:TextBox ID="txtListval1"  class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div id="divval2" class="col-md-6" runat="server">
                                <div id="atest" class="form-group">
                                    <label id="lblListval2" class="control-label" runat="server"></label>
                                    <asp:TextBox id = "txtListval2" name="txtListval2" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div id="divrow2" class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label id="lblListval3" class="control-label" runat="server"></label>
                                    <asp:TextBox id = "txtListval3" name="txtListval3" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                            <div id="divval4" class="col-md-6" runat="server">
                                <div class="form-group">
                                    <label id="lblListval4" class="control-label" runat="server"></label>
                                    <asp:TextBox id = "txtListval4" name="txtListval4" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div id="chkdiv" class="col-md-6" runat="server">
                                <div class="form-group">
                                    <label class="checkbox-inline">
                                    <asp:CheckBox id="chkisActive" runat="server" Checked="true"/>Active</label>
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
                 </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
    </div>
    <!-- END PAGE CONTENT -->
    <!-- END PAGE -->
    
                   
                    <!-- END FORM-->
                <div id="portlet-control-grid" class="portlet box green" style="display:none">
                <div class="portlet-title">
                    <div class="caption"> <asp:Label id="porthead2" Text="test" runat="server"></asp:Label></div>
                    <div class="pull-right">
                    <asp:LinkButton ID="btnRemoveFilter" class="btn btn-xs red" Text= "Remove Filter <i class='icon-filter'></i>" runat="server"
                    OnClick = "btnRemoveFilter_Click">
                    </asp:LinkButton>
                    <a href="#" id="btnadd" class="btn btn-xs default zbtnadd" runat="server">Add <i class="icon-plus"></i></a>
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
                                    <asp:Label ID="lblgListval1" runat="server" Text=""></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtListval1" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Listval1" CommandArgument="Listval1"></asp:linkbutton>
                                        <a href="#" id="fltListval1" data-filterex="Listval1"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Listval1" CssClass="" runat="server" Text='<%#Eval("Listval1")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblgListval2" runat="server" Text=""></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtListval2" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="Listval2" CommandArgument="Listval2"></asp:LinkButton>
                                        <a href="#" id="fltListval2" data-filterex="Listval2"><i class="icon-filter"></i>
                                        </a>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Listval2" CssClass="" runat="server" Text='<%#Eval("Listval2")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblListval3" runat="server" Text=""></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtListval3" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="Listval3" CommandArgument="Listval3"></asp:LinkButton>
                                        <a href="#" id="fltListval3" data-filterex="Listval3"><i class="icon-filter"></i>
                                        </a>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Listval3" CssClass="" runat="server" Text='<%#Eval("Listval3")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblgListval4" runat="server" Text=""></asp:Label>
                                    <div class="pull-right">
                                        <asp:LinkButton ID="srtListval4" runat="server" Text="<i class='icon-sort'></i>"
                                            CommandName="Sort" SortExpression="Listval4" CommandArgument="Listval4"></asp:LinkButton>
                                        <a href="#" id="fltListval4" data-filterex="Listval4"><i class="icon-filter"></i>
                                        </a>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Listval4" CssClass="" runat="server" Text='<%#Eval("Listval4")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="100px" HeaderStyle-CssClass="gridthcenter" ItemStyle-HorizontalAlign="Center" >
                                <HeaderTemplate>
                                    <asp:Label ID="lblisActive" runat="server" Text="Active"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="isActive" runat="server" Checked='<%#Eval("isActive")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="100px" HeaderText="" ItemStyle-HorizontalAlign="Center">
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
           //alert($('#<%= lblListval2.ClientID %>').html().length);
           if ($('#<%= lblListval2.ClientID %>').html().length == 0)
                $("#<%= chkdiv.ClientID %>").appendTo("#<%= divval2.ClientID %>");
            else
            {
                if ($('#<%= lblListval3.ClientID %>').html().length > 0)
                {   if ($('#<%= lblListval4.ClientID %>').html().length == 0)
                        $("#<%= chkdiv.ClientID %>").appendTo("#<%= divval4.ClientID %>");
                }
                else
                    $("#divrow2").hide();
            }
            
           if ($("#<%= hidprot.ClientID %>").val() == "portlet-control-grid") {
               $("#portlet-control-grid").show();
               $("#portlet-control").hide();
               $("#brdliPageID").hide();
           }
           else {
               $("#portlet-control").show();
               $("#portlet-control-grid").hide();
               $("#brdliPageID").show();
           }
           
           $('[data-high]').click(function() {
                $('[data-high]').removeClass('active');
           });
           
           
           var totalRows = $("#<%=GridView1.ClientID %> tr").length;
           if (totalRows=="0")
               $("#lblgridnot").show();
           else
               $("#lblgridnot").hide();

            
            
            
                
                
                
            
            //$("#<%= chkdiv.ClientID %>").appendTo("#<%= divval4.ClientID %>");
           
           
           //           jQuery('#portlet-detail').slideUp(200);
           //           jQuery('#portlet-control').children(".expand").removeClass("collapse").addClass("expand");
       });

       jQuery(document).ready(function() {
           jQuery('.zbtnadd').click(function() {
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

        var lblval =  $("#<%= lblListval2.ClientID %>");
        if (lblval[0].innerHTML.indexOf('Daily Rate') >= 0)
        {
            $("#<%= txtListval2.ClientID %>").formatCurrency({roundToDecimalPlace:0,symbol:'',groupDigits:false});
            
            $("#<%= txtListval2.ClientID %>").change(function() {
                var val2 = $("#<%= txtListval2.ClientID %>");
                $(val2).val($(val2).asNumber({ parseType: 'int' }));
                if (!$.isNumeric($(val2).val()))
                        $(val2).val(0);
                $(val2).formatCurrency({roundToDecimalPlace:0,symbol:'',groupDigits:false});
            });
        }

         jQuery.validator.addMethod("Listval2YesNo",
                function(value, element){
                    var lblval =  $("#<%= lblListval2.ClientID %>");
                    if (lblval[0].innerHTML.indexOf('Display in Proposal') >= 0) {
                        var olistval2 = $("#<%= txtListval2.ClientID %>");
                        if (olistval2.val().trim() == "Yes" || olistval2.val().trim() == "No")
                            return true
                        else
                            return false
                    }
                    else
                        return true 
                },"Only Yes or No is allowed."
             );
             
           jQuery.validator.addMethod("Listval4YesNo",
                function(value, element){
                    var lblval =  $("#<%= lblListval4.ClientID %>");
                    if (lblval[0].innerHTML.indexOf('Base Currency') >= 0) {
                        var olistval2 = $("#<%= txtListval4.ClientID %>");
                        if (olistval2.val().trim() == "Yes" || olistval2.val().trim() == "No")
                            return true
                        else
                            return false
                    }
                    else
                        return true 
                },"Only Yes or No is allowed."
             );
           
           $('form').validate({
               errorElement: 'span', //default input error message container
               errorClass: 'help-block', // default input error message class
               rules: {
                   <%= txtListval1.UniqueID %>: {
                       required: true
                   },
                   <%= txtListval2.UniqueID %>: {required:true,  Listval2YesNo:true},
                   <%= txtListval3.UniqueID %>: "required",
                   <%= txtListval4.UniqueID %>: {required:true,  Listval4YesNo:true}
               },

               messages: {
                   <%= txtListval1.UniqueID %>: {
                       required: "Required"
                   },
                   <%= txtListval2.UniqueID %>: {required: "Required"},
                   <%= txtListval3.UniqueID %>: "Required.",
                   <%= txtListval4.UniqueID %>: {required: "Required"}
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
               
//               errorPlacement: function (error, element) {
//                    error.insertAfter(element.closest('.form-group'));
//                    //error.insertAfter('.control-label');
//	            },
	            
               submitHandler: function(form) {
                   form.submit();
               }
           });
           
       });
   </script>
   </form>  
    
</asp:Content>

