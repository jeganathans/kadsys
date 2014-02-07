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
    public partial class WebForm2 : System.Web.UI.Page
    {
        dal dl = new dal();
        string Sort_Direction = "CostItemname ASC";
        int totalrecordsgrid = 0;
        string strloginuser = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            Page.Title = "Kadence | Master Cost Items";
            strloginuser = Session["loginuser"].ToString();

            hidtoaster.Value = "";
            if (!IsPostBack)
            {
                hidUID.Value = "";
                hidprot.Value = "portlet-control-grid";
                ViewState["SortExpr"] = Sort_Direction;
                ViewState["FilterExpression"] = "";
                BindGrid();
                reset_coltrols();
            }
        }

        void reset_coltrols()
        {
            hidUID.Value = "";
            txtCostItemname.Text = string.Empty;
            txtCode.Text = string.Empty;
            chkisFormula.Checked = false;
            txtFormula.Text = string.Empty;
            txtdecimalplace.Text = string.Empty;
            chkshowaspercent.Checked = false;
            chkisEditable.Checked = false;
            chkisCountable.Checked = false;
            chkisTimecost.Checked = false;
            chkperCity.Checked = false;
            chkperMethod.Checked = false;
            chkperOption.Checked = false;
            chkisActive.Checked = true;
            brdPageID.InnerText = "";
        }

        void BindGrid()
        {
            DataSet ds = dl.UP_Fetch_MasterCostItems(string.Empty);

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
            string UID, CostItemname, Code, isFormula, Formula, decimalplace, showaspercent, isEditable, isCountable, isTimecost, perCity, perMethod, perOption, isActive;
            Boolean result;

            if (hidUID.Value == "")
                UID = "";
            else
            {
                UID = hidUID.Value;
            }
            CostItemname = txtCostItemname.Text.Trim();
            Code = txtCode.Text.Trim();
            isFormula = chkisFormula.Checked.ToString();
            Formula = txtFormula.Text.Trim();
            decimalplace = txtdecimalplace.Text.Trim();
            showaspercent = chkshowaspercent.Checked.ToString();
            isEditable = chkisEditable.Checked.ToString();
            isCountable = chkisCountable.Checked.ToString();
            isTimecost = chkisTimecost.Checked.ToString();
            perCity = chkperCity.Checked.ToString();
            perMethod = chkperMethod.Checked.ToString();
            perOption = chkperOption.Checked.ToString();
            isActive = chkisActive.Checked.ToString();
            result = dl.UP_IU_MasterCostItems(UID, CostItemname, Code, isFormula, Formula, decimalplace, showaspercent, isEditable, isCountable, isTimecost, perCity, perMethod, perOption, isActive, strloginuser);

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

        protected void btn_select_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            hidUID.Value = ((Label)row.Cells[0].Controls[1]).Text;
            hidprot.Value = "portlet-control";

            DataSet ds = dl.UP_Fetch_MasterCostItems(hidUID.Value.ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtCostItemname.Text = ds.Tables[0].Rows[0]["CostItemname"].ToString();
                txtCode.Text = ds.Tables[0].Rows[0]["Code"].ToString();
                chkisFormula.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["isFormula"].ToString());
                txtFormula.Text = ds.Tables[0].Rows[0]["Formula"].ToString();
                txtdecimalplace.Text = ds.Tables[0].Rows[0]["decimalplace"].ToString();
                chkshowaspercent.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["showaspercent"].ToString());
                chkisEditable.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["isEditable"].ToString());
                chkisCountable.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["isCountable"].ToString());
                chkisTimecost.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["isTimecost"].ToString());
                chkperCity.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["perCity"].ToString());
                chkperMethod.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["perMethod"].ToString());
                chkperOption.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["perOption"].ToString());
                chkisActive.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["isActive"].ToString());

                brdPageID.InnerText = txtCode.Text;
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
    }
}
