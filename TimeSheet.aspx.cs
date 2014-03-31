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
    public partial class TimeSheet : System.Web.UI.Page
    {
        dal dl = new dal();
        string EmployeeID;
        int totalrecordsgrid = 0;
        string strloginuser = "";
        Boolean hasTask = false;
        DataSet dsTimeSheet;
        DataSet dsCombo;
        TimeSpan daystart;
        Boolean self;
        string FilterExpression = "";

        string TimeSheetDate;
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
                BindCombo();


                txtTimeSheetDate.Text = ((daystart > DateTime.UtcNow.AddMinutes(420).TimeOfDay) ? DateTime.UtcNow.AddMinutes(420).Date.AddDays(-1) : DateTime.UtcNow.AddMinutes(420).Date).ToShortDateString();
                TimeSheetDate = txtTimeSheetDate.Text;


                ddEmpName_Changed(sender, e);
                
                //BindGrid();
            }
            else
            {
                dsCombo = (DataSet)ViewState["dsCombo"];
                EmployeeID = ViewState["EmployeeID"].ToString();
                daystart = (TimeSpan) ViewState["daystart"];
                TimeSheetDate = txtTimeSheetDate.Text;
                self = (Boolean)ViewState["self"];
            }
            brdPageID.InnerText = ddEmpName.SelectedItem.Text + " - " + TimeSheetDate;

        }

        void BindCombo()
        {
            dsCombo = dl.UP_Fetch_TimeSheet_DD(strloginuser);
            ViewState["dsCombo"] = dsCombo;

            ddEmpName.DataSource = dsCombo.Tables[0];
            ddEmpName.DataTextField = "EmpName";
            ddEmpName.DataValueField = "EmployeeID";
            ddEmpName.DataBind();

            daystart = Convert.ToDateTime(dsCombo.Tables[1].Rows[0]["DayStart"].ToString()).TimeOfDay;
            ViewState["daystart"] = daystart;

        }

        void PopulateDetails()
        {
            if (dsTimeSheet.Tables[2].Rows.Count > 0)
            {
                txtInTime.Text = dsTimeSheet.Tables[2].Rows[0]["InTime"].ToString();
                txtOutTime.Text = dsTimeSheet.Tables[2].Rows[0]["OutTime"].ToString();
            }
            else
            {
                txtInTime.Text = "";
                txtOutTime.Text = "";
            }
        }


        protected void ddEmpName_Changed(object sender, EventArgs e)
        {
            EmployeeID = ddEmpName.SelectedValue;
            ViewState["EmployeeID"] = EmployeeID;
            dsCombo.Tables[0].DefaultView.RowFilter = "EmployeeID = '" + ddEmpName.SelectedValue + "'";
            if (dsCombo.Tables[0].DefaultView.Count == 1)
            {
                txtManagerName.Text = dsCombo.Tables[0].DefaultView[0]["ManagerName"].ToString();

                if (dsCombo.Tables[0].DefaultView[0]["disporder"].ToString() == "1")
                    self = true;
                else
                    self = false;
                ViewState["self"] = self;

            }
            dsCombo.Tables[0].DefaultView.RowFilter = "";

            resetfilterindex();
            BindGrid();

            PopulateDetails();
        }


        protected void txtTimeSheetDate_changed(object sender, EventArgs e)
        {
            TimeSheetDate = txtTimeSheetDate.Text;

            resetfilterindex();
            BindGrid();
            PopulateDetails();
        }

        void BindGrid()
        {
            dsTimeSheet = dl.UP_Fetch_TimeSheet(EmployeeID, TimeSheetDate);

            string strBaseFilter = "", strFinalFilter="";

            DataRow[] drpri3 = dsTimeSheet.Tables[0].Select("priority = 3");
            if (drpri3.GetUpperBound(0) == -1)
                hasTask = false;
            else
            {
                hasTask = true;
                //strBaseFilter = "priority >= 3";
                //strFinalFilter = strBaseFilter;
            }

            if (FilterExpression.Length > 0)
                strFinalFilter = (strFinalFilter.Length > 0 ? strFinalFilter + " and " : "") + FilterExpression;


            DataView dv = dsTimeSheet.Tables[0].DefaultView;
            dv.RowFilter = strFinalFilter;

            string txtfltddProjectRef = "All";
            if (IsPostBack)
            {
                txtfltddProjectRef = fltddProjectRef.SelectedItem.Text;
            }
            //DropDownList fltddProjectRef = (DropDownList)e.Row.FindControl("fltddProjectRef");
            DataTable dtprojectref = dv.ToTable(true, "ProjectRef");
            fltddProjectRef.DataSource = dtprojectref;
            fltddProjectRef.DataValueField = "ProjectRef";
            fltddProjectRef.DataTextField = "ProjectRef";
            fltddProjectRef.DataBind();
            fltddProjectRef.Items.Insert(0, new ListItem("All", ""));
            fltddProjectRef.SelectedIndex = fltddProjectRef.Items.IndexOf(fltddProjectRef.Items.FindByText(txtfltddProjectRef));

            string txtfltProjectName = "All";
            if (IsPostBack)
            {
                txtfltProjectName = fltddProjectName.SelectedItem.Text;
            }
            //DropDownList fltddProjectRef = (DropDownList)e.Row.FindControl("fltddProjectRef");
            DataTable dtProjectName = dv.ToTable(true, "ProjectName");
            fltddProjectName.DataSource = dtProjectName;
            fltddProjectName.DataValueField = "ProjectName";
            fltddProjectName.DataTextField = "ProjectName";
            fltddProjectName.DataBind();
            fltddProjectName.Items.Insert(0, new ListItem("All", ""));
            fltddProjectName.SelectedIndex = fltddProjectName.Items.IndexOf(fltddProjectName.Items.FindByText(txtfltProjectName));

            string txtfltTaskName = "All";
            if (IsPostBack)
            {
                txtfltTaskName = fltddTaskName.SelectedItem.Text;
            }
            //DropDownList fltddProjectRef = (DropDownList)e.Row.FindControl("fltddProjectRef");
            DataTable dtTaskName = dv.ToTable(true, "TaskName");
            fltddTaskName.DataSource = dtTaskName;
            fltddTaskName.DataValueField = "TaskName";
            fltddTaskName.DataTextField = "TaskName";
            fltddTaskName.DataBind();
            fltddTaskName.Items.Insert(0, new ListItem("All", ""));
            fltddTaskName.SelectedIndex = fltddTaskName.Items.IndexOf(fltddTaskName.Items.FindByText(txtfltTaskName));

            //if (ViewState["FilterExpression"].ToString().Length == 0)
            {
                
                /*if (hasTask)
                {
                    if (FilterExpression.Length > 0)
                        dv.RowFilter = "priority >= 3 and " + FilterExpression;
                    else
                        dv.RowFilter = "priority >= 3";
                }
                else if (FilterExpression.Length > 0)
                    dv.RowFilter = FilterExpression;*/
                //dv.Sort = ViewState["SortExpr"].ToString();
                GridTS.DataSource = dv;
                totalrecordsgrid = dsTimeSheet.Tables[0].Rows.Count;
                if (totalrecordsgrid == 0)
                {
                    //hidprot.Value = "portlet-control";
                }

                //btnRemoveFilter.Visible = false;
            }

            GridTS.DataBind();


            if (dsTimeSheet.Tables[2].Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dsTimeSheet.Tables[2].Rows[0]["dateSubmitedLast"].ToString()))
                {
                    lbltsinfo.Text = "Timesheet last submitted at " + dsTimeSheet.Tables[2].Rows[0]["dateSubmitedLast"].ToString();
                    lbltsinfo.CssClass = "text-success";
                }
                else
                {
                    lbltsinfo.Text = "Timesheet not yet submitted";
                    lbltsinfo.CssClass = "text-danger";
                }
            }
            else
            {
                lbltsinfo.Text = "Timesheet not yet submitted";
                lbltsinfo.CssClass = "text-danger";
            }
            
        }

        protected void btn_starttask(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            Label UID = (Label)row.FindControl("UID");
            Label priority = (Label)row.FindControl("priority");
            Label TaskName = (Label)row.FindControl("TaskName");
            Label ProjectRef = (Label)row.FindControl("ProjectRef");
            DropDownList ddTaskName = (DropDownList)row.FindControl("ddTaskName");

            String strTask = (priority.Text == "1") ? TaskName.Text : ddTaskName.Text;

            DateTime starttime = DateTime.UtcNow.AddMinutes(420);

            dl.UP_I_TimeSheetLog_Start(EmployeeID, TimeSheetDate, UID.Text, ProjectRef.Text, strTask, string.IsNullOrEmpty(UID.Text) ? "True" : "False", starttime);

            BindGrid();

        }

        protected void btn_overrid(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            Label UID = (Label)row.FindControl("UID");
            Label priority = (Label)row.FindControl("priority");
            Label TaskName = (Label)row.FindControl("TaskName");
            Label ProjectRef = (Label)row.FindControl("ProjectRef");
            DropDownList ddTaskName = (DropDownList)row.FindControl("ddTaskName");

            String strTask = (priority.Text == "1") ? TaskName.Text : ddTaskName.Text;

            dl.UP_I_TimeSheetLog_Start_Override(priority.Text == "4"?UID.Text:String.Empty, EmployeeID, TimeSheetDate, priority.Text == "1"?UID.Text:String.Empty, ProjectRef.Text, strTask, priority.Text == "2" ? "True" : "False");

            BindGrid();

        }

        protected void btn_stoptask(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label UID = (Label)row.FindControl("UID");
            TextBox Comments = (TextBox)row.FindControl("Comments");
            DateTime endtime = DateTime.UtcNow.AddMinutes(420);
            TextBox TotalMinutes = (TextBox)row.FindControl("TotalMinutes");
            Label Overridden = (Label)row.FindControl("Overridden");

            string strTotalMinutes = string.Empty;
            if (TotalMinutes != null)
                strTotalMinutes = TotalMinutes.Text;

            dl.UP_U_TimeSheetLog_StopEnd(UID.Text, endtime, "Stop", Comments.Text, strTotalMinutes, Overridden.Text);

            resetfilterindex();
            BindGrid();
        }

        protected void btn_endtask(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label UID = (Label)row.FindControl("UID");
            TextBox Comments = (TextBox)row.FindControl("Comments");
            DateTime endtime = DateTime.UtcNow.AddMinutes(420);

            TextBox TotalMinutes = (TextBox)row.FindControl("TotalMinutes");
            Label Overridden = (Label)row.FindControl("Overridden");

            string strTotalMinutes = string.Empty;
            if (TotalMinutes != null)
                strTotalMinutes = TotalMinutes.Text;

            dl.UP_U_TimeSheetLog_StopEnd(UID.Text, endtime, "End", Comments.Text, strTotalMinutes, Overridden.Text);

            resetfilterindex();
            BindGrid();
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label UID = (Label)row.FindControl("UID");

            dl.UP_D_TimeSheetLog(UID.Text);

            resetfilterindex();
            BindGrid();
        }

        protected void btnsave_click(object sender, EventArgs e)
        {
            string StrEmployeeID, StrTimeSheetDate, InTime, OutTime = "", Updateby;
            Boolean result = false;

            TimeSpan TSInTime, TSOutTime;
            TimeSpan.TryParse(txtInTime.Text, out TSInTime);
            TimeSpan.TryParse(txtOutTime.Text, out TSOutTime);

            InTime = TimeSheetDate + " " + txtInTime.Text;
            if (TSInTime <= TSOutTime)
                OutTime = TimeSheetDate + " " + txtOutTime.Text;
            else
                OutTime = Convert.ToDateTime(TimeSheetDate).AddDays(1).ToShortDateString() + " " + txtOutTime.Text;

            StrEmployeeID = EmployeeID;
            StrTimeSheetDate = TimeSheetDate;
            
            Updateby = strloginuser;

            result = dl.UP_IU_TimeSheet(EmployeeID, TimeSheetDate, InTime, OutTime, Updateby);

            if (result == true)
            {
                hidtoaster.Value = "success|Updated successfully";
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }

            
        }

        protected void gv_RowCommand(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton btn_starttask = (LinkButton)e.Row.FindControl("btn_starttask");
                LinkButton btn_stoptask = (LinkButton)e.Row.FindControl("btn_stoptask");
                LinkButton btn_endtask = (LinkButton)e.Row.FindControl("btn_endtask");
                LinkButton btn_overrid = (LinkButton)e.Row.FindControl("btn_overrid");
                LinkButton btn_delete = (LinkButton)e.Row.FindControl("btn_delete");
                TextBox Comments = (TextBox)e.Row.FindControl("Comments");
                TextBox TotalMinutes = (TextBox)e.Row.FindControl("TotalMinutes");
                TextBox dHoursMin = (TextBox)e.Row.FindControl("dHoursMin");
                DropDownList ddTaskStatus = (DropDownList)e.Row.FindControl("ddTaskStatus");


                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                int priroity = Convert.ToInt16(row["priority"].ToString());
                string ProjectRef = row["ProjectRef"].ToString();
                string TaskLogStatus = row["TaskLogStatus"].ToString();
                

                if (row["TotalMinutes"].ToString().Length > 0)
                {
                    int totalminutes = Convert.ToInt32(row["TotalMinutes"].ToString());
                    string hr = (totalminutes / 60).ToString().PadLeft(2,'0');
                    string mi = (totalminutes % 60).ToString().PadLeft(2, '0');
                    dHoursMin.Text = hr + ":" + mi;
                }

                TotalMinutes.Enabled = true;
                dHoursMin.Enabled = true;
                Comments.Enabled = true;

                btn_overrid.Visible = false;
                btn_starttask.Visible = false;
                btn_delete.Visible = false;
                btn_endtask.Visible = false;
                btn_stoptask.Visible = false;

                if (priroity == 4 || priroity == 5)
                {
                    Label TaskName = (Label)e.Row.FindControl("TaskName");
                    DropDownList ddTaskName = (DropDownList)e.Row.FindControl("ddTaskName");
                    TaskName.Visible = false;

                    ddTaskName.DataSource = dsTimeSheet.Tables[1];
                    ddTaskName.DataTextField = "TaskName";
                    ddTaskName.DataValueField = "TaskName";
                    ddTaskName.DataBind();
                    ddTaskName.Items.Insert(0, new ListItem("--Select--", ""));

                    ddTaskName.SelectedIndex = ddTaskName.Items.IndexOf(ddTaskName.Items.FindByText(row["TaskName"].ToString()));

                    ddTaskName.Visible = true;

                }

                if (ProjectRef.Length > 0)
                {
                    ddTaskStatus.Visible = true;
                    ddTaskStatus.Items.Insert(0, new ListItem("--Select--", ""));
                    ddTaskStatus.Items.Insert(1, new ListItem("Completed", "1"));
                    ddTaskStatus.Items.Insert(2, new ListItem("Not Completed", "0"));

                    if (!string.IsNullOrEmpty(TaskLogStatus))
                    {
                        ddTaskStatus.SelectedIndex = ddTaskStatus.Items.IndexOf(ddTaskStatus.Items.FindByText(TaskLogStatus));
                        if (TaskLogStatus == "Completed")
                            ddTaskStatus.Enabled = false;
                    }

                    

                }
                else
                {
                    ddTaskStatus.Visible = false;
                    if (priroity != 5)
                        btn_delete.Visible = true;
                }

                

                #region oldcode
                /*if (hasTask)
                {
                    btn_overrid.Visible = false;
                    btn_starttask.Visible = false;
                    btn_delete.Visible = false;
                    if (priroity == 3)
                    {
                        if (TaskLogStatus == "Completed")
                        {
                            btn_endtask.Visible = true;
                            btn_stoptask.Visible = false;
                        }
                        else if (TaskLogStatus == "Stop")
                        {
                            btn_endtask.Visible = false;
                            btn_stoptask.Visible = true;
                        }
                        else
                        {
                            if (string.IsNullOrEmpty(ProjectRef))
                                btn_stoptask.Visible = false;
                            else
                                btn_stoptask.Visible = true;
                            btn_endtask.Visible = true;
                        }

                        if (row["Overridden"].ToString() == "True")
                        {
                            TotalMinutes.Enabled = true;
                            dHoursMin.Enabled = true;
                        }

                        Comments.Enabled = true;
                        Comments.TextMode = TextBoxMode.MultiLine;
                        Comments.Rows = 2;
                    }
                    else
                    {
                        btn_stoptask.Visible = false;
                        btn_endtask.Visible = false;
                        Comments.Enabled = false;
                    }

                }
                else
                {
                    if (priroity <= 2)
                    {
                        if (Convert.ToDateTime(TimeSheetDate) == ((daystart > DateTime.UtcNow.AddMinutes(420).TimeOfDay) ? DateTime.UtcNow.AddMinutes(420).Date.AddDays(-1) : DateTime.UtcNow.AddMinutes(420).Date)
                            && self)
                            //disable start stop
                            //btn_starttask.Visible = true;
                            ;
                        else
                            btn_starttask.Visible = false;
                        Comments.Visible = false;
                        btn_delete.Visible = false;
                    }
                    else
                    {
                        btn_starttask.Visible = false;
                        Comments.Enabled = false;
                        Comments.ToolTip = Comments.Text;
                        if (!hasTask && priroity == 4)
                            btn_delete.Visible = true;
                    }
                    btn_stoptask.Visible = false;
                    btn_endtask.Visible = false;

                    if (priroity == 5)
                    {
                        Label TaskName = (Label)e.Row.FindControl("TaskName");
                        DropDownList ddTaskName = (DropDownList)e.Row.FindControl("ddTaskName");
                        TaskName.Visible = false;

                        ddTaskName.DataSource = dsTimeSheet.Tables[1];
                        ddTaskName.DataTextField = "TaskName";
                        ddTaskName.DataValueField = "TaskName";
                        ddTaskName.DataBind();
                        ddTaskName.Items.Insert(0, new ListItem("--Select--", ""));

                        ddTaskName.Visible = true;

                    }

                }*/
                #endregion
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            int inteTotalMinutes;
            result = saveopertion(out inteTotalMinutes);

            if (result == true)
            {
                if (inteTotalMinutes > 0)
                {
                    hidtoaster.Value = "success|Updated successfully";
                }
                else
                {
                    hidtoaster.Value = "error|Please input task details";
                }

                BindGrid();
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }
        }

        protected void btn_finalsubmit_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            int inteTotalMinutes;
            result = saveopertion(out inteTotalMinutes);

            if (inteTotalMinutes == 0)
            {
                hidtoaster.Value = "error|Please input task details";
                return;
            }


            DateTime dateSubmited = DateTime.UtcNow.AddMinutes(420);
            result = dl.UP_IU_TimeSheet_Submit(EmployeeID, TimeSheetDate, dateSubmited);
             
            if (result == true)
            {
                hidtoaster.Value = "success|Submitted successfully";
                BindGrid();
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }
        }

        protected Boolean saveopertion(out int inteTotalMinutes)
        {
            Boolean result = false;
            inteTotalMinutes = 0;

            string xmldetails = string.Empty;
            xmldetails = "<root>";
            foreach (GridViewRow row in GridTS.Rows)
            {
                Label UID = (Label)row.FindControl("UID");
                Label priority = (Label)row.FindControl("priority");
                Label ProjectRef = (Label)row.FindControl("ProjectRef");

                TextBox CurrencyValue = (TextBox)row.FindControl("CurrencyValue");
                TextBox Comments = (TextBox)row.FindControl("Comments");
                TextBox TotalMinutes = (TextBox)row.FindControl("TotalMinutes");
                DropDownList ddTaskStatus = (DropDownList)row.FindControl("ddTaskStatus");
                DropDownList ddTaskName = (DropDownList)row.FindControl("ddTaskName");

                Label TaskName = (Label)row.FindControl("TaskName");
                String strTask = (priority.Text == "5") ? ddTaskName.Text : TaskName.Text;
                Boolean emptyentry = false;

                if (priority.Text == "4" || priority.Text == "5")
                {
                    if (ddTaskName.Text.Length == 0 || TotalMinutes.Text.Length == 0 || Comments.Text.Length == 0)
                        emptyentry = true;
                }
                else
                {
                    if (TotalMinutes.Text.Length == 0 || Comments.Text.Length == 0 || ddTaskStatus.SelectedItem.Text.Length == 0)
                        emptyentry = true;
                }

                if (!emptyentry)
                {

                    if (priority.Text == "3" || priority.Text == "4")
                        xmldetails += "<detail><UID>" + UID.Text + "</UID>";
                    else
                        xmldetails += "<detail><UID/>";
                    if (priority.Text == "1")
                        xmldetails += "<ProjectTaskUID>" + UID.Text + "</ProjectTaskUID>";
                    else
                        xmldetails += "<ProjectTaskUID/>";
                    xmldetails += "<ProjectRef>" + ProjectRef.Text + "</ProjectRef>";
                    xmldetails += "<TaskName>" + strTask + "</TaskName>";
                    //xmldetails += "<TaskName>" + ProjectRef.Text + "</TaskName>";
                    xmldetails += "<TotalMinutes>" + TotalMinutes.Text + "</TotalMinutes>";
                    xmldetails += "<Comments>" + Comments.Text + "</Comments>";
                    if (priority.Text == "1" || priority.Text == "3")
                        xmldetails += "<TaskLogStatus>" + ddTaskStatus.SelectedItem.Text + "</TaskLogStatus>";
                    xmldetails += "</detail>";

                    inteTotalMinutes += Convert.ToInt16(TotalMinutes.Text);
                }
            }
            xmldetails += "</root>";

            result = dl.UP_IU_TimeSheetLog(EmployeeID, TimeSheetDate, xmldetails);

            return result;
        }

        protected void fltddchanged(Object sender, EventArgs e)
        {
            //DropDownList fltddProjectRef = (DropDownList)sender;

            if (fltddProjectRef.SelectedIndex != 0)
            {
                FilterExpression = (FilterExpression.Length>0?FilterExpression + " AND ":"") + "ProjectRef = '" + fltddProjectRef.SelectedItem.Text + "'";
            }

            if (fltddProjectName.SelectedIndex != 0)
            {
                FilterExpression = (FilterExpression.Length>0?FilterExpression + " AND ":"") + "ProjectName = '" + fltddProjectName.SelectedItem.Text + "'";
            }

            if (fltddTaskName.SelectedIndex != 0)
            {
                FilterExpression = (FilterExpression.Length > 0 ? FilterExpression + " AND " : "") + "TaskName = '" + fltddTaskName.SelectedItem.Text + "'";
            }
            BindGrid();
        }

        protected void resetfilterindex()
        {
            fltddProjectRef.SelectedIndex = 0;
            fltddProjectName.SelectedIndex = 0;
            fltddTaskName.SelectedIndex = 0;
            FilterExpression = "";
        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void btnFilterOk_Click(object sender, EventArgs e)
        {
        }
    }
}
