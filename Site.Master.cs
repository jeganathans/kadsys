using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace KedSys35
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string EmployeeFullName;
        string EmployeeRole;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            if (!IsPostBack)
            {
                if (Session["EmployeeFullName"] == null)
                {
                    Session["EmployeeFullName"] = "not logged in";
                }

                EmployeeFullName = Session["EmployeeFullName"].ToString();
                lblemployeename.Text = EmployeeFullName;
                EmployeeRole = Session["EmployeeRole"].ToString();

                if (EmployeeRole == "Analyst")
                {
                    liDashboard.Visible = false;
                    liProposal.Visible = true;
                    liProjects.Visible = true;
                    liTimeSheet.Visible = true;
                    liFinance.Visible = false;
                    liReports.Visible = false;
                    liMasters.Visible = false;
                }

                if (EmployeeRole == "Administrator")
                {
                    liDashboard.Visible = true;
                    liProposal.Visible = true;
                    liProjects.Visible = true;
                    liTimeSheet.Visible = true;
                    liFinance.Visible = true;
                    liReports.Visible = true;
                    liMasters.Visible = true;
                }
            }

            
        }

        
    }
}
