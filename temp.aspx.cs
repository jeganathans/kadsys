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
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;

namespace KedSys35
{
    public partial class temp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["loginuser"] = "anandy";
            //Session["EmployeeFName"] = "Anand Yesuraj";
            //Session["EmployeeFullName"] = "Anand Yesuraj Prakasham";
            //Session["EmployeeID"] = "337";
            //Session["EmployeeRole"] = "Analyst";
            //Session["EmployeeRole"] = "Administrator";
            //Session["Department"] = "Fieldwork";

            //Response.Redirect("ReportAuditLog.aspx");

            //Session["ProposalID"] = "Q131209001";
            //Response.Redirect("Proposal.aspx");

            //Session["ProjectID"] = "IDA3001-3";
            //Response.Redirect("Projects.aspx");

        }


        protected void btnupdate_Click(object sender, EventArgs e)
        {
            int test = 0;
            Database objDataBase = new Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(@"Server=d9deq4jc9e.database.windows.net;Database=kadsysv2;User id=jegan;Password=DBXPose!123;");
            //Database objDataBase = new Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(@"Server=bgtnhy\sql2008;Database=KadSysV2;User id=kaduser;Password=kad123;");
            test = objDataBase.ExecuteNonQuery(CommandType.Text, TextBox1.Text);
            objDataBase = null;
            Response.Write(test.ToString());
            Response.Write("Done");
        }


        protected void btnlist_Click(object sender, EventArgs e)
        {
            int test = 0;
            DataSet ds;
            Database objDataBase = new Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(@"Server=d9deq4jc9e.database.windows.net;Database=kadsysv2;User id=jegan;Password=DBXPose!123;");
            //Database objDataBase = new Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(@"Server=bgtnhy\sql2008;Database=KadSysV2;User id=kaduser;Password=kad123;");
            ds = objDataBase.ExecuteDataSet(CommandType.Text, TextBox1.Text);
            objDataBase = null;
            Response.Write(ds.Tables[0].Rows[0][0].ToString());
            Response.Write("Done");
        }


    }
}
