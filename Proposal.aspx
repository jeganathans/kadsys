<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proposal.aspx.cs" Inherits="KedSys35.WebForm5" Title="Kadence | Proposal" %>
<%@ Import Namespace="System.Data" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral,
 PublicKeyToken=31bf3856ad364e35"
 Namespace="System.Web.UI" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script> 
    <script type="text/javascript" src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript" ></script>
    <script src="assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript" ></script>
    <script type="text/javascript" src="assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery.formatCurrency-1.4.0.min.js"></script>
        
    <script src="assets/scripts/proposal-wizard.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
    <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="formproposal" name="formproposal" class="form" runat="server">
        <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Proposal
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="ProposalDashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="ProposalAll.aspx">Proposal</a></li>
                <li id="brdliPageID">
                    <i class="icon-angle-right"></i>
                    <a id="brdPageID" href="Proposal.aspx" runat="server"></a>
                </li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
        <asp:HiddenField ID="hidUID" runat="server"  enableviewstate="true" />
        <asp:HiddenField ID="hidtab" runat="server" />
        <asp:HiddenField ID="hidtoaster" runat="server" />
        <asp:HiddenField ID="hidactiveoption" runat="server" />
        <asp:HiddenField ID="hidoption" runat="server" />
        <asp:HiddenField ID="hidTotalHours" runat="server" />
        <asp:HiddenField ID="hidProjRef" runat="server" />
        <asp:HiddenField ID="hidProjRefNext" runat="server" />
    </div>
        <div class="row">
        <div class="col-md-12">
            <div id="form_wizard_1" class="portlet box green" >
                <div class="portlet-title">
                    <div class="caption">Proposal Wizard - <span class="step-title">Step 1 of 3</span></div>
                </div>
                <div class="portlet-body form">
                     <div id="submit_form">
                        <div class="form-wizard">
                           <div class="form-body">
                                <ul id="proptab" class="nav nav-pills nav-justified steps">
                                 <li>
                                    <a href="#tab1" data-toggle="tab" class="step">
                                    <span class="number">1</span>
                                    <span class="desc"><i class="icon-ok"></i> Proposal Entry</span>   
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#tab2" data-toggle="tab" class="step">
                                    <span class="number">2</span>
                                    <span class="desc"><i class="icon-ok"></i> Costing</span>   
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#tab3" data-toggle="tab" class="step active">
                                    <span class="number">3</span>
                                    <span class="desc"><i class="icon-ok"></i> Activity</span>   
                                    </a>
                                 </li>
