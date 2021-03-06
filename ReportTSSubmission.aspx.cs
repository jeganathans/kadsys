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
using System.IO;

namespace KedSys35
{
    public partial class ReportTSSubmission : System.Web.UI.Page
    {
        dal dl = new dal();
        string EmployeeID;
        int totalrecordsgrid = 0;
        string strloginuser = "";
        DataSet dsReport;
        DataSet dsCombo;
        string empRole;
        string strloginEmployeeID = "";
        Boolean allowPaging = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            strloginuser = Session["loginuser"].ToString();
            strloginEmployeeID = Session["EmployeeID"].ToString();
            empRole = Session["EmployeeRole"].ToString();

            if (!IsPostBack)
            {
                hidprot.Value = "portlet-control";
                ViewState["SortExpr"] = "CalenderDate ASC";
                BindCombo();
            }
        }

        void BindCombo()
        {

            if (empRole == "Administrator")
                dsCombo = dl.UP_Report_TimeSheet_DD(string.Empty);
            else
                dsCombo = dl.UP_Report_TimeSheet_DD(strloginEmployeeID);


            ViewState["dsCombo"] = dsCombo;

            ddEmployee.DataSource = dsCombo.Tables[0];
            ddEmployee.DataTextField = "EmpName";
            ddEmployee.DataValueField = "EmployeeID";
            ddEmployee.DataBind();

            if (dsCombo.Tables[0].Rows.Count > 1)
                ddEmployee.Items.Insert(0, new ListItem("--All--", string.Empty));

            ddManager.DataSource = dsCombo.Tables[1];
            ddManager.DataTextField = "MgrName";
            ddManager.DataValueField = "MGRID";
            ddManager.DataBind();

            if (dsCombo.Tables[1].Rows.Count > 1)
                ddManager.Items.Insert(0, new ListItem("--All--", string.Empty));

            ddDirector.DataSource = dsCombo.Tables[2];
            ddDirector.DataTextField = "DirectorName";
            ddDirector.DataValueField = "DIRID";
            ddDirector.DataBind();

            if (dsCombo.Tables[2].Rows.Count > 1)
                ddDirector.Items.Insert(0, new ListItem("--All--", string.Empty));

            ddDepartment.DataSource = dsCombo.Tables[3];
            ddDepartment.DataTextField = "Department";
            ddDepartment.DataValueField = "Department";
            ddDepartment.DataBind();

            if (dsCombo.Tables[3].Rows.Count > 1)
                ddDepartment.Items.Insert(0, new ListItem("--All--", string.Empty));

            ddTSStatus.DataSource = dsCombo.Tables[4];
            ddTSStatus.DataTextField = "vcharSubmitted";
            ddTSStatus.DataValueField = "inteSubmitted";
            ddTSStatus.DataBind();

            txtDtFrom.Text = DateTime.UtcNow.AddMinutes(420).Date.AddDays(-1).ToShortDateString();
            txtDtTo.Text = DateTime.UtcNow.AddMinutes(420).Date.AddDays(-1).ToShortDateString();

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            if (sender == null)
                allowPaging = false;
            else
                allowPaging = true;
            BindGrid();


        }

        protected void btn_XlExport_Click(object sender, EventArgs e)
        {
            btn_submit_Click(null, null);

            string attachment = "attachment; filename=Report.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();


        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        void BindGrid()
        {
            string DATEFROM, DATETO, EMPID, MGRID, DIRID, DEPARTMENT, LOGINEMPID, TSSTATUS;
            DATEFROM = txtDtFrom.Text;
            DATETO = txtDtTo.Text;
            EMPID = ddEmployee.SelectedItem.Value;
            MGRID = ddManager.SelectedItem.Value;
            DIRID = ddDirector.SelectedItem.Value;
            DEPARTMENT = ddDepartment.SelectedItem.Value;
            LOGINEMPID = strloginEmployeeID;
            TSSTATUS = ddTSStatus.SelectedItem.Value;

            dsReport = dl.UP_Report_TimesheetSubmission(DATEFROM, DATETO, EMPID, MGRID, DIRID, DEPARTMENT, LOGINEMPID, TSSTATUS);


            DataView dv = dsReport.Tables[0].DefaultView;
            dv.Sort = ViewState["SortExpr"].ToString();
            GridView1.DataSource = dv;
            totalrecordsgrid = dsReport.Tables[0].Rows.Count;
            if (totalrecordsgrid == 0)
            {
                hidprot.Value = "portlet-control";
                hidtoaster.Value = "warning|Records not available";
            }
            else
            {
                hidprot.Value = "portlet-control-grid";
            }

            GridView1.AllowPaging = allowPaging;
            GridView1.DataBind();
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
