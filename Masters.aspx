<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Masters.aspx.cs"
    Inherits="KedSys35.Masters" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">
// <!CDATA[

        function sample_editable_1_new_onclick() {
            var grd = document.getElementById('<%=GridView1.ClientID%>');
            var tbod = grd.rows[0].parentNode;
            var newRow = grd.rows[grd.rows.length - 1].cloneNode(true);
            tbod.appendChild(newRow);
            return false;
        }

// ]]>
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form2" runat="server">
    <!-- BEGIN PAGE -->
    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    </button>
                    <h4 class="modal-title">
                        Modal title</h4>
                </div>
                <div class="modal-body">
                    Widget settings form goes here
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn blue">
                        Save changes</button>
                    <button type="button" class="btn default" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <!-- BEGIN PAGE HEADER-->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Masters
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="dashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="#">Masters</a> <i class="icon-angle-right"></i></li>
                <li><a href="#">Broad Category</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>
    <!-- END PAGE HEADER-->
    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-edit"></i>Broad Category</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a><a href="javascript:;" class="reload">
                        </a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="#" class="horizontal-form">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Broad Category</label>
                                        <div class="col-md-8">
                                    <input type="text" id="firstName" class="form-control" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            
                                       <div class="col-md-4">
                                          <div class="form-group">
                                             <label class="control-label">Active</label>
                                    <input type="checkbox" id="Checkbox5" value="option1">
                                </label>
                                          </div>
                                       </div> 
                            <!--/span-->
                        </div>
                         <div class="form-actions right">
                            <button type="button" class="btn default">
                                Cancel</button>
                            <button type="submit" class="btn green">
                                Submit</button>
                        </div>
                    </div>
                    </form>
                    <!-- END FORM-->
                </div>
                <div class="portlet-body">
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                        class="table table-striped table-bordered table-hover">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUID" runat="server" Text='<%# Eval("UID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField  DataField="Listval1" HeaderText="Broad Category" Visible="True" />
                            <%--<asp:BoundField DataField="UID" HeaderText="UID" Visible="False" />--%>
                            
                            
                            <asp:TemplateField HeaderText="Active" ItemStyle-CssClass="visible-desktop" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkisActive" runat="server" Checked='<%# Bind("isActive") %>' class="checkboxes">
                                    </asp:CheckBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" CssClass="visible-desktop"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" >
                                <ItemTemplate>
                                    <span class="badge badge-danger">Edit</span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
    </div>
    <!-- END PAGE CONTENT -->
    <!-- END PAGE -->
    </form>
</asp:Content>
