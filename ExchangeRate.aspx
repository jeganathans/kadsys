<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExchangeRate.aspx.cs" Inherits="KedSys35.ExchangeRate" Title="Kadence | Exchange Rate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="assets/plugins/jquery.formatCurrency-1.4.0.min.js"></script>
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
                <li><a href="ExchangeRate.aspx">Exchange Rate</a></li>
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
                    <div class="caption">Exchange Rate</div>
                    </div>
                    
                    <div id="portlet-detail-grid" class="portlet-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Month Year</label>
                                <div class="input-groupd">
                                <asp:DropDownList ID="ddDateEffective" class="form-control select2me" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddDateEffective_Changed" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Base Currency</label>
                                <div class="input-groupd">
                                <asp:Label ID="lblBaseCurrency" CssClass="form-control" runat="server" ></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
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
                                    <asp:Label ID="lblCurrencyType" runat="server" Text="Currency Type"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="CurrencyType" CssClass="form-control" runat="server" Text='<%#Eval("CurrencyType")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblCurrencyValue" runat="server" Text="Currency Value"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="CurrencyValue" CssClass="form-control camt zreq" runat="server" Text='<%#Eval("CurrencyValue")%>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblPrevMonthValue" runat="server" Text="Previous Month Value"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="PrevMonthValue" CssClass="form-control camt" Enabled="false" runat="server" Text='<%#Eval("PrevMonthValue")%>'></asp:Label>
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
        
            $('.camt').change(function() {
                $(this).val($(this).asNumber());
                $(this).formatCurrency({ roundToDecimalPlace: 2, symbol: '' });
            });

            $('.camt').formatCurrency({ roundToDecimalPlace: 2, symbol: '' });
        });
    </script>
   </form>
</asp:Content>
