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
using System.Text;

namespace KedSys35
{
    public partial class Login : System.Web.UI.Page
    {
        dal dl = new dal();
        string EmployeeRole;

        protected void Page_Load(object sender, EventArgs e)
        {
            divalert.Visible = false;
            if (!IsPostBack)
            {
                Session.Clear();
                Session.Abandon();

                if (Request.Cookies["txtusername"] != null && Request.Cookies["txtpassword"] != null)
                {
                    txtusername.Text = Request.Cookies["txtusername"].Value;
                    txtpassword.Attributes["value"] = Request.Cookies["txtpassword"].Value;
                    chkRemember.Checked = true;
                }
                
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (chkRemember.Checked)
            {
                Response.Cookies["txtusername"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["txtpassword"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["txtusername"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["txtpassword"].Expires = DateTime.Now.AddDays(-1);

            }
            Response.Cookies["txtusername"].Value = txtusername.Text.Trim();
            Response.Cookies["txtpassword"].Value = txtpassword.Text.Trim();

            DataSet ds;
            string Username;
            string HashValue;
            int Result;
            Username = txtusername.Text.Trim();
            HashValue = dl.GetHashedValue(txtpassword.Text.Trim());
            ds = dl.UP_Fetch_Authentication(Username, HashValue, out Result);
            switch (Result)
            {
                case 1:
                    divalert.Visible = false;
                    Session["loginuser"] = Username;
                    Session["EmployeeFName"] = ds.Tables[0].Rows[0]["EmployeeFName"].ToString();
                    Session["EmployeeFullName"] = ds.Tables[0].Rows[0]["EmployeeFName"].ToString() + " " + ds.Tables[0].Rows[0]["EmployeeLName"].ToString();
                    Session["EmployeeID"] = ds.Tables[0].Rows[0]["EmployeeID"].ToString();
                    Session["EmployeeRole"] = ds.Tables[0].Rows[0]["EmployeeRole"].ToString();
                    Session["Department"] = ds.Tables[0].Rows[0]["Department"].ToString();
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["ForcePasswordChange"].ToString()))
                        Response.Redirect("ChangePassword.aspx");

                    EmployeeRole = ds.Tables[0].Rows[0]["EmployeeRole"].ToString();
                    if (EmployeeRole=="Administrator")
                        Response.Redirect("Dashboard.aspx");
                    else
                        Response.Redirect("TimeSheet.aspx");
                    break;
                case 3:
                    txtusername.Text = string.Empty;
                    txtpassword.Text = string.Empty;
                    lblalert.Text = "Account Locked.";
                    divalert.Visible = true;
                    break;
                default:
                    txtusername.Text = string.Empty;
                    txtpassword.Text = string.Empty;
                    lblalert.Text = "Invalid username or password.";
                    divalert.Visible = true;
                    break;
            }
            
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            string usrEmail = usremail.Text;
            string rndpwd = Membership.GeneratePassword(7, 2);
            string pwdNew = dl.GetHashedValue(rndpwd);

            int Result;
            string EmpName;
            dl.UP_U_ForgetPassword(usrEmail, pwdNew, out Result, out EmpName);

            if (Result == 1)
            {
                Boolean mailresult;
                string mailbody, mailsubject;
                PwdRestMailBody(EmpName, rndpwd, out mailbody, out mailsubject);
                mailresult = dl.SendMail(mailbody, mailsubject, usrEmail);

                if (mailresult == false)
                    lblalert.Text = "Password has not been sent to your mail.";
                else
                    lblalert.Text = "Password has been sent to your mail.";
                
                divalert.Visible = true;
            }
            else
            {
                lblalert.Text = "Invalid Email.";
                divalert.Visible = true;
            }

        }

        private void PwdRestMailBody(string EmpName, string rndpwd, out string mailbody, out string mailsubject)
        {
            string stroutput = "", strsubjet = "";
            DataSet dsET = dl.UP_Fetch_EMailTemplate("Password Reset");
            if (dsET.Tables[0].Rows.Count > 0)
            {
                stroutput = dsET.Tables[0].Rows[0]["TempaleContent"].ToString();
                stroutput = stroutput.Replace("&lt;UserName&gt;", EmpName);
                stroutput = stroutput.Replace("&lt;NewPassword&gt;", rndpwd);
                strsubjet = dsET.Tables[0].Rows[0]["TempaleSubject"].ToString();
            }
            mailbody = stroutput;
            mailsubject = strsubjet;
        }


        private string MailBody(string strpassword)
        {
            StringBuilder objStrBuilder = new StringBuilder();
            objStrBuilder.Append("<table><tr><td>");
            objStrBuilder.Append("Your password has been reset");
            objStrBuilder.Append("<br>New password :&nbsp;");
            objStrBuilder.Append(strpassword);
            objStrBuilder.Append("<br><br>Thanks<br>Kadence International");
            objStrBuilder.Append("<br><br><font size=1>Please do not replay to this mail</font>");
            objStrBuilder.Append("</td></tr></table>");
            return objStrBuilder.ToString();
        }
    }
}
