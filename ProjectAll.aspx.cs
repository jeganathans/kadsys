﻿using System;
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
    public partial class ProjectAll : System.Web.UI.Page
    {
        dal dl = new dal();
        string Sort_Direction = "inteOrder DESC, ProjectID DESC";
        int totalrecordsgrid = 0;
        string strloginuser = "";
        string DBfilter = "";
        string strloginEmployeeID = "";

        string empRole;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            strloginuser = Session["loginuser"].ToString();
            strloginEmployeeID = Session["EmployeeID"].ToString();
            empRole = Session["EmployeeRole"].ToString();

            if (Request.QueryString.AllKeys.Contains("status"))
            {
                DBfilter = "Status = '" + Request.QueryString["status"] + "'";
            }
            else if (Request.QueryString.AllKeys.Contains("ytd"))
            {
                string propyear = DateTime.UtcNow.AddMinutes(420).Year.ToString();
                DBfilter = "ProjectYear = " + propyear;
            }
            else if (Request.QueryString.AllKeys.Contains("mtd"))
            {
                string propmonth = DateTime.UtcNow.AddMinutes(420).Month.ToString();
                string propyear = DateTime.UtcNow.AddMinutes(420).Year.ToString();
                DBfilter = "ProjectMonth = " + propmonth + " and ProjectYear = " + propyear;
            }
            else if (Request.QueryString.AllKeys.Contains("qualmtd"))
            {
                string propmonth = DateTime.UtcNow.AddMinutes(420).Month.ToString();
                string propyear = DateTime.UtcNow.AddMinutes(420).Year.ToString();
                DBfilter = "Department = 'Qualitative' and ProjectMonth = " + propmonth + " and ProjectYear = " + propyear;
            }
            else if (Request.QueryString.AllKeys.Contains("quanmtd"))
            {
                string propmonth = DateTime.UtcNow.AddMinutes(420).Month.ToString();
                string propyear = DateTime.UtcNow.AddMinutes(420).Year.ToString();
                DBfilter = "Department = 'Quantitative' and ProjectMonth = " + propmonth + " and ProjectYear = " + propyear;
            }

            hidtoaster.Value = "";
            if (!IsPostBack)
            {
                hidUID.Value = "";
                ViewState["SortExpr"] = Sort_Direction;
                ViewState["FilterExpression"] = "";
                BindGrid();
            }
        }

        void BindGrid()
        {
            DataSet ds;
            if (empRole == "Administrator")
                ds = dl.UP_Fetch_ProjectAll(string.Empty);
            else
                ds = dl.UP_Fetch_ProjectAll(strloginEmployeeID);


            string filtercriteria = "";
            filtercriteria = DBfilter;

            string customfilter = string.Empty;
            customfilter = gridFilterbind(ds, filtercriteria);

            if (customfilter.Length > 0)
                if (filtercriteria.Length > 0)
                    filtercriteria = filtercriteria + " and " + customfilter;
                else
                    filtercriteria = customfilter;

            /*if (ViewState["FilterExpression"].ToString().Length > 0)
                if (filtercriteria.Length > 0)
                    filtercriteria = filtercriteria + " and " + ViewState["FilterExpression"].ToString();
                else
                    filtercriteria = ViewState["FilterExpression"].ToString();*/

            if (filtercriteria.Length > 0)
            {
                try
                {
                    using (DataTable objDataTable = ds.Tables[0])
                    {
                        DataRow[] objDataRows = objDataTable.Select(filtercriteria, ViewState["SortExpr"].ToString());
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
                    if (ViewState["FilterExpression"].ToString().Length > 0)
                        btnRemoveFilter.Visible = true;
                    else
                        btnRemoveFilter.Visible = false;
                }
                catch
                {
                    ViewState["FilterExpression"] = "";
                    hidtoaster.Value = "error|Filter not applied. Please do not use wildcard characters.";
                }
            }
            else if (filtercriteria.Length == 0)
            {
                DataView dv = ds.Tables[0].DefaultView;
                dv.Sort = ViewState["SortExpr"].ToString();
                GridView1.DataSource = dv;
                totalrecordsgrid = ds.Tables[0].Rows.Count;
                btnRemoveFilter.Visible = false;
            }
            GridView1.DataBind();

            gridColumnSelection();
        }

        protected string gridFilterbind(DataSet ds, string filtercriteria)
        {
            string customfilter = string.Empty;
            DataView dv = ds.Tables[0].DefaultView;
            dv.RowFilter = filtercriteria;

            DataTable dtprojectref = dv.ToTable(true, "ProjectID");
            fltddProjectID.DataSource = dtprojectref;
            fltddProjectID.DataValueField = "ProjectID";
            fltddProjectID.DataTextField = "ProjectID";
            fltddProjectID.DataBind();

            DataTable dtprojectname = dv.ToTable(true, "ProjectName");
            fltddProjectName.DataSource = dtprojectname;
            fltddProjectName.DataValueField = "ProjectName";
            fltddProjectName.DataTextField = "ProjectName";
            fltddProjectName.DataBind();

            DataTable dtClientName = dv.ToTable(true, "ClientName");
            fltddClientName.DataSource = dtClientName;
            fltddClientName.DataValueField = "ClientName";
            fltddClientName.DataTextField = "ClientName";
            fltddClientName.DataBind();

            DataTable dtCoordinatorName = dv.ToTable(true, "CoordinatorName");
            fltddCoordinatorName.DataSource = dtCoordinatorName;
            fltddCoordinatorName.DataValueField = "CoordinatorName";
            fltddCoordinatorName.DataTextField = "CoordinatorName";
            fltddCoordinatorName.DataBind();

            DataTable dtLeader = dv.ToTable(true, "Leader");
            fltddLeader.DataSource = dtLeader;
            fltddLeader.DataValueField = "Leader";
            fltddLeader.DataTextField = "Leader";
            fltddLeader.DataBind();

            DataTable dtStatus = dv.ToTable(true, "Status");
            fltddStatus.DataSource = dtStatus;
            fltddStatus.DataValueField = "Status";
            fltddStatus.DataTextField = "Status";
            fltddStatus.DataBind();


            string strcolfilter;
            strcolfilter = colfilter(fltduProjectID.Text, "ProjectID");
            if (strcolfilter.Length > 0)
                customfilter += ((customfilter.Length > 0) ? " and " : "") + strcolfilter;

            strcolfilter = colfilter(fltduProjectName.Text, "ProjectName");
            if (strcolfilter.Length > 0)
                customfilter += ((customfilter.Length > 0) ? " and " : "") + strcolfilter;

            strcolfilter = colfilter(fltduClientName.Text, "ClientName");
            if (strcolfilter.Length > 0)
                customfilter += ((customfilter.Length > 0) ? " and " : "") + strcolfilter;

            strcolfilter = colfilter(fltduCoordinatorName.Text, "CoordinatorName");
            if (strcolfilter.Length > 0)
                customfilter += ((customfilter.Length > 0) ? " and " : "") + strcolfilter;

            strcolfilter = colfilter(fltduLeader.Text, "Leader");
            if (strcolfilter.Length > 0)
                customfilter += ((customfilter.Length > 0) ? " and " : "") + strcolfilter;


            strcolfilter = colfilter(fltduStatus.Text, "Status");
            if (strcolfilter.Length > 0)
                customfilter += ((customfilter.Length > 0) ? " and " : "") + strcolfilter;

            

            return customfilter;
        }

        protected string colfilter(string strrawfiltertext, string strcolumnname)
        {
            string customfilter = string.Empty;

            String[] strparameters;
            String  strcsv;
            if (strrawfiltertext.Length > 0)
            {
                strcsv = strrawfiltertext.Replace("[", "").Replace("]", "").Replace("\"", "");
                if (strcsv.Length > 0)
                {
                    strparameters = strcsv.Split(',');
                    foreach (string strvalue in strparameters)
                    {
                        customfilter += ((customfilter.Length>0)?" or ":"") + strcolumnname + " = '" + strvalue + "'";
                    }

                    customfilter = "(" + customfilter + ")";
                }
            }

            return customfilter;
        }

        protected void gridColumnSelection()
        {
            GridView1.Columns[1].Visible = (gchkCol1.Checked) ? true : false;
            GridView1.Columns[2].Visible = (gchkCol2.Checked) ? true : false;
            GridView1.Columns[3].Visible = (gchkCol3.Checked) ? true : false;
            GridView1.Columns[4].Visible = (gchkCol4.Checked) ? true : false;
            GridView1.Columns[5].Visible = (gchkCol5.Checked) ? true : false;
            GridView1.Columns[6].Visible = (gchkCol6.Checked) ? true : false;
            GridView1.Columns[7].Visible = (gchkCol7.Checked) ? true : false;
            GridView1.Columns[8].Visible = (gchkCol8.Checked) ? true : false;
            GridView1.Columns[9].Visible = (gchkCol9.Checked) ? true : false;
            GridView1.Columns[10].Visible = (gchkCol10.Checked) ? true : false;
            GridView1.Columns[11].Visible = (gchkCol11.Checked) ? true : false;
            GridView1.Columns[12].Visible = (gchkCol12.Checked) ? true : false;
            GridView1.Columns[13].Visible = (gchkCol13.Checked) ? true : false;
            GridView1.Columns[14].Visible = (gchkCol14.Checked) ? true : false;
            GridView1.Columns[15].Visible = (gchkCol15.Checked) ? true : false;
            
        }


        protected void gridManage(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btn_select_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            hidUID.Value = ((Label)row.Cells[0].Controls[1]).Text;

            string strProjectID = ((Label)row.Cells[1].Controls[1]).Text;

            hidtoaster.Value = "";

            Session["ProjectID"] = strProjectID;
            Response.Redirect("Projects.aspx");
        }

        protected void btn_task_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            hidUID.Value = ((Label)row.Cells[0].Controls[1]).Text;

            string strProjectID = ((Label)row.Cells[1].Controls[1]).Text;

            hidtoaster.Value = "";

            Session["ProjectID"] = strProjectID;
            Response.Redirect("ProjectTask.aspx");
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            //hidUID.Value = string.Empty;
            //hidtoaster.Value = "";
            //Session["ProposalRef"] = "N/A";
            //Session["ProjectID"] = "New";
            //Response.Redirect("Projects.aspx");
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
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                LinkButton btn_select = (LinkButton)e.Row.FindControl("btn_select");
                LinkButton btn_task = (LinkButton)e.Row.FindControl("btn_task");
                Label Status = (Label)e.Row.FindControl("Status");
                if (Status.Text == "Invoiced")
                {
                    btn_select.Text = "<i class='icon-lock'></i>";
                    btn_select.ToolTip = "Read-Only";
                    btn_task.BackColor = System.Drawing.ColorTranslator.FromHtml("#6cb87f");
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
    }
}
