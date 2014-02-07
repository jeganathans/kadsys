using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace KedSys35
{
    public partial class EmailTemplate : System.Web.UI.Page
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
                BindCombo();
                BindValues();
            }
            brdPageID.InnerText = ddTemplateName.SelectedItem.Text;
        }

        void BindCombo()
        {
            DataSet ds = dl.UP_Fetch_EMailTemplate_DD();

            ddTemplateName.DataSource = ds.Tables[0];
            ddTemplateName.DataTextField = "TemplateName";
            ddTemplateName.DataValueField = "TemplateName";
            ddTemplateName.DataBind();

        }

        void BindValues()
        {
            DataSet ds = dl.UP_Fetch_EMailTemplate(ddTemplateName.SelectedItem.Text);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtTempaleSubject.Text = ds.Tables[0].Rows[0]["TempaleSubject"].ToString();
                TxtTempaleContent.Text = ds.Tables[0].Rows[0]["TempaleContent"].ToString();
                lblTelmpateFields.Text = "List of Predefined Fields : " + ds.Tables[0].Rows[0]["TelmpateFields"].ToString();
            }
            else
            {
                TxtTempaleContent.Text = "";
                lblTelmpateFields.Text = "";
            }
        }

        protected void ddTemplateName_Changed(Object sender, EventArgs e)
        {
            BindValues();
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            result = dl.UP_U_EMailTemplate(ddTemplateName.SelectedItem.Text, txtTempaleSubject.Text, TxtTempaleContent.Text);

            if (result == true)
            {
                hidtoaster.Value = "success|Updated successfully";
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }
        }
    }
}
