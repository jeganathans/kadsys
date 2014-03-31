<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectAll.aspx.cs" Inherits="KedSys35.ProjectAll" Title="Kadence | Project"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="assets/plugins/jquery.responsivetable.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery.formatCurrency-1.4.0.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="projactall" class="form" runat="server">
        <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE Status & BREADCRUMB-->
            <h3 class="page-Status">
                Project
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="ProjectDashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="#">Project</a></li>
            </ul>
            <!-- END PAGE Status & BREADCRUMB-->
        </div>
        <asp:HiddenField ID="hidUID" runat="server" />
        <asp:HiddenField ID="hidtoaster" runat="server" />
    </div>
    
    <div id="portlet-control-grid" class="portlet box green">
        <div class="portlet-title">
            <div class="caption">
                Project</div>
            <div class="pull-right">
                <asp:LinkButton ID="btnRemoveFilter" class="btn btn-xs red" Text="Remove Filter <i class='icon-filter'></i>"
                    runat="server" OnClick="btnRemoveFilter_Click">
                </asp:LinkButton>
                <asp:LinkButton ID="btnadd" class="btn btn-xs default" Text="Add <i class='icon-plus'></i>" 
                    runat="server" OnClick="btnadd_Click" Visible="false"></asp:LinkButton>
                <asp:LinkButton ID="btnGridManage" name="btnGridManage" type="submit"  class="btn default btn-xs" ToolTip="Column Selection & Filter"
                    runat="server" Text="<i class='icon-reorder'></i>" OnClientClick="return GridManage();">
                </asp:LinkButton>
            </div>
        </div>
        
        <div id="portlet-detail-grid" class="portlet-body">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                AllowPaging="true" OnPageIndexChanging="OnPaging" PageSize="10" AllowSorting="true"
                OnSorting="OnSorting" OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                class="tablefontsm table table-striped table-bordered table-hover" HeaderStyle-Wrap="false" RowStyle-Wrap="false">
                <Columns>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="UID" CssClass="" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProjectID" runat="server" Text="Project ID"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtProjectID" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="ProjectID" CommandArgument="ProjectID"></asp:LinkButton>
                                <%--<a href="#" id="fltProjectID" data-filterex="ProjectID"><i class="icon-filter"></i>
                                </a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProjectID" CssClass="" runat="server" Text='<%#Eval("ProjectID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProjectName" runat="server" Text="Project Name"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtProjectName" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="ProjectName" CommandArgument="ProjectName"></asp:LinkButton>
                                <%--<a href="#" id="fltProjectName" data-filterex="ProjectName"><i class="icon-filter">
                                </i></a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProjectName" CssClass="" runat="server" Text='<%#Eval("ProjectName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblClientName" runat="server" Text="Client Name"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtClientName" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="ClientName" CommandArgument="ClientName"></asp:LinkButton>
                                <%--<a href="#" id="fltClientName" data-filterex="ClientName"><i class="icon-filter">
                                </i></a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ClientName" CssClass="" runat="server" Text='<%#Eval("ClientName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCoordinatorName" runat="server" Text="Coordinator"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtCoordinatorName" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="CoordinatorName" CommandArgument="CoordinatorName"></asp:LinkButton>
                                <%--<a href="#" id="fltCoordinatorName" data-filterex="CoordinatorName"><i class="icon-filter"></i></a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CoordinatorName" CssClass="" runat="server" Text='<%#Eval("CoordinatorName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProjectDesc" runat="server" Text="Description"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtProjectDesc" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="ProjectDesc" CommandArgument="ProjectDesc"></asp:LinkButton>
                                <%--<a href="#" id="fltProjectDesc" data-filterex="ProjectDesc"><i class="icon-filter"></i></a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProjectDesc" CssClass="" ToolTip='<%#Eval("ProjectDesc")%>' runat="server" Text='<%#Eval("ProjectDescShort")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblAgreed" runat="server" Text="Project Value"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtAgreed" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Agreed" CommandArgument="Agreed"></asp:LinkButton>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Agreed" CssClass="zCurrNoDec" runat="server" Text='<%#Eval("Agreed")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField >
                        <HeaderTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                            <%--<div class="pull-right" >--%>
                                <asp:linkbutton id="srtStatus" runat ="server" Text = "<i class='icon-sort'></i>"
                                CommandName="Sort" SortExpression="Status" CommandArgument="Status"></asp:linkbutton>
                                <%--<a href="#" id="fltStatus" data-filterex="Status"><i class="icon-filter"></i></a> --%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Status" CssClass="" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProposalRef" runat="server" Text="Proposal ID"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtProposalRef" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="ProposalRef" CommandArgument="ProposalRef"></asp:LinkButton>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProposalRef" CssClass="" runat="server" Text='<%#Eval("ProposalRef")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAgency" runat="server" Text="Agency"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtAgency" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Agency" CommandArgument="Agency"></asp:LinkButton>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Agency" CssClass="" runat="server" Text='<%#Eval("Agency")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblLeader" runat="server" Text="Leader"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtLeader" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Leader" CommandArgument="Leader"></asp:LinkButton>
                           <%-- </div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Leader" CssClass="" runat="server" Text='<%#Eval("Leader")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProjectType" runat="server" Text="Project Type"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtProjectType" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="ProjectType" CommandArgument="ProjectType"></asp:LinkButton>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProjectType" CssClass="" runat="server" Text='<%#Eval("ProjectType")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtDepartment" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Department" CommandArgument="Department"></asp:LinkButton>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Department" CssClass="" runat="server" Text='<%#Eval("Department")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtStartDate" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="StartDate" CommandArgument="StartDate"></asp:LinkButton>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="StartDate" CssClass="" runat="server" Text='<%#Eval("StartDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblEndDate" runat="server" Text="End Date"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtEndDate" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="EndDate" CommandArgument="EndDate"></asp:LinkButton>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="EndDate" CssClass="" runat="server" Text='<%#Eval("EndDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTypeofIndustry" runat="server" Text="Type of Industry"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtTypeofIndustry" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="TypeofIndustry" CommandArgument="TypeofIndustry"></asp:LinkButton>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="TypeofIndustry" CssClass="" runat="server" Text='<%#Eval("TypeofIndustry")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblTask" runat="server" Text="Task"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_task" name="btn_task" type="submit" class="btn green btn-xs" ToolTip="Task"
                                runat="server" Text="<i class='icon-tasks'></i>" OnClick="btn_task_Click">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_select" name="btn_select" type="submit"  class="btn red btn-xs" ToolTip="Edit"
                                runat="server" Text="<i class='icon-edit'></i>" OnClick="btn_select_Click">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerTemplate>
                    <div class="form-actions-half">
                        <div class="col-md-8">
                            <div class="form-group">
                                <div class="btn-group">
                                    <asp:LinkButton ID="pgprev" runat="server" ToolTip="Previous" CssClass="btn btn-default"
                                        Text="<" OnClick="OnPaging"></asp:LinkButton>
                                    <asp:LinkButton ID="pgfirst" data-high="1" runat="server" CssClass="btn btn-default"
                                        Text="1" OnClick="OnPaging"></asp:LinkButton>
                                    <asp:LinkButton ID="pgsecond" data-high="1" runat="server" CssClass="btn btn-default"
                                        Text="2" Visible="false" OnClick="OnPaging"></asp:LinkButton>
                                    <asp:LinkButton ID="pgthird" data-high="1" runat="server" CssClass="btn btn-default"
                                        Text="3" Visible="false" OnClick="OnPaging"></asp:LinkButton>
                                    <asp:LinkButton ID="pgfourth" data-high="1" runat="server" CssClass="btn btn-default"
                                        Text="4" Visible="false" OnClick="OnPaging"></asp:LinkButton>
                                    <asp:LinkButton ID="pgfifth" data-high="1" runat="server" CssClass="btn btn-default"
                                        Text="5" Visible="false" OnClick="OnPaging"></asp:LinkButton>
                                    <asp:LinkButton ID="pgnext" runat="server" ToolTip="Next" CssClass="btn btn-default"
                                        Text=">" OnClick="OnPaging"></asp:LinkButton>
                                </div>
                                <asp:Label ID="pagelabelinfo" CssClass="control-label" runat="server" />
                                <asp:Label ID="Label1" CssClass="control-label pull-right lblmartop" Text="Pages per Page"
                                    runat="server" />
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
                <label id="lblgridnot" name="lblgridnot" class="label-danger" style="display: none">
                    Details not available, Please remove filter, if applied</label>
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
    
    <div id="divGridManage" class="modal" tabindex="-1" data-backdrop="static" data-keyboard="false" >
        <div class="modal-body modal-body-center" style="max-width:800px">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Column Selection & Filter</div>
                </div>
                <div class="portlet-body form">
                    <div class="row" style="padding-left:15px">
                        <div class="col-md-6">
                            <div class="form-group">
                                <h4>Columns</h4>                                <div class="checkbox-list">                                    <label><asp:CheckBox id="gchkCol1" Checked="true" class="input-small" runat="server"/>Project ID</label>
                                    <label><asp:CheckBox id="gchkCol2" Checked="true" class="input-small" runat="server"/>Project Name</label>
                                    <label><asp:CheckBox id="gchkCol3" Checked="true" class="input-small" runat="server"/>Client Name</label>
                                    <label><asp:CheckBox id="gchkCol4" Checked="true" class="input-small" runat="server"/>Coordinator</label>
                                    <label><asp:CheckBox id="gchkCol5" Checked="true" class="input-small" runat="server"/>Description</label>
                                    <label><asp:CheckBox id="gchkCol6" Checked="true" class="input-small" runat="server"/>Project Value</label>
                                    <label><asp:CheckBox id="gchkCol7" Checked="true" class="input-small" runat="server"/>Status</label>
                                    <label><asp:CheckBox id="gchkCol8" class="input-small" runat="server"/>Proposal ID</label>
                                    <label><asp:CheckBox id="gchkCol9" class="input-small" runat="server"/>Agency</label>
                                    <label><asp:CheckBox id="gchkCol10" class="input-small" runat="server"/>Leader</label>
                                    <label><asp:CheckBox id="gchkCol11" class="input-small" runat="server"/>Project Type</label>
                                    <label><asp:CheckBox id="gchkCol12" class="input-small" runat="server"/>Department</label>
                                    <label><asp:CheckBox id="gchkCol13" class="input-small" runat="server"/>Start Date</label>
                                    <label><asp:CheckBox id="gchkCol14" class="input-small" runat="server"/>End Date</label>
                                    <label><asp:CheckBox id="gchkCol15" class="input-small" runat="server"/>Type of Industry</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group" style="padding-right:15px">
                                <h4>Filter</h4>
                                <div class="controls">                                    <label class="control-label">Project ID</label>
                                    <asp:TextBox ID="fltduProjectID" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddProjectID"  class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                <div class="controls">                                    <label class="control-label">Project Name</label>
                                    <asp:TextBox ID="fltduProjectName" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddProjectName" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                <div class="controls">                                    <label class="control-label">Client Name</label>
                                    <asp:TextBox ID="fltduClientName" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddClientName" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                <div class="controls">                                    <label class="control-label">Coordinator Name</label>
                                    <asp:TextBox ID="fltduCoordinatorName" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddCoordinatorName" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                <div class="controls">                                    <label class="control-label">Leader Name</label>
                                    <asp:TextBox ID="fltduLeader" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddLeader" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                <div class="controls">                                    <label class="control-label">Status</label>
                                    <asp:TextBox ID="fltduStatus" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddStatus" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions form-actions-half right">
                        <asp:Button ID="btnGridUpdate" class="btn green" runat="server" Text="Ok" 
                            UseSubmitBehavior="false" OnClick="gridManage"/> 
                        <input id="btnGridCancel" type="button" data-dismiss="modal" class="btn default"
                            onclick="$('#divGridManage').hide();" value="Cancel">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <script>

            function GridManage() {
                $('#divGridManage').modal({ 'backdrop': 'static' });
                return false;
            }


            $(window).load(function() {

                var zdufilters = $('.zdufilter');
                $.each(zdufilters, function(index, zdufilter) {
                    
                    var data = [];
                    var strdata = $(zdufilter).val().replace(/"/g, '').replace('[', '').replace(']', '');
                    $(strdata.split(",")).each(function() {
                        data.push({ id: this, text: this });
                    });
                    if (strdata.length > 0)
                        var zddfilter = $(this).closest('div').find('select.zddfilter');
                        $(zddfilter).select2({ placeholder: "" });
                        $(zddfilter).select2('data', data);
                });

            });
            
            
            jQuery(document).ready(function() {

                $('.zddfilter').on("change", function(e) {
                    var data1 = $(this).select2('val');
                    var targetidcell = $(this).closest('div').find('.zdufilter');
                    $(targetidcell).val(JSON.stringify(data1));
                });

                $('#<%=GridView1.ClientID %>').responsiveTable({
                    staticColumns: 0,
                    scrollRight: false,
                    scrollHintEnabled: false
                });

                $('.zCurrNoDec').formatCurrency({ roundToDecimalPlace: 0, symbol: '', groupDigits: true });

                $('[data-high]').click(function() {
                    $('[data-high]').removeClass('active');
                });


                var totalRows = $("#<%=GridView1.ClientID %> tr").length;
                if (totalRows == "0")
                    $("#lblgridnot").show();
                else
                    $("#lblgridnot").hide();
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
        </script>
    </form>
</asp:Content>
