<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="KedSys35.WebForm1" Title="Kadence | Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="assets/plugins/flot/jquery.flot.js"></script>
   <script src="assets/plugins/flot/jquery.flot.resize.js"></script>
   <script src="assets/plugins/flot/jquery.flot.pie.js"></script>
   <script src="assets/plugins/flot/jquery.flot.stack.js"></script>
   <script src="assets/plugins/flot/jquery.flot.categories.js"></script>
   <script src="assets/plugins/flot/jquery.flot.tickrotor.js"></script>
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
    
    <div class="tabbable-custom ">
        <ul class="nav nav-tabs charttab">
           <li class="active"><a href="#tab_1" data-toggle="tab">Proposal</a></li>
           <li><a href="#tab_2" data-toggle="tab">Project</a></li>
        </ul>
        <div class="tab-content">
           <div class="tab-pane active" id="tab_1">                <div class="row">
                    <div class="col-md-4 ">
                       <div class="portlet box green">
                          <div class="portlet-title">
                             <div class="caption"><i class="icon-reorder"></i>
                                <label>Top 10 Clients by # of Proposals</label>
                             </div>
                          </div>
                          <div class="portlet-body">
                             <div style="height:300px">                                <asp:HiddenField ID="hidProposalchart1" runat="server" />                                <div id="divProposalchart1" class="chart"></div>                             </div>
                          </div>
                       </div>
                    </div>
                    <div class="col-md-4 ">
                       <div class="portlet box green">
                          <div class="portlet-title">
                             <div class="caption"><i class="icon-reorder"></i>
                                <label>Top 10 Proposals by Revenue</label>
                             </div>
                          </div>
                          <div class="portlet-body">
                            <div style="height:300px">                                <asp:HiddenField ID="hidProposalchart2" runat="server" />                                <div id="divProposalchart2" class="chart"></div>                             </div>
                          </div>
                       </div>
                    </div>
                    <div class="col-md-4 ">
                       <div class="portlet box green">
                          <div class="portlet-title">
                             <div class="caption"><i class="icon-reorder"></i>
                                <label>Proposals by Industry Type</label>
                             </div>
                          </div>
                          <div class="portlet-body">
                            <div style="height:300px">                                <asp:HiddenField ID="hidProposalchart3" runat="server" />                                <div id="divProposalchart3" class="chart"></div>                             </div>
                          </div>
                       </div>
                    </div>
                 </div>                 <div class="row">
                        <div class="col-md-4 ">
                           <div class="portlet box green">
                              <div class="portlet-title">
                                 <div class="caption"><i class="icon-reorder"></i>
                                    <label>Top 5 Contributing Clients</label>
                                 </div>
                              </div>
                              <div class="portlet-body">
                                 <div style="height:300px">                                    <asp:HiddenField ID="hidProposalchart4" runat="server" />                                    <div id="divProposalchart4" class="chart"></div>                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-4 ">
                           <div class="portlet box green">
                              <div class="portlet-title">
                                 <div class="caption"><i class="icon-reorder"></i>
                                    <label>Qualitative Vs Quantitative by # of Proposals</label>
                                 </div>
                              </div>
                              <div class="portlet-body">
                                <div style="height:300px">                                    <asp:HiddenField ID="hidProposalchart5" runat="server" />                                    <div id="divProposalchart5" class="chart"></div>                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-4 ">
                           <div class="portlet box green">
                              <div class="portlet-title">
                                 <div class="caption"><i class="icon-reorder"></i>
                                    <label>Qualitative Vs Quantitative by Revenue</label>
                                 </div>
                              </div>
                              <div class="portlet-body">
                                <div style="height:300px">                                    <asp:HiddenField ID="hidProposalchart6" runat="server" />                                    <div id="divProposalchart6" class="chart"></div>                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>           </div>           <div class="tab-pane" id="tab_2">                <div class="row">
                    <div class="col-md-4 ">
                       <div class="portlet box green">
                          <div class="portlet-title">
                             <div class="caption"><i class="icon-reorder"></i>
                                <label>Top 10 Clients by # of Projects</label>
                             </div>
                          </div>
                          <div class="portlet-body">
                             <div style="height:300px">                                <asp:HiddenField ID="hidProjchart1" runat="server" />                                <div id="divProjchart1" class="chart"></div>                             </div>
                          </div>
                       </div>
                    </div>
                    <div class="col-md-4 ">
                       <div class="portlet box green">
                          <div class="portlet-title">
                             <div class="caption"><i class="icon-reorder"></i>
                                <label>Top 10 Projects by Revenue</label>
                             </div>
                          </div>
                          <div class="portlet-body">
                            <div style="height:300px">                                <asp:HiddenField ID="hidProjchart2" runat="server" />                                <div id="divProjchart2" class="chart"></div>                             </div>
                          </div>
                       </div>
                    </div>
                    <div class="col-md-4 ">
                       <div class="portlet box green">
                          <div class="portlet-title">
                             <div class="caption"><i class="icon-reorder"></i>
                                <label>Projects by Industry Type</label>
                             </div>
                          </div>
                          <div class="portlet-body">
                            <div style="height:300px">                                <asp:HiddenField ID="hidProjchart3" runat="server" />                                <div id="divProjchart3" class="chart"></div>                             </div>
                          </div>
                       </div>
                    </div>
                 </div>
                <div class="row">
                        <div class="col-md-4 ">
                           <div class="portlet box green">
                              <div class="portlet-title">
                                 <div class="caption"><i class="icon-reorder"></i>
                                    <label>Top 5 Contributing Clients</label>
                                 </div>
                              </div>
                              <div class="portlet-body">
                                 <div style="height:300px">                                    <asp:HiddenField ID="hidProjchart4" runat="server" />                                    <div id="divProjchart4" class="chart"></div>                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-4 ">
                           <div class="portlet box green">
                              <div class="portlet-title">
                                 <div class="caption"><i class="icon-reorder"></i>
                                    <label>Qualitative Vs Quantitative by # of Projects</label>
                                 </div>
                              </div>
                              <div class="portlet-body">
                                <div style="height:300px">                                    <asp:HiddenField ID="hidProjchart5" runat="server" />                                    <div id="divProjchart5" class="chart"></div>                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-4 ">
                           <div class="portlet box green">
                              <div class="portlet-title">
                                 <div class="caption"><i class="icon-reorder"></i>
                                    <label>Qualitative Vs Quantitative by Revenue</label>
                                 </div>
                              </div>
                              <div class="portlet-body">
                                <div style="height:300px">                                    <asp:HiddenField ID="hidProjchart6" runat="server" />                                    <div id="divProjchart6" class="chart"></div>                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>           </div>        </div>    </div>

    
          
    <script>

        function flotChartProposal() {

            var data1 = $.parseJSON($("#<%= hidProposalchart1.ClientID %>").val());
            $.plot("#divProposalchart1", data1, {
                series: {
                    pie: {
                        show: true,
                        radius: 1,
                        label: {
                            show: true,
                            radius: 2 / 3,
                            formatter: function(label, series) {
                                return '<div style="font-size:6pt;text-align:center;padding:2px;color:white;">' + label + '<br/>' + Math.round(series.percent) + '%</div>';
                            },
                            threshold: 0.1
                        }
                    }
                },
                legend: {
                    show: false
                }, colors: ["#4A7B6F"]
            });

            var data2 = $.parseJSON($("#<%= hidProposalchart2.ClientID %>").val());
            $.plot("#divProposalchart2", data2, {
                series: {
                    pie: {
                        show: true
                    }
                },
                legend: {
                    show: false
                }, colors: ["#9EAEB3"]
            });

            var data3 = $.parseJSON($("#<%= hidProposalchart3.ClientID %>").val());
            $.plot("#divProposalchart3", [data3], {
                series: {
                    bars: {
                        show: true,
                        barWidth: 0.6,
                        align: "center"
                    }
                },
                xaxis: {
                    mode: "categories",
                    rotateTicks: 45
                }, colors: ["#9EAEB3"]
            });

            var data4 = $.parseJSON($("#<%= hidProposalchart4.ClientID %>").val());
            $.plot("#divProposalchart4", [data4], {
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

            var data5 = $.parseJSON($("#<%= hidProposalchart5.ClientID %>").val());
            $.plot("#divProposalchart5", [data5], {
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

            var data6 = $.parseJSON($("#<%= hidProposalchart6.ClientID %>").val());
            $.plot("#divProposalchart6", data6, {
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

        function flotChartProject() {

            var data1 = $.parseJSON($("#<%= hidProjchart1.ClientID %>").val());
            $.plot("#divProjchart1", data1, {
                series: {
                    pie: {
                        show: true
                    }
                },
                legend: {
                    show: false
                }, colors: ["#4A7B6F"]
            });

            var data2 = $.parseJSON($("#<%= hidProjchart2.ClientID %>").val());
            $.plot("#divProjchart2", data2, {
                series: {
                    pie: {
                        show: true
                    }
                },
                legend: {
                    show: false
                }, colors: ["#9EAEB3"]
            });

            var data3 = $.parseJSON($("#<%= hidProjchart3.ClientID %>").val());
            $.plot("#divProjchart3", [data3], {
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

            var data4 = $.parseJSON($("#<%= hidProjchart4.ClientID %>").val());
            $.plot("#divProjchart4", [data4], {
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

            var data5 = $.parseJSON($("#<%= hidProjchart5.ClientID %>").val());
            $.plot("#divProjchart5", [data5], {
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

            var data6 = $.parseJSON($("#<%= hidProjchart6.ClientID %>").val());
            $.plot("#divProjchart6", data6, {
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


        function flotChart(tabname) {
            if (tabname == "#tab_1") {
                flotChartProposal();
            }
            else if (tabname == "#tab_2") {
                flotChartProject();
            }
            
        }

        jQuery(document).ready(function() {

            $('.zddmonth').change(function() {
                flotChart();

            });
            $('[name=options]').change(function() {
                flotChart();

            });

            var currentTab = $("ul.charttab li.active").find('a').attr('href');
            flotChart(currentTab);

            //flotChartProject();

            $('form').on('shown.bs.tab', '.nav.nav-tabs', function() {
                var currentTab = $(this).find('li.active').find('a').attr('href')
                flotChart(currentTab);
            });



        });
        
        
    </script>

    </form>
</asp:Content>
