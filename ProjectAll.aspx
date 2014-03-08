<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectAll.aspx.cs" Inherits="KedSys35.ProjectAll" Title="Kadence | Project"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            </div>
        </div>
        
        <div id="portlet-detail-grid" class="portlet-body">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                AllowPaging="true" OnPageIndexChanging="OnPaging" PageSize="10" AllowSorting="true"
                OnSorting="OnSorting" OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                class="tablefontsm table table-striped table-bordered table-hover">
                <Columns>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="UID" CssClass="" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProjectID" runat="server" Text="Project ID"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtProjectID" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="ProjectID" CommandArgument="ProjectID"></asp:LinkButton>
                                <a href="#" id="fltProjectID" data-filterex="ProjectID"><i class="icon-filter"></i>
                                </a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProjectID" CssClass="" runat="server" Text='<%#Eval("ProjectID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProjectName" runat="server" Text="Project Name"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtProjectName" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="ProjectName" CommandArgument="ProjectName"></asp:LinkButton>
                                <a href="#" id="fltProjectName" data-filterex="ProjectName"><i class="icon-filter">
                                </i></a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProjectName" CssClass="" runat="server" Text='<%#Eval("ProjectName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblClientName" runat="server" Text="Client Name"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtClientName" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="ClientName" CommandArgument="ClientName"></asp:LinkButton>
                                <a href="#" id="fltClientName" data-filterex="ClientName"><i class="icon-filter">
                                </i></a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ClientName" CssClass="" runat="server" Text='<%#Eval("ClientName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCoordinatorName" runat="server" Text="Coordinator"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtCoordinatorName" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="CoordinatorName" CommandArgument="CoordinatorName"></asp:LinkButton>
                                <a href="#" id="fltCoordinatorName" data-filterex="CoordinatorName"><i class="icon-filter"></i></a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CoordinatorName" CssClass="" runat="server" Text='<%#Eval("CoordinatorName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProjectDesc" runat="server" Text="Description"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtProjectDesc" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="ProjectDesc" CommandArgument="ProjectDesc"></asp:LinkButton>
                                <a href="#" id="fltProjectDesc" data-filterex="ProjectDesc"><i class="icon-filter"></i></a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProjectDesc" CssClass="" ToolTip='<%#Eval("ProjectDesc")%>' runat="server" Text='<%#Eval("ProjectDescShort")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAgreed" runat="server" Text="Project Value"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtAgreed" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Agreed" CommandArgument="Agreed"></asp:LinkButton>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Agreed" CssClass="" runat="server" Text='<%#Eval("Agreed")%>'></asp:Label>
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
                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblTask" runat="server" Text="Task"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_task" name="btn_task" type="submit" class="btn green btn-xs" ToolTip="Task"
                                runat="server" Text="<i class='icon-tasks'></i>" OnClick="btn_task_Click">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
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
    
        <script>
            jQuery(document).ready(function() {

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
