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
    public partial class WebForm7 : System.Web.UI.Page
    {
        dal dl = new dal();
        string Sort_Direction = "Listval1 ASC";
        int totalrecordsgrid = 0;
        string strloginuser = "";
        string strmastername = "";
        string[] strcoldetails;

        PageAccess PGAccess;
        string empRole;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }


            hidtoaster.Value = "";
            if (!IsPostBack)
            {
                strmastername = Request.QueryString["listname"];

                if (strmastername == null)
                {
                    Response.Redirect("Dashboard.aspx");
                }

                strloginuser = Session["loginuser"].ToString();
                ViewState["strmastername"] = strmastername;
                brdliPageHeader.InnerText = strmastername;
                brdliPageHeader.HRef = Request.RawUrl;
                porthead1.Text = strmastername;
                porthead2.Text = strmastername;

                hidUID.Value = "";
                hidprot.Value = "portlet-control-grid";
                ViewState["SortExpr"] = Sort_Direction;
                ViewState["FilterExpression"] = "";
                BindGrid();


                if (strcoldetails[1].Trim().Length > 0)
                    lblListval1.InnerHtml = strcoldetails[1].Trim() + "<span class=\"required\">*</span>";

                if (strcoldetails[2].Trim().Length > 0)
                    lblListval2.InnerHtml = strcoldetails[2].Trim() + "<span class=\"required\">*</span>";
                else
                {
                    //txtListval2.Visible = false;
                    txtListval2.Style.Add("display", "none");
                }

                if (strcoldetails[3].Trim().Length > 0)
                    lblListval3.InnerHtml = strcoldetails[3].Trim() + "<span class=\"required\">*</span>";
                else
                    txtListval3.Visible = false;

                if (strcoldetails[4].Trim().Length > 0)
                    lblListval4.InnerHtml = strcoldetails[4].Trim() + "<span class=\"required\">*</span>";
                else
                    txtListval4.Visible = false;


                for (int i = 1; i < strcoldetails.Length; i++)
                {
                    if (strcoldetails[i].Trim().Length == 0)
                        this.GridView1.Columns[i].Visible = false;
                    else
                    {
                        ((Label)this.GridView1.HeaderRow.Cells[i].Controls[1]).Text = strcoldetails[i].Trim().ToString();
                    }
                }
                reset_coltrols();
            }

            strmastername = ViewState["strmastername"].ToString(); ;
            Page.Title = Page.Title = "Kadence | " + strmastername;
            PageAccessControl();
        }

        void PageAccessControl()
        {
            empRole = Session["EmployeeRole"].ToString();
            if (!IsPostBack)
            {
                PGAccess = dl.UP_Fetch_ModuleAccess(strmastername, empRole);
                ViewState["PGAccess"] = PGAccess;
            }
            else
            {
                PGAccess = (PageAccess)ViewState["PGAccess"];
            }
            if (!PGAccess.AllowPage)
                Response.Redirect("NoAccess.aspx");

            if (PGAccess.AllowEdit || PGAccess.AllowAdd)
                btn_submit.Visible = true;
            else
                btn_submit.Visible = false;

            if (PGAccess.AllowAdd)
                btnadd.Visible = true;
            else
                btnadd.Visible = false;
        }


        //To reset the values in the input controls
        void reset_coltrols()
        {
            hidUID.Value = "";
            txtListval1.Text = string.Empty;
            txtListval2.Text = string.Empty;
            txtListval3.Text = string.Empty;
            txtListval4.Text = string.Empty;
            chkisActive.Checked = true;
            brdPageID.InnerText = "";
        }

        //Bind grid
        void BindGrid()
        {
            ViewState["SortExpr"] = ViewState["SortExpr"].ToString().Replace("IntDailyRate","Listval2");
            DataSet ds = dl.UP_Fetch_Masterlists(strmastername);
            string strdetails;

            strdetails = ds.Tables[0].Rows[0]["Listval2"].ToString();
            strcoldetails = strdetails.Split('|');

            if (strcoldetails[2] == "Daily Rate" && ViewState["SortExpr"].ToString().Contains("Listval2"))
            {
                ds.Tables[1].Columns.Add("IntDailyRate", typeof(int), "Listval2");
                ViewState["SortExpr"] = ViewState["SortExpr"].ToString().Replace("Listval2", "IntDailyRate");
            }

            if (ViewState["FilterExpression"].ToString().Length > 0)
            {
                try
                {
                    using (DataTable objDataTable = ds.Tables[1])
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
                DataView dv = ds.Tables[1].DefaultView;
                dv.Sort = ViewState["SortExpr"].ToString();
                GridView1.DataSource = dv;
                totalrecordsgrid = ds.Tables[1].Rows.Count;
                if (totalrecordsgrid == 0)
                {
                    hidprot.Value = "portlet-control";
                }
                btnRemoveFilter.Visible = false;
            }

            GridView1.DataBind();

            for (int i = 1; i < strcoldetails.Length; i++)
            {
                if (strcoldetails[i].Trim().Length == 0)
                    this.GridView1.Columns[i].Visible = false;
                else
                {
                    ((Label)this.GridView1.HeaderRow.Cells[i].Controls[1]).Text = strcoldetails[i].Trim().ToString();
                }
            }
        }

        //Avtivate the grid if cancel button is pressed
        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            reset_coltrols();
            hidtoaster.Value = "";
            if (GridView1.Rows.Count == 0)
                hidprot.Value = "portlet-control";
            else
                hidprot.Value = "portlet-control-grid";
        }

        //Submit the date to the database
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string UID, Listval1, Listval2, Listval3, Listval4, isActive;
            Boolean result = false;

            if (hidUID.Value == "")
                UID = "";
            else
            {
                UID = hidUID.Value;
            }
            Listval1 = txtListval1.Text.Trim();
            Listval2 = txtListval2.Text.Trim();
            Listval3 = txtListval3.Text.Trim();
            Listval4 = txtListval4.Text.Trim();
            isActive = chkisActive.Checked.ToString();
            result = dl.UP_IU_Masterlists(UID, strmastername, Listval1, Listval2, Listval3, Listval4, isActive, strloginuser);

            if (result == true)
            {
                if (hidUID.Value == "")
                    hidtoaster.Value = "success|Added successfully";
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

        //Populate the details in input conrolts for edit
        protected void btn_select_Click(object sender, EventArgs e)
        {
            if (PGAccess.AllowEdit)
                btn_submit.Visible = true;
            else
                btn_submit.Visible = false;

            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            hidUID.Value = ((Label)row.Cells[0].Controls[1]).Text;
            hidprot.Value = "portlet-control";

            txtListval1.Text = ((Label)row.Cells[1].Controls[1]).Text;
            txtListval2.Text = ((Label)row.Cells[2].Controls[1]).Text;
            txtListval3.Text = ((Label)row.Cells[3].Controls[1]).Text;
            txtListval4.Text = ((Label)row.Cells[4].Controls[1]).Text;
            chkisActive.Checked = ((CheckBox )row.Cells[5].Controls[1]).Checked;

            brdPageID.InnerText = txtListval1.Text;

            hidtoaster.Value = "";
        }

        //for paging
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            for (int i = 1; i < strcoldetails.Length; i++)
            {
                if (strcoldetails[i].Trim().Length == 0)
                    this.GridView1.Columns[i].Visible = false;
                else
                {
                    ((Label)this.GridView1.HeaderRow.Cells[i].Controls[1]).Text = strcoldetails[i].Trim().ToString();
                }
            }
        }

        //for soring
        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            ViewState["SortExpr"] = ViewState["SortExpr"].ToString().Replace("IntDailyRate", "Listval2");

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


        //not used
        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            switch (e.CommandName.ToLower())
            {
                case "sort":

                    break;
            }
        }

        //display the  sort icon and page navigation controls
        protected void gv_RowCommand(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                if (ViewState["SortExpr"].ToString().Length > 0)
                {
                    string[] strsrtexp = ViewState["SortExpr"].ToString().Split(' ');
                    strsrtexp[0] = strsrtexp[0].Replace("IntDailyRate", "Listval2");
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

                    Label pageLabel = (Label)pagerRow.Cells[0].FindControl("pagelabelinfo");

                    /*
                     * <asp:DropDownList ID="PageDropDownList" AutoPostBack="true" OnSelectedIndexChanged="PageDropDownList_SelectedIndexChanged"
                                runat="server" />
                     DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");
                    if (pageList != null)
                    {
                        for (int i = 0; i < GridView1.PageCount; i++)
                        {
                            int pageNumber = i + 1;
                            ListItem item = new ListItem(pageNumber.ToString());

                            if (i == GridView1.PageIndex)
                            {
                                item.Selected = true;
                            }
                            pageList.Items.Add(item);
                        }
                    }*/


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

        //to filter the grid
        protected void btnFilterOk_Click(object sender, EventArgs e)
        {
            if (txtFilter.Text.Trim() == "")
                ViewState["FilterExpression"] = "";
            else
                ViewState["FilterExpression"] = hidfilterex.Value.ToString() + " like '*" + txtFilter.Text + "*'";
            BindGrid();

        }

        //remove Filter
        protected void btnRemoveFilter_Click(object sender, EventArgs e)
        {
            ViewState["FilterExpression"] = "";
            hidtoaster.Value = "";
            BindGrid();
        }

        //for grid page navigation
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
            for (int i = 1; i < strcoldetails.Length; i++)
            {
                if (strcoldetails[i].Trim().Length == 0)
                    this.GridView1.Columns[i].Visible = false;
                else
                {
                    ((Label)this.GridView1.HeaderRow.Cells[i].Controls[1]).Text = strcoldetails[i].Trim().ToString();
                }
            }
        }

        /*protected void PageDropDownList_SelectedIndexChanged(Object sender, EventArgs e)
        {

            // Retrieve the pager row.
            GridViewRow pagerRow = GridView1.BottomPagerRow;

            // Retrieve the PageDropDownList DropDownList from the bottom pager row.
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");

            // Set the PageIndex property to display that page selected by the user.
            BindGrid();
            GridView1.PageIndex = pageList.SelectedIndex;
            GridView1.DataBind();

        }*/

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
