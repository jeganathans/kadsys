using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.Script.Serialization;

namespace KedSys35
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        dal dl = new dal();
        string strloginuser = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            strloginuser = Session["loginuser"].ToString();

            if (!IsPostBack)
            {
                populatecharddetails();
            }


            
        }

        public void populatecharddetails()
        {
            populatecharddetailsProposals();
            populatecharddetailsProjects();

        }

        public void populatecharddetailsProposals()
        {
            DataSet dsChart;
            dsChart = dl.UP_Fetch_Dashboard_Proposal();
            hidProposalchart1.Value = convertToChartDataPie(dsChart.Tables[0]);
            hidProposalchart2.Value = convertToChartDataPie(dsChart.Tables[1]);
            hidProposalchart3.Value = convertToChartData(dsChart.Tables[2]);
            hidProposalchart4.Value = convertToChartData(dsChart.Tables[3]);
            hidProposalchart5.Value = convertToChartData(dsChart.Tables[4]);
            hidProposalchart6.Value = convertToChartDataPie(dsChart.Tables[5]);

        }

        public void populatecharddetailsProjects()
        {
            DataSet dsChart;
            dsChart = dl.UP_Fetch_Dashboard_Project();
            hidProjchart1.Value = convertToChartDataPie(dsChart.Tables[0]);
            hidProjchart2.Value = convertToChartDataPie(dsChart.Tables[1]);
            hidProjchart3.Value = convertToChartData(dsChart.Tables[2]);
            hidProjchart4.Value = convertToChartData(dsChart.Tables[3]);
            hidProjchart5.Value = convertToChartData(dsChart.Tables[4]);
            hidProjchart6.Value = convertToChartDataPie(dsChart.Tables[5]);
            
        }

        public string convertToChartDataPie(DataTable dtChart)
        {
            string strresult;
            strresult = "[";
            for (int i = 0; i < dtChart.Rows.Count; i++)
            {
                if (i > 0)
                    strresult += ",";

                strresult += "{\"label\":\"" + dtChart.Rows[i]["SeriesName"].ToString() + "\",\"data\":" + dtChart.Rows[i]["SeriesValue"].ToString().Replace(",","") + "}";
            }

            strresult += "]";

            
            return strresult;
        }

        public string convertToChartData(DataTable dtChart)
        {
            string strresult;
            string[][] result = new string[dtChart.Rows.Count][];
            for (int i = 0; i < dtChart.Rows.Count; i++)
            {
                result[i] = new string[2];
                result[i][0] = dtChart.Rows[i]["SeriesName"].ToString();
                result[i][1] = dtChart.Rows[i]["SeriesValue"].ToString();
            }

            strresult = new JavaScriptSerializer().Serialize(result);
            return strresult;
        }
    }
}
