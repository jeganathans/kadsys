using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace KedSys35
{
    public partial class AccessModule : System.Web.UI.Page
    {
        dal dl = new dal();
        string strloginuser = "";

        PageAccess PGAccess;
        string empRole;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            PageAccessControl();

            strloginuser = Session["loginuser"].ToString();
            if (!IsPostBack)
            {
                BindCombo();
                BindGrid();
            }
            brdPageID.InnerText = ddRole.SelectedItem.Text;
        }

        void PageAccessControl()
        {
            empRole = Session["EmployeeRole"].ToString();
            if (!IsPostBack)
            {
                PGAccess = dl.UP_Fetch_ModuleAccess("Module Access", empRole);
                ViewState["PGAccess"] = PGAccess;
            }
            else
            {
                PGAccess = (PageAccess)ViewState["PGAccess"];
            }
            if (!PGAccess.AllowPage)
                Response.Redirect("NoAccess.aspx");

            if (PGAccess.AllowEdit)
                btn_submit.Visible = true;
            else
                btn_submit.Visible = false;

        }

        void BindCombo()
        {
            DataSet ds = dl.UP_Fetch_AccessModule_DD();

            ddRole.DataSource = ds.Tables[0];
            ddRole.DataTextField = "Roles";
            ddRole.DataValueField = "Roles";
            ddRole.DataBind();
        }

        void BindGrid()
        {
            String strddEmpRole;
            strddEmpRole = ddRole.SelectedItem.Text;
            DataSet ds = dl.UP_Fetch_RoleBasedAccess(strddEmpRole);

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }


        protected void ddRole_Changed(Object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            String strddEmpRole;
            strddEmpRole = ddRole.SelectedItem.Text;

            string xmldetails = string.Empty;
            xmldetails = "<root>";
            foreach (GridViewRow row in GridView1.Rows)
            {
                Label Modulename = (Label)row.FindControl("Modulename");
                CheckBox AllowAdd = (CheckBox)row.FindControl("AllowAdd");
                CheckBox AllowEdit = (CheckBox)row.FindControl("AllowEdit");
                CheckBox AllowDelete = (CheckBox)row.FindControl("AllowDelete");
                CheckBox Active = (CheckBox)row.FindControl("Active");
                xmldetails += "<detail><Modulename>" + Modulename.Text + "</Modulename>";
                xmldetails += "<AllowAdd>" + AllowAdd.Checked + "</AllowAdd>";
                xmldetails += "<AllowEdit>" + AllowEdit.Checked + "</AllowEdit>";
                xmldetails += "<AllowDelete>" + AllowDelete.Checked + "</AllowDelete>";
                xmldetails += "<Active>" + Active.Checked + "</Active>";
                xmldetails += "</detail>";
            }
            xmldetails += "</root>";

            result = dl.UP_IU_RoleBasedAccess(strddEmpRole, xmldetails);


            if (result == true)
            {
                hidtoaster.Value = "success|Updated successfully";
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }

            BindGrid();
        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gv_RowCommand(object sender, GridViewRowEventArgs e)
        {

        }
    }
}
