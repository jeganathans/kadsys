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
using System.Text;


namespace KedSys35
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        dal dl = new dal();
        DataSet ds;
        DataSet dsTasks;
        DataSet dsLoadStatus;
        int cellwidth = 100;
        string txtAltOption = "", txtAltMethod = "", txtAltCity = "";
        string strProposalID;
        string strloginuser = "";
        string strloginuserID = "";
        string strMinGMValue = "";

        PageAccess PGAccess, ProjAccess;
        string empRole;


        public class codelist
        {
            public string listCode { get; set; }
            public Boolean listperCity { get; set; }
            public Boolean listperMethod { get; set; }
        }

        List<codelist> listCodelist = new List<codelist>();

        public class inputlist
        {
            public string txtid { get; set; }
            public string txtvalue { get; set; }
        }

        List<inputlist> gridinputlist = new List<inputlist>();

        protected void Page_Init(object sender, EventArgs e)
        {
            //Session["loginuser"] = "anandy";
            //Session["ProposalID"] = "Q131207001";

            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            strloginuser = Session["loginuser"].ToString();
            strloginuserID = Session["EmployeeID"].ToString();

            if (Request.QueryString.AllKeys.Contains("new"))
            {
                Session["ProposalID"] = "New";
            }

            if (Session["ProposalID"] == "New")
            {
                strProposalID = string.Empty;
                brdPageID.InnerText = "N/A";
            }
            else
            {
                strProposalID = Session["ProposalID"].ToString();
                brdPageID.InnerText = strProposalID;
            }

            if (!IsPostBack)
            {


                ds = dl.UP_Fetch_Proposal_Costs(strProposalID);
                Session["BaseData"] = ds;

                BindCombo();
                populatepropsalDetails();

                /*ds.Relations.Add("taskrelation",
                ds.Tables[6].Columns["TaskName"],
                ds.Tables[7].Columns["TaskName"]);


                lvTasks.DataSource = ds.Tables[6];
                lvTasks.DataBind();*/
            }
            else
            {
                ds = (DataSet)Session["BaseData"];

                string[] addargs = Request.Form[hidoption.UniqueID].ToString().Split('|');
                if (addargs[0].ToString() == "add")
                {
                    txtAltOption = addargs[1].ToString().Replace("Option ", "");
                    txtAltMethod = addargs[2];
                    if (addargs.Length == 3)
                    {
                        txtAltCity = string.Empty;
                    }
                    else if (addargs.Length == 4)
                    {
                        txtAltCity = addargs[3];
                    }


                    if (txtAltOption.Trim().Length > 0 && txtAltMethod.Trim().Length > 0)
                    {
                        DataRow dr = ds.Tables[1].NewRow();
                        dr["OptionID"] = txtAltOption;
                        dr["Method"] = txtAltMethod;
                        dr["City"] = (txtAltCity == string.Empty) ? (object)DBNull.Value : txtAltCity;
                        ds.Tables[1].Rows.Add(dr);
                        Session["BaseData"] = ds;
                    }
                }
            }
            BindGrid();
        }


        void PageAccessControl()
        {
            empRole = Session["EmployeeRole"].ToString();
            if (!IsPostBack)
            {
                PGAccess = dl.UP_Fetch_ModuleAccess("Proposal", empRole);
                ViewState["PGAccess"] = PGAccess;
                if (Session["ProposalID"].ToString() == "New")
                    ViewState["NewProposal"] = "Yes";
                else
                    ViewState["NewProposal"] = "No";

                ProjAccess = dl.UP_Fetch_ModuleAccess("Projects", empRole);
                ViewState["ProjAccess"] = ProjAccess;
            }
            else
            {
                PGAccess = (PageAccess)ViewState["PGAccess"];
                ProjAccess = (PageAccess)ViewState["ProjAccess"];
            }
            if (!PGAccess.AllowPage)
                Response.Redirect("NoAccess.aspx");

            

            if (PGAccess.AllowEdit || (PGAccess.AllowAdd && ViewState["NewProposal"].ToString()=="Yes"))
            {
                btnsave.Visible = true;
                btnsavecontinue.Visible = true;
                btnfinalsumbit.Visible = true;
                btn_addclient.Visible = true;

                if (!IsPostBack && ds.Tables[2].Rows.Count > 0)
                {
                    if (ds.Tables[2].Rows[0]["Status"].ToString() == "Won")
                    {
                        btnsave.Visible = false;
                        btnsavecontinue.Visible = false;
                        btnfinalsumbit.Visible = false;
                        btn_addclient.Visible = false;
                    }
                }
            }
            else
            {
                btnsave.Visible = false;
                btnsavecontinue.Visible = false;
                btnfinalsumbit.Visible = false;
                btn_addclient.Visible = false;
            }

            if (!ProjAccess.AllowAdd)
            {
                if (btnCreateProject.Visible)
                    btnCreateProject.Visible = false;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.GetPostBackEventReference(this, string.Empty);
            hidtoaster.Value = "";
            PageAccessControl();
            if (!IsPostBack)
            {
                //hidtab.Value = "#tab3";
                hidactiveoption.Value = "1";
                ViewState["TimeCostOption"] = "";


                //for Tasks

                dsTasks = dl.UP_Fetch_Proposal_Tasks(strProposalID);
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
            }
            else
                dsTasks = (DataSet)ViewState["dsTasks"];


            

            if (!String.IsNullOrEmpty(hidTimecost.Value))
            {
                hidtab.Value = "#tab2";
                BindTimecostGrid();
            }
            if (!String.IsNullOrEmpty(hidoption.Value))
                deletemethodcity();

            //To Hide Empty Options except one
            DataView dvOption = ds.Tables[1].DefaultView;
            Boolean emptyoptionadded = false;
            for (int i = 1; i <= 10; i++)
            {
                dvOption.RowFilter = "OptionID = '" + i.ToString() + "'";
                if (dvOption.Count == 0)
                {
                    if (!emptyoptionadded)
                        emptyoptionadded = true;
                    else
                    {
                        GridView1.Columns[i + 1].Visible = false;
                        continue;
                    }
                }
                GridView1.Columns[i + 1].Visible = true;
                dvOption.RowFilter = "";
            }

        }

        void BindCombo()
        {
            DataSet ds = dl.UP_Fetch_Proposal_DD();
            

            lvMethod.DataSource = ds.Tables[0];
            lvMethod.DataBind();

            lvCity.DataSource = ds.Tables[1];
            lvCity.DataBind();

            DataView dv = ds.Tables[2].DefaultView;
            dv.RowFilter = "AccountType = 'Customers'";
            ddClientName.DataSource = dv;
            ddClientName.DataTextField = "AccountName";
            ddClientName.DataValueField = "AccountName";
            ddClientName.DataBind();
            ddClientName.Items.Insert(0, new ListItem("--Select--", ""));

            dv = ds.Tables[2].DefaultView;
            dv.RowFilter = "AccountType = 'Agencies'";
            ddAgency.DataSource = dv;
            ddAgency.DataTextField = "AccountName";
            ddAgency.DataValueField = "AccountName";
            ddAgency.DataBind();
            //ddAgency.Items.Insert(0, new ListItem("--Select--", ""));

            dv = ds.Tables[3].DefaultView;
            //dv.RowFilter = "Manager = True";
            ddManager.DataSource = dv;
            ddManager.DataTextField = "EmployeeFName";
            ddManager.DataValueField = "EmployeeID";
            ddManager.DataBind();
            ddManager.Items.Insert(0, new ListItem("--Select--", ""));

            dv = ds.Tables[3].DefaultView;
            //dv.RowFilter = "Leader = True";
            ddLeader.DataSource = dv;
            ddLeader.DataTextField = "EmployeeFName";
            ddLeader.DataValueField = "EmployeeID";
            ddLeader.DataBind();
            ddLeader.Items.Insert(0, new ListItem("--Select--", ""));

            dv = ds.Tables[3].DefaultView;
            //dv.RowFilter = "Coordinator = True";
            ddCoordinator.DataSource = dv;
            ddCoordinator.DataTextField = "EmployeeFName";
            ddCoordinator.DataValueField = "EmployeeID";
            ddCoordinator.DataBind();
            ddCoordinator.Items.Insert(0, new ListItem("--Select--", "0"));

            ddBroadCategory.DataSource = ds.Tables[4];
            ddBroadCategory.DataTextField = "BroadCategory";
            ddBroadCategory.DataValueField = "BroadCategory";
            ddBroadCategory.DataBind();
            ddBroadCategory.Items.Insert(0, new ListItem("--Select--", ""));

            ddDepartment.DataSource = ds.Tables[5];
            ddDepartment.DataTextField = "Department";
            ddDepartment.DataValueField = "Department";
            ddDepartment.DataBind();
            ddDepartment.Items.Insert(0, new ListItem("--Select--", ""));

            //ddMarket.DataSource = ds.Tables[6];
            //ddMarket.DataTextField = "Market";
            //ddMarket.DataValueField = "Market";
            //ddMarket.DataBind();
            //ddMarket.Items.Insert(0, new ListItem("--Select--", ""));

            ddCurrencyType.DataSource = ds.Tables[7];
            ddCurrencyType.DataTextField = "CurrencyType";
            ddCurrencyType.DataValueField = "CurrencyType";
            ddCurrencyType.DataBind();
            ddCurrencyType.Items.Insert(0, new ListItem("--Select--", "0"));

            ddTypeofstudy.DataSource = ds.Tables[8];
            ddTypeofstudy.DataTextField = "TypeofStudy";
            ddTypeofstudy.DataValueField = "TypeofStudy";
            ddTypeofstudy.DataBind();
            ddTypeofstudy.Items.Insert(0, new ListItem("--Select--", ""));

            ddProjectType.DataSource = ds.Tables[9];
            ddProjectType.DataTextField = "ProjectType";
            ddProjectType.DataValueField = "ProjectType";
            ddProjectType.DataBind();
            ddProjectType.Items.Insert(0, new ListItem("--Select--", ""));

            ddProbability.DataSource = ds.Tables[10];
            ddProbability.DataTextField = "Probability";
            ddProbability.DataValueField = "Probability";
            ddProbability.DataBind();
            ddProbability.Items.Insert(0, new ListItem("--Select--", ""));

            ddStatus.DataSource = ds.Tables[11];
            ddStatus.DataTextField = "Status";
            ddStatus.DataValueField = "Status";
            ddStatus.DataBind();
            ddStatus.Items.Insert(0, new ListItem("--Select--", ""));
            ddStatus.SelectedIndex = ddStatus.Items.IndexOf(ddStatus.Items.FindByText("Follow up"));

            hidBaseCurrency.Value = ds.Tables[12].Rows[0]["BaseCurrency"].ToString();
           
        }

        void BindGrid()
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            //if (!String.IsNullOrEmpty(Request.Form[hidTimecost.UniqueID]))
            //{
            //    grdTimecost.DataSource = ds.Tables[4];
            //    grdTimecost.DataBind();
            //}
        }

        void BindTimecostGrid()
        {
            grdTimecost.DataSource = ds.Tables[4];
            grdTimecost.DataBind();
        }

        protected void gv_RowCommand(object sender, GridViewRowEventArgs e)
        {
#region CostingHeader
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    if (cell.HasControls())
                    {
                        foreach (Control ctrl in cell.Controls)
                        {
                            if (ctrl.ToString() == "System.Web.UI.WebControls.Table")
                            {

                                DataView dvOption;
                                DataTable dtMethod, dtCity;
                                DataView dvCity;
                                string strOption, strMethod, strCity;
                                int noMethods, noCity, totalCity = 0, totalMethod = 0, optioncolspan = 0;

                                Table tblHeader = (Table)ctrl;
                                strOption = tblHeader.ID.ToString().Replace("tbpoption", "");

                                dvOption = ds.Tables[1].DefaultView;
                                dvOption.RowFilter = "OptionID = '" + strOption + "'";

                                dtMethod = dvOption.ToTable(true, "Method");
                                dvCity = dvOption.ToTable(true, "Method", "City").DefaultView;
                                noMethods = dtMethod.Rows.Count;

                                TableRow tRowOption = new TableRow();
                                tblHeader.Rows.Add(tRowOption);
                                TableCell tCellOption = new TableCell();
                                tCellOption.Text = "Option " + strOption + "<i class=\"icon-folder-close pull-right\"></i>";

                                TableRow tRowMethod = new TableRow();
                                TableRow tRowCity = new TableRow();

                                foreach (DataRow drMethod in dtMethod.Rows)
                                {
                                    strMethod = drMethod["Method"].ToString();
                                    totalMethod++;
                                    dvCity.RowFilter = "Method = '" + strMethod + "' and City is not null";
                                    noCity = dvCity.Count;

                                    foreach (DataRowView drcity in dvCity)
                                    {
                                        strCity = drcity["City"].ToString();
                                        totalCity++;
                                        TableCell tCellCity = new TableCell();
                                        tCellCity.Text = strCity;
                                        tCellCity.Attributes.Add("data-method", strMethod);
                                        tCellCity.CssClass = "csheadcity noPad cssho" + strOption + " csmethod" + strMethod;
                                        tCellCity.Style.Add("display", "none");
                                        tCellCity.Width = Unit.Pixel(cellwidth);
                                        tRowCity.Cells.Add(tCellCity);
                                    }

                                    if (noCity > 1)
                                    {
                                        TableCell tCellMethodTotal = new TableCell();
                                        tCellMethodTotal.Text = "Total";
                                        tCellMethodTotal.CssClass = "csmethod noPad cssho" + strOption;
                                        tCellMethodTotal.Style.Add("display", "none");
                                        tCellMethodTotal.Width = Unit.Pixel(cellwidth);
                                        tRowCity.Cells.Add(tCellMethodTotal);
                                    }

                                    TableCell tCellMethod = new TableCell();
                                    tCellMethod.Text = strMethod;
                                    tCellMethod.ColumnSpan = (noCity > 1) ? (noCity + 1) : 1;
                                    tCellMethod.RowSpan = (noCity == 0) ? 2 : 1;
                                    tCellMethod.CssClass = "csheadmethod noPad cssho" + strOption;
                                    tCellMethod.Style.Add("display", "none");
                                    tCellMethod.Width = Unit.Pixel(cellwidth);
                                    tRowMethod.Cells.Add(tCellMethod);

                                    optioncolspan = optioncolspan + noCity + ((noCity == 1) ? 0 : 1);

                                }

                                if (dvOption.Count > 0)
                                {
                                    TableCell tCellTotal = new TableCell();
                                    tCellTotal.Text = "Total";
                                    tCellTotal.RowSpan = 2;
                                    tCellTotal.CssClass = "csheadtotal noPad cssho" + strOption;
                                    tCellTotal.Style.Add("display", "none");
                                    tCellTotal.Width = Unit.Pixel(cellwidth);
                                    tRowMethod.Cells.Add(tCellTotal);
                                }

                                tRowMethod.HorizontalAlign = HorizontalAlign.Center;
                                tRowCity.HorizontalAlign = HorizontalAlign.Center;
                                tblHeader.Rows[0].HorizontalAlign = HorizontalAlign.Center;

                                tblHeader.Rows.Add(tRowMethod);
                                tblHeader.Rows.Add(tRowCity);

                                tCellOption.ID = "idoption" + strOption;
                                tCellOption.ColumnSpan = optioncolspan + 1;
                                //tblHeader.Rows[0].Cells[0].Attributes.Add("colSpan", (totalCity + totalMethod  + 1).ToString());
                                //tblHeader.Rows[0].Cells[0].Width = Unit.Pixel(cellwidth);
                                //tblHeader.Rows[0].Cells[0].Text = "Option " + strOption;
                                //tblHeader.Width = Unit.Pixel(cellwidth * (totalCity+1));
                                //cell.Width = Unit.Pixel(cellwidth * (totalCity+1));
                                //cell.Width = Unit.Percentage(100);
                                //tblHeader.Width = Unit.Percentage(100);
                                //tCellOption.Width = Unit.Pixel((optioncolspan + 1) * cellwidth);
                                tCellOption.CssClass = "csheadoption noPad curpointer";
                                tCellOption.Attributes.Add("data-option", strOption);
                                tCellOption.Attributes.Add("data-odroppable", "1");
                                tRowOption.Cells.Add(tCellOption);
                                tblHeader.CssClass = "csoption propheader table-bordered tbchild";
                                tblHeader.CellPadding = 0;

                            }
                        }
                    }
                }
            }
            #endregion
