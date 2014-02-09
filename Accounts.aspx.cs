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
using System.Collections.Generic;
using System.Web.Script.Serialization;

namespace KedSys35
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        dal dl = new dal();
        string Sort_Direction = "AccountID ASC";
        int totalrecordsgrid = 0;
        string strloginuser = "";
        string DBfilter = "";

        PageAccess PGAccess;
        string empRole;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["loginuser"] = "anandy";

            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            PageAccessControl();

            Page.Title = "Kadence | Accounts";
            strloginuser = Session["loginuser"].ToString();

            if (Request.QueryString.AllKeys.Contains("newclient"))
            {
                DBfilter = "AccountType = 'Customers' And Approved = False";
            }

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

        void PageAccessControl()
        {
            empRole = Session["EmployeeRole"].ToString();
            if (!IsPostBack)
            {
                PGAccess = dl.UP_Fetch_ModuleAccess("Accounts", empRole);
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
            txtaccid.Text = string.Empty;
            txtaccname.Text = string.Empty;
            ddacctype.SelectedIndex = 0;
            txtaccbill.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtcountry.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtwebsite.Text = string.Empty;
            txttaxno.Text = string.Empty;
            //ddsector.SelectedIndex = 0;
            dusector.Text = "[]";
            txtphone.Text = string.Empty;
            txtfax.Text = string.Empty;
            txtannrev.Text = string.Empty;
            txtnoemp.Text = string.Empty;
            txtnotes.Text = string.Empty;
            ddcontact.SelectedIndex = 0;

            chkApproved.Checked = true;
            chkApproved.Enabled = false;

            brdPageID.InnerText = "";
        }

        //Bind grid
        void BindGrid()
        {
            DataSet ds = dl.UP_Fetch_Accounts();

            ddacctype.DataSource = ds.Tables[1];
            ddacctype.DataTextField = "acctype";
            ddacctype.DataValueField = "acctype";
            ddacctype.DataBind();
            ddacctype.Items.Insert(0, new ListItem("-- Select Account Type --", ""));
            
            ddsector.DataSource = ds.Tables[2];
            ddsector.DataTextField = "Sector";
            ddsector.DataValueField = "Sector";
            ddsector.DataBind();
            //ddsector.Items.Insert(0, new ListItem("-- Select Sector --", "0"));

            ddcontact.DataSource = ds.Tables[3];
            ddcontact.DataTextField = "ContactFName";
            ddcontact.DataValueField = "ContactID";
            ddcontact.DataBind();
            ddcontact.Items.Insert(0, new ListItem("-- Select Contact --", "0"));

            string filtercriteria = "";
            filtercriteria = DBfilter;
            if (ViewState["FilterExpression"].ToString().Length > 0)
                if (filtercriteria.Length > 0)
                    filtercriteria = filtercriteria + " and " + ViewState["FilterExpression"].ToString();
                else
                    filtercriteria = ViewState["FilterExpression"].ToString();

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
                if (totalrecordsgrid == 0)
                {
                    hidprot.Value = "portlet-control";
                }
                btnRemoveFilter.Visible = false;
            }
            
            GridView1.DataBind();
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
            string UID, AccountID, AccountName, AccountType, AddrBilling, City, Country;
            string EmailAdd, Website, TaxNo, Sector, Phone, Fax, annual_rev, NoOfEmp, Notes, PrimaryContactID;
            string Approved;
            Boolean result;

            if (hidUID.Value == "")
                UID = "";
            else
            {
                UID = hidUID.Value;
            }
            //AccountID = txtaccid.Text.Trim();
            AccountName = txtaccname.Text.Trim();
            AccountType = ddacctype.Text.Trim();
            AddrBilling = txtaccbill.Text.Trim();
            City = txtcity.Text.Trim();
            Country = txtcountry.Text.Trim();
            EmailAdd = txtemail.Text.Trim();
            Website = txtwebsite.Text.Trim();
            TaxNo = txttaxno.Text.Trim();
            //Sector = ddsector.Text.Trim();

            //Sector = "";
            //JavaScriptSerializer js = new JavaScriptSerializer();
            //clsSector[] sectors = js.Deserialize<clsSector[]>(dusector.Text);
            //if (sectors != null)
            //{
            //    for (int i = 0; i < sectors.Length; i++)
            //    {
            //        Sector += (Sector.Length>0?",":"") +  sectors[i].id;
            //    }
            //}

            Sector = string.Empty;
            if (dusector.Text.Length > 0)
            {
                Sector = dusector.Text.Replace("[", "").Replace("]", "").Replace("\"", "");
            }


            
            Phone = txtphone.Text.Trim();
            Fax = txtfax.Text.Trim();
            annual_rev = txtannrev.Text.Trim();
            NoOfEmp = txtnoemp.Text.Trim();
            Notes = txtnotes.Text.Trim();
            PrimaryContactID = ddcontact.Text.Trim();
            Approved = chkApproved.Checked.ToString();
            result = dl.UP_IU_Accounts(UID, AccountName, AccountType, AddrBilling, City, Country, EmailAdd, Website, TaxNo, Sector, Phone, Fax, annual_rev, NoOfEmp, Notes, PrimaryContactID, Approved, strloginuser);

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

        public class clsSector
        {
            public string id { get; set; }
            public string text { get; set; }
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

            DataSet ds = dl.UP_Fetch_Accounts(hidUID.Value.ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {

                txtaccid.Text = ds.Tables[0].Rows[0]["AccountID"].ToString();
                txtaccname.Text = ds.Tables[0].Rows[0]["AccountName"].ToString();
                ddacctype.SelectedIndex = ddacctype.Items.IndexOf(ddacctype.Items.FindByText(ds.Tables[0].Rows[0]["AccountType"].ToString()));
                txtaccbill.Text = ds.Tables[0].Rows[0]["AddrBilling"].ToString();
                txtcity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                txtcountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["EmailAdd"].ToString();
                txtwebsite.Text = ds.Tables[0].Rows[0]["Website"].ToString();
                txttaxno.Text = ds.Tables[0].Rows[0]["TaxNo"].ToString();

                //ddsector.SelectedIndex = ddsector.Items.IndexOf(ddsector.Items.FindByText(ds.Tables[0].Rows[0]["Sector"].ToString()));
                //string[] dSector = ds.Tables[0].Rows[0]["Sector"].ToString().Split(',');
                //dusector.Text = "[";
                //for (int j = 0; j < dSector.Length; j++)
                //{
                //    if (!string.IsNullOrEmpty(dSector[j]))
                //    {
                //        if (j > 0)
                //            dusector.Text += ",";
                //        dusector.Text += "{\"id\":\"" + dSector[j] + "\",\"text\":\"" + dSector[j] + "\"";
                //        dusector.Text += ",\"element\":[{}],\"disabled\":false,\"locked\":false}";
                //    }
                //}
                //dusector.Text += "]";

                string strduSector = ds.Tables[0].Rows[0]["Sector"].ToString();
                if (string.IsNullOrEmpty(strduSector))
                    dusector.Text = string.Empty;
                else
                    dusector.Text = "[\"" + strduSector.Replace(",", "\",\"") + "\"]";

                txtphone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                txtfax.Text = ds.Tables[0].Rows[0]["Fax"].ToString();
                txtannrev.Text = ds.Tables[0].Rows[0]["annual_rev"].ToString();
                txtnoemp.Text = ds.Tables[0].Rows[0]["NoOfEmp"].ToString();
                txtnotes.Text = ds.Tables[0].Rows[0]["Notes"].ToString();
                ddcontact.SelectedIndex = ddcontact.Items.IndexOf(ddcontact.Items.FindByText(ds.Tables[0].Rows[0]["PrimaryContactID"].ToString()));

                brdPageID.InnerText = txtaccid.Text;
            }

            if (Convert.ToBoolean(ds.Tables[0].Rows[0]["Approved"].ToString()) == true)
            {
                chkApproved.Checked = true;
                chkApproved.Enabled = false;
            }
            else
            {
                chkApproved.Checked = false;
                chkApproved.Enabled = true;
            }

            hidtoaster.Value = "";
        }

        //for paging
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindGrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        //for soring
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
                            pgsecond.Visible = true; pgthird.Visible = true; pgfourth.Visible = true; pgfifth.Visible=true;
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

                    if (currentPage==1)
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
            {
                //ViewState["FilterExpression"] = hidfilterex.Value.ToString() + " like '" + txtFilter.Text.Replace("*","[*]").Replace("%","[%]") + "'";
                
                switch (hidfilterex.Value.ToString().ToLower())
                {
                    case "accountid":
                        ViewState["FilterExpression"] = "AccountID like '*" + txtFilter.Text + "*'";
                        break;
                    case "accountname":
                        ViewState["FilterExpression"] = "AccountName like '*" + txtFilter.Text + "*'";
                        break;
                    case "accounttype":
                        ViewState["FilterExpression"] = "AccountType like '*" + txtFilter.Text + "*'";
                        break;
                    case "city":
                        ViewState["FilterExpression"] = "City like '*" + txtFilter.Text + "*'";
                        break;
                    case "country":
                        ViewState["FilterExpression"] = "Country like '*" + txtFilter.Text + "*'";
                        break;
                    case "sector":
                        ViewState["FilterExpression"] = "Sector like '*" + txtFilter.Text + "*'";
                        break;
                }
            }
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
                    newpageindex = (GridView1.PageIndex == 0) ? 0 :GridView1.PageIndex-1;
                    break;
                case ">":
                    newpageindex = (GridView1.PageIndex + 1 == GridView1.PageCount) ? GridView1.PageCount : GridView1.PageIndex+1;
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

        
    }
}

