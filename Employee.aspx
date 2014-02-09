<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="KedSys35.Employee" Title="Kadence | Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <form id="formmstcostitem" name="formmstcostitem" class="form" runat="server">
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
                <li><a href="Employee.aspx">Employee</a></li>
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
    <div class="row">
        <div class="col-md-12">
            <div id="portlet-control" class="portlet box green" style="display:none">
                <div class="portlet-title">
                    <div class="caption">Employee</div>
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
                                    <label class="control-label">Employee ID</label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtEmployeeID" Enabled="false" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">First Name<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtEmployeeFName"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Last Name<span class="required">*</span></label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtEmployeeLName"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div>
                                    <label class="control-label">User ID<span class="required">*</span></label>
                                    <asp:label id="lbllogininfo" class ="control-label pull-right lblsmall" visible="false" runat="server"></asp:label>
                                    <asp:LinkButton ID="btn_reset" CssClass="pull-right" Text="Reset Password&nbsp;&nbsp;" visible="false" runat="server" onclick="btn_reset_Click"></asp:LinkButton>
                                    </div>
                                    <div class="input-groupd"><div class="input-icon right">
                                    <asp:TextBox ID="txtUserID"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Title</label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddTitle" class="form-control select2me" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Department</label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddDepartment" class="form-control select2me" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">EMail<span class="required">*</span></label>
                                    <div class="input-groupd"><div class="input-group">
                                        <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                        <asp:TextBox id = "txtEmailAddress" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                    </div></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Mobile No</label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtMobileNo"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Work Phone No</label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtWorkPhoneNo"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Home Phone No</label>
                                    <div class="input-groupd">
                                    <asp:TextBox ID="txtHomeno"  class="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Home Address</label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtHomeAddress" class="form-control" TextMode="multiline" rows ="3" type="textarea" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">Join Date</label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtJoinDate" class="form-control form-control-inline date-picker" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">End Date</label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtEndDate" class="form-control form-control-inline date-picker" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Gender</label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddGender" class="form-control select2me" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Birthday</label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtBirthday" class="form-control form-control-inline date-picker" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Direct Manager</label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddDirectManager" class="form-control select2me" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Indirect Manager</label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddIndirectManager" class="form-control select2me" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Director</label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddDirector" class="form-control select2me" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Role</label>
                                    <div class="input-groupd">
                                    <asp:DropDownList ID="ddEmployeeRole" class="form-control select2me" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Notes</label>
                                    <div class="input-groupd">
                                    <asp:TextBox id = "txtNotes" class="form-control" TextMode="multiline" rows ="3" type="textarea" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <div class="checkbox-list">
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkSalesPerson" runat="server"/>
                                    Sales Person
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkManager" runat="server"/>
                                    Manager
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkLeader" runat="server"/>
                                    Leader
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkCoordinator" runat="server"/>
                                    Coordinator
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkSharedResource" runat="server"/>
                                    SharedResource
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox id="chkActive" runat="server" Checked="true"/>
                                    Active
                                </label>
                                <div class="pull-right">
                                <label  class="checkbox-inline" >
                                    <asp:CheckBox id="chkLocked" runat="server"/>
                                    Locked
                                </label>
                                <asp:Label id="lbllocked" class="control-label lblsmall" runat="server" ></asp:Label>
                                </div>
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
                    <div class="caption">Employee</div>
                    <div class="pull-right">
                    <asp:LinkButton ID="btnRemoveFilter" class="btn btn-xs red" Text= "Remove Filter <i class='icon-filter'></i>" runat="server"
                    OnClick = "btnRemoveFilter_Click">
                    </asp:LinkButton>
                    <a href="#" id="btnadd" class="btn btn-xs default zbtnadd" runat="server">Add <i class="icon-plus"></i></a>
                    </div>
                    </div>
                    
                    <div id="portlet-detail-grid" class="portlet-body">
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                        AllowPaging="true" OnPageIndexChanging = "OnPaging" PageSize = "10"
                        AllowSorting="true" OnSorting = "OnSorting" 
                        OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                        class="table table-striped table-bordered table-hover">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="UID" CssClass="" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblEmployeeID" runat="server" Text="Employee ID"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtEmployeeID" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="EmployeeID" CommandArgument="EmployeeID"></asp:linkbutton>
                                        <a href="#" id="fltEmployeeID" data-filterex="EmployeeID"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="EmployeeID" CssClass="" runat="server" Text='<%#Eval("EmployeeID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblEmployeeFName" runat="server" Text="First Name"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtEmployeeFName" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="EmployeeFName" CommandArgument="EmployeeFName"></asp:linkbutton>
                                        <a href="#" id="fltEmployeeFName" data-filterex="EmployeeFName"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="EmployeeFName" CssClass="" runat="server" Text='<%#Eval("EmployeeFName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblEmployeeLName" runat="server" Text="Last Name"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtEmployeeLName" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="EmployeeLName" CommandArgument="EmployeeLName"></asp:linkbutton>
                                        <a href="#" id="fltEmployeeLName" data-filterex="EmployeeLName"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="EmployeeLName" CssClass="" runat="server" Text='<%#Eval("EmployeeLName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblUserID" runat="server" Text="User ID"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtUserID" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="UserID" CommandArgument="UserID"></asp:linkbutton>
                                        <a href="#" id="fltUserID" data-filterex="UserID"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="UserID" CssClass="" runat="server" Text='<%#Eval("UserID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtTitle" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Title" CommandArgument="Title"></asp:linkbutton>
                                        <a href="#" id="fltTitle" data-filterex="Title"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Title" CssClass="" runat="server" Text='<%#Eval("Title")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                                    <div class="pull-right" >
                                        <asp:linkbutton id="srtDepartment" runat ="server" Text = "<i class='icon-sort'></i>"
                                        CommandName="Sort" SortExpression="Department" CommandArgument="Department"></asp:linkbutton>
                                        <a href="#" id="fltDepartment" data-filterex="Department"><i class="icon-filter"></i></a> 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Department" CssClass="" runat="server" Text='<%#Eval("Department")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblisActive" runat="server" Text="Active"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="Active" runat="server" Checked='<%#Eval("Active")%>' Enabled="false"></asp:CheckBox>
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
                $('#<%= txtUserID.ClientID %>').bind('keyup',function(){
                    return false; 
                });
                $('#<%= txtEmployeeID.ClientID %>').bind('keyup',function(){
                    return false; 
                });
                $('#<%= txtEmailAddress.ClientID %>').bind('keyup',function(){
                    return false; 
                });
         });
         
         jQuery.validator.addMethod("uniqueuser",
            function(value, element){
                var input =  $("#<%= txtUserID.ClientID %>");
                if (input.val() === "") {
                    return false;
                }
                input.addClass("spinner");
                
                var respons='';
                $.ajax({
                    type: "POST",
                    url: "employee.aspx/CheckUserName",
                    async: false,
                    data: '{UserID: "' + $("#<%=txtUserID.ClientID%>")[0].value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success:function(data){
                        response = data;}
                }).responseText;

                input.removeClass("spinner");
                if (response.d == "true") 
                    return true;
                else    
                    return false;

            },"User Id not available."
         );
         
         jQuery.validator.addMethod("uniqueempid",
            function(value, element){
                var input =  $("#<%= txtEmployeeID.ClientID %>");
                if (input.val() === "") {
                    return false;
                }
                input.addClass("spinner");
                
                var respons='';
                $.ajax({
                    type: "POST",
                    url: "employee.aspx/CheckEmployeeID",
                    async: false,
                    data: '{EmployeeID: "' + $("#<%=txtEmployeeID.ClientID%>")[0].value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success:function(data){
                        response = data;}
                }).responseText;

                input.removeClass("spinner");
                if (response.d == "true") 
                    return true;
                else    
                    return false;

            },"Employee ID not available."
         );
         
         jQuery.validator.addMethod("uniqueemailid",
            function(value, element){
                var input =  $("#<%= txtEmailAddress.ClientID %>");
                if (input.val() === "") {
                    return false;
                }
                input.addClass("spinner");
                
                var respons='';
                $.ajax({
                    type: "POST",
                    url: "employee.aspx/CheckEmailID",
                    async: false,
                    data: '{EmailAddress: "' + $("#<%=txtEmailAddress.ClientID%>")[0].value + '", UserID: "' +  $("#<%=txtUserID.ClientID%>")[0].value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success:function(data){
                        response = data;}
                }).responseText;

                input.removeClass("spinner");
                if (response.d == "true") 
                    return true;
                else    
                    return false;

            },"EMail ID used already."
         );
         
         jQuery(document).ready(function() {
             $.validator.addMethod("PastDate",
                    function (value, element) { 
                        if (value == "") {
                            return true;
                        }
                        return Date.parse(value.replace("-","/")) < new Date().getTime(); 
                    },
                    "Date should not be in future."
             );
        });
 
         

        jQuery(document).ready(function() {
            if ($("#<%= hidprot.ClientID %>").val() == "portlet-control-grid") {
                $("#portlet-control-grid").show();
                $("#portlet-control").hide();
                $("#brdliPageID").hide();
            }
            else {
                $("#portlet-control").show();
                $("#portlet-control-grid").hide();
                $("#brdliPageID").show();
            }
            
            if ($("#<%= hidUID.ClientID %>").val().length == 0)
            {
                $('#<%= txtUserID.ClientID %>').removeAttr('disabled');
//                $('#<%= txtEmployeeID.ClientID %>').removeAttr('disabled');
//                $('#<%= txtEmailAddress.ClientID %>').removeAttr('disabled');
            }
            else
            {
                $("#<%= txtUserID.ClientID %>").attr('disabled', true);
//                $("#<%= txtEmployeeID.ClientID %>").attr('disabled', true);
//                $("#<%= txtEmailAddress.ClientID %>").attr('disabled', true);
            }
                
            $('[data-high]').click(function() {
                $('[data-high]').removeClass('active');
            });
            
            var totalRows = $("#<%=GridView1.ClientID %> tr").length;
            if (totalRows == "0")
                $("#lblgridnot").show();
            else
                $("#lblgridnot").hide();
                
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    autoclose: true
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
        });

        jQuery(document).ready(function() {
            jQuery('.zbtnadd').click(function() {
                $("#portlet-control").show();
                $("#portlet-control-grid").hide();
                $("#<%= hidprot.ClientID %>").val("portlet-control");
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
                   <%= txtEmployeeID.UniqueID %>: {
                        required: true,
                        uniqueempid:true},
                   <%= txtEmployeeFName.UniqueID %>: "required",
                   <%= txtEmployeeLName.UniqueID %>: "required",
                   <%= txtUserID.UniqueID %>: {
                        required: true,
                        uniqueuser: true},
                   <%= txtEmailAddress.UniqueID %>:{required: true,email:true,uniqueemailid:true},
                   <%= txtBirthday.UniqueID %>: {date:true,PastDate:true},
                   <%= txtJoinDate.UniqueID %>: "date",
                   <%= txtEndDate.UniqueID %>: "date"
                   
               },

               messages: {
                   <%= txtEmployeeID.UniqueID %>: {
                         required:"Employee ID is required."},
                   <%= txtEmployeeFName.UniqueID %>: "First Name is required.",
                   <%= txtEmployeeLName.UniqueID %>: "Last Name is required.",
                   <%= txtUserID.UniqueID %>: {
                         required:"User ID is required.",
                         uniqueuser:"User ID not available."},
                   <%= txtEmailAddress.UniqueID %>:{required: "EMail id is required."},
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
