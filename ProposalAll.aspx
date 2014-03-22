<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProposalAll.aspx.cs" Inherits="KedSys35.ProposalAll" Title="Kadence | Proposal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
  <%--<script src="http://code.jquery.com/jquery-1.9.1.js"></script>--%>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <script type="text/javascript" src="assets/plugins/jquery.responsivetable.js"></script>
  <script type="text/javascript" src="assets/plugins/jquery.formatCurrency-1.4.0.min.js"></script>
  <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
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
                <li><i class="icon-home"></i><a href="ProposalDashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="ProposalAll.aspx">Proposal</a></li>
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
                <asp:LinkButton ID="btnGridManage" name="btnGridManage" type="submit"  class="btn default btn-xs" ToolTip="Column Selection & Filter"
                    runat="server" Text="<i class='icon-reorder'></i>" OnClientClick="return GridManage();">
                </asp:LinkButton>
            </div>
        </div>
        
        <div id="portlet-detail-grid" class="portlet-body">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                AllowPaging="true" OnPageIndexChanging="OnPaging" PageSize="10" AllowSorting="true"
                OnSorting="OnSorting" OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                class="tablefontxsm table table-striped table-bordered table-hover zrestable" HeaderStyle-Wrap="false" RowStyle-Wrap="false">
                <Columns>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="UID" CssClass="" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProposalID" runat="server" Text="Proposal ID"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtProposalID" runat="server" Text="<i class='icon-sort'></i>"
                                    CommandName="Sort" SortExpression="ProposalID" CommandArgument="ProposalID"></asp:LinkButton>
                                <%--<a href="#" id="fltProposalID" data-filterex="ProposalID"><i class="icon-filter"></i>
                                </a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProposalID" CssClass="" runat="server" Text='<%#Eval("ProposalID")%>'></asp:Label>
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
                            <asp:Label ID="lblProposalDesc" runat="server" Text="Description"></asp:Label>
                           <%-- <div class="pull-right">--%>
                                <asp:LinkButton ID="srtProposalDesc" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="ProposalDesc" CommandArgument="ProposalDesc"></asp:LinkButton>
                                <%--<a href="#" id="fltProposalDesc" data-filterex="ProposalDesc"><i class="icon-filter"></i></a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProposalDesc" CssClass="" ToolTip='<%#Eval("ProposalDesc")%>' runat="server" Text='<%#Eval("ProposalDescShort")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTypeofstudy" runat="server" Text="Type of Study"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtTypeofstudy" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Typeofstudy" CommandArgument="Typeofstudy"></asp:LinkButton>
                               <%-- <a href="#" id="fltTypeofstudy" data-filterex="Typeofstudy"><i class="icon-filter"></i></a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Typeofstudy" CssClass="" runat="server" Text='<%#Eval("Typeofstudy")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblProbability" runat="server" Text="Probability"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Probability" CssClass="" runat="server" Text='<%#Eval("Probability")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblProbabilityValue" runat="server" Text="Probability Value"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProbabilityValue" CssClass="zCurrNoDec" runat="server" Text='<%#Eval("ProbabilityValue")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblDuedate" runat="server" Text="Due date"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Duedate" CssClass="" runat="server" Text='<%#Eval("Duedate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblSenddate" runat="server" Text="Sent date"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Senddate" CssClass="" runat="server" Text='<%#Eval("Senddate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                            <%--<div class="pull-right">--%>
                                <asp:LinkButton ID="srtStatus" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Status" CommandArgument="Status"></asp:LinkButton>
                                <%--<a href="#" id="fltStatus" data-filterex="Status"><i class="icon-filter"></i></a>--%>
                            <%--</div>--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Status" CssClass="" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAgency" runat="server" Text="Agency"></asp:Label>
                                <asp:LinkButton ID="srtAgency" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Agency" CommandArgument="Agency"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Agency" CssClass="" runat="server" Text='<%#Eval("Agency")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblMgrName" runat="server" Text="Manager"></asp:Label>
                                <asp:LinkButton ID="srtMgrName" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="MgrName" CommandArgument="MgrName"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="MgrName" CssClass="" runat="server" Text='<%#Eval("MgrName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblLeaderName" runat="server" Text="Leader"></asp:Label>
                                <asp:LinkButton ID="srtLeaderName" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="LeaderName" CommandArgument="LeaderName"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LeaderName" CssClass="" runat="server" Text='<%#Eval("LeaderName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblBroadCategory" runat="server" Text="Broad Category"></asp:Label>
                                <asp:LinkButton ID="srtBroadCategory" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="BroadCategory" CommandArgument="BroadCategory"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="BroadCategory" CssClass="" runat="server" Text='<%#Eval("BroadCategory")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblRFQRefDate" runat="server" Text="RFQ/RFP Date"></asp:Label>
                                <asp:LinkButton ID="srtRFQRefDate" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="RFQRefDate" CommandArgument="RFQRefDate"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="RFQRefDate" CssClass="" runat="server" Text='<%#Eval("RFQRefDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                                <asp:LinkButton ID="srtDepartment" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Department" CommandArgument="Department"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Department" CssClass="" runat="server" Text='<%#Eval("Department")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblMarket" runat="server" Text="Market"></asp:Label>
                                <asp:LinkButton ID="srtMarket" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Market" CommandArgument="Market"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Market" CssClass="" runat="server" Text='<%#Eval("Market")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblApprovaldate" runat="server" Text="Approval Date"></asp:Label>
                                <asp:LinkButton ID="srtApprovaldate" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Approvaldate" CommandArgument="Approvaldate"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Approvaldate" CssClass="" runat="server" Text='<%#Eval("Approvaldate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProjectType" runat="server" Text="Project Type"></asp:Label>
                                <asp:LinkButton ID="srtProjectType" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="ProjectType" CommandArgument="ProjectType"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ProjectType" CssClass="" runat="server" Text='<%#Eval("ProjectType")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblOffered" runat="server" Text="Offered"></asp:Label>
                                <asp:LinkButton ID="srtOffered" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Offered" CommandArgument="Offered"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Offered" CssClass="zCurrNoDec" runat="server" Text='<%#Eval("Offered")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCurrencyType" runat="server" Text="Currency Type"></asp:Label>
                                <asp:LinkButton ID="srtCurrencyType" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="CurrencyType" CommandArgument="CurrencyType"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CurrencyType" CssClass="" runat="server" Text='<%#Eval("CurrencyType")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblAgreed" runat="server" Text="Agreed"></asp:Label>
                                <asp:LinkButton ID="srtAgreed" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="Agreed" CommandArgument="Agreed"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Agreed" CssClass="zCurrNoDec" runat="server" Text='<%#Eval("Agreed")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblAgreedBaseCurrency" runat="server" Text="Agreed (Base)"></asp:Label>
                                <asp:LinkButton ID="srtAgreedBaseCurrency" runat="server" Text="<i class='icon-sort'></i>" CommandName="Sort"
                                    SortExpression="AgreedBaseCurrency" CommandArgument="AgreedBaseCurrency"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="AgreedBaseCurrency" CssClass="zCurrNoDec" runat="server" Text='<%#Eval("AgreedBaseCurrency")%>'></asp:Label>
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
    
    <div id="divGridManage" class="modal" tabindex="-1" data-backdrop="static" data-keyboard="false" >
        <div class="modal-body modal-body-center" style="max-width:1200px">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Column Selection & Filter</div>
                </div>
                <div class="portlet-body form">
                    <div class="row" style="padding-left:15px">
                        <div class="col-md-4">
                            <div class="form-group">
                                <h4>Columns</h4>                                <div class="checkbox-list">                                    <label><asp:CheckBox id="gchkCol1" Checked="true" class="input-small" runat="server"/>Proposal ID</label>
                                    <label><asp:CheckBox id="gchkCol2" Checked="true" class="input-small" runat="server"/>Client Name</label>
                                    <label><asp:CheckBox id="gchkCol3" Checked="true" class="input-small" runat="server"/>Coordinator</label>
                                    <label><asp:CheckBox id="gchkCol4" Checked="true" class="input-small" runat="server"/>Description</label>
                                    <label><asp:CheckBox id="gchkCol5" Checked="true" class="input-small" runat="server"/>Type of Study</label>
                                    <label><asp:CheckBox id="gchkCol6" Checked="true" class="input-small" runat="server"/>Probability</label>
                                    <label><asp:CheckBox id="gchkCol7" Checked="true" class="input-small" runat="server"/>Probability Value</label>
                                    <label><asp:CheckBox id="gchkCol8" Checked="true" class="input-small" runat="server"/>Due date</label>
                                    <label><asp:CheckBox id="gchkCol9" Checked="true" class="input-small" runat="server"/>Sent date</label>
                                    <label><asp:CheckBox id="gchkCol10" Checked="true" class="input-small" runat="server"/>Status</label>
                                    <label><asp:CheckBox id="gchkCol11" class="input-small" runat="server"/>Agency</label>
                                    <label><asp:CheckBox id="gchkCol12" class="input-small" runat="server"/>Manager</label>
                                    <label><asp:CheckBox id="gchkCol13" class="input-small" runat="server"/>Leader</label>
                                    <label><asp:CheckBox id="gchkCol14" class="input-small" runat="server"/>Broad Category</label>
                                    <label><asp:CheckBox id="gchkCol15" class="input-small" runat="server"/>RFQ/RFP Date</label>
                                    <label><asp:CheckBox id="gchkCol16" class="input-small" runat="server"/>Department</label>
                                    <label><asp:CheckBox id="gchkCol17" class="input-small" runat="server"/>Market</label>
                                    <label><asp:CheckBox id="gchkCol18" class="input-small" runat="server"/>Approval Date</label>
                                    <label><asp:CheckBox id="gchkCol19" class="input-small" runat="server"/>Project Type</label>
                                    <label><asp:CheckBox id="gchkCol20" class="input-small" runat="server"/>Offered</label>
                                    <label><asp:CheckBox id="gchkCol21" class="input-small" runat="server"/>Currency Type</label>
                                    <label><asp:CheckBox id="gchkCol22" class="input-small" runat="server"/>Agreed</label>
                                    <label><asp:CheckBox id="gchkCol23" class="input-small" runat="server"/>Agreed (in Base Currency)</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group" style="padding-right:15px">
                                <h4>Filter</h4>
                                <div class="controls">                                    <label class="control-label">Proposal ID</label>
                                    <asp:TextBox ID="fltduProposalID" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddProposalID"  class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                <div class="controls">                                    <label class="control-label">Client Name</label>
                                    <asp:TextBox ID="fltduClientName" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddClientName" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                <div class="controls">                                    <label class="control-label">Coordinator Name</label>
                                    <asp:TextBox ID="fltduCoordinatorName" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddCoordinatorName" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                <div class="controls">                                    <label class="control-label">Type of Study</label>
                                    <asp:TextBox ID="fltduTypeofstudy" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddTypeofstudy" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                
                                <div class="controls">                                    <label class="control-label">Status</label>
                                    <asp:TextBox ID="fltduStatus" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddStatus" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                
                                <div class="controls">                                    <label class="control-label">Manager</label>
                                    <asp:TextBox ID="fltduMgrName" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddMgrName" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                
                                <div class="controls">                                    <label class="control-label">Leader</label>
                                    <asp:TextBox ID="fltduLeaderName" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddLeaderName" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                
                                <div class="controls">                                    <label class="control-label">Broad Category</label>
                                    <asp:TextBox ID="fltduBroadCategory" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddBroadCategory" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                
                                <div class="controls">                                    <label class="control-label">Department</label>
                                    <asp:TextBox ID="fltduDepartment" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddDepartment" class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group" style="padding-right:15px">
                                <h4> </h4>
                                <div class="controls">                                    <label class="control-label">Probability</label>
                                    <asp:TextBox ID="fltduProbability" CssClass="zdufilter" runat="server" style="display:none"></asp:TextBox> 
                                    <asp:DropDownList ID="fltddProbability"  class="form-control select2me zddfilter" multiple runat="server"></asp:DropDownList>
                                </div>
                                
                                <div class="controls">                                    <label class="control-label">Probability Value</label>
                                    <div class="row">                                        <div class="col-md-3">                                            <asp:DropDownList ID="fltNCProbabilityValue"  class="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="fltNCVProbabilityValue" CssClass="form-control znumeric" runat="server" ></asp:TextBox> 
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="controls">                                    <label class="control-label">Due Date</label>
                                    <div class="row">                                        <div class="col-md-3">                                            <asp:DropDownList ID="fltDCDuedate"  class="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="fltDCVDuedate" CssClass="form-control zdate" runat="server" ></asp:TextBox> 
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="controls">                                    <label class="control-label">Sent Date</label>
                                    <div class="row">                                        <div class="col-md-3">                                            <asp:DropDownList ID="fltDCSenddate"  class="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="fltDCVSenddate" CssClass="form-control zdate" runat="server" ></asp:TextBox> 
                                        </div>
                                    </div>
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
    
    <div id="dialog" title="Delete Proposal">Are you sure?</div>
    
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

                $('.sidebar-toggler').change(function() {
                    alert("test");
                });

            });

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

                $('.zddfilter').on("change", function(e) {
                    var data1 = $(this).select2('val');
                    var targetidcell = $(this).closest('div').find('.zdufilter');
                    $(targetidcell).val(JSON.stringify(data1));
                });

                if (jQuery().datepicker) {
                    $(".zdate")
                    .datepicker({
                        
                        rtl: App.isRTL(),
                        autoclose: true,
                        forceParse: true
                    })
                }

                $('.zCurrNoDec').formatCurrency({ roundToDecimalPlace: 0, symbol: '', groupDigits: true });

                $('.znumeric').change(function() {
                    if ($(this).val() != "") {
                        $(this).val($(this).asNumber());
                        $(this).formatCurrency({ roundToDecimalPlace: 0, symbol: '', groupDigits: true });
                    }
                });

                $('#portlet-detail-grid').bind('resize', function() {
                    alert("test");
                });

                $("#portlet-detail-grid").on("webkitTransitionEnd transitionend oTransitionEnd", function() {
                    alert("Size Changed!");
                });

                

                $('#<%=GridView1.ClientID %>').responsiveTable({
                    staticColumns: 0,
                    scrollRight: false,
                    scrollHintEnabled: false
                });


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
