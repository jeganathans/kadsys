<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="KedSys35.WebForm1" Title="Kadence | Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="assets/plugins/flot/jquery.flot.js"></script>
   <script src="assets/plugins/flot/jquery.flot.resize.js"></script>
   <script src="assets/plugins/flot/jquery.flot.pie.js"></script>
   <script src="assets/plugins/flot/jquery.flot.stack.js"></script>
   <script src="assets/plugins/flot/jquery.flot.categories.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="formdb" name="formdb" class="form" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Dashboard
            </h3>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-4 ">
           <div class="portlet box green">
              <div class="portlet-title">
                 <div class="caption"><i class="icon-reorder"></i>Top 10 Clients</div>
              </div>
              <div class="portlet-body">
                 <div style="height:300px">                    <asp:HiddenField ID="hidchart1" runat="server" />                    <div id="divchart1" class="chart"></div>                 </div>
              </div>
           </div>
        </div>
        <div class="col-md-4 ">
           <div class="portlet box green">
              <div class="portlet-title">
                 <div class="caption"><i class="icon-reorder"></i>Top 10 Projects</div>
              </div>
              <div class="portlet-body">
                <div style="height:300px">                    <asp:HiddenField ID="hidchart2" runat="server" />                    <div id="divchart2" class="chart"></div>                 </div>
              </div>
           </div>
        </div>
        <div class="col-md-4 ">
           <div class="portlet box green">
              <div class="portlet-title">
                 <div class="caption"><i class="icon-reorder"></i>Industry Type</div>
              </div>
              <div class="portlet-body">
                <div style="height:300px">                    <asp:HiddenField ID="hidchart3" runat="server" />                    <div id="divchart3" class="chart"></div>                 </div>
              </div>
           </div>
        </div>
     </div>
     <div class="row">
        <div class="col-md-4 ">
           <div class="portlet box green">
              <div class="portlet-title">
                 <div class="caption"><i class="icon-reorder"></i>Top 5 Contributur</div>
              </div>
              <div class="portlet-body">
                 <div style="height:300px">                    <asp:HiddenField ID="hidchart4" runat="server" />                    <div id="divchart4" class="chart"></div>                 </div>
              </div>
           </div>
        </div>
        <div class="col-md-4 ">
           <div class="portlet box green">
              <div class="portlet-title">
                 <div class="caption"><i class="icon-reorder"></i>Qualitative Vs Quantitative</div>
              </div>
              <div class="portlet-body">
                <div style="height:300px">                    <asp:HiddenField ID="hidchart5" runat="server" />                    <div id="divchart5" class="chart"></div>                 </div>
              </div>
           </div>
        </div>
        <div class="col-md-4 ">
           <div class="portlet box green">
              <div class="portlet-title">
                 <div class="caption"><i class="icon-reorder"></i>Qualitative Vs Quantitative</div>
              </div>
              <div class="portlet-body">
                <div style="height:300px">                    <asp:HiddenField ID="hidchart6" runat="server" />                    <div id="divchart6" class="chart"></div>                 </div>
              </div>
           </div>
        </div>
     </div>
    
          
    <script>

        function flotChart() {

            var data1 = $.parseJSON($("#<%= hidchart1.ClientID %>").val());
            $.plot("#divchart1", data1, {
                series: {
                    pie: {
                        show: true
                    }
                },
                legend: {
                    show: false
                }, colors: ["#4A7B6F"]
            });

            var data2 = $.parseJSON($("#<%= hidchart2.ClientID %>").val());
            $.plot("#divchart2", data2, {
                series: {
                    pie: {
                        show: true
                    }
                },
                legend: {
                    show: false
                }, colors: ["#9EAEB3"]
            });

            var data3 = $.parseJSON($("#<%= hidchart3.ClientID %>").val());
            $.plot("#divchart3", [data3], {
                series: {
                    bars: {
                        show: true,
                        barWidth: 0.6,
                        align: "center"
                    }
                },
                xaxis: {
                    mode: "categories",
                    tickLength: 0
                }, colors: ["#9EAEB3"]
            });

            var data4 = $.parseJSON($("#<%= hidchart4.ClientID %>").val());
            $.plot("#divchart4", [data4], {
                series: {
                    bars: {
                        show: true,
                        barWidth: 0.6,
                        align: "center"
                    }
                },
                xaxis: {
                    mode: "categories",
                    tickLength: 0
                }, colors: ["#84978F"]
            });

            var data5 = $.parseJSON($("#<%= hidchart5.ClientID %>").val());
            $.plot("#divchart5", [data5], {
                series: {
                    bars: {
                        show: true,
                        barWidth: 0.6,
                        align: "center"
                    }
                },
                xaxis: {
                    mode: "categories",
                    tickLength: 0
                }, colors: ["#527578"]
            });

            var data6 = $.parseJSON($("#<%= hidchart6.ClientID %>").val());
            $.plot("#divchart6", data6, {
                series: {
                    pie: {
                        show: true
                    }
                },
                legend: {
                    show: false
                }, colors: ["#495E88"]
            });
            
        }

        jQuery(document).ready(function() {

            $('.zddmonth').change(function() {
                flotChart();

            });
            $('[name=options]').change(function() {
                flotChart();

            });



            flotChart();



        });
        
        
    </script>

    </form>
</asp:Content>
