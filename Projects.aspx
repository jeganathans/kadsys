<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="KedSys35.Projects" Title="Kadence | Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script> 
    <script type="text/javascript" src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript" ></script>
    <script src="assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript" ></script>
    <script type="text/javascript" src="assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery.formatCurrency-1.4.0.min.js"></script>
    <script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
        
    <script src="assets/scripts/project-wizard.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
    <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="assets/plugins/jquery-multi-select/css/multi-select.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="formproposal" name="formproposal" class="form" runat="server">
        <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Projects
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="ProjectDashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="ProjectAll.aspx">Projects</a></li>
                <li id="brdliProjectID">
                    <i class="icon-angle-right"></i>
                    <a id="brdProjectID" href="Projects.aspx" runat="server"></a>
                </li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
        <asp:HiddenField ID="hidUID" runat="server"  enableviewstate="true" />
        <asp:HiddenField ID="hidtab" runat="server" />
        <asp:HiddenField ID="hidtoaster" runat="server" />
    </div>
        <div class="row">
        <div class="col-md-12">
            <div id="form_wizard_1" class="portlet box green" >
                <div class="portlet-title">
                    <div class="caption">Project Wizard - <span class="step-title">Step 1 of 4</span></div>
                </div>
                <div class="portlet-body form">
                     <div id="submit_form">
                        <div class="form-wizard">
                           <div class="form-body">
                                <ul id="proptab" class="nav nav-pills nav-justified steps">
                                 <li>
                                    <a href="#tab1" data-toggle="tab" class="step">
                                    <span class="number">1</span>
                                    <span class="desc"><i class="icon-ok"></i>Project Entry</span>   
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#tab2" data-toggle="tab" class="step">
                                    <span class="number">2</span>
                                    <span class="desc" style="font-size:14px"><i class="icon-ok"></i>Department Assignment</span>   
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#tab3" data-toggle="tab" class="step">
                                    <span class="number">3</span>
                                    <span class="desc"><i class="icon-ok"></i>Field Work</span>   
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#tab4" data-toggle="tab" class="step">
                                    <span class="number">4</span>
                                    <span class="desc"><i class="icon-ok"></i>Invoice</span>   
                                    </a>
                                 </li>
                              </ul>
                               <div id="bar" class="progress progress-striped" role="progressbar">
                                 <div class="progress-bar progress-bar-success"></div>
                              </div>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab1">
                                        <div action="#" class="horizontal-form">
                                            <div class="form-body" style="display:none">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Project ID<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtProjectID" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Project Name<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtProjectName" class="form-control" type="text" runat="server"></asp:TextBox>
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
                                                            <label class="control-label">Project Description<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox id = txtProjectDesc class="form-control" TextMode="multiline" rows ="3" type="textarea" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Client Name<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddClientName" class="form-control select2me" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Agency<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddAgency" class="form-control select2me" runat="server"></asp:DropDownList>
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
                                                                Coordinator<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddResearchEngineer" class="form-control select2me" runat="server">
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
                                                                Project Type<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddProjectType" class="form-control select2me" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
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
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Start Date<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox id = txtStartDate class="form-control date-picker-start" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                End Date<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox id = txtEndDate class="form-control date-picker-end" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Type of Industry</label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddFWTypeofStudy" class="form-control select2me" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Actual Completion Date</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox id = "txtActualCompletionDate" class="form-control date-picker-end" runat="server"></asp:TextBox>
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
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab2">
                                        <div action="#" class="horizontal-form">
                                            <div class="form-body" style="display: none">
                                                <div class="nomargintop">
                                                    <div class="listleftside">
                                                        <asp:DropDownList ID="ddEmpDept" CssClass="form-control" runat="server"> 
                                                        </asp:DropDownList>
                                                        <asp:ListView ID="lvEmployee" runat="server">
                                                            <LayoutTemplate>
                                                                <ul class="clearfix nopadingleft">
                                                                    <input id="empfilt" class="form-control csearchbg" />
                                                                    <div class="scroller" style="height:400px" data-always-visible="1" data-rail-visible="0">                                                                    <div class="clearfix zemplist">
                                                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                                                    </div>
                                                                    </div>
                                                                </ul>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                <%--<div>--%>
                                                                <li class="btn btn-xs default margin1 textleft curpointer" style="width: 200px" data-emp="yes"
                                                                    data-employeeid="<%#Eval("EmployeeID")%>" data-department="<%#Eval("Department")%>">
                                                                    <%#Eval("EmpName")%>
                                                                </li>
                                                                <div>
                                                                </div>
                                                                <%--</div>--%>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </div>
                                                    <div class="marginleft250 nopadingtop">
                                                        <asp:GridView runat="server" ID="grdDepts" AutoGenerateColumns="false" 
                                                            class="proptable table-bordered" OnRowDataBound="grdDepts_OnRowDataBound"> 
                                                            <Columns>
                                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblUID" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtPDDepartment" CssClass="boxlefttrans" runat="server" Width="225px" Style="max-width: 225px"
                                                                            Text='<%#Eval("Department")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtPDSupervisor" CssClass="boxlefttrans zsupplist" runat="server" ></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblSupervisor" runat="server" Text="Supervisor"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div id="SupTag" runat="server">
                                                                        <%--<asp:TextBox ID="txtPDSupervisorName" CssClass="boxlefttrans ztxtsup" runat="server" Width="210px" Style="max-width: 210px;display:none">--%>
                                                                        <input type="hidden" class="dsupplist" id="DSupervisorList" data-required="yes" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblHours" runat="server" style="max-width: 75px" Text="Total Hours"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtPDNoofHours" style="max-width: 75px" CssClass="cbox text-right" runat="server"
                                                                            Text='<%#Eval("NoofHours")%>' data-required="yes"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblTargetDate" CssClass="boxleft" runat="server" Text="Target Date"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtPDTargetDate" style="max-width: 100px" CssClass="boxlefttrans date-picker-furure" runat="server"
                                                                            Text='<%#Eval("TargetDate")%>' data-required="yes"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblStatus" CssClass="text-center" runat="server"
                                                                            Text="Status"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:DropDownList ID="ddPDStatus" CssClass="boxleft" runat="server" ></asp:DropDownList>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab3">
                                        <div action="#" class="horizontal-form">
                                            <div class="form-body" style="display:none">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">PO to FieldWork</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtFWPOFieldwork" CssClass="form-control date-picker-furure"  runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">FW Type</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="duFWType" CssClass="zduFWType" runat="server" style="display:none"></asp:TextBox>
                                                                <asp:DropDownList ID="ddFWType" multiple class="form-control select2me zddFWType"  runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Target of Sample</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtFWTargetSample" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Number of Sample Collection</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox id = txtFWSampleCollected class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Target Completion of FW</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtFWTargetDate" CssClass="form-control date-picker-furure"  runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Project Confirmation Sent</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtFWConSentDate" CssClass="form-control date-picker-furure"  runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab4">
                                        <div action="#" class="horizontal-form">
                                            <div class="form-body" style="display:none">
                                                <div class="alert alert-success">                                                                                                        <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label"><strong>Proposal Agreed Value</strong></label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label"><strong>Total Invoice Amount</strong></label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label"><strong>Total Pending Value</strong></label>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:Label ID="lblagreed" CssClass="form-control dcurr" runat="server"></asp:Label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:Label ID="lblTotalInvoiceAmount" CssClass="form-control dcurr" runat="server"></asp:Label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:Label ID="lblTotalPendingValue" CssClass="form-control dcurr" runat="server"></asp:Label>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="form-body" style="display:none">
                                                <asp:HiddenField ID="hidRecordSequence" runat="server"  enableviewstate="true" />
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Billing Currency<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                            <asp:DropDownList ID="ddBillingCurrency" CssClass="form-control select2me" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Invoice Amount<span class="required">*</span></label>
                                                            <div class="input-groupd">
                                                            <asp:TextBox id = "txtBillingAmount" class="form-control dcurr zCBA" type="text" runat="server"></asp:TextBox>
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
                                                                <asp:TextBox id = "txtPaymentTerms" class="form-control" Visible="false" type="text" runat="server"></asp:TextBox>
                                                                <asp:TextBox id = "txtInvoiceDate" class="form-control date-picker-invoice" type="text" runat="server"></asp:TextBox>
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
                                                            <asp:TextBox id = "txtBaseAmount" CssClass="form-control dcurr" type="text" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">&nbsp;</label>
                                                            <div>
                                                                <asp:LinkButton ID=btnAddInvoice Text="Add" class="btn red btn-xs addInv" runat="server" 
                                                                    OnClick="btnAddInvoice_Click" OnClientClick="return invValid();" />
                                                                <asp:LinkButton ID=btnUpdateInvoice Text="Update" class="btn red btn-xs updateInv" runat="server" 
                                                                    OnClick="btnUpdateInvoice_Click" OnClientClick="return invValid();"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-body" style="display:none">
                                                <asp:GridView ID="gvInvoice" runat="server" Width="100%" AutoGenerateColumns="False" 
                                                    AllowPaging="true" OnPageIndexChanging = "OnPaging" PageSize = "10"
                                                    OnRowDataBound="gvInv_RowCommand" OnRowCommand="gvInv_RowCommand"
                                                    class="table table-striped table-bordered table-hover">
                                                    <Columns>
                                                        <asp:TemplateField Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInvUID" runat="server" Text='<%# Eval("UID")%>' />
                                                                <asp:Label ID="lblInvProjectRef" CssClass="" runat="server" Text='<%#Eval("ProjectRef")%>'></asp:Label>
                                                                <asp:Label ID="lblInvRecordSequence" CssClass="" runat="server" Text='<%#Eval("RecordSequence")%>'></asp:Label>
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
                                                        <asp:TemplateField >
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblInvoiceDate" runat="server" Text="Invoice Date"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="InvoiceDate" CssClass="" runat="server" Text='<%#Eval("InvoiceDate")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField >
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblBaseCurrency" runat="server" Text="Base Currency"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="BaseCurrency" CssClass="" runat="server" Text='<%#Eval("BaseCurrency")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField >
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblBaseAmount" runat="server" Text="Base Amount"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="BaseAmount" CssClass="" runat="server" Text='<%#Eval("BaseAmount")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="" >
                                                            <ItemTemplate>
                                                                <asp:Linkbutton id="btn_select" name="btn_select" type="submit" class="btn red btn-xs" ToolTip="Edit" runat ="server" 
                                                                    Text="<i class='icon-edit'></i>" onclick="btn_selectInvoice_Click">
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
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                           </div>
                           <div class="form-actions right">
                              <div class="row">
                                 <div class="col-md-12">
                                    <div class="col-md-offset-3 col-md-9">
                                       <a href="ProjectAll.aspx" class="cancel btn default">Cancel</a>
                                       <a href="javascript:;" class="btn default button-previous">
                                       <i class="m-icon-swapleft"></i> Back 
                                       </a>
                                       <a href="javascript:;" class="btn green button-next">
                                       Continue <i class="m-icon-swapright m-icon-white"></i>
                                       </a>
                                       <asp:LinkButton ID=btnsave Text="Save" 
                                        class="btn green" runat="server" OnClick="btnsave_Click" OnClientClick="return setcurrentTab();"/>
                                       <asp:LinkButton ID=btnsavecontinue Text="Save & Continue <i class='m-icon-swapright m-icon-white'></i>" 
                                        class="btn green button-save" runat="server" OnClick="btnsavecontinue_Click" OnClientClick="return setcurrentTab();" />
                                       <asp:LinkButton ID=btnfinalsumbit Text="Submit <i class='m-icon-swapright m-icon-white'></i>" 
                                        class="btn green button-submit" type="submit" runat="server" style="display:none" OnClick="btnfinalsumbit_Click"/> 
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
    
    <script>
    
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
            
            function invValid() {
                if ($("#<%= ddBillingCurrency.ClientID %>").val() == "" || $("#<%= txtBillingAmount.ClientID %>").val() == "" 
                    || $("#<%= txtInvoiceDate.ClientID %>").val() == "" || $("#<%= ddBaseCurrency.ClientID %>").val() == ""
                    || $("#<%= txtBaseAmount.ClientID %>").val() == "")
                {
                    $("#<%= hidtoaster.ClientID %>").val("error|Please fill all the fields.");
                    showtoastrr();
                    return false;
                }
                else
                {
                    $("#<%= txtBaseAmount.ClientID %>").prop('disabled', false);
                    return true;
                }
            }
            
            function CalculateBaseAmount() {
                var InvoiceDate = $("#<%= txtInvoiceDate.ClientID %>").val();
                var BillingCurrency = $("#<%= ddBillingCurrency.ClientID %>").val()
                var BillingAmount = $("#<%= txtBillingAmount.ClientID %>").val()
                var BaseCurrency = $("#<%= ddBaseCurrency.ClientID %>").val()
                
                if (InvoiceDate == "" || BillingCurrency == "" || BillingAmount == "")
                {
                    $("#<%= txtBaseAmount.ClientID %>").val("0.00");
                }
                else if (BaseCurrency == BillingCurrency)
                {
                    $("#<%= txtBaseAmount.ClientID %>").val(BillingAmount);
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
                                $("#<%= txtBaseAmount.ClientID %>").val("0.00");
                            }
                            else
                            {
                                $("#<%= txtBaseAmount.ClientID %>").val(response.d);
                                $("#<%= txtBaseAmount.ClientID %>").change();
                            }
                        },
                        failure: function() {
                            $("#<%= txtBaseAmount.ClientID %>").val("0.00");
                            alert("Unable to calculate base amount.");
                        }
                    }).responseText;
                    
                    
                }

            }
            
            function empexists(data, val){
                var empdata = false;
                data.map(function (emp) {
                    if (emp.id == val) {
                        empdata = true;
                    } 
                });
                return empdata;
            }
            
            function checkvalid() {
                var resValid;
                resValid = false;
                
                var hasvaluesAll = 1;
                
                $('.proptable tr').each(function (i, row) {
                    var inputs = $(row).closest('tr').find('[data-required]')
                    var emptytask = true;
                    var hasvalues = 1;
                    $.each(inputs, function(index, inputs) {
                        if (inputs.value.trim().length == 0)
                        { 
                            $(inputs).closest('tr').find('input[name$=txtPDDepartment]').addClass('cerrortask');
                            $(inputs).closest('tr').find('input[name$=txtPDDepartment]').attr("title", "Please fill all the columns.");
                            hasvalues = 0;
                        }
                        else
                        {
                            emptytask = false;
                            $(inputs).closest('tr').find('input[name$=txtPDDepartment]').removeClass('cerrortask');
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
                    resValid = true;
                else
                    resValid = false;
                
                return resValid;
                
            }
            
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
            
            $( window ).load(function() {
                $('select.zddFWType').select2({ placeholder: ""});
                
                var data = [];
                var strdata = $('.zduFWType').val().replace(/"/g, '').replace('[','').replace(']','');
                $(strdata.split(",")).each(function () {
                    data.push({id: this, text: this});
                });
                if (strdata.length > 0)
                    $('select.zddFWType').select2('data', data);
           });
            jQuery(document).ready(function() {
                showtoastrr();
                ProjWizard.init();
                
                $('.zddFWType').on("change", function(e) {
                    var data1= $(this).select2('val');
                    var targetidcell = $('.zduFWType');
                    $(targetidcell).val(JSON.stringify(data1));
                });
                
                
                
                $('.zCBA').change(function() {
                    CalculateBaseAmount();
                });
                
                $('#empfilt').keyup(function(){
                   var valThis = $(this).val().toLowerCase();
                    $('.zemplist>li').each(function(){
                     var text = $(this).text().toLowerCase();
                        if (((text.indexOf(valThis) > 0) || valThis=="") && $(this).attr('data-department') == $("[name$=ddEmpDept]")[0].value)
                            $(this).show();
                        else
                            $(this).hide();         
                   });
                   //setactiheight();
                });
                
                $("#<%= txtBaseAmount.ClientID %>").prop('disabled', true);
                if ($("#<%= hidRecordSequence.ClientID %>").val() == "")
                {
                    $('.addInv').show();
                    $('.updateInv').hide();
                }
                else
                {
                    $('.addInv').hide();
                    $('.updateInv').show();
                }
                
                $('.dcurr').change(function() {
                    $(this).val($(this).asNumber());
                    if (!$.isNumeric($(this).val()))
                        $(this).val(0);
                    $(this).formatCurrency({roundToDecimalPlace:2,symbol:''});
               });
               
               $('.dcurr').formatCurrency({roundToDecimalPlace:2,symbol:''});
                
                jQuery('input[name$=txtPDDepartment]').attr('readonly','readonly');
                jQuery('input[name$=txtPDSupervisorName]').attr('readonly','readonly');
                
                $("[data-department]").hide();
                $("[data-department='" + $("[name$=ddEmpDept]")[0].value+ "']").show();
                $("[name$=ddEmpDept]").change(function() {
                    $("[data-department]").hide();
                    $("[data-department='" + $("[name$=ddEmpDept]")[0].value+ "']").show();
                });
                
                $('li[data-emp]').draggable({ revert: true });
                //$('input[name$=txtPDSupervisorName]').droppable({  //.closest('td').droppable({
                $('.zSupTag').droppable({
                    accept: 'li[data-emp]',
                    drop: function(event, ui) {
                        if ($(this).closest('tr')[0].disabled)
                            return;
                        //var targecell = $(event.target); //.find('input');
                        var targecell = $(event.target).find('.dsupplist')
                        //var empname = event.srcElement.innerText.trim();
                        var empname = ui.draggable[0].innerHTML.trim();
                        var targetidcell = $(event.target).closest('tr').find("[name$=txtPDSupervisor]")
                        var empid = ui.draggable[0].getAttribute("data-EmployeeID");
                        //$(targecell).addTag(empname);
                        var data= $(targecell).select2('data');
                         
                        if (empexists(data,empid) == true)
                        {
                                $("#<%= hidtoaster.ClientID %>").val("error|Already exists.");
                                showtoastrr();
                        }
                        else
                        {
                            data.push({id: empid, text: empname});
                            $(targecell).select2('data', data);
                            //$("#test").select2("data", [{id: empid, text: empname}]);
                            //targecell[0].value = empname;
                            targetidcell[0].value = JSON.stringify(data);
                        }
                    },
                    activeClass: "highlighttask",
                });
                
                var test = $('.dsupplist');
                $(test).select2({
                   data:[],
                    multiple: true,
                    width: "230px"
                }).on("removed", function(e) {
                    var data= $(this).select2('data');
                    var targetidcell = $(this).closest('tr').find("[name$=txtPDSupervisor]")
                    targetidcell[0].value = JSON.stringify(data);
                });
                
                var inputs = $(".zsupplist")
                $.each(inputs, function(index, inputs) {
                    var Dsup = $(inputs).closest('tr').find("#DSupervisorList");
                    var data= $.parseJSON($(inputs).val());
                    $(Dsup).select2('data', data);
                });
                

                $('input[name$=txtPDNoofHours]').inputmask({
                    "mask": "9",
                    "repeat": 10,
                    "greedy": false
                });
                
                if (jQuery().datepicker) {
                    $(".date-picker-start")
                    .datepicker({
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
                        var objEndH = $('.date-picker-end')[0];
                        var objEndDate = new Date(objEndH.value);
                        {
                            $(objEndH).datepicker('setStartDate', newText);

                            if (!Date.parse(objEndDate))
                            {
                                $(this).datepicker('hide');
                                $(objEndH).datepicker('show');
                            }
                            else if (objEndDate < newDate)
                            {
                                objEndH.value="";
                                $(this).datepicker('hide');
                                $(objEndH).datepicker('show');
                            }
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
                        var objStartH = $('.date-picker-start')[0];
                        var objStartDate = new Date(objStartH.value);
                        {
                            if (!Date.parse(objStartDate))
                            {
                                $(this).datepicker('hide');
                                $(objStartH).datepicker('show');
                            }
                            else if (objStartDate > newDate)
                            {
                                objStartH.value="";
                                $(this).datepicker('hide');
                                $(objStartH).datepicker('show');
                            }
                        }
                    });
                    
                    
                    var dataendp = $(".date-picker-end");
                    var objStartH = $('.date-picker-start')[0];
                    if(objStartH.value)
                        $(dataendp).datepicker('setStartDate', objStartH.value);
                    else
                        $(dataendp).datepicker('setStartDate', null);
                        
                    $(".date-picker-invoice").datepicker({
                        dateFormat: "mm/dd/yyyy",
                        rtl: App.isRTL(),
                        autoclose: true,
                        forceParse: true
                    })
                    .on('changeDate', function(ev, inst){
                        var newDate = $(this).datepicker("getDate");
                        if (!Date.parse(newDate))
                            return;
                        $(this).datepicker('hide');
                        CalculateBaseAmount();
                    });
                }
                
                
               $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
                    $($(this).attr('href')).closest('div').find('.form-body').show();
                });

                var lastTab = $("#<%= hidtab.ClientID %>").val();
                if (lastTab) {
                    $("#<%= hidtab.ClientID %>").val("");
                    $('a[href=' + lastTab + ']').tab('show');
                }
                else
                    $("#tab1").closest('div').find('.form-body').show();
                
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
            
            jQuery(document).ready(function() {
                var form = $('form');
                form.validate({
                   errorElement: 'span', //default input error message container
                   errorClass: 'help-block', // default input error message class
                   rules: {
                       <%= txtProjectID.UniqueID %>: "required",
                       <%= txtProjectName.UniqueID %>: "required",
                       <%= txtProjectDesc.UniqueID %>: "required",
                       <%= ddClientName.UniqueID %>: "required",
                       <%= ddAgency.UniqueID %>: "required",
                       <%= ddLeader.UniqueID %>: "required",
                       <%= ddDepartment.UniqueID %>: "required",
                       <%= ddResearchEngineer.UniqueID %>: "required",
                       <%= ddProjectType.UniqueID %>: "required",
                       <%= ddStatus.UniqueID %>: "required",
                       <%= txtStartDate.UniqueID %>: "required",
                       <%= txtEndDate.UniqueID %>: "required"
                   },

                   messages: {
                       <%= txtProjectID.UniqueID %>: "Project ID is required.",
                       <%= txtProjectName.UniqueID %>: "Project Name is required.",
                       <%= txtProjectDesc.UniqueID %>: "Description is required.",
                       <%= ddClientName.UniqueID %>: "Client is required.",
                       <%= ddAgency.UniqueID %>: "Agency is reuqired.",
                       <%= ddLeader.UniqueID %>: "Leader is required.",
                       <%= ddDepartment.UniqueID %>: "Department is required.",
                       <%= ddResearchEngineer.UniqueID %>: "Coordinator is required.",
                       <%= ddProjectType.UniqueID %>: "Project type is required.",
                       <%= ddStatus.UniqueID %>: "Status is required.",
                       <%= txtStartDate.UniqueID %>: "Start Date is required.",
                       <%= txtEndDate.UniqueID %>: "End Date is required."
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
               
        });
        
            
        </script>
    </form>
</asp:Content>
