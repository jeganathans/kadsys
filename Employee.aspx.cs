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
using System.Text;

namespace KedSys35
{
    public partial class Employee : System.Web.UI.Page
    {
        dal dl = new dal();
        string Sort_Direction = "EmployeeID ASC";
        int totalrecordsgrid = 0;
        string strloginuser = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            strloginuser = Session["loginuser"].ToString();

            hidtoaster.Value = "";
            if (!IsPostBack)
            {
                hidUID.Value = "";
                hidprot.Value = "portlet-control-grid";
                ViewState["SortExpr"] = Sort_Direction;
                ViewState["FilterExpression"] = "";
                BindCombo();
                BindGrid();
                reset_coltrols();
            }
        }

        void reset_coltrols()
        {
            hidUID.Value = "";

            txtEmployeeID.Text = string.Empty;
            txtEmployeeFName.Text = string.Empty;
            txtEmployeeLName.Text = string.Empty;
            txtUserID.Text = string.Empty;
            ddTitle.SelectedIndex = 0;
            ddDepartment.SelectedIndex = 0;
            txtEmailAddress.Text = string.Empty;
            txtMobileNo.Text = string.Empty;
            txtWorkPhoneNo.Text = string.Empty;
            txtHomeno.Text = string.Empty;
            txtHomeAddress.Text = string.Empty;
            txtJoinDate.Text = string.Empty;
            txtEndDate.Text = string.Empty;
            ddGender.SelectedIndex = 0;
            txtBirthday.Text = string.Empty;
            chkSalesPerson.Checked = false;
            chkManager.Checked = false;
            chkLeader.Checked = false;
            chkCoordinator.Checked = false;
            chkSharedResource.Checked = false;
            chkActive.Checked = true;
            ddDirectManager.SelectedIndex = 0;
            ddIndirectManager.SelectedIndex = 0;
            txtNotes.Text = string.Empty;
            ddEmployeeRole.SelectedIndex = 0;

            txtEmployeeID.Enabled = false;
            brdPageID.InnerText = "";

            lbllogininfo.Visible = false;
            btn_reset.Visible = false;
            chkLocked.Checked = false;
            chkLocked.Enabled = false;
        }

        void BindCombo()
        {
            DataSet ds = dl.UP_Fetch_Employees_DD();

            ddTitle.DataSource = ds.Tables[0];
            ddTitle.DataTextField = "JobTitle";
            ddTitle.DataValueField = "JobTitle";
            ddTitle.DataBind();
            ddTitle.Items.Insert(0, new ListItem("--Select--", "0"));

            ddDepartment.DataSource = ds.Tables[1];
            ddDepartment.DataTextField = "Department";
            ddDepartment.DataValueField = "Department";
            ddDepartment.DataBind();
            ddDepartment.Items.Insert(0, new ListItem("--Select--", "0"));

            ddGender.DataSource = ds.Tables[2];
            ddGender.DataTextField = "Gender";
            ddGender.DataValueField = "Gender";
            ddGender.DataBind();
            ddGender.Items.Insert(0, new ListItem("--Select--", "0"));

            ddDirectManager.DataSource = ds.Tables[3];
            ddDirectManager.DataTextField = "EmployeeFName";
            ddDirectManager.DataValueField = "EmployeeID";
            ddDirectManager.DataBind();
            ddDirectManager.Items.Insert(0, new ListItem("--Select--", "0"));

            ddIndirectManager.DataSource = ds.Tables[3];
            ddIndirectManager.DataTextField = "EmployeeFName";
            ddIndirectManager.DataValueField = "EmployeeID";
            ddIndirectManager.DataBind();
            ddIndirectManager.Items.Insert(0, new ListItem("--Select--", "0"));

            ddEmployeeRole.DataSource = ds.Tables[4];
            ddEmployeeRole.DataTextField = "Roles";
            ddEmployeeRole.DataValueField = "Roles";
            ddEmployeeRole.DataBind();
            ddEmployeeRole.Items.Insert(0, new ListItem("--Select--", "0"));

            ddDirector.DataSource = ds.Tables[3];
            ddDirector.DataTextField = "EmployeeFName";
            ddDirector.DataValueField = "EmployeeID";
            ddDirector.DataBind();
            ddDirector.Items.Insert(0, new ListItem("--Select--", "0"));



        }

