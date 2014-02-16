<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectDashboard.aspx.cs" Inherits="KedSys35.ProjectDashboard" Title="Kadence | Project Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script src="assets/plugins/flot/jquery.flot.js"></script>
   <script src="assets/plugins/flot/jquery.flot.resize.js"></script>
   <script src="assets/plugins/flot/jquery.flot.pie.js"></script>
   <script src="assets/plugins/flot/jquery.flot.stack.js"></script>
   <script src="assets/plugins/flot/jquery.flot.categories.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="formprojectdb" name="formprojectdb" class="form" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Project Dashboard
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="dashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="ProjectAll.aspx">Project</a></li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat blue">
                <div class="visual">
                    <i class="icon-book"></i>
                </div>
                <div class="details">
                    <div class="number">
                        <asp:Label ID="totalproject" runat="server"></asp:Label>
                    </div>
                    <div class="desc">
                        Total Project (YTD)
                    </div>
                </div>
                <a class="more" href="ProjectAll.aspx?ytd=yes">View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat green">
                <div class="visual">
                    <i class="icon-book"></i>
                </div>
                <div class="details">
                    <div class="number">
                        <asp:Label ID="newproject" runat="server"></asp:Label>
                    </div>
                    <div class="desc">
                        Total Project (MTD)</div>
                </div>
                <a class="more" href="ProjectAll.aspx?mtd=yes">View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat purple">
                <div class="visual">
                    <i class="icon-list-ul"></i>
                </div>
                <div class="details">
                    <div class="number">
                        <asp:Label ID="lblQualitative" runat="server"></asp:Label></div>
                    <div class="desc">
                        Qualitative (MTD)</div>
                </div>
                <a class="more" href="ProjectAll.aspx?qualmtd=yes">View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="dashboard-stat yellow">
                <div class="visual">
                    <i class="icon-list-ol"></i>
                </div>
                <div class="details">
                    <div class="number">
                        <asp:Label ID="lblQuantitive" runat="server"></asp:Label></div>
                    <div class="desc">
                        Quantitive (MTD)</div>
                </div>
                <a class="more" href="ProjectAll.aspx?quanmtd=yes">View more <i class="m-icon-swapright m-icon-white"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-9 col-sm-9">
            <!-- BEGIN PORTLET-->
            <div class="portlet solid bordered light-grey">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-bar-chart"></i>Statistics
                    </div>
                        <div class="tools">
                            
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn default btn-sm active">
                                    <input type="radio" name="options" class="toggle" id="option1" checked="checked">Product
                                </label>
                                <label class="btn default btn-sm">
                                    <input type="radio" name="options" class="toggle" id="option2">Manager
                                </label>
                                <label class="btn default btn-sm">
                                    <input type="radio" name="options" class="toggle" id="option3">Employee
                                </label>
                            </div>
                        </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                                <label class="control-label">Month</label>
                                    <asp:DropDownList ID="ddmonth" class="zddmonth" runat="server"></asp:DropDownList>
                            </div>
                    <div id="chartstat_loading">
                        <img src="assets/img/loading.gif" alt="loading" />
                    </div>
                    <div id="chartstat_content" > <%--class="display-none"--%>
                        <div id="chartstat" class="chart">
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PORTLET-->
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="portlet box red">                <div class="portlet-title">
                     <div class="caption"><i class="icon-reorder"></i>Quick Links</div>                </div>
                <div class="portlet-body">                     <a href="ProjectAll.aspx?status=Yet to Start" class="list-group-item">Yet to Start Projects</a>                     <a href="ProjectAll.aspx?status=In Process" class="list-group-item">In Process Projects</a>                     <a href="ProjectAll.aspx?status=Completed" class="list-group-item">Completed Projects</a>                     <a href="ProjectAll.aspx?status=Cancelled" class="list-group-item">Cancelled Projects</a>                     <a href="ProjectAll.aspx" class="list-group-item">All Projects</a>                </div>
                
            </div>
        </div>
    </div>
          
    <script>

        function flotChart() {
            var chktype = $("input[name=options]:checked");
            if ($(chktype).length == 1)
                var type = chktype[0].id;
            else
                return
            var monthyear = $('.zddmonth').val();

            $('[id=chartstat_loading]').show();

            var response = '';
            $.ajax({
                type: "POST",
                url: "ProjectDashboard.aspx/ProjectDBChart",
                async: false,
                data: '{XType: "' + type + '", MonthYear: "' + monthyear + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(data) {
                    response = data;
                },
                failure: function() {
                    alert("failed");
                }
            }).responseText;

            var data1 = response.d;

            $.plot("#chartstat", [data1], {
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
                }
            });

            $('[id=chartstat_loading]').hide();
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
