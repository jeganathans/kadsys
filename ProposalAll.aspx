<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProposalAll.aspx.cs" Inherits="KedSys35.ProposalAll" Title="Kadence | Proposal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
  <%--<script src="http://code.jquery.com/jquery-1.9.1.js"></script>--%>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="propsoalall" class="form" runat="server">
        <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE Status & BREADCRUMB-->
            <h3 class="page-Status">
                Proposal
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="dashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="#">Proposal</a></li>
            </ul>
            <!-- END PAGE Status & BREADCRUMB-->
        </div>
        <asp:HiddenField ID="hidUID" runat="server" />
        <asp:HiddenField ID="hidtoaster" runat="server" />
    </div>
    
    <div id="portlet-control-grid" class="portlet box green">
        <div class="portlet-title">
            <div class="caption">
                Proposal</div>
            <div class="pull-right">
                <asp:LinkButton ID="btnRemoveFilter" class="btn btn-xs red" Text="Remove Filter <i class='icon-filter'></i>"
                    runat="server" OnClick="btnRemoveFilter_Click">
                </asp:LinkButton>
                <asp:LinkButton ID="btnadd" class="btn btn-xs default" Text="Add <i class='icon-plus'></i>" 
                    runat="server" OnClick="btnadd_Click"></asp:LinkButton>
            </div>
        </div>
        
        <div id="portlet-detail-grid" class="portlet-body">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                AllowPaging="true" OnPageIndexChanging="OnPaging" PageSize="10" AllowSorting="true"
                OnSorting="OnSorting" OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                class="table table-striped table-bordered table-hover">
                <Columns>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="UID" CssClass="" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProposalID" runat="server" Text="Proposal ID"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtProposalID" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="ProposalID" CommandArgument="ProposalID"></asp:LinkButton>
                                <a href="#" id="fltProposalID" data-filterex="ProposalID"><i class="icon-filter"></i>
                                </a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProposalID" CssClass="" runat="server" Text='<%#Eval("ProposalID")%>'></asp:Label>
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
                            <asp:Label ID="lblManager" runat="server" Text="Manager"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtManager" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="Manager" CommandArgument="Manager"></asp:LinkButton>
                                <a href="#" id="fltManager" data-filterex="Manager"><i class="icon-filter">
                                </i></a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Manager" CssClass="" runat="server" Text='<%#Eval("Manager")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblLeader" runat="server" Text="Leader"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtLeader" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Leader" CommandArgument="Leader"></asp:LinkButton>
                                <a href="#" id="fltLeader" data-filterex="Leader"><i class="icon-filter"></i></a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Leader" CssClass="" runat="server" Text='<%#Eval("Leader")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtDepartment" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Department" CommandArgument="Department"></asp:LinkButton>
                                <a href="#" id="fltDepartment" data-filterex="Department"><i class="icon-filter"></i></a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Department" CssClass="" runat="server" Text='<%#Eval("Department")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblOffered" runat="server" Text="Offered"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Offered" CssClass="" runat="server" Text='<%#Eval("Offered")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAgreed" runat="server" Text="Agreed"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Agreed" CssClass="" runat="server" Text='<%#Eval("Agreed")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                            <div class="pull-right">
                                <asp:LinkButton ID="srtStatus" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Status" CommandArgument="Status"></asp:LinkButton>
                                <a href="#" id="fltStatus" data-filterex="Status"><i class="icon-filter"></i></a>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Status" CssClass="" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_project" name="btn_project" type="submit" class="btn green btn-xs" ToolTip="Create Project"
                                runat="server" Text="<i class='icon-plus'></i>" OnClick="btn_project_Click">
                            </asp:LinkButton>
                            <asp:LinkButton ID="btn_delete" name="btn_delete" type="submit" class="btn purple btn-xs" ToolTip="Delete Proposal"
                                runat="server" Text="<i class='icon-remove'></i>" OnClientClick="javascript:return deleteItem(this);"  
                                OnCommand="btn_delete_Click">
                                <%--OnClientClick="return confirm('Are you sure?')"--%>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btn_select" name="btn_select" type="submit" class="btn red btn-xs" ToolTip="Edit"
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
    
    <div id="dialog" title="Delete Proposal">Are you sure?</div>
    
        <script>

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
            jQuery(document).ready(function() {
                $("#dialog").dialog({
                    autoOpen: false,
                    modal: true,
                    closeOnEscape: false
                });
                

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