        void BindGrid()
        {
            DataSet ds = dl.UP_Fetch_Employees(string.Empty);

            if (ViewState["FilterExpression"].ToString().Length > 0)
            {
                try
                {
                    using (DataTable objDataTable = ds.Tables[0])
                    {
                        DataRow[] objDataRows = objDataTable.Select(ViewState["FilterExpression"].ToString(), ViewState["SortExpr"].ToString());
                        if (objDataRows.Length > 0)
                        {
                            using (DataTable objFilteredTable = objDataRows.CopyToDataTable())
                            {
                                GridView1.DataSource = objFilteredTable;
                                totalrecordsgrid = objFilteredTable.Rows.Count;
                            }
                        }
                        else
                        {
                            hidtoaster.Value = "warning|Matching records not available";
                            totalrecordsgrid = 0;
                        }
                    }
                    btnRemoveFilter.Visible = true;
                }
                catch
                {
                    ViewState["FilterExpression"] = "";
                    hidtoaster.Value = "error|Filter not applied. Please do not use wildcard characters.";
                }
            }
            if (ViewState["FilterExpression"].ToString().Length == 0)
            {
                DataView dv = ds.Tables[0].DefaultView;
                dv.Sort = ViewState["SortExpr"].ToString();
                GridView1.DataSource = dv;
                totalrecordsgrid = ds.Tables[0].Rows.Count;
                if (totalrecordsgrid == 0)
                {
                    hidprot.Value = "portlet-control";
                }
                btnRemoveFilter.Visible = false;
            }

            GridView1.DataBind();
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            reset_coltrols();
            hidtoaster.Value = "";
            if (GridView1.Rows.Count == 0)
                hidprot.Value = "portlet-control";
            else
                hidprot.Value = "portlet-control-grid";
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string UID, EmployeeID, EmployeeFName, EmployeeLName, UserID, UserPWD="", Title, Department, EmailAddress, MobileNo, WorkPhoneNo, Homeno, HomeAddress, JoinDate, EndDate, Gender, Birthday, SalesPerson, Manager, Leader, Coordinator, Active, SharedResource, DirectManager, IndirectManager, Notes;
            string EmployeeRole, Locked, Director;
            Boolean result=false;
            string pwdNew = "";

            if (string.IsNullOrEmpty(hidUID.Value.Trim()) == true)
            {
                UID = string.Empty;
                pwdNew = Membership.GeneratePassword(7, 2);
                UserPWD = dl.GetHashedValue(pwdNew);
            }
            else
            {
                UID = hidUID.Value;
            }

            //EmployeeID = txtEmployeeID.Text.Trim();
            EmployeeFName  = txtEmployeeFName.Text.Trim();
            EmployeeLName = txtEmployeeLName.Text.Trim();
            UserID = txtUserID.Text.Trim();
            Title = (ddTitle.SelectedIndex == 0) ? string.Empty : ddTitle.SelectedValue;
            Department = (ddDepartment.SelectedIndex == 0) ? string.Empty : ddDepartment.SelectedValue;
            EmailAddress = txtEmailAddress.Text.Trim();
            MobileNo = txtMobileNo.Text.Trim();
            WorkPhoneNo = txtWorkPhoneNo.Text.Trim();
            Homeno = txtHomeno.Text.Trim();
            HomeAddress = txtHomeAddress.Text.Trim();
            JoinDate = txtJoinDate.Text.Trim();
            EndDate = txtEndDate.Text.Trim();
            Gender = (ddGender.SelectedIndex == 0) ? string.Empty : ddGender.SelectedValue;
            Birthday = txtBirthday.Text.Trim();
            SalesPerson= chkSalesPerson.Checked.ToString();
            Manager = chkManager.Checked.ToString();
            Leader = chkLeader.Checked.ToString();
            Coordinator = chkCoordinator.Checked.ToString();
            Active = chkActive.Checked.ToString();
            SharedResource = chkSharedResource.Checked.ToString();
            DirectManager = (ddDirectManager.SelectedIndex == 0) ? string.Empty : ddDirectManager.SelectedValue;
            IndirectManager = (ddIndirectManager.SelectedIndex == 0) ? string.Empty : ddIndirectManager.SelectedValue;
            Notes = txtNotes.Text.Trim();
            EmployeeRole = (ddEmployeeRole.SelectedIndex == 0) ? string.Empty : ddEmployeeRole.SelectedValue;
            Locked = chkLocked.Checked.ToString();
            Director = (ddDirector.SelectedIndex == 0) ? string.Empty : ddDirector.SelectedValue;

            result = dl.UP_IU_Employees(UID, EmployeeFName, EmployeeLName, UserID, UserPWD, Title, Department, EmailAddress, MobileNo, WorkPhoneNo, Homeno, HomeAddress, JoinDate, EndDate, Gender, Birthday, SalesPerson, Manager, Leader, Coordinator, Active, SharedResource, DirectManager, IndirectManager, Notes, EmployeeRole, Locked, Director, strloginuser);

            if (result == true)
            {
                if (hidUID.Value == "")
                {
                    Boolean mailresult;
                    string mailbody, mailsubject;
                    NewUserMailContent(EmployeeFName,UserID, pwdNew, out mailbody, out mailsubject);
                    mailresult = dl.SendMail(mailbody, mailsubject, EmailAddress);
                    if (mailresult == false)
                        hidtoaster.Value = "error|Added successfully but unable to send mail to user";
                    else
                        hidtoaster.Value = "success|Added successfully";
                }
                else
                    hidtoaster.Value = "success|Updated successfully";

                UID = "";
                BindGrid();
                reset_coltrols();
                hidprot.Value = "portlet-control-grid";
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }
        }

