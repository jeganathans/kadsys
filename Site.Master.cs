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
        dal dl = new dal();
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

                DataSet dsM = dl.UP_Fetch_Modules(EmployeeRole);

                if (dsM.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow r in dsM.Tables[0].Rows)
                    {
                        HtmlGenericControl lictrl = (HtmlGenericControl)FindControl(r["LinkID"].ToString());
                        if (lictrl != null)
                        {
                            lictrl.Visible = true;
                        }
                    }
                }

                /*if (EmployeeRole == "Analyst")
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
                }*/
            }

            
        }

        
    }
}
