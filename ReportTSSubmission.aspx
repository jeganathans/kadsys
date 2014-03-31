<%@ Page Title="Kadence | TimeSheet" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportTSSubmission.aspx.cs" Inherits="KedSys35.ReportTSSubmission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery.responsivetable.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="formreport" name="formreport" class="form" runat="server">
    <!-- BEGIN PAGE -->
    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
    </div>
    <!-- BEGIN PAGE HEADER-->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Timesheet Submission Report
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="TimeSheetDashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <%--<li><a href="#">Masters</a> <i class="icon-angle-right"></i></li>--%>
                <li><a href="TimeSheet.aspx">Time Sheet</a></li>
                <li id="brdliPageID"><i class="icon-angle-right"></i><a id="brdPageID" href="#" runat="server">
                </a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
        <asp:HiddenField ID="hidtoaster" runat="server" />
        <asp:HiddenField ID="hidprot" runat="server" />
    </div>
    <!-- END PAGE HEADER-->
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->
            <div id="portlet-control" class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        Report Parameters</div>
                        <div class="tools">                            <a href="" class="collapse"></a>                        </div>
                </div>
                <div id="portlet-detail" class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div action="#" class="horizontal-form">
                        <div class="form-body">
                            <asp:HiddenField ID="hidUID" runat="server" EnableViewState="true" />
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Date From</label>
                                        <div class="input-groupd">
                                            <asp:TextBox ID="txtDtFrom" class="form-control date-picker" type="text"
                                                runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Date To</label>
                                        <div class="input-groupd">
                                            <asp:TextBox ID="txtDtTo" class="form-control date-picker" type="text"
                                                runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Employee Name</label>
                                        <div class="input-groupd">
                                            <asp:DropDownList ID="ddEmployee" class="form-control select2me" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Manager Name</label>
                                        <div class="input-groupd">
                                            <asp:DropDownList ID="ddManager" class="form-control select2me" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Director Name</label>
                                        <div class="input-groupd">
                                            <asp:DropDownList ID="ddDirector" class="form-control select2me" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Department</label>
                                        <div class="input-groupd">
                                            <asp:DropDownList ID="ddDepartment" class="form-control select2me" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Timesheet Status</label>
                                        <div class="input-groupd">
                                            <asp:DropDownList ID="ddTSStatus" class="form-control select2me" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions right">
                                <asp:Button ID="btn_submit" class="btn green" Text="Submit" type="submit" runat="server"
                                     OnClick="btn_submit_Click"></asp:Button> <%--OnClientClick="return checkvalid();"--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END EXAMPLE TABLE PORTLET-->
            <div id="portlet-control-grid" class="portlet box green" style="display:none">
                <div class="portlet-title">
                    <div class="caption">Report</div>
                    <div class="pull-right">
                    <%--<a href="#" id="btnadd" class="btn btn-xs default zbtnadd" runat="server">Add <i class="icon-plus"></i></a>--%>
                    </div>
                    <%--<div class="tools">
                        <a href="" class="reload"></a>
                     </div>--%>
                    </div>
                    
                    <div id="portlet-detail-grid" class="portlet-body">
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                        AllowPaging="true" OnPageIndexChanging = "OnPaging" PageSize = "10"
                        AllowSorting="true" OnSorting = "OnSorting" 
                        OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                        class="tablefontsm table table-striped table-bordered table-hover" HeaderStyle-Wrap="false" RowStyle-Wrap="false">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Width="175px" ItemStyle-Width="175px" >
                                <HeaderTemplate>
                                    <asp:Label ID="lblEMPName" runat="server" Text="Employee Name"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="EMPName" CssClass="" runat="server" Text='<%#Eval("EMPName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblMgrName" runat="server" Text="Manager"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="MgrName" CssClass="" runat="server" Text='<%#Eval("MgrName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblDirectorName" runat="server" Text="Director"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="DirectorName" CssClass="" Width="150px" runat="server" Text='<%#Eval("DirectorName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Department" CssClass="" Width="150px" runat="server" Text='<%#Eval("Department")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblCalenderDate" runat="server" Text="TimeSheet Date"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="CalenderDate" CssClass="" Width="150px" runat="server" Text='<%#Eval("CalenderDate")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblSubmitted" runat="server" Text="Submitted (Yes/No)"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Submitted" CssClass="" Width="150px" runat="server" Text='<%#Eval("Submitted")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lbldateSubmited" runat="server" Text="Submitted On"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="dateSubmited" CssClass="" Width="150px" runat="server" Text='<%#Eval("dateSubmited")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblTotalMinutes" runat="server" Text="Total Hrs Spent"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="TotalMinutes" CssClass="" Width="150px" runat="server" Text='<%#Eval("TotalMinutes")%>'></asp:Label>
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
                    <label ID="lblgridnot" name="lblgridnot" class="label-danger" style="display:none">Records not found</label> 
                    </div>
                    
                </div>
                </div>
        </div>
    </div>
    <!-- END PAGE CONTENT -->
    <!-- END PAGE -->
    <!-- END FORM-->

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

        jQuery(document).ready(function() {
            showtoastrr();

            if ($("#<%= hidprot.ClientID %>").val() == "portlet-control-grid") {
                $("#portlet-control-grid").show();
                //$("#portlet-control").hide();
                $("#brdliPageID").hide();

                var el = $("#portlet-control").closest(".portlet").children(".portlet-body");
                var tools = $("#portlet-control").closest(".portlet").find('a');
                if ($(tools).hasClass("collapse")) {
                    $(tools).removeClass("collapse").addClass("expand");
                    el.slideUp(200);
                }
                //                else {
                //                    jQuery(this).removeClass("expand").addClass("collapse");
                //                    el.slideDown(200);
                //                }
            }
            else {
                $("#portlet-control").show();
                $("#portlet-control-grid").hide();
                $("#brdliPageID").show();
            }

            $('#<%=GridView1.ClientID %>').responsiveTable({
                staticColumns: 0,
                scrollRight: false,
                scrollHintEnabled: false
            });

            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    dateFormat: "mm/dd/yyyy",
                    rtl: App.isRTL(),
                    autoclose: true,
                    endDate: "0d"
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
        });
    </script>

    </form>

</asp:Content>