        private void NewUserMailContent(string strusername, string strloginname, string strpassword, out string mailbody, out string mailsubject)
        {
            string stroutput = "", strsubjet = "";
            DataSet dsET = dl.UP_Fetch_EMailTemplate("User Creation");
            if (dsET.Tables[0].Rows.Count > 0)
            {
                stroutput = dsET.Tables[0].Rows[0]["TempaleContent"].ToString();
                stroutput = stroutput.Replace("&lt;UserName&gt;", strusername);
                stroutput = stroutput.Replace("&lt;LoginName&gt;", strloginname);
                stroutput = stroutput.Replace("&lt;Password&gt;", strpassword);
                strsubjet = dsET.Tables[0].Rows[0]["TempaleSubject"].ToString();
            }
            mailbody = stroutput;
            mailsubject = strsubjet;
        }
        private string MailBody(string strusername, string strloginname, string strpassword)
        {
            StringBuilder objStrBuilder = new StringBuilder();
            objStrBuilder.Append("<table><tr><td>Dear&nbsp;");
            objStrBuilder.Append(strusername);
            objStrBuilder.Append("<br><br><b>Kadence V2 Account Created</b>");
            objStrBuilder.Append("<br><br>Plese use the following Credentials to login:");
            objStrBuilder.Append("<br><br>User ID :&nbsp;");
            objStrBuilder.Append(strloginname);
            objStrBuilder.Append("<br>Password :&nbsp;");
            objStrBuilder.Append(strpassword);
            objStrBuilder.Append("<br><br>Thanks<br>Kadence International");
            objStrBuilder.Append("<br><br><font size=1>Please do not replay to this mail</font>");
            objStrBuilder.Append("</td></tr></table>");
            return objStrBuilder.ToString();
        }

        protected void btn_select_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            hidUID.Value = ((Label)row.Cells[0].Controls[1]).Text;
            hidprot.Value = "portlet-control";

