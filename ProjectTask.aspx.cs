using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace KedSys35
{
    public partial class ProjectTask : System.Web.UI.Page
    {
        dal dl = new dal();
        DataSet dsTasks;
        DataSet dsLoadStatus;
        string strProjectID;
        string strloginuser = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["loginuser"] = "anandy";
            //Session["ProjectID"] = "P131218001";

            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }
            strloginuser = Session["loginuser"].ToString();

            strProjectID = Session["ProjectID"].ToString();
            brdProjectID.InnerText = strProjectID;

            if (!IsPostBack)
            {
                dsTasks = dl.UP_Fetch_Project_Tasks(strProjectID);
                ViewState["dsTasks"] = dsTasks;

                lvTasks.DataSource = dsTasks.Tables[1];
                lvTasks.DataBind();

                ddEmpDept.DataSource = dsTasks.Tables[2];
                ddEmpDept.DataValueField = "Department";
                ddEmpDept.DataTextField = "Department";
                ddEmpDept.DataBind();
                DDEmpDept_Changed(sender, e);

                int LastSequence = 0;
                if (dsTasks.Tables[0].Rows.Count > 0)
                    LastSequence = Convert.ToInt32(dsTasks.Tables[0].Compute("max(RecordSequence)", string.Empty));
                ViewState["LastSequence"] = LastSequence;

                addBlankrow();
                BindTasks();
                btnupdatetask_Click(sender, e);

                hidTotalHours.Value = dsTasks.Tables[4].Rows[0]["TotalHours"].ToString();

                if (dsTasks.Tables[5].Rows.Count > 0)
                    if (dsTasks.Tables[5].Rows[0]["Status"].ToString() == "Invoiced")
                        btn_submit.Visible = false;
            }
            else
                dsTasks = (DataSet)ViewState["dsTasks"];

        }

        private void BindTasks()
        {
            DataView dv = dsTasks.Tables[0].DefaultView;
            dv.Sort = "RecordSequence ASC";
            dv.RowFilter = "Department = '" + ddEmpDept.Text + "' OR RecordSequence = -1";
            grdTasks.DataSource = dv;
            grdTasks.DataBind();
            dv.RowFilter = "";
        }

        protected void DDEmpDept_Changed(object sender, EventArgs e)
        {
            DataView dtEmp = dsTasks.Tables[3].DefaultView;
            dtEmp.RowFilter = "Department = '" + ddEmpDept.SelectedValue.ToString() + "'";
            lvEmployee.DataSource = dtEmp;
            lvEmployee.DataBind();
            dtEmp.RowFilter = "";

            updateDSBeforeBind();
            BindTasks();

        }

        protected void updateDSBeforeBind()
        {
            foreach (GridViewRow row in grdTasks.Rows)
            {

                TextBox TaskName = (TextBox)row.FindControl("TaskName");
                TextBox EmployeeID = (TextBox)row.FindControl("EmployeeID");
                TextBox EmpName = (TextBox)row.FindControl("EmpName");
                TextBox StartDate = (TextBox)row.FindControl("StartDate");
                TextBox EndDate = (TextBox)row.FindControl("EndDate");
                TextBox Hours = (TextBox)row.FindControl("Hours");
                TextBox RecordSequence = (TextBox)row.FindControl("RecordSequence");
                DropDownList TaskStatus = (DropDownList)row.FindControl("TaskStatus");
                if (TaskName != null)
                {
                    DataView dt = dsTasks.Tables[0].DefaultView;
                    dt.RowFilter = "RecordSequence = " + RecordSequence.Text;
                    if (dt.Count == 1)
                    {
                        dt[0]["TaskName"] = TaskName.Text;
                        dt[0]["EmployeeID"] = EmployeeID.Text;
                        dt[0]["EmpName"] = EmpName.Text;
                        dt[0]["StartDate"] = StartDate.Text;
                        dt[0]["EndDate"] = EndDate.Text;
                        if (Hours.Text.Trim().Length > 0)
                            dt[0]["Hours"] = Hours.Text;
                        dt[0]["RecordSequence"] = RecordSequence.Text;
                        dt[0]["TaskStatus"] = TaskStatus.Text;
                        dsTasks.Tables[0].AcceptChanges();
                    }
                    dt.RowFilter = "";

                }
            }
            ViewState["dsTasks"] = dsTasks;
        }

        protected void grdTasks_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox RecordSequence = (TextBox)e.Row.FindControl("RecordSequence");
                if (RecordSequence != null)
                {
                    TextBox TaskName = (TextBox)e.Row.FindControl("TaskName");
                    TextBox EmployeeID = (TextBox)e.Row.FindControl("EmployeeID");
                    TextBox EmpName = (TextBox)e.Row.FindControl("EmpName");
                    TextBox StartDate = (TextBox)e.Row.FindControl("StartDate");
                    TextBox EndDate = (TextBox)e.Row.FindControl("EndDate");
                    TextBox Hours = (TextBox)e.Row.FindControl("Hours");
                    Image imgstatus = (Image)e.Row.FindControl("imgstatus");
                    LinkButton btn_deletetask = (LinkButton)e.Row.FindControl("btn_deletetask");

                    DataRow datarow = ((DataRowView)e.Row.DataItem).Row;

                    DropDownList TaskStatus = (DropDownList)e.Row.FindControl("TaskStatus");
                    TaskStatus.DataSource = dsTasks.Tables[6];
                    TaskStatus.DataValueField = "Status";
                    TaskStatus.DataTextField = "Status";
                    TaskStatus.DataBind();

                    if (RecordSequence.Text == "-1")
                    {
                        btn_deletetask.Visible = false;
                        TaskStatus.SelectedIndex = TaskStatus.Items.IndexOf(TaskStatus.Items.FindByText("Yet to Start"));
                    }
                    else
                    {
                        btn_deletetask.Visible = true;
                        if (datarow["TaskStatus"].ToString().Length > 0)
                            TaskStatus.SelectedIndex = TaskStatus.Items.IndexOf(TaskStatus.Items.FindByText(datarow["TaskStatus"].ToString()));
                        else
                            TaskStatus.SelectedIndex = TaskStatus.Items.IndexOf(TaskStatus.Items.FindByText("Yet to Start"));
                    }
                    TaskName.Attributes.Add("data-newtask", "yes");
                    EmpName.Attributes.Add("data-newemp", "yes");

                    TaskName.Attributes.Add("data-taskinput", "yes");
                    EmpName.Attributes.Add("data-taskinput", "yes");
                    StartDate.Attributes.Add("data-taskinput", "yes");
                    EndDate.Attributes.Add("data-taskinput", "yes");
                    Hours.Attributes.Add("data-taskinput", "yes");
                    TaskStatus.Attributes.Add("data-taskinput", "yes");

                    if (dsLoadStatus != null)
                    {
                        DataView dv = dsLoadStatus.Tables[0].DefaultView;
                        dv.RowFilter = "RecordSequence = " + RecordSequence.Text;
                        if (dv.Count == 1)
                        {
                            imgstatus.ImageUrl = "~/assets/img/" + dv[0]["ColorCode"].ToString() + ".png";
                            imgstatus.Visible = true;
                        }
                        dv.RowFilter = "";
                    }
                }
            }
        }

        protected void btnupdatetask_Click(object sender, EventArgs e)
        {
            string xmldetails = getTasksXML();

            dsLoadStatus = dl.UP_Fetch_Project_Task_LoadStatus(strProjectID, xmldetails);
            updateDSBeforeBind();
            BindTasks();
        }

        protected void btn_deletetask(object sender, EventArgs e)
        {

            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);
            TextBox RecordSequence = (TextBox)row.FindControl("RecordSequence");

            DataRow[] rows;
            rows = dsTasks.Tables[0].Select("RecordSequence = " + RecordSequence.Text);

            if (rows.Count() == 1)
            {
                rows[0].Delete();
                dsTasks.Tables[0].AcceptChanges();
            }

            BindTasks();

            string xmldetails = getTasksXML();

            dsLoadStatus = dl.UP_Fetch_Project_Task_LoadStatus(strProjectID, xmldetails);
            updateDSBeforeBind();
            BindTasks();
        }

        private string getTasksXML()
        {
            string xmldetails = string.Empty;
            xmldetails = "<root>";

            foreach (GridViewRow row in grdTasks.Rows)
            {
                TextBox TaskName = (TextBox)row.FindControl("TaskName");
                TextBox EmployeeID = (TextBox)row.FindControl("EmployeeID");
                TextBox EmpName = (TextBox)row.FindControl("EmpName");
                TextBox StartDate = (TextBox)row.FindControl("StartDate");
                TextBox EndDate = (TextBox)row.FindControl("EndDate");
                TextBox Hours = (TextBox)row.FindControl("Hours");
                TextBox RecordSequence = (TextBox)row.FindControl("RecordSequence");

                if (TaskName.Text.Trim().Length > 0 && EmployeeID.Text.Trim().Length > 0
                        && StartDate.Text.Trim().Length > 0 && EndDate.Text.Trim().Length > 0 && Hours.Text.Trim().Length > 0)
                {
                    if (RecordSequence.Text == "-1")
                    {
                        DataView dv = dsTasks.Tables[0].DefaultView;
                        dv.RowFilter = "RecordSequence = -1";
                        if (dv.Count == 1)
                        {
                            dv[0]["Department"] = ddEmpDept.Text;

                            int LastSequence = Convert.ToInt16(ViewState["LastSequence"].ToString());
                            LastSequence++;
                            dv[0]["RecordSequence"] = LastSequence.ToString();
                            ViewState["LastSequence"] = LastSequence;
                            RecordSequence.Text = LastSequence.ToString();
                            dv.RowFilter = "";
                            dsTasks.Tables[0].AcceptChanges();
                            addBlankrow();
                        }
                        dv.RowFilter = "";

                    }
                    xmldetails += "<detail><TaskName>" + TaskName.Text + "</TaskName>";
                    xmldetails += "<EmployeeID>" + EmployeeID.Text + "</EmployeeID>";
                    xmldetails += "<EmpName>" + EmpName.Text + "</EmpName>";
                    xmldetails += "<StartDate>" + StartDate.Text + "</StartDate>";
                    xmldetails += "<EndDate>" + EndDate.Text + "</EndDate>";
                    xmldetails += "<Hours>" + Hours.Text + "</Hours>";
                    xmldetails += "<RecordSequence>" + RecordSequence.Text + "</RecordSequence>";
                    xmldetails += "</detail>";
                }
            }

            xmldetails += "</root>";

            return xmldetails;
        }

        private void addBlankrow()
        {
            DataRow dr = dsTasks.Tables[0].NewRow();
            //dr["TaskName"] = "add Task";
            //dr["EmpName"] = "add Employee";
            dr["RecordSequence"] = "-1";
            dsTasks.Tables[0].Rows.Add(dr);
            dsTasks.Tables[0].AcceptChanges();
        }

        protected void btnfinalsumbit_Click(object sender, EventArgs e)
        {
            Boolean result = false;

            string strTaskXML = "<root>";
            foreach (DataRow dr in dsTasks.Tables[0].Rows)
            {
                if (dr["RecordSequence"].ToString() != "-1")
                {
                    strTaskXML += "<detail><Department>" + dr["Department"].ToString() + "</Department>";
                    strTaskXML += "<TaskName>" + dr["TaskName"].ToString() + "</TaskName>";
                    strTaskXML += "<EmployeeID>" + dr["EmployeeID"].ToString() + "</EmployeeID>";
                    strTaskXML += "<StartDate>" + dr["StartDate"].ToString() + "</StartDate>";
                    strTaskXML += "<EndDate>" + dr["EndDate"].ToString() + "</EndDate>";
                    strTaskXML += "<Hours>" + dr["Hours"].ToString() + "</Hours>";
                    strTaskXML += "<RecordSequence>" + dr["RecordSequence"].ToString() + "</RecordSequence>";
                    strTaskXML += "<TaskStatus>" + dr["TaskStatus"].ToString() + "</TaskStatus>";
                    strTaskXML += "</detail>";
                }
            }
            strTaskXML += "</root>";

            result = dl.UP_IU_ProjectTasks(strProjectID, strTaskXML, strloginuser);
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
