<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="KedSys35.Projects" Title="Kadence | Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script> 
    <script type="text/javascript" src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript" ></script>
    <script src="assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript" ></script>
    <script type="text/javascript" src="assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
        
    <script src="assets/scripts/project-wizard.js"></script>
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
                Projects
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="dashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="ProjectAll.aspx">Projects</a></li>
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
                    <div class="caption">Project Wizard - <span class="step-title">Step 1 of 2</span></div>
                </div>
                <div class="portlet-body form">
                     <div id="submit_form">
                        <div class="form-wizard">
                           <div class="form-body">
                                <ul id="proptab" class="nav nav-pills nav-justified steps">
                                 <li>
                                    <a href="#tab1" data-toggle="tab" class="step">
                                    <span class="number">1</span>
                                    <span class="desc"><i class="icon-ok"></i> Project Entry</span>   
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#tab2" data-toggle="tab" class="step">
                                    <span class="number">2</span>
                                    <span class="desc"><i class="icon-ok"></i> Department Assignment</span>   
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#tab3" data-toggle="tab" class="step">
                                    <span class="number">3</span>
                                    <span class="desc"><i class="icon-ok"></i> Field Work</span>   
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
                                                            <label class="control-label">Project ID</label>
                                                            <div class="input-groupd">
                                                                <asp:TextBox ID="txtProjectID" Enabled="false" CssClass="form-control" type="text" runat="server"></asp:TextBox>
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
                                                                <asp:TextBox id = txtProjectDesc class="form-control" runat="server"></asp:TextBox>
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
                                                                Research Engineer<span class="required">*</span></label>
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
                                                                    <div class="clearfix">
                                                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
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
                                                                        <asp:TextBox ID="txtPDSupervisor" CssClass="boxlefttrans" runat="server" Text='<%#Eval("Supervisor")%>'></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblSupervisor" runat="server" Text="Supervisor"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtPDSupervisorName" CssClass="boxlefttrans" runat="server" Width="210px" Style="max-width: 210px"
                                                                            Text='<%#Eval("SupervisorName")%>' data-required="yes"></asp:TextBox>
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
                                                                        <asp:DropDownList ID="ddPDStatus" CssClass="boxleft" runat="server" data-required="yes"></asp:DropDownList>
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
                                                            <label class="control-label">Type of Study</label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddFWTypeofStudy" class="form-control select2me" runat="server"></asp:DropDownList>
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
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">FW Type</label>
                                                            <div class="input-groupd">
                                                                <asp:DropDownList ID="ddFWType" class="form-control select2me" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
                var currentTab = $("ul#proptab li.active").find('a').attr('href');
                $("#<%= hidtab.ClientID %>").val(currentTab);
                return true;
            }
            
            jQuery(document).ready(function() {
                ProjWizard.init();
                
                jQuery('input[name$=txtPDDepartment]').attr('readonly','readonly');
                jQuery('input[name$=txtPDSupervisorName]').attr('readonly','readonly');
                
                $("[data-department]").hide();
                $("[data-department='" + $("[name$=ddEmpDept]")[0].value+ "']").show();
                $("[name$=ddEmpDept]").change(function() {
                    $("[data-department]").hide();
                    $("[data-department='" + $("[name$=ddEmpDept]")[0].value+ "']").show();
                });
                
                $('li[data-emp]').draggable({ revert: true });
                $('input[name$=txtPDSupervisorName]').droppable({  //.closest('td').droppable({
                    accept: 'li[data-emp]',
                    drop: function(event, ui) {
                        var targecell = $(event.target); //.find('input');
                        var empname = event.srcElement.innerText.trim();
                        var targetidcell = $(targecell).closest('tr').find("[name$=txtPDSupervisor]")
                        var empid = event.srcElement.getAttribute("data-EmployeeID");
                        targecell[0].value = empname;
                        targetidcell[0].value = empid;
                    },
                    activeClass: "highlighttask",
                });
                
                $('input[name$=txtPDNoofHours]').inputmask({
                    "mask": "9",
                    "repeat": 10,
                    "greedy": false
                });
                
                
                
                
                
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
                       <%= txtProjectName.UniqueID %>: "required",
                       <%= txtProjectDesc.UniqueID %>: "required",
                       <%= ddClientName.UniqueID %>: "required",
                       <%= ddAgency.UniqueID %>: "required",
                       <%= ddLeader.UniqueID %>: "required",
                       <%= ddDepartment.UniqueID %>: "required",
                       <%= ddResearchEngineer.UniqueID %>: "required",
                       <%= ddProjectType.UniqueID %>: "required",
                       <%= ddStatus.UniqueID %>: "required"
                   },

                   messages: {
                       <%= txtProjectName.UniqueID %>: "Project Name is required.",
                       <%= txtProjectDesc.UniqueID %>: "Description is required.",
                       <%= ddClientName.UniqueID %>: "Client is required.",
                       <%= ddAgency.UniqueID %>: "Agency is reuqired.",
                       <%= ddLeader.UniqueID %>: "Leader is required.",
                       <%= ddDepartment.UniqueID %>: "Department is required.",
                       <%= ddResearchEngineer.UniqueID %>: "Research Engineer is required.",
                       <%= ddProjectType.UniqueID %>: "Project type is required.",
                       <%= ddStatus.UniqueID %>: "Status is required."
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
