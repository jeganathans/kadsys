<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccessModule.aspx.cs" Inherits="KedSys35.AccessModule" 
Title="Kadence | Module Access"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="formexrate" name="formexrate" class="form" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Masters
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="dashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="AccessModule.aspx">Module Access</a></li>
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
        
                <div id="portlet-control-grid" class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Module Access</div>
                    </div>
                    
                    <div id="portlet-detail-grid" class="portlet-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Role</label>
                                <div class="input-groupd">
                                <asp:DropDownList ID="ddRole" class="form-control select2me" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddRole_Changed" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                        OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand"
                        class="proptable table-bordered table-hover">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="UID" CssClass="" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblModulename" runat="server" Text="Module Name"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Modulename" runat="server" Text='<%#Eval("Modulename")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblAllowAdd" runat="server" Text="Allow Add"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="AllowAdd" runat="server" Checked='<%#Eval("AllowAdd")%>' ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblAllowEdit" runat="server" Text="Allow Edit"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="AllowEdit" runat="server" Checked='<%#Eval("AllowEdit")%>' ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblAllowDelete" runat="server" Text="AllowDelete"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="AllowDelete" runat="server" Checked='<%#Eval("AllowDelete")%>' ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="Active" runat="server" Checked='<%#Eval("Active")%>' ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                <div>
                    <label ID="lblgridnot" name="lblgridnot" class="label-danger" style="display:none">Details not available, Please remove filter, if applied</label> 
                    </div>
                    
                    <div class="form-actions right">
                        <asp:Button id="btn_submit" class="btn green" text="Submit" type="submit" runat="server" 
                            OnClientClick="return checkvalid();" onclick="btn_submit_Click"></asp:Button>
                    </div>
                    
                </div>
                </div>
                
    
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

        function checkvalid() {
            var resValid;
            resValid = true;
            var inputs = $('.zreq');
            $.each(inputs, function(index, inputs) {
                if (inputs.value.trim().length == 0 || inputs.value == 0) {
                    $(inputs).addClass('cerrortask');
                    $(inputs).attr("title", "Required");
                    resValid = false;
                }
                else {
                    emptytask = false;
                    $(inputs).removeClass('cerrortask');
                }

            });
            if (resValid == false) {
                $("#<%= hidtoaster.ClientID %>").val("warning|Please correct the errors");
                showtoastrr();
            }
            return resValid;

        }

        jQuery(document).ready(function() {
            showtoastrr();
        });
    </script>
   </form>
</asp:Content>
