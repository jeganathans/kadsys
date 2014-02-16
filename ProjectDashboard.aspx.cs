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

namespace KedSys35
{
    public partial class ProjectDashboard : System.Web.UI.Page
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
            DataSet ds = dl.UP_Fetch_ProjectDB(strloginuser);

            ddmonth.DataSource = ds.Tables[0];
            ddmonth.DataTextField = "MonthYear";
            ddmonth.DataValueField = "CalenderDate";
            ddmonth.DataBind();

            if (ds.Tables[1].Rows.Count > 0)
            {
                totalproject.Text = ds.Tables[1].Rows[0]["YTD"].ToString();
                newproject.Text = ds.Tables[1].Rows[0]["MTD"].ToString();
                lblQualitative.Text = ds.Tables[1].Rows[0]["QualitativeMTD"].ToString();
                lblQuantitive.Text = ds.Tables[1].Rows[0]["QuantitativeMTD"].ToString();
            }
        }


        [System.Web.Services.WebMethod]
        public static string[][] ProjectDBChart(string XType, DateTime MonthYear)
        {
            string strloginuser = "anandy";//Session["loginuser"].ToString();
            dal dlchart = new dal();
            DataSet dsChart;
            dsChart = dlchart.UP_Fetch_ProjectDBChart(XType, MonthYear, strloginuser);
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
    }
}
