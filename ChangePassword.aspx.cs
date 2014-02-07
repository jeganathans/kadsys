using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KedSys35
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        dal dl = new dal();
        string strloginuser;

        protected void Page_Load(object sender, EventArgs e)
        {
            divalert.Visible = false;
            lblrelogin.Visible = false;
            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            strloginuser = Session["loginuser"].ToString();
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string HashValueOld;
            string HashValueNew;
            int Result;

            divalert.Visible = true;


            HashValueOld = dl.GetHashedValue(txtpassword.Text.Trim());
            HashValueNew = dl.GetHashedValue(txtnewpassword.Text.Trim());

            if (HashValueOld == HashValueNew)
            {
                lblalert.Text = "Old and New password should not be same.";
                return;
            }

            dl.UP_U_ChangePassword(strloginuser, HashValueOld, HashValueNew, out Result);

            
            if (Result == 2)
            {
                txtpassword.Text = string.Empty;
                txtnewpassword.Text = string.Empty;
                txtrpassword.Text = string.Empty;
                lblalert.Text = "Invalid old password.";
            }
            else
            {
                Session.Clear();
                Session.Abandon();
                lblalert.Text = "Password changed successfully.";
                lblrelogin.Visible = true;
                lblrelogin.Text = "Kindly <a href = 'login.aspx'>login</a> again to continue";
                btn_submit.Visible = false;

            }

        }
    }
}