            DataSet ds = dl.UP_Fetch_Employees(hidUID.Value.ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtEmployeeID.Text = ds.Tables[0].Rows[0]["EmployeeID"].ToString();
                txtEmployeeFName.Text = ds.Tables[0].Rows[0]["EmployeeFName"].ToString();
                txtEmployeeLName.Text = ds.Tables[0].Rows[0]["EmployeeLName"].ToString();
                txtUserID.Text = ds.Tables[0].Rows[0]["UserID"].ToString();
                ddTitle.SelectedIndex = ddTitle.Items.IndexOf(ddTitle.Items.FindByText(ds.Tables[0].Rows[0]["Title"].ToString()));
                ddDepartment.SelectedIndex = ddDepartment.Items.IndexOf(ddDepartment.Items.FindByText(ds.Tables[0].Rows[0]["Department"].ToString()));
                txtEmailAddress.Text = ds.Tables[0].Rows[0]["EmailAddress"].ToString();
                txtMobileNo.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
                txtWorkPhoneNo.Text = ds.Tables[0].Rows[0]["WorkPhoneNo"].ToString();
                txtHomeno.Text = ds.Tables[0].Rows[0]["Homeno"].ToString();
                txtHomeAddress.Text = ds.Tables[0].Rows[0]["HomeAddress"].ToString();
                txtJoinDate.Text = ds.Tables[0].Rows[0]["JoinDate"].ToString();
                txtEndDate.Text = ds.Tables[0].Rows[0]["EndDate"].ToString();
                ddGender.SelectedIndex = ddGender.Items.IndexOf(ddGender.Items.FindByText(ds.Tables[0].Rows[0]["Gender"].ToString()));
                txtBirthday.Text = ds.Tables[0].Rows[0]["Birthday"].ToString();
                chkSalesPerson.Checked = Convert.ToBoolean((ds.Tables[0].Rows[0]["SalesPerson"].ToString() == string.Empty) ? "false" : ds.Tables[0].Rows[0]["SalesPerson"].ToString());
                chkManager.Checked = Convert.ToBoolean((ds.Tables[0].Rows[0]["Manager"].ToString() == string.Empty) ? "false" : ds.Tables[0].Rows[0]["Manager"].ToString());
                chkLeader.Checked = Convert.ToBoolean((ds.Tables[0].Rows[0]["Leader"].ToString() == string.Empty) ? "false" : ds.Tables[0].Rows[0]["Leader"].ToString());
                chkCoordinator.Checked = Convert.ToBoolean((ds.Tables[0].Rows[0]["Coordinator"].ToString() == string.Empty) ? "false" : ds.Tables[0].Rows[0]["Coordinator"].ToString());
                chkSharedResource.Checked = Convert.ToBoolean((ds.Tables[0].Rows[0]["SharedResource"].ToString() == string.Empty) ? "false" : ds.Tables[0].Rows[0]["SharedResource"].ToString());
                chkActive.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Active"].ToString());
                ddDirectManager.SelectedValue = (ds.Tables[0].Rows[0]["DirectManager"].ToString() == string.Empty) ? "0" : ds.Tables[0].Rows[0]["DirectManager"].ToString();
                ddIndirectManager.SelectedValue = (ds.Tables[0].Rows[0]["IndirectManager"].ToString() == string.Empty) ? "0" : ds.Tables[0].Rows[0]["IndirectManager"].ToString();
                txtNotes.Text = ds.Tables[0].Rows[0]["Notes"].ToString();
                ddEmployeeRole.SelectedValue = (ds.Tables[0].Rows[0]["EmployeeRole"].ToString() == string.Empty) ? "0" : ds.Tables[0].Rows[0]["EmployeeRole"].ToString();
                ddDirector.SelectedValue = (ds.Tables[0].Rows[0]["Director"].ToString() == string.Empty) ? "0" : ds.Tables[0].Rows[0]["Director"].ToString();

                txtEmployeeID.Enabled = false;

                brdPageID.InnerText = txtEmployeeID.Text;

                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["Locked"].ToString()) == true)
                {
                    chkLocked.Checked = true;
                    chkLocked.Enabled = true;
                }
                else
                {
                    chkLocked.Checked = false;
                    chkLocked.Enabled = false;
                }

                if (ds.Tables[0].Rows[0]["LastLogin"].ToString().Length > 0)
                {
                    lbllogininfo.Visible = true;
                    lbllogininfo.Text = "Last Login: " + ds.Tables[0].Rows[0]["LastLogin"].ToString();
                }
                else
                    lbllogininfo.Visible = false;

                if (ds.Tables[0].Rows[0]["LoginAttempt"].ToString().Length > 0)
                    lbllocked.Text = "(" + ds.Tables[0].Rows[0]["LoginAttempt"].ToString() + " login attempt(s))";
                else
                    lbllocked.Text = "";

                btn_reset.Visible = true;
                    
            }

            hidtoaster.Value = "";
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            string[] SortOrder = ViewState["SortExpr"].ToString().Split(' ');
            if (SortOrder[0] == e.SortExpression)
            {
                if (SortOrder[1] == "ASC")
                {
                    ViewState["SortExpr"] = e.SortExpression + " " + "DESC";
                }
                else
                {
                    ViewState["SortExpr"] = e.SortExpression + " " + "ASC";
                }
            }
            else
            {
                ViewState["SortExpr"] = e.SortExpression + " " + "ASC";
            }

            BindGrid();
        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gv_RowCommand(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                if (ViewState["SortExpr"].ToString().Length > 0)
                {
                    string[] strsrtexp = ViewState["SortExpr"].ToString().Split(' ');
                    foreach (TableCell cell in e.Row.Cells)
                    {
                        if (cell.HasControls())
                        {
                            foreach (Control ctrl in cell.Controls)
                            {
                                if (ctrl.ToString() == "System.Web.UI.WebControls.LinkButton")
                                {
                                    LinkButton button = (LinkButton)ctrl;
                                    if (button.Text.Contains("icon-sort") && button.CommandArgument.ToLower() == strsrtexp[0].ToLower())
                                    {
                                        if (strsrtexp[1].ToLower() == "asc")
                                            button.Text = "<i class='icon-sort-up'></i>";
                                        else
                                            button.Text = "<i class='icon-sort-down'></i>";
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (e.Row.RowType == DataControlRowType.Pager)
            {
                GridViewRow pagerRow = e.Row;

                if (pagerRow != null)
                {

                    DataTable dtpz = dl.dt_PageSize();
                    DropDownList ddpagesize = (DropDownList)pagerRow.Cells[0].FindControl("ddpagesize");
                    if (ddpagesize != null)
                    {
                        ddpagesize.DataSource = dtpz;
                        ddpagesize.DataTextField = "intePageSize";
                        ddpagesize.DataValueField = "intePageSize";
                        ddpagesize.DataBind();
                        ddpagesize.SelectedValue = GridView1.PageSize.ToString();
                    }

                    Label pageLabel = (Label)pagerRow.Cells[0].FindControl("pagelabelinfo");

                    LinkButton pgprev = (LinkButton)pagerRow.Cells[0].FindControl("pgprev");
                    LinkButton pgfirst = (LinkButton)pagerRow.Cells[0].FindControl("pgfirst");
                    LinkButton pgsecond = (LinkButton)pagerRow.Cells[0].FindControl("pgsecond");
                    LinkButton pgthird = (LinkButton)pagerRow.Cells[0].FindControl("pgthird");
                    LinkButton pgfourth = (LinkButton)pagerRow.Cells[0].FindControl("pgfourth");
                    LinkButton pgfifth = (LinkButton)pagerRow.Cells[0].FindControl("pgfifth");
                    LinkButton pgnext = (LinkButton)pagerRow.Cells[0].FindControl("pgnext");

                    switch (GridView1.PageCount)
                    {
                        case 1:
                            pgprev.Visible = false; pgfirst.Visible = false; pgnext.Visible = false;
                            break;
                        case 2:
                            pgsecond.Visible = true;
                            break;
                        case 3:
                            pgsecond.Visible = true; pgthird.Visible = true;
                            break;
                        case 4:
                            pgsecond.Visible = true; pgthird.Visible = true; pgfourth.Visible = true;
                            break;
                        default:
                            pgsecond.Visible = true; pgthird.Visible = true; pgfourth.Visible = true; pgfifth.Visible = true;
                            break;
                    }
                    int currentPage = GridView1.PageIndex + 1;
                    if (currentPage <= 3)
                    {
                        pgfirst.Text = "1"; pgsecond.Text = "2"; pgthird.Text = "3"; pgfourth.Text = "4"; pgfifth.Text = "5";
                    }
                    else if (GridView1.PageCount - currentPage <= 1)
                    {
                        pgfifth.Text = GridView1.PageCount.ToString();
                        pgfourth.Text = (GridView1.PageCount - 1).ToString();
                        pgthird.Text = (GridView1.PageCount - 2).ToString();
                        pgsecond.Text = (GridView1.PageCount - 3).ToString();
                        pgfirst.Text = (GridView1.PageCount - 4).ToString();
                    }
                    else
                    {
                        pgfirst.Text = (currentPage - 2).ToString();
                        pgsecond.Text = (currentPage - 1).ToString();
                        pgthird.Text = (currentPage).ToString();
                        pgfourth.Text = (currentPage + 1).ToString();
                        pgfifth.Text = (currentPage + 2).ToString();
                    }


                    if (pgfirst.Text == currentPage.ToString())
                        pgfirst.CssClass = pgfirst.CssClass + " active";
                    else if (pgsecond.Text == currentPage.ToString())
                        pgsecond.CssClass = pgsecond.CssClass + " active";
                    else if (pgthird.Text == currentPage.ToString())
                        pgthird.CssClass = pgthird.CssClass + " active";
                    else if (pgfourth.Text == currentPage.ToString())
                        pgfourth.CssClass = pgfourth.CssClass + " active";
                    else if (pgfifth.Text == currentPage.ToString())
                        pgfifth.CssClass = pgfifth.CssClass + " active";

                    if (currentPage == 1)
                        pgprev.Enabled = false;
                    if (currentPage == GridView1.PageCount)
                        pgnext.Enabled = false;


                    if (pageLabel != null)
                    {
                        //int currentPage = GridView1.PageIndex + 1;
                        int pagesize = GridView1.PageSize;
                        int startcnt = GridView1.PageIndex * pagesize + 1;
                        int endcnt = (GridView1.PageIndex + 1) * pagesize;
                        endcnt = (endcnt > totalrecordsgrid) ? totalrecordsgrid : endcnt;

                        pageLabel.Text = "Showing " + startcnt.ToString() + " to " + endcnt.ToString() +
                          " of " + totalrecordsgrid.ToString() + " entries";

                    }

                }

            }
        }

        protected void btnFilterOk_Click(object sender, EventArgs e)
        {
            if (txtFilter.Text.Trim() == "")
                ViewState["FilterExpression"] = "";
            else
            {
                ViewState["FilterExpression"] = hidfilterex.Value.ToString() + " like '*" + txtFilter.Text + "*'";
            }
            BindGrid();
        }

        protected void btnRemoveFilter_Click(object sender, EventArgs e)
        {
            ViewState["FilterExpression"] = "";
            hidtoaster.Value = "";
            BindGrid();

        }

        protected void OnPaging(object sender, EventArgs e)
        {
            LinkButton lbsender = (LinkButton)sender;
            int newpageindex;
            switch (lbsender.Text)
            {
                case "<":
                    newpageindex = (GridView1.PageIndex == 0) ? 0 : GridView1.PageIndex - 1;
                    break;
                case ">":
                    newpageindex = (GridView1.PageIndex + 1 == GridView1.PageCount) ? GridView1.PageCount : GridView1.PageIndex + 1;
                    break;
                default:
                    newpageindex = Convert.ToInt16(lbsender.Text) - 1;
                    break;
            }
            BindGrid();
            GridView1.PageIndex = newpageindex;
            GridView1.DataBind();
        }

        protected void PageSize_Changed(Object sender, EventArgs e)
        {
            DataTable dtpz = dl.dt_PageSize();
            DropDownList ddpagesize = (DropDownList)GridView1.BottomPagerRow.Cells[0].FindControl("ddpagesize");

            BindGrid();
            GridView1.PageSize = Convert.ToInt16(ddpagesize.SelectedValue);
            GridView1.DataBind();
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            string usrEmail = txtEmailAddress.Text;
            string rndpwd = Membership.GeneratePassword(7, 2);
            string pwdNew = dl.GetHashedValue(rndpwd);

            int Result;
            string EmpName;
            dl.UP_U_ForgetPassword(usrEmail, pwdNew, out Result, out EmpName);

            if (Result == 1)
            {
                Boolean mailresult;
                //string mailbody = MailBody(rndpwd);
                string mailbody, mailsubject;
                PwdRestMailBody(rndpwd, out mailbody, out mailsubject);
                mailresult = dl.SendMail(mailbody, mailsubject, usrEmail);
                if (mailresult == false)
                    hidtoaster.Value = "error|Added reset successful but unable to send mail to user";
                else
                    hidtoaster.Value = "success|Password reset successful and mail sent";
            }
            else
            {
                hidtoaster.Value = "error|Password reset failed";
            }

        }

        private void PwdRestMailBody(string rndpwd, out string mailbody, out string mailsubject)
        {
            string stroutput = "", strsubjet = "";
            DataSet dsET = dl.UP_Fetch_EMailTemplate("Password Reset");
            if (dsET.Tables[0].Rows.Count > 0)
            {
                string UserName = Session["EmployeeFName"].ToString();
                stroutput = dsET.Tables[0].Rows[0]["TempaleContent"].ToString();
                stroutput = stroutput.Replace("&lt;UserName&gt;", UserName);
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

        [System.Web.Services.WebMethod]
        public static string CheckUserName(string UserID)
        {
            dal dluser = new dal();
            string returnValue = string.Empty;
            try
            {
                returnValue = dluser.UP_Fetch_UserAvailability(UserID);
            }
            catch
            {
                returnValue = "error";
            }
            return returnValue;
        }

        [System.Web.Services.WebMethod]
        public static string CheckEmployeeID(string EmployeeID)
        {
            dal dluser = new dal();
            string returnValue = string.Empty;
            try
            {
                returnValue = dluser.UP_Fetch_EmployeeIDAvailability(EmployeeID);
            }
            catch
            {
                returnValue = "error";
            }
            return returnValue;
        }

        [System.Web.Services.WebMethod]
        public static string CheckEmailID(string EmailAddress, string UserID)
        {
            dal dluser = new dal();
            string returnValue = string.Empty;
            try
            {
                returnValue = dluser.UP_Fetch_EmailIDAvailability(EmailAddress, UserID);
            }
            catch
            {
                returnValue = "error";
            }
            return returnValue;
        }
    }
}