<%--                                 <li>
                                    <a href="#tab4" data-toggle="tab" class="step">
                                    <span class="number">4</span>
                                    <span class="desc"><i class="icon-ok"></i> Confirm</span>   
                                    </a> 
                                 </li>--%>
                              </ul>
                                <div id="bar" class="progress progress-striped" role="progressbar">
                                 <div class="progress-bar progress-bar-success"></div>
                              </div>
                              <div id="method_div" style="display: none">
                                                        <asp:ListView ID="lvMethod" runat="server">
                                                            <LayoutTemplate>
                                                                <ul class="sub-menu">
                                                                    <div class="form-group">
                                                                    <label class="control-label col-md-2">Methods</label>
                                                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                                                    </div>
                                                                </ul>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                <li class="dmlvmethod badge badge-default badge-roundless curpointer">
                                                                    <%#Eval("Method")%>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:ListView ID="lvCity" runat="server">
                                                            <LayoutTemplate>
                                                                <ul class="sub-menu">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-2">City</label>
                                                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                                                    </div>
                                                                </ul>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                <li class="dmlvcity badge badge-default badge-roundless curpointer">
                                                                    <%#Eval("City")%>
                                                                </li>
                                                            </ItemTemplate>
                                                            <EmptyDataTemplate>
                                                                <p>
                                                                    Nothing here.</p>
                                                            </EmptyDataTemplate>
                                                        </asp:ListView>
                                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab1">
                                        <div action="#" class="horizontal-form">
                                            <div class="form-body" style="display:none">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Proposal ID<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtProposalID" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Proposal Description<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtProposalDesc" class="form-control" TextMode="multiline" rows ="3" type="textarea" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Client Name<span class="required">*</span></label>
                                                            <div class="pull-right">
                                                                <asp:LinkButton ID="btn_addclient" name="btn_addclient" class="btn green btn-xs" ToolTip="Add New Client"
                                                                    Text="<i class='icon-plus-sign'></i>" OnClientClick="return addclientclick();" runat="server" >
                                                                </asp:LinkButton>
                                                            </div>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddClientName" class="form-control select2me" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ClientIndexChanged"></asp:DropDownList>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Agency<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="duAgency" CssClass="zduAgency" runat="server" style="display:none"></asp:TextBox> 
                                                                <asp:DropDownList ID="ddAgency" name ="ddAgency" class="form-control select2me zddAgency" multiple runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Coordinator</label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddCoordinator" class="form-control select2me" runat="server" 
                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddCoordinator_SelectedIndexChanged" >
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Due Date<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtDueDate" class="form-control form-control-inline date-picker"
                                                                    runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Manager<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddManager" class="form-control select2me" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Sent Date</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtSenddate" class="form-control form-control-inline date-picker zCBA" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Leader<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddLeader" class="form-control select2me" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Approval Date</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtApprovaldate" class="form-control form-control-inline date-picker" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Broad Category<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddBroadCategory" class="form-control select2me" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Type of Industry<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddTypeofstudy" class="form-control select2me" runat="server">
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
                                                                RFQ/RFP Date<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtRFQRefDate" class="form-control form-control-inline date-picker-past" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Project Type<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddProjectType" class="form-control select2me" runat="server">
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
                                                                Department<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddDepartment" class="form-control select2me" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <%--<div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Project Description</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox id = txtProjectDesc class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Probability<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddProbability" class="form-control select2me" runat="server">
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
                                                                Market<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddMarket" class="form-control select2me" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <label class="control-label input-medium">CurrencyType</label>
                                                                <label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values</label>
                                                            </div>
                                                            <div class="input-group">
                                                                <asp:DropDownList ID="ddCurrencyType" class="form-control input-medium select2me zCBA" runat="server"></asp:DropDownList>
                                                                <div class="col-md-6">
                                                                    <asp:TextBox ID="txtValue" class="form-control input-medium camt" type="text" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                                <label class="control-label">Offered</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtOffered" class="form-control camt" type="text" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <label class="control-label input-medium">Agreed</label>
                                                                <label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Agreed (in Base Currency)</label>
                                                            </div>
                                                            <div class="input-group input-groupd">
                                                                <asp:TextBox ID="txtAgreed" class="form-control input-medium camt zCBA" type="text" runat="server"></asp:TextBox>
                                                                <div class="col-md-6">
                                                                    <asp:HiddenField ID="hidBaseCurrency" runat="server" />
                                                                    <asp:TextBox ID="txtAgreedBase" CssClass="form-control input-medium camt" type="text" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Status<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddStatus" class="form-control select2me" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Comments</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtComments" class="form-control" TextMode="multiline" rows ="3" type="textarea" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab2">
                                        <div action="#" class="horizontal-form">
                                            <div class="form-body" style="display:none">
                                                <div style="width: 100%; height: 100%; overflow: scroll">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                    OnRowDataBound="gv_RowCommand" CellPadding="0"
                                                    class="proptable table-bordered">
                                                    <Columns>
                                                        <asp:TemplateField Visible="false" >
                                                            <ItemTemplate>
                                                                <asp:Label style="display: none" ID="Code" CssClass="" runat="server" Text='<%#Eval("Code")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblCostItemname" CssClass="boxleft" runat="server" Text="Cost"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="CostItemname" Width="150px" CssClass="boxleft" runat="server" Text='<%#Eval("CostItemname")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption1 runat="server" border="1">
                                                                    <%--<asp:TableRow>
                                                                        <asp:TableCell>Option 1<i class="icon-folder-close pull-right"></i></asp:TableCell>
                                                                    </asp:TableRow>--%>
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption1 data-tableoption="1" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption2 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption2 data-tableoption="2" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption3 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption3 data-tableoption="3" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption4 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption4 data-tableoption="4" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption5 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption5 data-tableoption="5" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption6 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption6 data-tableoption="6" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption7 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption7 data-tableoption="7" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption8 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption8 data-tableoption="8" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption9 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption9 data-tableoption="9" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="noPad" ItemStyle-CssClass="noPad" >
                                                            <HeaderTemplate>
                                                                <asp:Table ID=tbpoption10 runat="server" border="1">
                                                                </asp:Table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Table ID=tbdoption10 data-tableoption="10" runat="server" >
                                                                    <asp:TableRow>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab3">
                                        <div action="#" class="horizontal-form">
                                            <div class="form-body upheight" style="display:none">
                                            
        
                                            <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="panelemppanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
    <ContentTemplate>                                            
        <div class="nomargintop">
            <div class="listleftside">
                <asp:DropDownList ID="ddEmpDept" CssClass="form-control" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="DDEmpDept_Changed">
                </asp:DropDownList>
                <asp:ListView ID="lvEmployee" runat="server">
                    <LayoutTemplate>
                        <ul class="clearfix nopadingleft">
                            <input id="empfilt" class="form-control csearchbg" />
                            <%--<div class="scroller" style="height:400px" data-always-visible="1" data-rail-visible="0">--%>
                            <div class="clearfix zemplist">
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </div>
                            <%--</div>--%>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <%--<div>--%>
                            <li class="btn btn-xs default margin1 textleft curpointer" style="width:200px" data-emp="yes"
                                data-employeeid="<%#Eval("EmployeeID")%>">
                                <%#Eval("EmpName")%>
                            </li>
                            <div></div>
                        <%--</div>--%>
                    </ItemTemplate>
                </asp:ListView>
            </div>
      
    <div class="marginleft250 nopadingtop">
    <asp:ListView ID="lvTasks" runat="server">
        <LayoutTemplate>
            <ul class="sub-menu nopadingleft">
                <div class="form-group">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </div>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li class="btn btn-xs default margin1 textleft curpointer" style="width:140x" data-task="yes">
                <%#Eval("TaskName")%>
            </li>
        </ItemTemplate>
    </asp:ListView>
                                                
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                                                    <ContentTemplate>
                                                        <asp:GridView runat="server" ID="grdTasks" AutoGenerateColumns="false"
                                                            OnRowDataBound="grdTasks_OnRowDataBound"
                                                            class="proptable table-bordered">
                                                            <Columns>
                                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="UID" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                
                                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="EmployeeID" CssClass="boxlefttrans" runat="server" Text='<%#Eval("EmployeeID")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblEmployee" runat="server" Text="Employee"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="EmpName" CssClass="boxlefttrans" runat="server" Width="180px" 
                                                                            style="max-width: 180px" Text='<%#Eval("EmpName")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblTaskName" runat="server" Text="Task Name"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TaskName" CssClass="boxlefttrans" runat="server" Width="180px" 
                                                                            style="max-width: 180px" Text='<%#Eval("TaskName")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblStart" runat="server" Text="Start Date"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <input name="StartDateH" style="max-width: 100px" class="boxlefttrans date-picker-start"  size="16" type="text" value='<%#Eval("StartDate")%>'/>
                                                                        <asp:TextBox ID="StartDate" style="max-width: 100px" CssClass="hidden" runat="server" Text='<%#Eval("StartDate")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblEnd" CssClass="boxleft" runat="server" Text="End Date"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <input name="EndDateH" style="max-width: 100px" class="boxlefttrans date-picker-end"  size="16" type="text" value='<%#Eval("EndDate")%>'/>
                                                                        <asp:TextBox ID="EndDate" style="max-width: 100px" CssClass="hidden" runat="server" Text='<%#Eval("EndDate")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblHours" CssClass="text-center" style="max-width: 75px" runat="server" Text="Hours per Day"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="Hours" style="max-width: 75px" CssClass="cboxHours text-right" runat="server" Text='<%#Eval("Hours")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblNoDays" CssClass="text-center" style="max-width: 75px" runat="server" Text="No of Days"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="NoDays" style="max-width: 75px" CssClass="cbox text-right" runat="server" Text='<%#Eval("NoDays")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblStatus" CssClass="text-center" runat="server" Text="Status"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="imgstatus" runat="server" Visible="false" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="btn_deletetask" name="btn_deletetask" type="submit" class="btn purple btn-xs" ToolTip="Delete Task"
                                                                            runat="server" Text="<i class='icon-remove'></i>" OnCommand="btn_deletetask">
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="RecordSequence" runat="server" Text='<%#Eval("RecordSequence")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:Button ID="btnupdatetask" style="display:none" runat="server" Text="Button" OnClick="btnupdatetask_Click" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnupdatetask" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddEmpDept" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="grdTasks" EventName="RowDataBound" />
                                                    </Triggers>
                                                </asp:UpdatePanel>  
      </div>
      </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddEmpDept" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
   </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab4">
                                    </div>
                                </div>
                           </div>
                           <div class="form-actions right">
                              <div class="row">
                                 <div class="col-md-12">
                                    <div class="col-md-offset-3 col-md-9">
                                       <a href="ProposalAll.aspx" class="cancel btn default">Cancel</a>
                                       <a href="javascript:;" class="btn default button-previous">
                                       <i class="m-icon-swapleft"></i> Back 
                                       </a>
                                       <a href="javascript:;" class="btn green button-next">
                                       Continue <i class="m-icon-swapright m-icon-white"></i>
                                       </a>
                                       <asp:LinkButton ID=btnCreateProject Text="Create Project" 
                                        class="btn green" runat="server" OnClick="btnproject_Click" OnClientClick="return setcurrentTab();" style="display:none"/>
                                       <asp:LinkButton ID=btnsave Text="Save" 
                                        class="btn green" runat="server" OnClick="btnsave_Click" OnClientClick="return setcurrentTab();"/>
                                       <asp:LinkButton ID=btnsavecontinue Text="Save & Continue <i class='m-icon-swapright m-icon-white'></i>" 
                                        class="btn green button-save" runat="server" OnClick="btnsavecontinue_Click" OnClientClick="return setcurrentTab();"/>
                                       <asp:LinkButton ID=btnfinalsumbit Text="Submit <i class='m-icon-swapright m-icon-white'></i>" 
                                        class="btn green button-submit" type="submit" runat="server" OnClick="btnfinalsumbit_Click" style="display:none"/>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                
            </div>
        </div>
    </div>
    
    <div id="divTimecost" class="modal" tabindex="-1" data-backdrop="static" data-keyboard="false">
        <div class="modal-body modal-body-center">
            <div id="portlet-control" class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Time Cost</div>
                </div>
                <div id="portlet-detail" class="portlet-body form">
                    <asp:HiddenField ID="hidTimecost" runat="server" />
                    <asp:GridView ID="grdTimecost" runat="server" Width="100%" AutoGenerateColumns="False"
                        class="table-striped table-bordered table-hover" OnRowDataBound="grdTimecost_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderStyle-CssClass="gridthcenter">
                                <HeaderTemplate>
                                    <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="TitleDec" CssClass="boxleft" runat="server" Text='<%#Eval("TitleDec")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridthcenter">
                                <HeaderTemplate>
                                    <asp:Label ID="lbldays" runat="server" Text="No of Days"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="NoofDays" CssClass="boxttans text-right" data-numeric="yes" runat="server" Text="0"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div class="form-actions form-actions-half right">
                        <asp:Button ID="btnTimeCostOk" class="btn green" runat="server" Text="Ok" OnClick="lbtnTimeCostOK_Click"
                            UseSubmitBehavior="false" data-dismiss="modal" />
                        <input id="btnTimeCostCancel" type="button" data-dismiss="modal" class="btn default"
                            onclick="$('#divTimecost').hide();$('#<%= hidTimecost.ClientID %>').val('');"
                            value="Cancel">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <div id="divAddClient" class="modal" tabindex="-1" data-backdrop="static" data-keyboard="false">
        <div class="modal-body modal-body-center">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Add New Client</div>
                </div>
                <div class="portlet-body form">
                    <div class="row" style="padding-left:15px">
                        <div class="col-md-9">
                            <div class="form-group">
                                <label class="control-label">Client Name<span class="required">*</span></label>
                                <div class="input-groupd">
                                <asp:TextBox id = "txtaccname" name="txtaccname" class="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions form-actions-half right">
                        <asp:Button ID="btnaddClient" class="btn green" runat="server" Text="Ok" OnClick="btnAddNewClient"
                            UseSubmitBehavior="false" />
                        <input id="btn_addCancel" type="button" data-dismiss="modal" class="btn default"
                            onclick="$('#divAddClient').hide();"
                            value="Cancel">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    
            function addclientclick() {
                    $('#divAddClient').css('height',250);
                    $('#divAddClient').css({ 'margin-top': window.pageYOffset - $(this).height() / 2, 'top': '50%' });
                    $('#divAddClient').css({ 'margin-left': window.pageXOffset - $(this).width() / 2, 'left': '50%' });
                    $("#<%= txtaccname.ClientID %>").val('');
                    $("#<%= btnaddClient.ClientID %>").hide();
                    $('#divAddClient').modal({'backdrop': 'static'});
                    return false;
                }
            
            jQuery(document).ready(function() {
            
                
                
                $("#<%= txtaccname.ClientID %>").keyup(function() {
                    if ($("#<%= txtaccname.ClientID %>").val() == '')
                        $("#<%= btnaddClient.ClientID %>").hide();
                    else
                        $("#<%= btnaddClient.ClientID %>").show();
                });
            });
            
            function clientaddcheck() {
                if ($("#<%= txtaccname.ClientID %>").val() == '')
                {
                    alert("Please input client name");
                    return false;
                }   
                else
                    return true;
                
            }
    
            function setcurrentTab() {
                if ($('form').valid() == false) {
                        return false;
                }
                
                var $valid = checkvalid();
                if(!$valid) {
                    toastr.options = {
                        closeButton: true,
                        timeOut: "6000",
                        positionClass: "toast-bottom-full-width",
                        onclick: null
                    };
                    var $toast = toastr["warning"]("Please correct the errors", "Validation Failed");
                    return false;
                } 
                
                var currentTab = $("ul#proptab li.active").find('a').attr('href');
                $("#<%= hidtab.ClientID %>").val(currentTab);
                return true;
            }
            
            /*function enableproject() {
                if ($("#<%= ddStatus.ClientID %>").val() == "Won")
                {
                    if ($("#<%= hidProjRef.ClientID %>").val() == "")
                        $("#<%= btnCreateProject.ClientID %>").show();
                    else
                        $("#<%= btnCreateProject.ClientID %>").hide();
                }
                else
                    $("#<%= btnCreateProject.ClientID %>").hide();
            }*/
            
            jQuery(document).ready(function() {
                //enableproject();
                
                //$("#<%= ddStatus.ClientID %>").change(function() {
                //    enableproject();
                //});
                if ($("#<%= hidProjRefNext.ClientID %>").val().length > 0)
                    $("#<%= btnCreateProject.ClientID %>").show();
                else
                    $("#<%= btnCreateProject.ClientID %>").hide();
                
                
                $('.button-submit').click(function() {
                    var form = $('form');
                    var $valid = form.valid();
                    if(!$valid) {
                        //form.focusInvalid();
                        return false;
                    } 
                    
                    var $valid = checkvalid();
                    if(!$valid) {
                        toastr.options = {
                            closeButton: true,
                            timeOut: "6000",
                            positionClass: "toast-bottom-full-width",
                            onclick: null
                        };
                        var $toast = toastr["warning"]("Please correct the errors", "Validation Failed");
                        return false;
                    } 
                    
                    enabletotalforpb();
                });
            });
            
            function enabletotalforpb() {
                var gtable = $('table[data-tableoption]');
                var allinputs = gtable.find('input');
                $.each(allinputs, function(index, oinput) {
                    oinput.disabled = false;
                });
            }
            
            function resizetablewidth() {
                var otable = $('table[data-tbwidth]');
                $.each(otable, function(index, otable) {
                    //otable.width = otable.attributes["data-tbwidth"].value;
                    var otd = $(otable).find('td');
                    var totwid = 0;
                    $.each(otd, function(index, otd) {
                        totwid = totwid + parseInt(otd.style.width);
                    });
                    otable.width = totwid;
                    otable.setAttribute('data-tbwidth',totwid);
                });
            }
            
            function resizetablewidth(tboption) {
                var otable = $(".cssho" + tboption).closest('table');
                $.each(otable, function(index, otable) {
                    //otable.width = otable.attributes["data-tbwidth"].value;
                    var otd = $(otable).find('td');
                    var totwid = 0;
                    $.each(otd, function(index, otd) {
                        //if ($.isNumeric(parseInt(otd.style.width)))
                        totwid = totwid + parseInt(otd.style.width);
                    });
                    if ($.isNumeric(totwid))
                        otable.width = totwid;
                    else
                    {
                        var oth = $(otable).find('tr:eq(1)').find('td');
                        var totwid = 0;
                        var totcspan = 0;
                        var cspan;
                        $.each(oth, function(index, oth) {
                            cspan = 1;
                            if ($.isNumeric(oth.colSpan))
                            {
                                cspan = oth.colSpan;
                                totcspan = totcspan + cspan;
                            }
                            if ($.isNumeric(parseInt(oth.style.width)))
                                totwid = totwid + (parseInt(oth.style.width) * cspan);
                        });
                        otable.width = totwid + (totcspan - 1);
                    }
                });
            }
            
            function setactiheight() {
                if ($('.marginleft250').height() < $('.listleftside').height())
                    $('.upheight').height($('.listleftside').height());
                 else
                    $('.upheight').height($('.marginleft250').height());
            }
            
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function() {
                LoadTaskScript();
                setactiheight();
            });
            
            function checkvalid() {
                var resValid;
                resValid = false;
                
                var hasvaluesAll = 1;
                
                $('.proptable tr').each(function (i, row) {
                    var inputs = $(row).closest('tr').find('input[data-taskinput]')
                    var emptytask = true;
                    var hasvalues = 1;
                    $.each(inputs, function(index, inputs) {
                        if (inputs.value.trim().length == 0)
                        { 
                            $(inputs).closest('td').find('input').addClass('cerrortask');
                            $(inputs).closest('td').find('input').attr("title", "Required");
                            hasvalues = 0;
                        }
                        else
                        {
                            emptytask = false;
                            $(inputs).closest('td').find('input').removeClass('cerrortask');
                            
                            if (inputs.name.indexOf("Hours") > 0 )
                            {
                                var ivalue = Number(inputs.value.replace(/[^0-9\.]+/g,""));
                                var tothours = Number($("[name$=hidTotalHours]")[0].value.replace(/[^0-9\.]+/g,""));
                                if (ivalue > tothours)
                                {
                                    $(inputs).closest('td').find('input').addClass('cerrortask');
                                    $(inputs).closest('td').find('input').attr("title", "Should be less than or equal to " + tothours + " Hours");
                                    hasvalues = 0;
                                }
                            }
                            
                            
                        }
                        
                    });
                    if (emptytask == true)
                    {
                        $(row).closest('tr').find('input').removeClass('cerrortask');
                        hasvalues = 1;
                    }
                    if (hasvalues == 0)
                        hasvaluesAll = 0;
                });
                
                if (hasvaluesAll == 1)
                {
                    if ($('.cerrortaskdup').length > 0 && $("ul#proptab li.active").find('a').attr('href') == "#tab3")
                        resValid = false;
                    else
                        resValid = true;
                }
                else
                    resValid = false;
                
                return resValid;
                
            }
            
            function CalculateBaseAmount() {
                var InvoiceDate = $("#<%= txtSenddate.ClientID %>").val();
                var BillingCurrency = $("#<%= ddCurrencyType.ClientID %>").val()
                var BillingAmount = $("#<%= txtAgreed.ClientID %>").val()
                var BaseCurrency = $("#<%= hidBaseCurrency.ClientID %>").val()
                
                if (InvoiceDate == "" || BillingCurrency == "" || BillingAmount == "")
                {
                    $("#<%= txtAgreedBase.ClientID %>").val("0.00");
                }
                else if (BaseCurrency == BillingCurrency)
                {
                    $("#<%= txtAgreedBase.ClientID %>").val(BillingAmount);
                    $("#<%= txtAgreedBase.ClientID %>").change();
                }
                else
                {
                    var response = '';
                    $.ajax({
                        type: "POST",
                        url: "Projects.aspx/CalculateBaseAmount",
                        async: false,
                        data: '{InvoiceDate: "' + InvoiceDate + '", BillingCurrency: "' + BillingCurrency + '", BillingAmount: "' + BillingAmount + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(data) {
                            response = data;
                            if (response.d == "Exchange Rate Not Available" || response.d == "Unable to calculate base amount.")
                            {
                                alert(response.d);
                                $("#<%= txtAgreedBase.ClientID %>").val("0.00");
                            }
                            else
                            {
                                $("#<%= txtAgreedBase.ClientID %>").val(response.d);
                                $("#<%= txtAgreedBase.ClientID %>").change();
                            }
                        },
                        failure: function() {
                            $("#<%= txtAgreedBase.ClientID %>").val("0.00");
                            alert("Unable to calculate base amount.");
                        }
                    }).responseText;
                    
                    
                }

            }
            
            function LoadTaskScript() {
            
                /*$("[name$=Hours]").inputmask("9.99",{
                    placeholder:" ", clearMaskOnLostFocus: true 
                });*/
                
                $('[data-dup="yes"]').attr("title", "This task is already assigned");
                $('[data-dup="yes"]').addClass('cerrortaskdup');
                $('[data-dup="no"]').removeClass('cerrortaskdup');
                
                $('.cboxHours').formatCurrency({roundToDecimalPlace:2,symbol:''});
                
                $('#empfilt').keyup(function(){
                   var valThis = $(this).val().toLowerCase();
                    $('.zemplist>li').each(function(){
                     var text = $(this).text().toLowerCase();
                        if ((text.indexOf(valThis) > 0) || valThis=="")
                            $(this).show();
                        else
                            $(this).hide();         
                   });
                   setactiheight();
                });
                 
            
                jQuery('input[data-newtask]').attr('readonly','readonly');
                jQuery('input[data-newemp]').attr('readonly','readonly');
                
                $('input[data-taskinput]').change(function() {
                    /*if (this.value.length == 0)
                    {
                        if ($(this).closest('tr').find("[name$=RecordSequence]").val() != "-1");
                        this.focus();
                        alert("Value could not be empty");
                    }
                    else*/
                    
                    if (this.name.indexOf("Hours") > 0 )
                    {
                        //var ivalue = Number(this.value.replace(/[^0-9\.]+/g,""));
                        var tothours = Number($("[name$=hidTotalHours]")[0].value.replace(/[^0-9\.]+/g,""));
                        
                        $(this).val($(this).asNumber());
                        $(this).formatCurrency({roundToDecimalPlace:2,symbol:'',groupDigits:false});
                        var ivalue = $(this).val();
                        if (ivalue > tothours)
                        {
                            $(this).closest('td').find('input').addClass('cerrortask');
                            $(this).closest('td').find('input').attr("title", "Should be less than or equal to " + tothours + " Hours");
                            return;
                        }
                        else
                            $(this).closest('td').find('input').removeClass('cerrortask');
                    }
                        checkupdate(this);
                });
                
                if (jQuery().datepicker) {
                    $(".date-picker-start")
                    .datepicker({
                        dateFormat: "mm/dd/yyyy",
                        rtl: App.isRTL(),
                        autoclose: true,
                        forceParse: true,
                        startDate: "0d"
                    })
                    .on('changeDate', function(ev, inst){
                        var newDate = $(this).datepicker("getDate");
                        if (!Date.parse(newDate))
                            return;
                        var newText = $(this)[0].value;
                        var objStart = $(this).closest('td').find('[data-taskinput]')[0];
                        var objStartDate = new Date(objStart.value);
                        var objEndH = $(this).closest('td').next('td').find('.date-picker-end')[0];
                        var objEnd = $(this).closest('td').next('td').find('[data-taskinput]')[0];
                        var objEndDate = new Date(objEnd.value);
                        if (objStartDate == newDate)
                            return;
                        else
                        {
                            objStart.value = newText;
                            $(objEndH).datepicker('setStartDate', newText);

                            if (!Date.parse(objEndDate))
                            {
                                $(this).datepicker('hide');
                                $(objEndH).datepicker('show');
                            }
                            else if (objEndDate < newDate)
                            {
                                objEndH.value="";
                                objEnd.value="";
                                $(this).datepicker('hide');
                                $(objEndH).datepicker('show');
                            }
                            else if (objEndDate >= newDate) 
                                checkupdate(objStart);
                            
                            
                        }
                    });
                    
                    
                    $(".date-picker-end").datepicker({
                        dateFormat: "mm/dd/yyyy",
                        rtl: App.isRTL(),
                        autoclose: true,
                        forceParse: true
                    })
                    .on('changeDate', function(ev, inst){
                        var newDate = $(this).datepicker("getDate");
                        if (!Date.parse(newDate))
                            return;
                        var newText = $(this)[0].value;
                        var objEnd = $(this).closest('td').find('[data-taskinput]')[0];
                        var objEndDate = new Date(objEnd.value);
                        var objStartH = $(this).closest('td').prev('td').find('.date-picker-start')[0];
                        var objStart = $(this).closest('td').prev('td').find('[data-taskinput]')[0];
                        var objStartDate = new Date(objStart.value);
                        if (objEndDate == newDate)
                            return;
                        else
                        {
                            objEnd.value = newText;
                            if (!Date.parse(objStartDate))
                            {
                                $(this).datepicker('hide');
                                $(objStartH).datepicker('show');
                            }
                            else if (objStartDate > newDate)
                            {
                                objStartH.value="";
                                objStart.value="";
                                $(this).datepicker('hide');
                                $(objStartH).datepicker('show');
                            }
                            else if (objStartDate <= newDate) 
                                checkupdate(objEnd);
                        }
                    });
                    
                    
                    var dataendp = $(".date-picker-end");
                    $.each(dataendp, function(index, dataendp) {
                        var objStartH = $(dataendp).closest('td').prev('td').find('.date-picker-start')[0];
                        if(objStartH.value)
                            $(dataendp).datepicker('setStartDate', objStartH.value);
                        else
                            $(dataendp).datepicker('setStartDate', null);
                        
                    });
                }
                

                function checkupdate(objchanged)
                {
                    /*alert("change");
                    return;*/
                    
                    var errtasks = $('.cerrortask');
                    
                    if (errtasks.length > 0)
                    {
                        if (!$(errtasks).attr('data-dup') == "yes")
                            return;
                    }
                        
                    var inputs = $(objchanged).closest('tr').find('input[data-taskinput]')
                    var hasvalues = 1;
                    $.each(inputs, function(index, inputs) {
                        if (inputs.value.length == 0) 
                            hasvalues = 0;
                    });
                    
                    if (hasvalues == 1)
                        document.getElementById('<%= btnupdatetask.ClientID %>').click();
                    
                }
            
                jQuery(document).ready(function() {
                    $('li[data-task]').draggable({ revert: true });
                    $('input[data-newtask]').droppable({
                        accept: 'li[data-task]',
                        drop: function(event, ui) {
                            var targecell = $(event.target); //.find('input');
                            var taskname = event.srcElement.innerText.trim();
                            targecell[0].value = taskname;
                            checkupdate(targecell[0]);
                        },
                        activeClass: "highlighttask",


                    });
                        
                    $('li[data-emp]').draggable({ revert: true });
                    $('input[data-newemp]').droppable({  //.closest('td').droppable({
                        accept: 'li[data-emp]',
                        drop: function(event, ui) {
                            var targecell = $(event.target); //.find('input');
                            var empname = event.srcElement.innerText.trim();
                            var targetidcell = $(targecell).closest('tr').find("[name$=EmployeeID]")
                            var empid = event.srcElement.getAttribute("data-EmployeeID");
                            targecell[0].value = empname;
                            targetidcell[0].value = empid;
                            checkupdate(targecell[0]);
                        },
                        activeClass: "highlighttask",
                    });
                    
                    
                    
                    
                });
            }
            
            
            $( window ).load(function() {
                    $('select.zddAgency').select2({ placeholder: ""});
                    var data = [];
                    var strdata = $('.zduAgency').val().replace(/"/g, '').replace('[','').replace(']','');
                    $(strdata.split(",")).each(function () {
                        data.push({id: this, text: this});
                    });
                    if (strdata.length > 0)
                        $('select.zddAgency').select2('data', data);

           });
            
            jQuery(document).ready(function() {
                PropWizard.init();
                LoadTaskScript();
                
                
                $('.zddAgency').on("change", function(e) {
                    var data1= $(this).select2('val');
                    var targetidcell = $('.zduAgency');
                    $(targetidcell).val(JSON.stringify(data1));
                });
                
                $('.zCBA').change(function() {
                    CalculateBaseAmount();
                });
                
                //$("#<%= txtAgreedBase.ClientID %>").prop('disabled', true);
                $("#<%= txtAgreedBase.ClientID %>").attr("readonly", "readonly");
                
                $('[name$=_OPC]').closest('tr').parents('tr').hide();
                
                $(".dmlvmethod").draggable({ revert: true });
                //$('.csheadoption').droppable({
                $('td[data-odroppable="1"]').droppable({
                    accept: ".dmlvmethod",
                    drop: function(event, ui) {
                        var targetoption = event.target.innerText.trim();
                        //var sourcemethod = event.srcElement.innerText.trim();
                        var sourcemethod = ui.draggable[0].innerText.trim();
                        var dupmethod = $(event.target).closest('tr').next().find("td:contains(" + sourcemethod + ")");
                        if (dupmethod.length == 0) {
                            //event.target.colSpan = event.target.colSpan + 1;
                            $("#<%= hidoption.ClientID %>").val("add|" + targetoption + "|" + sourcemethod);
                            $("#<%= hidtab.ClientID %>").val("#tab2");
                            __doPostBack();
                        }
                        else
                            alert('Method Already Exists');
                    },
                    activeClass: "highlightactive",
                    hoverClass: "highlight",

                });
                $('td[data-odroppable="1"]').droppable( "disable" );
                
                $(".csheadmethod").draggable({ revert: true });
                $(".dmlvmethod").droppable({
                    accept: '.csheadmethod',
                    drop: function(event, ui) {
                        var uidropped = ui.draggable[0];
                        var sourcemethod = uidropped.innerText.trim();
                        var sourceoption = ui.draggable.closest('tr').prev().find('[data-option]')[0].innerText.trim();
                        $("#<%= hidoption.ClientID %>").val("remove|" + sourceoption + "|" + sourcemethod);
                        $("#<%= hidtab.ClientID %>").val("#tab2");
                        __doPostBack();
                    },
                    activeClass: "highlightactive",
                    hoverClass: "highlight",

                });
                
                $(".dmlvcity").draggable({ revert: true });
                $(".csheadmethod").droppable({

                    accept: ".dmlvcity",
                    drop: function(event, ui) {
                        var activeoption = $("#<%= hidactiveoption.ClientID %>").val();
                        var targetmethod = event.target.innerText.trim();
                        //var sourcecity = event.srcElement.innerText.trim();
                        var sourcecity = ui.draggable[0].innerText.trim();
                        //var dupmethod = $(".cscity:contains(" + sourcecity + ")");
                        var dupmethod = $(event.target).closest('tr').next().find(".csmethod" + targetmethod + ":contains(" + sourcecity + ")");

                        if (dupmethod.length == 0) {
                            $("#<%= hidoption.ClientID %>").val("add|" + activeoption + "|" + targetmethod + "|" + sourcecity);
                            $("#<%= hidtab.ClientID %>").val("#tab2");
                            __doPostBack();
                        }
                        else
                            alert('City Already Exists');
                    },
                    refreshPositions: true,
                    hoverClass: "highlight",
                    activeClass: "highlightactive"

                });
                
                $(".csheadcity").draggable({ revert: true });
                $(".dmlvcity").droppable({
                    accept: '.csheadcity',
                    drop: function(event, ui) {
                        var uidropped = ui.draggable[0];
                        var sourcecity = uidropped.innerText.trim();
                        var sourcemethod = uidropped.attributes["data-method"].value;
                        var sourceoption = ui.draggable.closest('tr').prev().prev().find('[data-option]')[0].innerText.trim();
                        $("#<%= hidoption.ClientID %>").val("remove|" + sourceoption + "|" + sourcemethod + "|" + sourcecity);
                        $("#<%= hidtab.ClientID %>").val("#tab2");
                        __doPostBack();
                    },
                    activeClass: "highlightactive",
                    hoverClass: "highlight",

                });
                
                $("[data-option]").draggable({ revert: true });
                $("#method_div").droppable({
                    accept: '[data-option]',
                    drop: function(event, ui) {
                        var sourceoption = ui.draggable[0].innerText.trim();
                        $("#<%= hidoption.ClientID %>").val("remove|" + sourceoption);
                        $("#<%= hidtab.ClientID %>").val("#tab2");
                        __doPostBack();
                    },
                    activeClass: "highlightactive",
                    hoverClass: "highlight",

                });
                
                
               $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
                    //localStorage.setItem('lastTab', $(this).attr('href'));
                    $($(this).attr('href')).closest('div').find('.form-body').show();
                    showactiveoption();
                });

                //var lastTab = localStorage.getItem('lastTab');
                var lastTab = $("#<%= hidtab.ClientID %>").val();
                if (lastTab) {
                    $("#<%= hidtab.ClientID %>").val("");
                    $('a[href=' + lastTab + ']').tab('show');
                    showactiveoption();
                }
                else
                    $("#tab1").closest('div').find('.form-body').show();
                    
                
                function showactiveoption() {
                    var currentTab = $("ul#proptab li.active").find('a').attr('href');
                    var activeoption = $("#<%= hidactiveoption.ClientID %>").val();
                    if (activeoption.length > 0 && currentTab=='#tab2') {
                        $("#method_div").fadeIn();
                        $(".cssho" + activeoption).show();
                        resizetablewidth(activeoption);
                        $("td[data-option="+activeoption+"]").droppable( "enable" );
                        $("i","td[data-option="+activeoption+"]").removeClass("icon-folder-close").addClass("icon-folder-open");
                    }
                    else
                        $("#method_div").hide();
                    
                    if (currentTab=='#tab3')
                        setactiheight();
                }
                
                $(".csheadoption").click(function() {
                    var tdmethod = $(this).closest('tr').next().find('.csheadmethod');
                    var currentoption = $(this)[0].innerText.trim().replace("Option ", "");

                    if (tdmethod.length > 0) {
                        $('td[data-odroppable="1"]').droppable( "disable" );
                        if (tdmethod[0].style.display == "none") {
                            var previousoption = $("#<%= hidactiveoption.ClientID %>").val();
                            if (previousoption.length > 0) {
                                $(".cssho" + previousoption).hide();
                                var otable = $(".cssho" + previousoption).closest('table');
                                $.each(otable, function(index, otable) {
                                    otable.width = 100;
                                });
                                $("i","td[data-option="+previousoption+"]").removeClass("icon-folder-open").addClass("icon-folder-close");
                            }

                            $("#method_div").fadeIn(1000);
                            $("#<%= hidactiveoption.ClientID %>").val(currentoption);
                            $(".cssho" + currentoption).show();
                            $("i","td[data-option="+currentoption+"]").removeClass("icon-folder-close").addClass("icon-folder-open");
                            $(this).droppable( "enable" );
                            resizetablewidth(currentoption);
                        }
                        else {
                            $("#method_div").fadeOut();
                            $("#<%= hidactiveoption.ClientID %>").val("");
                            $(".cssho" + currentoption).hide();
                            var otable = $(".cssho" + currentoption).closest('table');
                            $.each(otable, function(index, otable) {
                                otable.width = 100;
                            });
                            $("i","td[data-option="+currentoption+"]").removeClass("icon-folder-open").addClass("icon-folder-close");
                            
                        }
                    }
                    else
                    {
                        $('td[data-odroppable="1"]').droppable( "disable" );
                        var previousoption = $("#<%= hidactiveoption.ClientID %>").val();
                        if (previousoption.length > 0) {
                            $(".cssho" + previousoption).hide();
                            var otable = $(".cssho" + previousoption).closest('table');
                            $.each(otable, function(index, otable) {
                                otable.width = 100;
                            });
                            $("i","td[data-option="+previousoption+"]").removeClass("icon-folder-open").addClass("icon-folder-close");
                        }
                        
                        $("#method_div").fadeIn(1000);
                        $("#<%= hidactiveoption.ClientID %>").val(currentoption);
                        $("i","td[data-option="+currentoption+"]").removeClass("icon-folder-close").addClass("icon-folder-open");
                        $(this).droppable( "enable" );
                    }
                    
                    

                });

                
            });
            
            jQuery(document).ready(function() {
                $.fn.modal.defaults.manager = $.fn.modalmanager.defaults.manager = 'body form:first';
                var istimecost = $("#<%= hidTimecost.ClientID %>").val();
                if (istimecost)
                {
                   //$('#divTimecost').css({ 'hight', 400});
                   $('#divTimecost').css('height',600);
                   $('#divTimecost').css({ 'margin-top': window.pageYOffset - $(this).height() / 2, 'top': '50%' });
                   $('#divTimecost').css({ 'margin-left': window.pageXOffset - $(this).width() / 2, 'left': '50%' });
                   $("#<%= hidTimecost.ClientID %>").val('');
                   $('#divTimecost').modal({'backdrop': 'static'});
                }
            });

            jQuery(document).ready(function() {
                //$('[id="testcalc"]').click(function() {
                $('.boxttans').change(function() {
                    $(this).val($(this).asNumber());
                    if (!$.isNumeric($(this).val()))
                        $(this).val(0);
                    $(this).formatCurrency({roundToDecimalPlace:2,symbol:'',groupDigits:false});
                });
                $('.cbox').change(function() {
                    $(this).val($(this).asNumber({ parseType: 'int' }));
                    $(this).formatCurrency({roundToDecimalPlace:0,symbol:''});
                    var option = $("#<%= hidactiveoption.ClientID %>").val();
                    costcalculation(option);
                });
                $('.cboxdec').change(function() {
                    $(this).val($(this).asNumber());
                    $(this).formatCurrency({roundToDecimalPlace:2,symbol:''});
                    var option = $("#<%= hidactiveoption.ClientID %>").val();
                    costcalculation(option);
                });
                
                costcalculation();
                
                $('.camt').change(function() {
                    $(this).val($(this).asNumber());
                    $(this).formatCurrency({roundToDecimalPlace:2,symbol:''});
                });
                
                $('.boxttans').formatCurrency({roundToDecimalPlace:2,symbol:''});
                $('.cbox').formatCurrency({roundToDecimalPlace:0,symbol:''});
                $('.cboxdec').formatCurrency({roundToDecimalPlace:2,symbol:''});
                $('.cboxHours').formatCurrency({roundToDecimalPlace:2,symbol:'',groupDigits:false});
                $('.camt').formatCurrency({roundToDecimalPlace:2,symbol:''});
                
                var operinputs = $('.zshowper');
                $.each(operinputs, function(index, oinput) {
                    $(oinput).val($(oinput).val() + "%");
                });
            });
            
            function GMccode() {
                var ofinputs = $('.zGMccode');
                $.each(ofinputs, function(index, oinput) {
                    $(oinput).removeClass('cbgstatusgreen').removeClass('cbgstatusyellow').removeClass('cbgstatusred').removeClass('cbgstatuspink');
                    if (parseFloat($(oinput).val()) < 15)
                        $(oinput).addClass('cbgstatusred');
                    else if (parseFloat($(oinput).val()) >= 15 && parseFloat($(oinput).val()) < 20)
                        $(oinput).addClass('cbgstatuspink');
                    else if (parseFloat($(oinput).val()) >= 20 && parseFloat($(oinput).val()) <= 24)
                        $(oinput).addClass('cbgstatusyellow');
                    else if (parseFloat($(oinput).val()) > 24)
                        $(oinput).addClass('cbgstatusgreen');
                    else
                        $(oinput).addClass('cbgstatusred');
                    
                });
            }
            
            function costcalculation(option) {
                if (option)
                    var otable = $('table[data-tableoption='+option+']');
                else
                    var otable = $('table[data-tableoption]');
                    
                var ofinputs = otable.find('input[data-formula]');
                $.each(ofinputs, function(index, oinput) {
                    try
                    {
                        var res = eval(oinput.attributes["data-formula"].value);
                    }
                    catch(err)
                    {
                        res = "Error";
                    }
                    if (!$.isNumeric(res))
                    {
                        $(oinput).val("");
                        $(oinput).addClass('calerror');
                    }
                    else
                    {   
                        if ($(oinput).hasClass("cboxdec"))
                        {
                            $(oinput).val(res);
                            $(oinput).formatCurrency({roundToDecimalPlace:2,symbol:''});
                        }
                        else
                        {
                            $(oinput).val(Math.round(res));
                            $(oinput).formatCurrency({roundToDecimalPlace:0,symbol:''});
                        }
                        
                        if ($(oinput).hasClass("zshowper"))
                        {
                            $(oinput).val($(oinput).val() + "%");
                        }
                        
                        $(oinput).removeClass('calerror');
                    }
                });
                GMccode();
            }
            
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
            
            jQuery(document).ready(function() {
                jQuery.validator.addMethod("wonstatus",
                    function(value, element){
                        var stat =  $("#<%= ddStatus.ClientID %>");
                        if (stat.val() == "Won") {
                            var agreed = $("#<%= txtAgreed.ClientID %>").asNumber();
                            var agreedBase = $("#<%= txtAgreedBase.ClientID %>").asNumber();
                            if (agreed>0 && agreedBase>0)
                                return true
                            else
                                return false
                        }
                        else
                            return true 
                    },"Required."
                 );
                 
                 jQuery.validator.addMethod("commentsreq",
                    function(value, element){
                        var stat =  $("#<%= ddStatus.ClientID %>");
                        if (stat.val() == "Postponed" || stat.val() == "Lost" || stat.val() == "Cancelled") {
                            if ($("#<%= txtComments.ClientID %>").val().trim() == "")
                                return false
                            else
                                return true
                        }
                        else
                            return true 
                    },"Comments Required."
                 );
            
                
                var form = $('form');
                form.validate({
                   errorElement: 'span', //default input error message container
                   errorClass: 'help-block', // default input error message class
                   rules: {
                       <%= txtProposalID.UniqueID %>: {required: true},
                       <%= txtProposalDesc.UniqueID %>: "required",
                       <%= ddClientName.UniqueID %>: "required",
                       <%= ddAgency.UniqueID %>: "required",
                       <%= ddManager.UniqueID %>: "required",
                       <%= ddLeader.UniqueID %>: "required",
                       <%= ddBroadCategory.UniqueID %>: "required",
                       <%= ddDepartment.UniqueID %>: "required",
                       <%= ddProjectType.UniqueID %>: "required",
                       <%= ddMarket.UniqueID %>: "required",
                       <%= ddProbability.UniqueID %>: "required",
                       <%= ddStatus.UniqueID %>: "required",
                       <%= txtDueDate.UniqueID %>: {required: true, date:true},
                       <%= txtSenddate.UniqueID %>: {date:true},
                       <%= txtApprovaldate.UniqueID %>: {date:true},
                       <%= txtRFQRefDate.UniqueID %>: {required: true, date:true},
                       <%= ddTypeofstudy.UniqueID %>: "required",
                       <%= txtAgreed.UniqueID %>: "wonstatus",
                       <%= txtComments.UniqueID %>: "commentsreq"
                   },

                   messages: {
                       <%= txtProposalID.UniqueID %>: {required: "ID is required."},
                       <%= txtProposalDesc.UniqueID %>: "Description is required.",
                       <%= ddClientName.UniqueID %>: "Client is required.",
                       <%= ddAgency.UniqueID %>: "Agency is reuqired.",
                       <%= ddManager.UniqueID %>: "Manager is required.",
                       <%= ddLeader.UniqueID %>: "Leader is required.",
                       <%= ddBroadCategory.UniqueID %>: "Broad Category is required.",
                       <%= ddDepartment.UniqueID %>: "Department is required.",
                       <%= ddProjectType.UniqueID %>: "Project type is required.",
                       <%= ddMarket.UniqueID %>: "Market is required.",
                       <%= ddProbability.UniqueID %>: "Propability is required.",
                       <%= ddStatus.UniqueID %>: "Status is required.",
                       <%= ddTypeofstudy.UniqueID %>: "Type of Industry is required."
                   },

                   invalidHandler: function(event, validator) { //display error alert on form submit
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
                       //form.submit();
                   }
               });
           
               $('1input[data-numeric="yes"]').inputmask({
                    "mask": "9",
                    "repeat": 10,
                    "greedy": false
               });
               
               $(".1cbox").keydown(function(event) {
                    // Allow: backspace, delete, tab, escape, enter and .
                    if ( $.inArray(event.keyCode,[46,8,9,27,13,190]) !== -1 ||
                         // Allow: Ctrl+A
                        (event.keyCode == 65 && event.ctrlKey === true) || 
                         // Allow: home, end, left, right
                        (event.keyCode >= 35 && event.keyCode <= 39)) {
                             // let it happen, don't do anything
                             return;
                    }
                    else {
                        // Ensure that it is a number and stop the keypress
                        if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                            event.preventDefault(); 
                        }   
                    }
                });
               
               
               
        });
            
        </script>
    </form>
</asp:Content>
