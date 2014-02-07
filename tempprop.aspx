<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tempprop.aspx.cs" Inherits="KedSys35.tempprop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap2-typeahead.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
    <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
    <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
    <script type="text/javascript" src="assets/scripts/JScript.js"></script>
    <script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap-toastr/toastr.min.js"></script>
    <script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script> 
</head>
<body>
    <form id="form1" runat="server" class="form">
    <div id="portlet-control-grid" class="portlet box green">
    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" 
        OnRowDataBound="gv_RowCommand" OnRowCommand="gv_RowCommand" CellPadding="0"
        class="table table-striped table-bordered table-hover">
        <Columns>
            <asp:TemplateField >
                <HeaderTemplate>
                    <asp:Label ID="lblcode" runat="server" Text="Code"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Code" CssClass="" runat="server" Text='<%#Eval("Code")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate>
                    <asp:Label ID="lblCostItemname" runat="server" Text="CostItemname"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="CostItemname" CssClass="" runat="server" Text='<%#Eval("CostItemname")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate>
                    <asp:Table ID=tbpoption1 runat="server">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="1" runat="server">Option 1</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Table ID=tbdoption1 runat="server">
                        <asp:TableRow>
                        </asp:TableRow>
                    </asp:Table>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate>
                    <asp:Table ID=tbpoption2 runat="server">
                        <asp:TableRow>
                            <asp:TableCell ID="TableCell1" ColumnSpan="1" runat="server"></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Table ID=tbdoption2 runat="server">
                        <asp:TableRow>
                        </asp:TableRow>
                    </asp:Table>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate>
                    <asp:Table ID=tbpoption3 runat="server">
                        <asp:TableRow>
                            <asp:TableCell ID="TableCell1" ColumnSpan="1" runat="server"></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Table ID=tbdoption3 runat="server">
                        <asp:TableRow>
                        </asp:TableRow>
                    </asp:Table>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate>
                    <asp:Table ID=tbpoption4 runat="server">
                        <asp:TableRow>
                            <asp:TableCell ID="TableCell1" ColumnSpan="1" runat="server"></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Table ID=tbdoption4 runat="server">
                        <asp:TableRow>
                        </asp:TableRow>
                    </asp:Table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        
    </div>
    <div>
        <a id="show">Show</a>
        <a id="hide">Hide</a>
    </div>
    <div>
        <asp:TextBox ID="txtoption" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtmethod" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </div>
    </form>
</body>
<script>
    jQuery(document).ready(function() {

        $("#hide").click(function() {
            $(".csmethod").hide();
            $(".cscity").hide();
            $(".csoption").css('width', "100px");     
        });

        $("#show").click(function() {
            $(".csmethod").show();
            $(".cscity").show();
            $(".csoption").css('width', "");
        });
    });

</script>
</html>