#region CostingItems
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    if (cell.HasControls())
                    {
                        foreach (Control ctrl in cell.Controls)
                        {
                            if (ctrl.ToString() == "System.Web.UI.WebControls.Table")
                            {

                                DataView dvCostitem, dvOption;
                                DataTable dtMethod, dtCity;
                                DataView dvCity;
                                string strOption, strMethod, strCity;
                                int noMethods, noCity, totalCity = 0, totalMethod = 0, noofMethodTotals = 0;
                                int timecostspancnt = 0, totalcolcount = 0;
                                
                                
                                string strCode = ((System.Web.UI.WebControls.Label)(((System.Web.UI.Control)(e.Row.Cells[0])).Controls[1])).Text;
                                Boolean isFormula, showaspercent, isEditable, isCountable, isTimecost, perCity, perMethod, perOption;
                                string strFormula="", strTotalFormula = "", strMethodTotalFormula = "";
                                int decimalplace;

                                dvCostitem = ds.Tables[0].DefaultView;
                                dvCostitem.RowFilter = "Code = '" + strCode + "'";
                                isFormula = Convert.ToBoolean(dvCostitem[0]["isFormula"].ToString());
                                strFormula = dvCostitem[0]["Formula"].ToString();
                                if (string.IsNullOrEmpty(dvCostitem[0]["decimalplace"].ToString()))
                                    decimalplace = 0;
                                else
                                    decimalplace = Convert.ToInt16(dvCostitem[0]["decimalplace"].ToString());
                                showaspercent = Convert.ToBoolean(dvCostitem[0]["showaspercent"].ToString());
                                isEditable = Convert.ToBoolean(dvCostitem[0]["isEditable"].ToString());
                                isCountable = Convert.ToBoolean(dvCostitem[0]["isCountable"].ToString());
                                isTimecost = Convert.ToBoolean(dvCostitem[0]["isTimecost"].ToString());
                                perCity = Convert.ToBoolean(dvCostitem[0]["perCity"].ToString());
                                perMethod = Convert.ToBoolean(dvCostitem[0]["perMethod"].ToString());
                                perOption = Convert.ToBoolean(dvCostitem[0]["perOption"].ToString());

                                if (listCodelist.Find(x => x.listCode== strCode) == null)
                                    listCodelist.Add(new codelist { listCode = strCode, listperCity = perCity, listperMethod = perMethod });

                                dvCostitem.RowFilter = "";

                                Table tblDetail = (Table)ctrl;
                                strOption = tblDetail.ID.ToString().Replace("tbdoption", "");

                                dvOption = ds.Tables[1].DefaultView;
                                dvOption.RowFilter = "OptionID = '" + strOption + "'";

                                if (dvOption.Count == 0)
                                    continue;

                                dtMethod = dvOption.ToTable(true, "Method");
                                dvCity = dvOption.ToTable(true, "Method", "City").DefaultView;
                                noMethods = dtMethod.Rows.Count;

                                //TableRow tRowMethod = new TableRow();
                                //TableRow tRowCity = new TableRow();
                                TableRow tRowDetail = tblDetail.Rows[0];

                                foreach (DataRow drMethod in dtMethod.Rows)
                                {
                                    strMethod = drMethod["Method"].ToString();
                                    dvCity.RowFilter = "Method = '" + strMethod + "' and City is not null";
                                    noCity = dvCity.Count;

                                    totalcolcount += noCity == 1 ? 1 : noCity + 1;
                                    if (isTimecost || (!perCity && !perMethod))
                                    {
                                        timecostspancnt += noCity == 1 ? 1 : noCity + 1;
                                        continue;
                                    }

                                    strMethodTotalFormula = "";
                                    Boolean totalformulaadded = false;

                                    foreach (DataRowView drcity in dvCity)
                                    {
                                        strCity = drcity["City"].ToString();
                                        totalCity++;
                                        TableCell tCellCity = new TableCell();

                                        string strtxtCellCityID = strOption + "_" + strCode + "_" + strMethod + "_" + strCity;
                                        //if (!isTimecost)
                                        {
                                            TextBox txtCellCity = new TextBox();

                                            txtCellCity.ID = strtxtCellCityID;
                                            if (!IsPostBack)
                                                txtCellCity.Text = costitemvalue(strCode, strOption, strMethod, strCity);
                                            else
                                                txtCellCity.Text = "0";
                                            txtCellCity.Width = Unit.Pixel(cellwidth);
                                            txtCellCity.BorderStyle = BorderStyle.None;
                                            if (decimalplace == 0)
                                                txtCellCity.CssClass = "cbox";
                                            else
                                                txtCellCity.CssClass = "cboxdec";

                                            if (showaspercent == true)
                                            {
                                                txtCellCity.CssClass = txtCellCity.CssClass + " zshowper";
                                                txtCellCity.Text = txtCellCity.Text + "%";
                                            }

                                            if (strCode == "GM")
                                            {
                                                txtCellCity.CssClass = txtCellCity.CssClass + " zGMccode";
                                            }

                                            txtCellCity.Style.Add(HtmlTextWriterStyle.TextAlign, "right");
                                            txtCellCity.Style.Add(HtmlTextWriterStyle.BackgroundColor, "transparent");
                                            if (perCity)
                                            {
                                                tCellCity.Controls.Add(txtCellCity);
                                            }

                                            if (!isEditable)
                                                txtCellCity.Enabled = false;
                                            else
                                                txtCellCity.Attributes.Add("data-numeric", "yes");

                                            
                                            if (strFormula.Trim().Length == 0)
                                            {
                                                string actContolId = strtxtCellCityID;
                                                if (!perCity)
                                                    actContolId = actContolId.Replace("_" + strCity, "");
                                                strMethodTotalFormula = strMethodTotalFormula + ((strMethodTotalFormula.Length == 0) ? "" : " + ")
                                                    + ("parseFloat($('[name$=\"" + actContolId + "\"]').val().replace(/,/g, ''))");
                                                if (actContolId != strtxtCellCityID)
                                                    break;
                                            }
                                            else
                                            {
                                                string newformula = strFormula, finalformula=strFormula;
                                                string txtid = "", actContolId = "";
                                                Boolean formulacitylevel = false;
                                                foreach (codelist Codedetail in listCodelist)
                                                {
                                                    actContolId = strtxtCellCityID;
                                                    if (!Codedetail.listperCity)
                                                        actContolId = actContolId.Replace("_" + strCity, "");
                                                    else if( Codedetail.listperCity && strFormula.Trim().IndexOf('/') >0 && noCity>1)
                                                        actContolId = actContolId.Replace("_" + strCity, "_MethodTotal");

                                                    txtid = ("parseFloat($('[name$=\"" + actContolId.Replace("_" + strCode + "_", "_" + Codedetail.listCode + "_") + "\"]').val().replace(/,/g, ''))");
                                                    newformula = newformula.Replace(Codedetail.listCode, txtid);
                                                    if (finalformula != newformula && Codedetail.listperCity && strFormula.Trim().IndexOf('/') <= 0)
                                                        formulacitylevel = true;
                                                    finalformula = newformula;
                                                }


                                                strMethodTotalFormula = strMethodTotalFormula + ((strMethodTotalFormula.Length == 0) ? "" : " + ")
                                                    + "(" + finalformula + ")";

                                                if (!formulacitylevel && !perCity)
                                                    break;

                                                /*//To add method total in city column if only one city present
                                                if (!perCity && perMethod && !isEditable && !string.IsNullOrEmpty(strMethodTotalFormula) && dvCity.Count == 1)
                                                {
                                                    txtCellCity.Attributes.Add("data-formula", strMethodTotalFormula.ToString());
                                                    tCellCity.Controls.Add(txtCellCity);
                                                    if (!strcontrollist.Any(s => txtCellCity.ID.Contains(s)))
                                                        strcontrollist.Add(txtCellCity.ID);
                                                }*/
                                            }

                                            /*//To add editable method in city column if only one city present
                                            if (!perCity && perMethod && isEditable && dvCity.Count == 1)
                                            {
                                                tCellCity.Controls.Add(txtCellCity);
                                                if (!strcontrollist.Any(s => txtCellCity.ID.Contains(s)))
                                                    strcontrollist.Add(txtCellCity.ID);
                                            }*/
                                        }

                                        tCellCity.CssClass = "cscity noPad cssho" + strOption;
                                        tCellCity.Style.Add("display", "none");
                                        tCellCity.Width = Unit.Pixel(cellwidth);
                                        if (perCity)
                                        {
                                            tRowDetail.Cells.Add(tCellCity);
                                        }
                                    }

                                    if (noCity > 1 && perCity)
                                    {
                                        noofMethodTotals++;
                                        TableCell tCellMethodTotal = new TableCell();
                                        if (!isTimecost)
                                        {
                                            TextBox txtCellMethodTotal = new TextBox();
                                            txtCellMethodTotal.ID = strOption + "_" + strCode + "_" + strMethod + "_MethodTotal";
                                            if (!IsPostBack)
                                                txtCellMethodTotal.Text = costitemvalue(strCode, strOption, strMethod, string.Empty);
                                            else
                                                txtCellMethodTotal.Text = "0";
                                            txtCellMethodTotal.Width = Unit.Pixel(cellwidth);
                                            txtCellMethodTotal.BorderStyle = BorderStyle.None;
                                            if (decimalplace == 0)
                                                txtCellMethodTotal.CssClass = "cbox";
                                            else
                                                txtCellMethodTotal.CssClass = "cboxdec";

                                            if (showaspercent == true)
                                            {
                                                txtCellMethodTotal.CssClass = txtCellMethodTotal.CssClass + " zshowper";
                                                txtCellMethodTotal.Text = txtCellMethodTotal.Text + "%";
                                            }

                                            if (strCode == "GM")
                                            {
                                                txtCellMethodTotal.CssClass = txtCellMethodTotal.CssClass + " zGMccode";
                                            }

                                            txtCellMethodTotal.Style.Add(HtmlTextWriterStyle.TextAlign, "right");
                                            txtCellMethodTotal.Enabled = false;

                                            //Editable field in total column 
                                            if (!perCity && perMethod && isEditable)
                                            {
                                                txtCellMethodTotal.Enabled = true;
                                                txtCellMethodTotal.Attributes.Add("data-numeric", "yes");
                                            }
                                            else
                                                txtCellMethodTotal.Attributes.Add("data-formula", strMethodTotalFormula.ToString());

                                            tCellMethodTotal.Controls.Add(txtCellMethodTotal);
                                            /*if (strFormula.Trim().Length == 0)
                                            {
                                                strTotalFormula = strTotalFormula + ((strTotalFormula.Length == 0) ? "" : " + ") + ("parseFloat($('[id$=" + txtCellMethodTotal.ID + "]').val().replace(/,/g, ''))");
                                            }
                                            else
                                            {
                                                string newformula = strFormula;
                                                string txtid = "";
                                                foreach (string strfrmcode in strcodeslist)
                                                {
                                                    txtid = ("parseFloat($('[id$=" + txtCellMethodTotal.ID.Replace("_" + strCode + "_", "_" + strfrmcode + "_") + "]').val().replace(/,/g, ''))");
                                                    newformula = newformula.Replace(strfrmcode, txtid);
                                                }
                                                strTotalFormula = strTotalFormula + ((strTotalFormula.Length == 0) ? "" : " + ")
                                                    + "(" + newformula + ")";
                                            }*/
                                        }
                                        tCellMethodTotal.CssClass = "csmethod noPad cssho" + strOption;
                                        tCellMethodTotal.Style.Add("display", "none");
                                        tCellMethodTotal.Width = Unit.Pixel(cellwidth);

                                        tRowDetail.Cells.Add(tCellMethodTotal);

                                    }

                                    if (noCity >= 1)
                                    {
                                        strTotalFormula = strTotalFormula + ((strTotalFormula.Length == 0) ? "" : " + ") + strMethodTotalFormula;
                                        totalformulaadded = true;
                                    }

                                    if ((noCity == 0 && perCity) || (!perCity && perMethod))
                                    {
                                        TableCell tCellMethod = new TableCell();
                                        if (!isTimecost)
                                        {
                                            TextBox txtCellMethod = new TextBox();
                                            txtCellMethod.ID = strOption + "_" + strCode + "_" + strMethod;
                                            if (!IsPostBack)
                                                txtCellMethod.Text = costitemvalue(strCode, strOption, strMethod, string.Empty);
                                            else
                                                txtCellMethod.Text = "0";
                                            txtCellMethod.Width = Unit.Pixel(cellwidth + ((noCity == 1 ? 0 : noCity) * cellwidth) + (noCity == 1 ? 0 : noCity));
                                            txtCellMethod.BorderStyle = BorderStyle.None;
                                            if (decimalplace == 0)
                                                txtCellMethod.CssClass = "cbox";
                                            else
                                                txtCellMethod.CssClass = "cboxdec";

                                            if (showaspercent == true)
                                            {
                                                txtCellMethod.CssClass = txtCellMethod.CssClass + " zshowper";
                                                txtCellMethod.Text = txtCellMethod.Text + "%";
                                            }

                                            if (strCode == "GM")
                                            {
                                                txtCellMethod.CssClass = txtCellMethod.CssClass + " zGMccode";
                                            }

                                            txtCellMethod.Style.Add(HtmlTextWriterStyle.TextAlign, "right");
                                            if (!isEditable)
                                            {
                                                txtCellMethod.Enabled = false;
                                                if (perMethod && strFormula.Trim().Length > 0 )
                                                {
                                                    if (strMethodTotalFormula == "")
                                                    {
                                                        string newformula = strFormula;
                                                        string txtid = "";
                                                        foreach (codelist Codedetail in listCodelist)
                                                        {
                                                            txtid = ("parseFloat($('[name$=\"" + txtCellMethod.ID.Replace("_" + strCode + "_", "_" + Codedetail.listCode  + "_") + "\"]').val().replace(/,/g, ''))");
                                                            newformula = newformula.Replace(Codedetail.listCode, txtid);
                                                        }
                                                        strMethodTotalFormula = strMethodTotalFormula + ((strMethodTotalFormula.Length == 0) ? "" : " + ")
                                                            + "(" + newformula + ")";
                                                    }
                                                    txtCellMethod.Attributes.Add("data-formula", strMethodTotalFormula.ToString());
                                                }
                                            }
                                            else
                                                txtCellMethod.Attributes.Add("data-numeric", "yes");

                                            tCellMethod.Controls.Add(txtCellMethod);

                                            if ((noCity == 0 || !perCity) && !totalformulaadded)
                                            {
                                                if (strFormula.Trim().Length == 0)
                                                {
                                                    strTotalFormula = strTotalFormula + ((strTotalFormula.Length == 0) ? "" : " + ") + ("parseFloat($('[name$=\"" + txtCellMethod.ID + "\"]').val().replace(/,/g, ''))");
                                                }
                                                else
                                                {
                                                    string newformula = strFormula;
                                                    string txtid = "";
                                                    foreach (codelist Codedetail in listCodelist)
                                                    {
                                                        txtid = ("parseFloat($('[name$=\"" + txtCellMethod.ID.Replace("_" + strCode + "_", "_" + Codedetail.listCode + "_") + "\"]').val().replace(/,/g, ''))");
                                                        newformula = newformula.Replace(Codedetail.listCode, txtid);
                                                    }
                                                    strTotalFormula = strTotalFormula + ((strTotalFormula.Length == 0) ? "" : " + ")
                                                        + "(" + newformula + ")";
                                                }
                                            }
                                        }
                                        tCellMethod.CssClass = "csmethod noPad cssho" + strOption;
                                        tCellMethod.Style.Add("display", "none");

                                        tCellMethod.Width = Unit.Pixel(cellwidth + ((noCity == 1 ? 0 : noCity) * cellwidth) + (noCity == 1 ? 0 : noCity));
                                        tCellMethod.ColumnSpan = 1 + (noCity == 1?0:noCity);

                                        tRowDetail.Cells.Add(tCellMethod);
                                    }
                                    
                                }

                                
                                TableCell tCellTotal = new TableCell();
                                TextBox txtCellTotal = new TextBox();
                                txtCellTotal.ID = strOption + "_" + strCode;
                                if (!IsPostBack)
                                    txtCellTotal.Text = costitemvalue(strCode, strOption, string.Empty, string.Empty);
                                else
                                    txtCellTotal.Text = "0";
                                txtCellTotal.Width = Unit.Pixel(cellwidth);
                                txtCellTotal.BorderStyle = BorderStyle.None;
                                //txtCellTotal.BorderColor = System.Drawing.Color.Transparent;
                                if (decimalplace == 0)
                                    txtCellTotal.CssClass = "cbox";
                                else
                                    txtCellTotal.CssClass = "cboxdec";

                                if (showaspercent == true)
                                {
                                    txtCellTotal.CssClass = txtCellTotal.CssClass + " zshowper";
                                    txtCellTotal.Text = txtCellTotal.Text + "%";
                                }

                                if (strCode == "GM")
                                {
                                    txtCellTotal.CssClass = txtCellTotal.CssClass + " zGMccode";
                                }

                                txtCellTotal.Style.Add(HtmlTextWriterStyle.TextAlign, "right");
                                

                                if (isTimecost && timecostspancnt>0)
                                {
                                    TableCell tCellTotalbtn = new TableCell();
                                    LinkButton lbtnTimeCost = new LinkButton();
                                    lbtnTimeCost.ID = "lbtnTimeCost_" + strOption + "_" + strCode;
                                    lbtnTimeCost.Text = "Detail";
                                    lbtnTimeCost.CssClass = "boxleft badge badge-success";
                                    
                                    lbtnTimeCost.OnClientClick = "$('[id$=hidTimecost]').val(" + strOption + ");";
                                    //lbtnTimeCost.Click += new EventHandler(this.lbtnTimeCost_Click);
                                    //lbtnTimeCost.CssClass = "boxleft";
                                    tCellTotalbtn.Width = Unit.Pixel(timecostspancnt * cellwidth + (timecostspancnt-1));
                                    tCellTotalbtn.ColumnSpan = timecostspancnt;
                                    tCellTotalbtn.CssClass = "noPad cssho" + strOption;
                                    tCellTotalbtn.Style.Add("display", "none");
                                    tCellTotalbtn.Controls.Add(lbtnTimeCost);
                                    tRowDetail.Cells.Add(tCellTotalbtn);
                                }
                                else if (!perCity && !perMethod && timecostspancnt > 0)
                                {
                                    TableCell tCellTotaldummy = new TableCell();
                                    tCellTotaldummy.Width = Unit.Pixel(timecostspancnt * cellwidth + (timecostspancnt-1));
                                    tCellTotaldummy.ColumnSpan = timecostspancnt;
                                    tCellTotaldummy.CssClass = "noPad cssho" + strOption;
                                    tCellTotaldummy.Style.Add("display", "none");
                                    tRowDetail.Cells.Add(tCellTotaldummy);

                                    string newformula = strFormula;
                                    string txtid = "", actContolId = "";
                                    foreach (codelist Codedetail in listCodelist)
                                    {
                                        actContolId = txtCellTotal.ID;
                                        txtid = ("parseFloat($('[name$=\"" + actContolId.Replace("_" + strCode, "_" + Codedetail.listCode) + "\"]').val().replace(/,/g, ''))");
                                        newformula = newformula.Replace(Codedetail.listCode, txtid);
                                    }
                                    txtCellTotal.Attributes.Add("data-formula", newformula.ToString());
                                }
                                else
                                    txtCellTotal.Attributes.Add("data-formula", strTotalFormula.ToString());

                                txtCellTotal.Width = Unit.Pixel(cellwidth);
                                txtCellTotal.Enabled = false;
                                tCellTotal.Controls.Add(txtCellTotal);
                                tCellTotal.CssClass = "cstotal noPad";
                                tCellTotal.Width = Unit.Pixel(cellwidth);
                                tRowDetail.Cells.Add(tCellTotal);

                                tblDetail.HorizontalAlign = HorizontalAlign.Center;
                                tblDetail.Attributes.Add("data-totalmethod", totalMethod.ToString());
                                tblDetail.CssClass = "csoption table-bordered tbchild";
                                tblDetail.CellPadding = 0;
                                tblDetail.Attributes.Add("data-tbwidth", (((totalcolcount + 1) * cellwidth) + totalcolcount).ToString());

                            }
                        }
                    }
                }
            }
