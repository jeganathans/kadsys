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
using System.Collections.Generic;

namespace KedSys35
{
    public partial class ProposalDashboard : System.Web.UI.Page
    {
        dal dl = new dal();
        string strloginuser = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            //Session["loginuser"] = "anandy";


            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            strloginuser = Session["loginuser"].ToString();
            if (!IsPostBack)
            {
                BindValues();
            }

        }

        void BindValues()
        {
            DataSet ds = dl.UP_Fetch_ProposalDB(strloginuser);

            ddmonth.DataSource = ds.Tables[0];
            ddmonth.DataTextField = "MonthYear";
            ddmonth.DataValueField = "CalenderDate";
            ddmonth.DataBind();

            if (ds.Tables[1].Rows.Count > 0)
            {
                totalproposal.Text = ds.Tables[1].Rows[0]["YTD"].ToString();
                newproposal.Text = ds.Tables[1].Rows[0]["MTD"].ToString();
                lblQualitative.Text = ds.Tables[1].Rows[0]["QualitativeMTD"].ToString();
                lblQuantitive.Text = ds.Tables[1].Rows[0]["QuantitativeMTD"].ToString(); 
            }
        }


        [System.Web.Services.WebMethod]
        public static string[][] ProposalDBChart(string XType, DateTime MonthYear)
        {
            string strloginuser = "anandy";//Session["loginuser"].ToString();
            dal dlchart = new dal();
            DataSet dsChart;
            dsChart = dlchart.UP_Fetch_ProposalDBChart(XType, MonthYear, strloginuser);
            DataTable dtChart = dsChart.Tables[0];
            string[][] result = new string[dtChart.Rows.Count][];
            for (int i = 0; i < dtChart.Rows.Count; i++)
            {
                result[i] = new string[2];
                result[i][0] = dtChart.Rows[i]["XType"].ToString();
                result[i][1] = dtChart.Rows[i]["cnt"].ToString();
            }
            return result;
        }

        /*public static string[,] ProposalDBChart()
        {
            dal dlchart = new dal();
            DataTable dtChart;
            dtChart = dlchart.UP_Fetch_ProposalDBChart().Tables[0];
            //return dtChart.Rows[0][0].ToString(); ;
            string[,] result = new string[dtChart.Rows.Count, 2];
            for (int i = 0; i < dtChart.Rows.Count; i++)
            {
                result[i, 0] = dtChart.Rows[i][1].ToString();
                result[i, 1] = dtChart.Rows[i][2].ToString();
            }
            return result;
        }*/

        /*public static string[] ProposalDBChart()
        {
            dal dlchart = new dal();
            DataTable dtChart;
            dtChart = dlchart.UP_Fetch_ProposalDBChart().Tables[0];
            //return dtChart.Rows[0][0].ToString(); ;
            List<string> result = new List<string>();

            for (int i = 0; i < dtChart.Rows.Count; i++)
            {
                result.Add("[\"" + dtChart.Rows[i][1].ToString() + "\"," + dtChart.Rows[i][2].ToString() + "]");
            }
            return result.ToArray<string>();
        }*/

        /*public static DataTable ProposalDBChart()
        {
            dal dlchart = new dal();
            DataTable dtChart;
            dtChart = dlchart.UP_Fetch_ProposalDBChart().Tables[0];
            //return dtChart.Rows[0][0].ToString(); ;
            List<string> result = new List<string>();

            for (int i = 0; i < dtChart.Rows.Count; i++)
            {
                result.Add("[\"" + dtChart.Rows[i][1].ToString() + "\"," + dtChart.Rows[i][2].ToString() + "]");
            }
            return dtChart;
        }*/
    }
}
