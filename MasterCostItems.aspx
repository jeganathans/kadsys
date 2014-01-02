<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterCostItems.aspx.cs" Inherits="KedSys35.WebForm2" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="formmstcostitem" name="formmstcostitem" class="form" runat="server">
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
                <li><a href="#">Master Cost Items</a></li>
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
                    <div class="caption">Master Cost Items</div>
                    <%--<div class="tools">
                        <a href="javascript:;" class="expand"></a><a href="javascript:;" class="reload">
                        </a>
                    </div>--%>
                    </div>
                    
                <div id="portlet-detail" class="portlet-body form">
                    <div action="#" class="horizontal-form">
                    <div class="form-body">
                        <asp:HiddenField ID="hidUID" runat="server"  enableviewstate="true" />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="txtCostItemname">Name<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtCostItemname"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="txtCode">Code<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtCode"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:CheckBox id="chkisFormula" runat="server" Checked="true"/>
                                    <label class="control-label"> Formula</label>
                                    <asp:TextBox ID="txtFormula"  class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for ="txtdecimalplace">Decimal Places</label>
                                     <asp:TextBox ID="txtdecimalplace"  class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox-list">
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkshowaspercent" runat="server"/>
                                    Show As Percent
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkisEditable" runat="server"/>
                                    Editable
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkisCountable" runat="server"/>
                                    Countable
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkisTimecost" runat="server"/>
                                    Time Cost
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkperCity" runat="server"/>
                                    Per City
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkperMethod" runat="server"/>
                                    Per Method
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkperOption" runat="server"/>
                                    Per Option
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkisActive" runat="server" Checked="true"/>
                                    Active
                                </label>
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
    
    
                <div id="portlet-control-grid" class="portlet box green" style="display:none">
                <div class="portlet-title">
                    <div class="caption"> Master Cost Items</div>
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
                        class="tablefontsm table table-striped table-bordered table-hover">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="UID" CssClass="" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="175px" ItemStyle-Width="175px" >
                                <HeaderTemplate>
                                    <asp:Label ID="lblCostItemname" runat="server" Text="Cost Item Name"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtCostItemname" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="CostItemname" CommandArgument="CostItemname"></asp:linkbutton>
                                        <a href="#" id="fltCostItemname" data-filterex="CostItemname"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="CostItemname" CssClass="" runat="server" Text='<%#Eval("CostItemname")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="75px" ItemStyle-Width="75px">
                                <HeaderTemplate>
                                    <asp:Label ID="lblCode" runat="server" Text="Code"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtCode" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Code" CommandArgument="Code"></asp:linkbutton>
                                        <a href="#" id="fltCode" data-filterex="Code"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Code" CssClass="" runat="server" Text='<%#Eval("Code")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="90px" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblisFormula" runat="server" Text="IsFormula"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtisFormula" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="isFormula" CommandArgument="isFormula"></asp:linkbutton>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="isFormula" runat="server" Checked='<%#Eval("isFormula")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                <HeaderTemplate>
                                    <asp:Label ID="lblFormula" runat="server" Text="Formula"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtFormula" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Formula" CommandArgument="Formula"></asp:linkbutton>
                                        <a href="#" id="fltFormula" data-filterex="Formula"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Formula" CssClass="" Width="150px" style="max-width: 140px; word-wrap: break-word" runat="server" Text='<%#Eval("Formula")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <asp:Label ID="lbldecimalplace" runat="server" Text="Decimal"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="decimalplace" CssClass="" runat="server" Text='<%#Eval("decimalplace")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblshowaspercent" runat="server" Text="Percent"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="showaspercent" runat="server" Checked='<%#Eval("showaspercent")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblisEditable" runat="server" Text="Editable"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="isEditable" runat="server" Checked='<%#Eval("isEditable")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblisCountable" runat="server" Text="Countable"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="isCountable" runat="server" Checked='<%#Eval("isCountable")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="gridthcenter" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblisTimecost" runat="server" Text="Time Cost"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="isTimecost" runat="server" Checked='<%#Eval("isTimecost")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="gridthcenter" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblperCity" runat="server" Text="Per City"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="perCity" runat="server" Checked='<%#Eval("perCity")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="gridthcenter" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblperMethod" runat="server" Text="Per Method"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="perMethod" runat="server" Checked='<%#Eval("perMethod")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:TemplateField HeaderStyle-CssClass="gridthcenter" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblperOption" runat="server" Text="Per Option"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="perOption" runat="server" Checked='<%#Eval("perOption")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblisActive" runat="server" Text="Active"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="isActive" runat="server" Checked='<%#Eval("isActive")%>' Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
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
            if (totalRows == "0")
                $("#lblgridnot").show();
            else
                $("#lblgridnot").hide();
                
            $("#<%= txtFormula.ClientID %>").prop("disabled", !$('#<%= chkisFormula.ClientID %>').is(':checked'));
            $("#<%= txtdecimalplace.ClientID %>").prop("disabled", !$('#<%= chkisFormula.ClientID %>').is(':checked'));
            
            $("#<%= txtdecimalplace.ClientID %>").inputmask({
            "mask": "9",
            "repeat": 10,
            "greedy": false
        });
            
        });

        jQuery(document).ready(function() {
            jQuery('#btnadd').click(function() {
                $("#portlet-control").show();
                $("#portlet-control-grid").hide();
                $("#<%= hidprot.ClientID %>").val("portlet-control");
            });
            
             jQuery('#<%= chkisFormula.ClientID %>').click(function() {
                if ($('#<%= chkisFormula.ClientID %>').is(':checked') == true)
                {
                       $("#<%= txtFormula.ClientID %>").prop("disabled", false);
                       $("#<%= txtdecimalplace.ClientID %>").prop("disabled", false);
                }
                else
                {      $("#<%= txtFormula.ClientID %>").val("");
                       $("#<%= txtdecimalplace.ClientID %>").val("");
                       $("#<%= txtFormula.ClientID %>").prop("disabled", true);
                       $("#<%= txtdecimalplace.ClientID %>").prop("disabled", true);
                       
                }

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
                   <%= txtCostItemname.UniqueID %>: "required",
                   <%= txtCode.UniqueID %>: "required"
               },

               messages: {
                   <%= txtCostItemname.UniqueID %>: "Name is required.",
                   <%= txtCode.UniqueID %>: "Code is required."
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