#endregion
        }

        private void deletemethodcity()
        {
            string[] addargs = Request.Form[hidoption.UniqueID].ToString().Split('|');
            if (addargs[0].ToString() != "remove")
                return;

            txtAltOption = addargs[1].ToString().Replace("Option ", "");
            
            string strselect = "";
            if (addargs.Length == 2)
            {
                strselect = "OptionID = '" + txtAltOption + "'";
            }
            else if (addargs.Length == 3)
            {
                txtAltMethod = addargs[2];
                strselect = "OptionID = '" + txtAltOption + "' and Method = '" + txtAltMethod + "'";
            }
            else if (addargs.Length == 4)
            {
                txtAltMethod = addargs[2];
                txtAltCity = addargs[3];
                strselect = "OptionID = '" + txtAltOption + "' and Method = '" + txtAltMethod + "' and City = '" + txtAltCity + "'";
            }

            DataRow[] rowdelete;
            rowdelete = ds.Tables[1].Select(strselect);
            foreach (DataRow rd in rowdelete)
            {
                rd.Delete();
            }
            ds.Tables[1].AcceptChanges();
            Session["BaseData"] = ds;
            getalltxtboxvalues(GridView1);
            BindGrid();
            setalltxtboxvalues();
        }

        void setalltxtboxvalues()
        {
            TextBox txtbox;
            foreach (inputlist oinput in gridinputlist)
            {
                txtbox = (TextBox)FindControl(GridView1, oinput.txtid);
                if (txtbox != null)
                    txtbox.Text = oinput.txtvalue;
            }
        }

        public string costitemvalue(string strCode, string strOption, string strMethod, string strCity)
        {
            string result = "0";
            DataView ProposalCost = ds.Tables[3].DefaultView;

            string strFilter = "OptionID = " + strOption;
            strFilter += " AND CostItemcode = '" + strCode + "'";
            strFilter += " AND Isnull(Method,'') = '" + (strMethod == string.Empty ? "" : strMethod) + "'";
            strFilter += " AND Isnull(City,'') = '" + (strCity == string.Empty ? "" : strCity) + "'";

            ProposalCost.RowFilter = strFilter;
            if (ProposalCost.Count == 1)
                result = Convert.ToDouble(ProposalCost[0]["CostItemvalue"].ToString()).ToString(); 
                //result = Convert.ToInt64(Convert.ToDouble(ProposalCost[0]["CostItemvalue"].ToString())).ToString(); 
            ProposalCost.RowFilter = "";

            return result;
        }

        protected void populatepropsalDetails()
        {
            if (ds.Tables[2].Rows.Count > 0)
            {
                txtProposalID.Enabled = false;

                hidUID.Value = ds.Tables[2].Rows[0]["UID"].ToString();
                txtProposalID.Text = ds.Tables[2].Rows[0]["ProposalID"].ToString();
                txtProposalDesc.Text = ds.Tables[2].Rows[0]["ProposalDesc"].ToString();
                ddClientName.SelectedIndex = ddClientName.Items.IndexOf(ddClientName.Items.FindByText(ds.Tables[2].Rows[0]["ClientName"].ToString()));
                ClientIndexChanged(null, null);
                ddManager.SelectedIndex = ddManager.Items.IndexOf(ddManager.Items.FindByValue(ds.Tables[2].Rows[0]["Manager"].ToString()));
                ddLeader.SelectedIndex = ddLeader.Items.IndexOf(ddLeader.Items.FindByValue(ds.Tables[2].Rows[0]["Leader"].ToString()));
                ddBroadCategory.SelectedIndex = ddBroadCategory.Items.IndexOf(ddBroadCategory.Items.FindByText(ds.Tables[2].Rows[0]["BroadCategory"].ToString()));
                txtRFQRefDate.Text = ds.Tables[2].Rows[0]["RFQRefDate"].ToString();
                ddDepartment.SelectedIndex = ddDepartment.Items.IndexOf(ddDepartment.Items.FindByText(ds.Tables[2].Rows[0]["Department"].ToString()));
                ddMarket.SelectedIndex = ddMarket.Items.IndexOf(ddMarket.Items.FindByText(ds.Tables[2].Rows[0]["Market"].ToString()));
                ddCoordinator.SelectedIndex = ddCoordinator.Items.IndexOf(ddCoordinator.Items.FindByValue(ds.Tables[2].Rows[0]["Coordinator"].ToString()));
                ddCurrencyType.SelectedIndex = ddCurrencyType.Items.IndexOf(ddCurrencyType.Items.FindByText(ds.Tables[2].Rows[0]["CurrencyType"].ToString()));
                txtValue.Text = ds.Tables[2].Rows[0]["Value"].ToString();
                txtOffered.Text = ds.Tables[2].Rows[0]["Offered"].ToString();
                txtAgreed.Text = ds.Tables[2].Rows[0]["Agreed"].ToString();
                txtAgreedBase.Text = ds.Tables[2].Rows[0]["AgreedBaseCurrency"].ToString();
                txtDueDate.Text = ds.Tables[2].Rows[0]["Duedate"].ToString();
                txtSenddate.Text = ds.Tables[2].Rows[0]["Senddate"].ToString();
                txtApprovaldate.Text = ds.Tables[2].Rows[0]["Approvaldate"].ToString();
                ddTypeofstudy.SelectedIndex = ddTypeofstudy.Items.IndexOf(ddTypeofstudy.Items.FindByText(ds.Tables[2].Rows[0]["Typeofstudy"].ToString()));
                ddProjectType.SelectedIndex = ddProjectType.Items.IndexOf(ddProjectType.Items.FindByText(ds.Tables[2].Rows[0]["ProjectType"].ToString()));
                //txtProjectDesc.Text = ds.Tables[2].Rows[0]["ProjectDesc"].ToString();
                ddProbability.SelectedIndex = ddProbability.Items.IndexOf(ddProbability.Items.FindByText(ds.Tables[2].Rows[0]["Probability"].ToString()));
                
                //ddAgency.SelectedIndex = ddAgency.Items.IndexOf(ddAgency.Items.FindByText(ds.Tables[2].Rows[0]["Agency"].ToString()));
                string strduAgency = ds.Tables[2].Rows[0]["Agency"].ToString();
                if (string.IsNullOrEmpty(strduAgency))
                    duAgency.Text = string.Empty;
                else
                    duAgency.Text = "[\"" + strduAgency.Replace(",", "\",\"") + "\"]";




                ddStatus.SelectedIndex = ddStatus.Items.IndexOf(ddStatus.Items.FindByText(ds.Tables[2].Rows[0]["Status"].ToString()));
                hidProjRef.Value = (ds.Tables[2].Rows[0]["ProjectRefID"].ToString() == "NULL") ? string.Empty : ds.Tables[2].Rows[0]["ProjectRefID"].ToString();

                string ProjectRefIDLast = (ds.Tables[2].Rows[0]["ProjectRefIDLast"].ToString() == "NULL") ? string.Empty : ds.Tables[2].Rows[0]["ProjectRefIDLast"].ToString();


                
                    if (!string.IsNullOrEmpty(ProjectRefIDLast))
                    {
                        string[] strprojid = ProjectRefIDLast.Split('-');
                        if (strprojid.Length == 2)
                        {
                            hidProjRefNext.Value = strprojid[0] + "-" + (Convert.ToInt16(strprojid[1]) + 1);
                        }
                        else if (strprojid.Length == 1)
                        {
                            hidProjRefNext.Value = strprojid[0] + "-2";
                        }
                        if (!string.IsNullOrEmpty(hidProjRefNext.Value))
                        {
                            btnCreateProject.Text = "Create Project " + hidProjRefNext.Value;
                            btnCreateProject.Visible = true;
                        }

                    }
                

                txtComments.Text = ds.Tables[2].Rows[0]["Comments"].ToString();
                if (ds.Tables[2].Rows[0]["Status"].ToString() == "Won")
                {
                    btnsave.Visible = false;
                    btnsavecontinue.Visible = false;
                    btnfinalsumbit.Visible = false;
                    btn_addclient.Visible = false;
                }
            }
            else
            {
                ddCoordinator.SelectedIndex = ddCoordinator.Items.IndexOf(ddCoordinator.Items.FindByValue(strloginuserID));
                ddCoordinator_SelectedIndexChanged(null, null);
                txtRFQRefDate.Text = DateTime.UtcNow.AddMinutes(420).ToShortDateString();
                ddDepartment.SelectedIndex = ddDepartment.Items.IndexOf(ddDepartment.Items.FindByText(Session["Department"].ToString()));
            }

        }

        protected void btnproject_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            String strerrmsg;
            string newUID; string newProposalID;
            result = saveopertion(out strerrmsg, out newUID, out newProposalID);
            if (result == true)
            {
                if (hidUID.Value == "")
                    Session["ProposalRef"] = newProposalID;
                else
                    Session["ProposalRef"] = txtProposalID.Text;

                if (string.IsNullOrEmpty(hidProjRefNext.Value))
                    Session["ProjectID"] = "New";
                else
                    Session["ProjectID"] = "New|" + hidProjRefNext.Value;
                Response.Redirect("Projects.aspx");

            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
                hidtoaster.Value = "error|" + strerrmsg;
            }

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            String strerrmsg;
            string newUID; string newProposalID;
            result = saveopertion(out strerrmsg, out newUID, out newProposalID);
            if (result == true)
            {
                if (ddStatus.Text == "Won" && string.IsNullOrEmpty(hidProjRef.Value) && ProjAccess.AllowAdd)
                {
                    if (hidUID.Value == "")
                        Session["ProposalRef"] = newProposalID;
                    else
                        Session["ProposalRef"] = txtProposalID.Text;

                    Session["ProjectID"] = "New";
                    Response.Redirect("Projects.aspx");
                }

                if (hidUID.Value == "")
                {
                    hidtoaster.Value = "success|Added successfully";
                    hidUID.Value = newUID;
                    txtProposalID.Text = newProposalID;
                    txtProposalID.Enabled = false;
                    Session["ProposalID"] = newProposalID;
                    brdPageID.InnerText = txtProposalID.Text;
                }
                else
                    hidtoaster.Value = "success|Updated successfully";

                if (hidtab.Value == "#tab1")
                    hidtab.Value = "";
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
                hidtoaster.Value = "error|" + strerrmsg;
            }
            
        }

        protected void btnsavecontinue_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            String strerrmsg;
            string newUID; string newProposalID;
            result = saveopertion(out strerrmsg, out newUID, out newProposalID);
            if (result == true)
            {
                if (hidUID.Value == "")
                {
                    hidtoaster.Value = "success|Added successfully";
                    hidUID.Value = newUID;
                    txtProposalID.Text = newProposalID;
                    txtProposalID.Enabled = false;
                    Session["ProposalID"] = newProposalID;
                    brdPageID.InnerText = txtProposalID.Text;
                }
                else
                    hidtoaster.Value = "success|Updated successfully";

                hidtab.Value = "#tab" + (Convert.ToInt16(hidtab.Value.ToString().Replace("#tab", "")) + 1).ToString();
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
                hidtoaster.Value = "error|" + strerrmsg;
            }

        }

        protected void btnfinalsumbit_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            String strerrmsg;
            string newUID; string newProposalID;
            result = saveopertion(out strerrmsg, out newUID, out newProposalID);
            if (result == true)
            {
                if (hidUID.Value == "")
                {
                    hidtoaster.Value = "success|Added successfully";
                    txtProposalID.Text = newProposalID;
                }
                else
                    hidtoaster.Value = "success|Updated successfully";

                if (Convert.ToDecimal(strMinGMValue) < 40)
                {
                    DataSet dsEmail = dl.UP_Fetch_AdminEmailIds();
                    int totalusers = dsEmail.Tables[0].Rows.Count;
                    if (totalusers > 0)
                    {
                        string[] messageTo = new string[totalusers];
                        for (int i = 0; i < totalusers; i++)
                        {
                            messageTo[i] = dsEmail.Tables[0].Rows[i]["EmailAddress"].ToString();
                        }

                        string mailbody, mailsubject;
                        GrossMarginAlert(out mailbody, out mailsubject);
                        dl.SendMail(mailbody, mailsubject, messageTo);
                    }
                }

                Response.Redirect("ProposalAll.aspx");
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
                hidtoaster.Value = "error|" + strerrmsg;
            }
        }

        private void GrossMarginAlert(out string mailbody, out string mailsubject)
        {
            string stroutput = "", strsubjet = "";
            DataSet dsET = dl.UP_Fetch_EMailTemplate("Gross Margin Alert");
            if (dsET.Tables[0].Rows.Count > 0)
            {
                stroutput = dsET.Tables[0].Rows[0]["TempaleContent"].ToString();
                stroutput = stroutput.Replace("&lt;ProposalID&gt;", txtProposalID.Text);
                stroutput = stroutput.Replace("&lt;GMValue&gt;", strMinGMValue);
                strsubjet = dsET.Tables[0].Rows[0]["TempaleSubject"].ToString();
            }
            mailbody = stroutput;
            mailsubject = strsubjet;
        }

        protected Boolean saveopertion(out String strerrmsg, out string newUID, out string newProposalID)
        {
            string UID, ProposalID, ProposalDesc, ClientName, Manager, Leader, BroadCategory, RFQRefDate, Department, Market, Coordinator, CurrencyType, Value, Offered, Agreed, Duedate, Senddate, Approvaldate, Typeofstudy, ProjectType, ProjectDesc, Probability, Agency, Status, ProjectRefID;
            string CostXML, TimeCostXML, TaskXML, Comments, AgreedBaseCurrency;
            Boolean result = false;

            if (string.IsNullOrEmpty(hidUID.Value.Trim()) == true)
                UID = string.Empty;
            else
                UID = hidUID.Value;

            ProposalID = txtProposalID.Text.Trim();
            ProposalDesc = txtProposalDesc.Text.Trim();
            ClientName = (ddClientName.SelectedIndex == 0) ? string.Empty : ddClientName.SelectedValue;
            Manager = (ddManager.SelectedIndex == 0) ? string.Empty : ddManager.SelectedValue;
            Leader = (ddLeader.SelectedIndex == 0) ? string.Empty : ddLeader.SelectedValue;
            BroadCategory = (ddBroadCategory.SelectedIndex == 0) ? string.Empty : ddBroadCategory.SelectedValue;
            RFQRefDate = txtRFQRefDate.Text.Trim();
            Department = (ddDepartment.SelectedIndex == 0) ? string.Empty : ddDepartment.SelectedValue;
            Market = (ddMarket.SelectedIndex == 0) ? string.Empty : ddMarket.SelectedValue;
            Coordinator = (ddCoordinator.SelectedIndex == 0) ? string.Empty : ddCoordinator.SelectedValue;
            CurrencyType = (ddCurrencyType.SelectedIndex == 0) ? string.Empty : ddCurrencyType.SelectedValue;
            Value = txtValue.Text.Trim();
            Offered = txtOffered.Text.Trim();
            Agreed = txtAgreed.Text.Trim();
            Duedate = txtDueDate.Text.Trim();
            Senddate = txtSenddate.Text.Trim();
            Approvaldate = txtApprovaldate.Text.Trim();
            Typeofstudy = (ddTypeofstudy.SelectedIndex == 0) ? string.Empty : ddTypeofstudy.SelectedValue;
            ProjectType = (ddProjectType.SelectedIndex == 0) ? string.Empty : ddProjectType.SelectedValue;
            ProjectDesc = string.Empty;
            Probability = (ddProbability.SelectedIndex == 0) ? string.Empty : ddProbability.SelectedValue;
            //Agency = (ddAgency.SelectedIndex == 0) ? string.Empty : ddAgency.SelectedValue;
            Agency = string.Empty;
            if (duAgency.Text.Length > 0)
            {
                Agency = duAgency.Text.Replace("[", "").Replace("]", "").Replace("\"", "");
            }
            Status = (ddStatus.SelectedIndex == 0) ? string.Empty : ddStatus.SelectedValue;
            ProjectRefID = string.Empty;
            Comments = txtComments.Text.Trim();
            AgreedBaseCurrency = txtAgreedBase.Text.Trim();

            CostXML = getCostXML();
            TimeCostXML = getTimeCostXML();
            TaskXML = getTasksXML();

            result = dl.UP_IU_Proposals(UID, ProposalID, ProposalDesc, ClientName, Manager, Leader, BroadCategory, RFQRefDate, Department, Market, Coordinator, CurrencyType, Value, Offered, Agreed, Duedate, Senddate, Approvaldate, Typeofstudy, ProjectType, ProjectDesc, Probability, Agency, Status, ProjectRefID, Comments, AgreedBaseCurrency, strloginuser, CostXML, TimeCostXML, TaskXML, out strerrmsg, out newUID, out newProposalID);

            return result;
            
            
        }

        private string getCostXML()
        {
            string strOption, strMethod, strCity, strCode, strValue;
            getalltxtboxvalues(GridView1);

            strMinGMValue = string.Empty;

            string xmldetails = "<root>";


            foreach (inputlist oinput in gridinputlist)
            {
                string[] oinputs = oinput.txtid.Split('_');
                strOption = oinputs[0];
                strCode = oinputs[1];
                strValue = oinput.txtvalue;
                strMethod = string.Empty;
                strCity = string.Empty;
                if (oinputs.Length == 4)
                {
                    strMethod = oinputs[2];
                    if (oinputs[3] != "MethodTotal")
                        strCity = oinputs[3];
                }
                else if (oinputs.Length == 3)
                    strMethod = oinputs[2];

                if (strCode == "GM")
                {
                    Decimal decGMValue;
                    try
                    {
                        decGMValue = Convert.ToDecimal(strValue.Replace(",", "").Replace("%", ""));
                    }
                    catch
                    {
                        decGMValue = 0;
                    }
                    if (string.IsNullOrEmpty(strMinGMValue))
                        strMinGMValue = decGMValue.ToString();
                    else
                    {
                        if (Convert.ToDecimal(strMinGMValue) > decGMValue)
                            strMinGMValue = decGMValue.ToString();
                    }
                }

                xmldetails += "<detail><option>" + strOption + "</option>";
                xmldetails += "<code>" + strCode + "</code>";
                if (!string.IsNullOrEmpty(strMethod))
                    xmldetails += "<method>" + strMethod + "</method>";
                if (!string.IsNullOrEmpty(strCity))
                    xmldetails += "<city>" + strCity + "</city>";
                xmldetails += "<value>" + strValue.Replace(",", "").Replace("%","") + "</value>";
                xmldetails += "</detail>";
            }
            xmldetails += "</root>";
            return xmldetails;

                            /*SELECT
                    det.value('(option)[1]', 'nvarchar(100)') OptionID,
                    det.value('(method)[1]', 'nvarchar(100)') Method,
                    det.value('(city)[1]', 'nvarchar(100)') City,
                    det.value('(code)[1]', 'nvarchar(100)') code,
                    det.value('(value)[1]', 'nvarchar(100)') Value
                from @xml.nodes('/root/detail') AS XTbl(det)*/
        }

        private string getTimeCostXML()
        {
            string strOption, strTitleDec, intNoofDays, TimeCostvalue;
            string xmldetails = string.Empty;
            if (ds.Tables[5].Rows.Count > 0)
            {
                xmldetails = "<root>";
                foreach (DataRowView dr in ds.Tables[5].DefaultView)
                {
                    strOption = dr["OptionID"].ToString();
                    strTitleDec = dr["TitleDec"].ToString();
                    intNoofDays = dr["NoofDays"].ToString();
                    TimeCostvalue = dr["TimeCostvalue"].ToString();

                    xmldetails += "<detail><OptionID>" + strOption + "</OptionID>";
                    xmldetails += "<TitleDec>" + strTitleDec + "</TitleDec>";
                    xmldetails += "<NoofDays>" + intNoofDays + "</NoofDays>";
                    xmldetails += "<TimeCostvalue>" + TimeCostvalue + "</TimeCostvalue>";
                    xmldetails += "</detail>";
                }
                xmldetails += "</root>";
            }
            return xmldetails;
        }

        private void getalltxtboxvalues(Control parent)
        {
            foreach (Control control in parent.Controls)
            {
                if (control.ToString() == "System.Web.UI.WebControls.TextBox")
                {
                    TextBox cntrl = (TextBox)control;
                    gridinputlist.Add(new inputlist { txtid = cntrl.ID, txtvalue = cntrl.Text.Trim()});
                }
                else
                    getalltxtboxvalues(control);
            }
            //return null;
        }

        protected void lbtnTimeCostOK_Click(object sender, EventArgs e)
        {
            string strOption = ViewState["TimeCostOption"].ToString();
            DataView dvRateCard = ds.Tables[4].DefaultView;
            DataView dvTimeCost = ds.Tables[5].DefaultView;
            decimal TotalTimeCost = 0;
            foreach (GridViewRow row in grdTimecost.Rows)
            {
                string strTitleDec = ((System.Web.UI.WebControls.Label)(((System.Web.UI.Control)(row.Cells[0])).Controls[1])).Text;
                TextBox txtNoofDays = (TextBox)((System.Web.UI.Control)(((System.Web.UI.WebControls.TableRow)(row)).Cells[1])).Controls[1];

                dvRateCard.RowFilter = "TitleDec = '" + strTitleDec + "'";
                if (dvRateCard.Count > 0)
                {
                    decimal DailyRate = Convert.ToDecimal(dvRateCard[0]["DailyRate"].ToString());
                    decimal TimeCostvalue = 0;
                    decimal declNoofDays;
                    declNoofDays = Convert.ToDecimal(txtNoofDays.Text.Trim());
                    TimeCostvalue = Math.Round(declNoofDays * DailyRate,0);
                    TotalTimeCost += TimeCostvalue;

                    dvTimeCost.RowFilter = "OptionID = " + strOption + " and TitleDec = '" + strTitleDec + "'";
                    if (dvTimeCost.Count > 0)
                    {
                        dvTimeCost[0]["NoofDays"] = declNoofDays.ToString();
                        dvTimeCost[0]["TimeCostvalue"] = TimeCostvalue.ToString();
                    }
                    else if (declNoofDays > 0)
                    {
                        DataRow newrow = dvTimeCost.Table.NewRow();
                        newrow["OptionID"] = strOption;
                        newrow["TitleDec"] = strTitleDec;
                        newrow["NoofDays"] = declNoofDays.ToString();
                        newrow["TimeCostvalue"] = TimeCostvalue.ToString();
                        dvTimeCost.Table.Rows.Add(newrow);
                    }

                    dvTimeCost.RowFilter = "";
                }
                dvRateCard.RowFilter = "";

            }
            TextBox txttimecost = (TextBox)FindControl(GridView1, strOption +  "_TIC");
            txttimecost.Text = TotalTimeCost.ToString();

            hidtab.Value = "#tab2";

        }

        public static Control FindControl(Control parent, string id)
        {
            foreach (Control control in parent.Controls)
            {
                if (control.ID == id)
                {
                    return control;
                }
                var childResult = FindControl(control, id);
                if (childResult != null)
                {
                    return childResult;
                }
            }
            return null;
        }

        protected void grdTimecost_RowCommand(object sender, GridViewRowEventArgs e)
        {
            string strOption = hidTimecost.Value;
            DataView dvOption;

            dvOption = ds.Tables[5].DefaultView;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string strTitleDec = ((System.Web.UI.WebControls.Label)(((System.Web.UI.Control)(e.Row.Cells[0])).Controls[1])).Text;
                TextBox txtNoofDays = (TextBox)((System.Web.UI.Control)(((System.Web.UI.WebControls.TableRow)(e.Row)).Cells[1])).Controls[1];

                dvOption.RowFilter = "OptionID = '" + strOption + "' and TitleDec = '" + strTitleDec + "'";
                if (dvOption.Count == 0)
                {
                    txtNoofDays.Text = "0";
                }
                else
                {
                    txtNoofDays.Text = dvOption[0]["NoofDays"].ToString();
                }
                dvOption.RowFilter = "";
            }
            ViewState["TimeCostOption"] = strOption;
        }

        private void BindTasks()
        {
            DataView dv = dsTasks.Tables[0].DefaultView;
            dv.Sort = "RecordSequence ASC";
            grdTasks.DataSource = dv;
            grdTasks.DataBind();
        }

        protected void DDEmpDept_Changed(object sender, EventArgs e)
        {
            DataView dtEmp = dsTasks.Tables[3].DefaultView;
            dtEmp.RowFilter = "Department = '" + ddEmpDept.SelectedValue.ToString() + "'";
            lvEmployee.DataSource = dtEmp;
            lvEmployee.DataBind();
            dtEmp.RowFilter = "";

            string xmldetails = getTasksXML();

            dsLoadStatus = dl.UP_Fetch_Proposal_Task_LoadStatus(strProposalID, xmldetails);

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
                    //TextBox Hours = (TextBox)e.Row.FindControl("Hours");
                    Image imgstatus = (Image)e.Row.FindControl("imgstatus");
                    LinkButton btn_deletetask = (LinkButton)e.Row.FindControl("btn_deletetask");
                    Label NoDays = (Label)e.Row.FindControl("NoDays");

                    if (RecordSequence.Text == "-1")
                        btn_deletetask.Visible = false;
                    else
                        btn_deletetask.Visible = true;
                    TaskName.Attributes.Add("data-newtask", "yes");
                    EmpName.Attributes.Add("data-newemp", "yes");

                    TaskName.Attributes.Add("data-taskinput", "yes");
                    EmpName.Attributes.Add("data-taskinput", "yes");
                    StartDate.Attributes.Add("data-taskinput", "yes");
                    EndDate.Attributes.Add("data-taskinput", "yes");
                    //Hours.Attributes.Add("data-taskinput", "yes");

                    if (dsLoadStatus != null)
                    {
                        DataView dv = dsLoadStatus.Tables[0].DefaultView;
                        dv.RowFilter = "RecordSequence = " + RecordSequence.Text;
                        if (dv.Count == 1)
                        {
                            NoDays.Text = dv[0]["NoDays"].ToString();
                            imgstatus.ImageUrl = "~/assets/img/" + dv[0]["ColorCode"].ToString() + ".png";
                            imgstatus.Visible = true;

                            if (dv[0]["bitdup"].ToString() == "True")
                                EmpName.Attributes.Add("data-dup", "yes"); 
                            else
                                EmpName.Attributes.Add("data-dup", "no"); 
                        }
                        dv.RowFilter = "";
                    }
                }
            }
        }

        protected void btnupdatetask_Click(object sender, EventArgs e)
        {
            string xmldetails = getTasksXML();

            dsLoadStatus = dl.UP_Fetch_Proposal_Task_LoadStatus(strProposalID, xmldetails);
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
            rows = dsTasks.Tables[0].Select("RecordSequence = " + RecordSequence.Text );

            if (rows.Count() == 1)
            {
                rows[0].Delete();
                dsTasks.Tables[0].AcceptChanges();
            }

            BindTasks();

            string xmldetails = getTasksXML();

            dsLoadStatus = dl.UP_Fetch_Proposal_Task_LoadStatus(strProposalID, xmldetails);
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
                //TextBox Hours = (TextBox)row.FindControl("Hours");
                TextBox RecordSequence = (TextBox)row.FindControl("RecordSequence");
                Label NoDays = (Label)row.FindControl("NoDays");

                if (TaskName.Text.Trim().Length > 0 && EmployeeID.Text.Trim().Length > 0
                        && StartDate.Text.Trim().Length > 0 && EndDate.Text.Trim().Length > 0) //&& Hours.Text.Trim().Length > 0
                {
                    if (RecordSequence.Text == "-1")
                    {
                        DataView dv = dsTasks.Tables[0].DefaultView;
                        dv.RowFilter = "RecordSequence = -1";
                        if (dv.Count == 1)
                        {
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
                    //xmldetails += "<Hours>" + Hours.Text + "</Hours>";
                    xmldetails += "<Hours>0</Hours>";
                    xmldetails += "<NoDays>" + NoDays.Text + "</NoDays>";
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

        protected void btnAddNewClient(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = dl.UP_I_Client(txtaccname.Text, strloginuser);
            if (ds.Tables.Count > 0)
            {
                DataView dv = ds.Tables[0].DefaultView;
                dv.RowFilter = "AccountType = 'Customers'";
                ddClientName.DataSource = dv;
                ddClientName.DataTextField = "AccountName";
                ddClientName.DataValueField = "AccountName";
                ddClientName.DataBind();
                ddClientName.Items.Insert(0, new ListItem("--Select--", ""));
                ddClientName.SelectedIndex = ddClientName.Items.IndexOf(ddClientName.Items.FindByText(txtaccname.Text));

                int totaladmin = ds.Tables[1].Rows.Count;
                if (totaladmin > 0)
                {
                    string[] messageTo = new string[totaladmin];
                    for (int i = 0; i < totaladmin; i++)
                    {
                        messageTo[i] = ds.Tables[1].Rows[i]["EmailAddress"].ToString();
                    }

                    /*StringBuilder objStrBuilder = new StringBuilder();
                    objStrBuilder.Append("<table><tr><td>Dear Administrator");
                    objStrBuilder.Append("<br><br><b>New Client Added</b>");
                    objStrBuilder.Append("<br><br>Client Name :&nbsp;");
                    objStrBuilder.Append(txtaccname.Text);
                    objStrBuilder.Append("<br><br>Please review and update details.");
                    objStrBuilder.Append("<br><br>Thanks<br>Kadence International");
                    objStrBuilder.Append("<br><br><font size=1>Please do not replay to this mail</font>");
                    objStrBuilder.Append("</td></tr></table>");

                    dl.SendMail(objStrBuilder.ToString(), "Information from Kadence V2", messageTo);*/

                    string mailbody, mailsubject;
                    NewClientMailContent(txtaccname.Text, out mailbody, out mailsubject);
                    dl.SendMail(mailbody, mailsubject, messageTo);
                }
                hidtoaster.Value = "success|Added successfully";
            }
            else
            {
                ddClientName.SelectedIndex = ddClientName.Items.IndexOf(ddClientName.Items.FindByText(txtaccname.Text));
                hidtoaster.Value = "error|Client Alerady Exists";
            }
            ClientIndexChanged(null, null);

            if (hidtab.Value == "#tab1")
                hidtab.Value = "";
        }

        private void NewClientMailContent(string ClientName, out string mailbody, out string mailsubject)
        {
            string stroutput = "", strsubjet = "";
            DataSet dsET = dl.UP_Fetch_EMailTemplate("New Client");
            if (dsET.Tables[0].Rows.Count > 0)
            {
                stroutput = dsET.Tables[0].Rows[0]["TempaleContent"].ToString();
                stroutput = stroutput.Replace("&lt;ClientName&gt;", ClientName);
                strsubjet = dsET.Tables[0].Rows[0]["TempaleSubject"].ToString();
            }
            mailbody = stroutput;
            mailsubject = strsubjet;
        }



        protected void ddCoordinator_SelectedIndexChanged(Object sender, EventArgs e)
        {
            string EmployeeID;
            EmployeeID = ddCoordinator.SelectedValue;
            DataSet dtcoord = dl.UP_Fetch_Emp_ManagerDirector(ddCoordinator.SelectedValue);
            if (dtcoord.Tables[0].Rows.Count > 0)
            {
                ddManager.SelectedIndex = ddManager.Items.IndexOf(ddManager.Items.FindByValue(dtcoord.Tables[0].Rows[0]["DirectManager"].ToString()));
                ddLeader.SelectedIndex = ddLeader.Items.IndexOf(ddLeader.Items.FindByValue(dtcoord.Tables[0].Rows[0]["Director"].ToString()));
            }
            else
            {
                ddManager.SelectedIndex = 0;
                ddLeader.SelectedIndex = 0;
            }
        }

        protected void ClientIndexChanged(Object sender, EventArgs e)
        {
            string AccountName;
            AccountName = ddClientName.SelectedItem.Text;
            if (!string.IsNullOrEmpty(AccountName))
            {
                DataSet dsSector = dl.UP_Fetch_Proposal_DD_Sector(AccountName);

                ddMarket.DataSource = dsSector.Tables[0];
                ddMarket.DataTextField = "Market";
                ddMarket.DataValueField = "Market";
                ddMarket.DataBind();
                ddMarket.Items.Insert(0, new ListItem("--Select--", ""));

            }
        }
    }
}
