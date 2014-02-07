<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TimeSheet.aspx.cs" Inherits="KedSys35.TimeSheet" Title="Kadence | TimeSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/plugins/clockface/css/clockface.css" />
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-timepicker/compiled/timepicker.css" />
    
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/plugins/clockface/js/clockface.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery.formatCurrency-1.4.0.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
    
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
                Time Sheet
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="TimeSheetDashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <%--<li><a href="#">Masters</a> <i class="icon-angle-right"></i></li>--%>
                <li><a href="TimeSheet.aspx">Time Sheet</a></li>
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
            <div id="portlet-control" class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Time Sheet</div>
                </div>
                <div id="portlet-detail" class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div action="#" class="horizontal-form">
                    <div class="form-body">
                    <asp:HiddenField ID="hidUID" runat="server"  enableviewstate="true" />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Employee Name</label>
                                    <div class="input-groupd">
                                        <asp:DropDownList ID="ddEmpName" class="form-control select2me" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddEmpName_Changed" ></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Manager Name</label>
                                    <div class="input-groupd">
                                        <asp:TextBox ID = "txtManagerName" Cssclass="form-control" Enabled="false" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Date</label>
                                    <div class="input-groupd">
                                        <asp:TextBox ID="txtTimeSheetDate" class="form-control date-picker-past" type="text" runat="server" AutoPostBack="true" OnTextChanged="txtTimeSheetDate_changed"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <label class="control-label input-medium">In & Out Time</label>
                                    </div>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtInTime" class="form-control input-small cf-in" type="text" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtOutTime" class="form-control input-small cf-out" type="text" runat="server"></asp:TextBox>
                                        <asp:LinkButton ID="btn_save" name="btn_save" type="submit" class="btn green btn-xs zupdateiotime" ToolTip="Save In & Out Time"
                                            runat="server" Text="<i class='icon-save'></i>" OnCommand="btnsave_click">
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <asp:DropDownList ID="fltddProjectRef" Width="100px" CssClass="boxleft srcfltproj" runat="server" AutoPostBack="true" OnSelectedIndexChanged="fltddchanged"
                                style="display:none" ></asp:DropDownList>
                            <asp:DropDownList ID="fltddProjectName" Width="175px" CssClass="boxleft srcfltprojname" runat="server" AutoPostBack="true" OnSelectedIndexChanged="fltddchanged"
                                style="display:none" ></asp:DropDownList>
                            <asp:DropDownList ID="fltddTaskName" Width="200px" CssClass="boxleft srcflttaskname" runat="server" AutoPostBack="true" OnSelectedIndexChanged="fltddchanged"
                                style="display:none" ></asp:DropDownList>
                            <asp:GridView ID="GridTS" runat="server" AutoGenerateColumns="False"
                                OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                                class="proptable table-bordered">
                                <Columns>
                                    <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                        <ItemTemplate>
                                            <asp:Label ID="UID" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                                            <asp:Label ID="priority" runat="server" Text='<%#Eval("priority")%>' data-pri="1"></asp:Label>
                                            <asp:Label ID="Overridden" runat="server" Text='<%#Eval("Overridden")%>' data-ovrride="1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblProjectRef" runat="server" Text="Project ID"></asp:Label>
                                            <div id="desfltproj"></div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ProjectRef" Width="100px" CssClass="boxleft" runat="server" Text='<%#Eval("ProjectRef")%>' data-prjref="1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblProjectName" runat="server" Text="Project Name"></asp:Label>
                                            <div id="desfltprojname"></div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="ProjectName" Width="175px" CssClass="boxleft" runat="server" Text='<%#Eval("ProjectName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblTaskName" runat="server" Text="Task Name"></asp:Label>
                                            <div id="desflttaskname"></div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="TaskName" Width="200px" CssClass="boxleft" runat="server" Text='<%#Eval("TaskName")%>'></asp:Label>
                                            <asp:DropDownList ID="ddTaskName"  Width="200px" CssClass="boxleft" runat="server" data-ddtask="1"  Visible = "false"> </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblStartTime" runat="server" Text="Start Time"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="StartTime" runat="server" Width="100px" CssClass="boxleft"
                                                        Text='<%#Eval("StartTime")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblEndTime" runat="server" Text="EndTime"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="EndTime" runat="server" Width="100px" CssClass="boxleft"
                                                        Text='<%#Eval("EndTime")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblTotalMinutes" Width="60px" runat="server" Text="Total (HH:MM)"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="TotalMinutes" Style="max-width: 60px;display:none" Cssclass="cbox totmin" runat="server"
                                                Text='<%#Eval("TotalMinutes")%>' data-totmin="1"  ></asp:TextBox>
                                                <div class="bootstrap-timepicker"/>
                                            <asp:TextBox ID="dHoursMin" Style="max-width: 60px" Cssclass="dhours" runat="server"></asp:TextBox>
                                                </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblComments" Width="300px" runat="server" Text="Comments"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="Comments" Width="300px" CssClass="boxleft" runat="server"
                                                Text='<%#Eval("Comments")%>' data-comments="1"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblTaskStatus" runat="server" Text="Task Status"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddTaskStatus"  Width="150px" CssClass="boxleft" runat="server" data-ddtaskstatus="1"> </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_starttask" type="submit" class="btn green btn-xs zStarttask" ToolTip="Start Task"
                                                runat="server" Text="<i class='icon-play'></i>" OnCommand="btn_starttask" Visible="false">
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btn_stoptask" type="submit" class="btn blue btn-xs zFinishtask" ToolTip="Stop Task"
                                                runat="server" Text="<i class='icon-pause'></i>" OnCommand="btn_stoptask">
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btn_endtask" type="submit" class="btn green btn-xs zFinishtask" ToolTip="End Task"
                                                runat="server" Text="<i class='icon-stop'></i>" OnCommand="btn_endtask">
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btn_delete" name="btn_delete" type="submit" class="btn purple btn-xs" ToolTip="Delete Entry"
                                                runat="server" Text="<i class='icon-remove'></i>" OnClientClick="javascript:return deleteItem(this);"  
                                                OnCommand="btn_delete_Click">
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btn_overrid" type="submit" class="btn red btn-xs zStarttask" ToolTip="Manual Input"
                                                runat="server" Text="<i class='icon-unlock'></i>" OnCommand="btn_overrid">
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            
                            <div class="form-actions right">
                                <asp:Button id="btn_submit" class="btn green" text="Submit" type="submit" runat="server" 
                                    OnClientClick="return checkvalid();" onclick="btn_submit_Click"></asp:Button>
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
    
  <div id="dialog" title="Delete Entry" style="display: none">Are you sure?</div>
   <script>

       function checkvalid() {
           var resValid;
           resValid = false;
           var emptyts = true;

           var hasvaluesAll = 1;

           $('.proptable tr').each(function(i, row) {
               var opriority = $(row).closest('tr').find('[data-pri]');
               var oTaskName = $(row).closest('tr').find('[data-ddtask]');
               var ototmin = $(row).closest('tr').find('[data-totmin]');
               var ocomments = $(row).closest('tr').find('[data-comments]');
               var oddtaskstatus = $(row).closest('tr').find('[data-ddtaskstatus]');


               $(row).closest('tr').find('[data-prjref]').removeClass('cerrortask');
               if (opriority.length > 0) {
                   if (parseFloat($(opriority)[0].innerText) == 4 || parseFloat($(opriority)[0].innerText) == 5) {
                       if ($(oTaskName).val().trim().length > 0 || $(ototmin).val().trim().length > 0 || $(ocomments).val().trim().length > 0) {
                           if ($(oTaskName).val().trim().length == 0 || $(ototmin).val().trim().length == 0 || $(ocomments).val().trim().length == 0) {
                               hasvaluesAll = 0;
                               $(row).closest('tr').addClass('cerrortask');
                               $(row).closest('tr').attr("title", "Please fill all the columns.");
                           }
                           else {
                               emptyts = false;
                           }

                       }
                   }
                   else {
                       if ($(ototmin).val().length > 0 || $(ocomments).val().length > 0 || $(oddtaskstatus).val().length > 0) {
                           if ($(ototmin).val().length == 0 || $(ocomments).val().length == 0 || $(oddtaskstatus).val().length == 0) {
                               hasvaluesAll = 0;
                               $(row).closest('tr').addClass('cerrortask');
                               $(row).closest('tr').attr("title", "Please fill all the columns.");
                           }
                           else {
                               emptyts = false;
                           }
                       }
                   }
               }

           });

           if (hasvaluesAll == 1) {
               resValid = true;
           }
           else {
               resValid = false;
               $("#<%= hidtoaster.ClientID %>").val("warning|Please correct the errors");
               showtoastrr();
           }

           return resValid;

       }

       function deleteItem(uniqueID) {
           $("#dialog").dialog({
               buttons: {
                   "Delete": function() {
                       eval($(uniqueID).attr('href'));
                       //__doPostBack(uniqueID.name, '');
                       $(this).dialog("close");
                   },
                   "Cancel": function() { $(this).dialog("close"); }
               }
           });
           $("#dialog").dialog("open");
           return false;
       }

       $(window).load(function() {
           $('.dhours').timepicker({
               autoclose: true,
               minuteStep: 1,
               showSeconds: false,
               showMeridian: false,
               defaultTime: false
           });



           $('.dhours').change(function() {

               var parts = $(this).val().split(":");
               if (parts.length == 2) {
                   var totalmin = $(this).closest('tr').find('[data-totmin]');
                   var totmin;
                   totmin = parts[0] * 60 + parseFloat(parts[1]);
                   if (parseFloat(totmin) > 0)
                       totalmin.val(totmin);
                   else
                       totalmin.val("");
               }
           });

           //           var inputs = $(".totmin")
           //           $.each(inputs, function(index, inputs) {
           //               var Dhours = $(inputs).closest('tr').find('.dhours');
           //               if ($(inputs).val() > 0) {
           //                   var hr = Math.floor($(inputs).val() / 60);
           //                   var mi = ($(inputs).val() % 60);
           //                   var hrmi = hr + ":" + mi;
           //                   //$(Dhours).timepicker('setTime', hrmi);
           //                   $(Dhours).timepicker('setTime', '12:45 AM');
           //               }

           //           });

           //           $('.dhours').on('changeTime', function(e) {
           //               alert("enjoy");
           //           });
       });

       jQuery(document).ready(function() {
           $(".srcfltproj").appendTo("#desfltproj");
           $(".srcfltproj").show();
           
           $(".srcfltprojname").appendTo("#desfltprojname");
           $(".srcfltprojname").show();

           $(".srcflttaskname").appendTo("#desflttaskname");
           $(".srcflttaskname").show();

           

           $('[data-high]').click(function() {
               $('[data-high]').removeClass('active');
           });

           $('.totmin').change(function() {
               $(this).val($(this).asNumber({ parseType: 'int' }));
               if (!$.isNumeric($(this).val()) || $(this).val() == "0")
                   $(this).val("");
               else if ($(this).val() > 1439)
                   $(this).val("1439");
               $(this).formatCurrency({ roundToDecimalPlace: 0, symbol: '', groupDigits: false });
           });

           $('.totmin').formatCurrency({ roundToDecimalPlace: 0, symbol: '', groupDigits: false });

           $("#dialog").dialog({
               autoOpen: false,
               modal: true,
               closeOnEscape: false
           });

       });

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

       jQuery(document).ready(function() {
           showtoastrr();

           if (jQuery().datepicker) {
               $('.date-picker-past').datepicker({
                   dateFormat: "mm/dd/yyyy",
                   rtl: App.isRTL(),
                   autoclose: true,
                   endDate: "0d"
               });
               //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
           }


           if (jQuery().clockface) {
               $('.cf-in').clockface({format:"HH:mm"});
               $('.cf-out').clockface({format:"HH:mm"});
           }

           function ztimevalid(otime) {
               if (otime.match(/^([01][0-9]|2[0-3]):[0-5][0-9]$/))
                   return true;
               else
                   return false;
           }

           $('.zupdateiotime').click(function() {
               var cfin = $('.cf-in');
               var cfout = $('.cf-out');
               if ($(cfin).val() == "" || $(cfout).val() == "") {
                   $("#<%= hidtoaster.ClientID %>").val("error|In and Out Time required.");
                   showtoastrr();
                   return false;
               }
               else if (!ztimevalid($(cfin).val()) || !ztimevalid($(cfout).val())) {
                   $("#<%= hidtoaster.ClientID %>").val("error|Please input valid time.");
                   showtoastrr();
                   return false;
               }

               return true;
           });



           $('.zStarttask').click(function() {
               var pri = $(this).closest('tr').find('[data-pri]');
               if (pri[0].innerText == "2") {
                   var ddtask = $(this).closest('tr').find('[data-ddtask]');
                   if ($(ddtask).val() == "") {
                       $("#<%= hidtoaster.ClientID %>").val("error|Please select the task");
                       showtoastrr();
                       return false;
                   }
               }


               return true;
           });

           $('.zFinishtask').click(function() {
               var overrid = $(this).closest('tr').find('[data-ovrride]');
               if (overrid[0].innerText == "True") {
                   var totalmin = $(this).closest('tr').find('[data-totmin]');
                   var comments = $(this).closest('tr').find('[data-comments]');
                   if ($(totalmin).val() == "" || $(comments).val() == "") {
                       $("#<%= hidtoaster.ClientID %>").val("error|Total Minutes and Comments are required.");
                       showtoastrr();
                       return false;
                   }
               }
               return true;
           });
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
       
       
       </script>
       
       
    </form>
</asp:Content>
