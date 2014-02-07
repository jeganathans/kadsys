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
using System.Web.Script.Serialization;
using System.Collections.Generic;

namespace KedSys35
{
    public partial class Projects : System.Web.UI.Page
    {
        dal dl = new dal();
        DataSet ds;
        //DataSet dsInvoice;
        string strProjectID, strProposalRef;
        string strProjectIDNext;
        string strloginuser = "";
        int totalrecordsinvoice = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["loginuser"] = "anandy";
            //Session["ProposalRef"] = "Q131207001";
            //Session["ProjectID"] = "P131219001";

            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }
            strloginuser = Session["loginuser"].ToString();

            if (Request.QueryString.AllKeys.Contains("new"))
            {
                Session["ProposalRef"] = "N/A";
                Session["ProjectID"] = "New";
            }

            if (Session["ProjectID"].ToString().StartsWith("New"))
            {
                if (Session["ProjectID"].ToString() == "New")
                {
                    strProjectID = string.Empty;
                    strProjectIDNext = string.Empty;
                }
                else
                {
                    string[] tempid = Session["ProjectID"].ToString().Split('|');
                    if (tempid.Length == 2)
                    {
                        strProjectID = string.Empty;
                        strProjectIDNext = tempid[1];
                    }
                    else
                    {
                        strProjectID = string.Empty;
                        strProjectIDNext = string.Empty;
                    }
                }
                if (Session["ProposalRef"] != null)
                {
                    strProposalRef = Session["ProposalRef"].ToString();
                    //txtProposalID.Text = strProposalRef; 
                }
                brdProjectID.InnerText = "N/A";
            }
            else
            {
                strProjectID = Session["ProjectID"].ToString();
                brdProjectID.InnerText = strProjectID;
            }



            if (!IsPostBack)
            {


                ds = dl.UP_Fetch_Project(strProjectID, strProposalRef);
                ViewState["BaseData"] = ds;

                BindCombo();
                populateprojectDetails();
                BindGrid();
                BindInvGrid();
            }
            else
            {
                ds = (DataSet)ViewState["BaseData"];
            }

        }

        void BindCombo()
        {
            DataSet ds = dl.UP_Fetch_Project_DD();

            ddEmpDept.DataSource = ds.Tables[0];
            ddEmpDept.DataValueField = "Department";
            ddEmpDept.DataTextField = "Department";
            ddEmpDept.DataBind();

            lvEmployee.DataSource = ds.Tables[1];
            lvEmployee.DataBind();

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
            ddAgency.Items.Insert(0, new ListItem("--Select--", ""));

            dv = ds.Tables[3].DefaultView;
            //dv.RowFilter = "Leader = True";
            ddLeader.DataSource = ds.Tables[3];
            ddLeader.DataTextField = "EmpName";
            ddLeader.DataValueField = "EmployeeID";
            ddLeader.DataBind();
            ddLeader.Items.Insert(0, new ListItem("--Select--", ""));

            ddDepartment.DataSource = ds.Tables[0];
            ddDepartment.DataTextField = "Department";
            ddDepartment.DataValueField = "Department";
            ddDepartment.DataBind();
            ddDepartment.Items.Insert(0, new ListItem("--Select--", ""));

            ddProjectType.DataSource = ds.Tables[4];
            ddProjectType.DataTextField = "ProjectType";
            ddProjectType.DataValueField = "ProjectType";
            ddProjectType.DataBind();
            ddProjectType.Items.Insert(0, new ListItem("--Select--", ""));

            ddStatus.DataSource = ds.Tables[5];
            ddStatus.DataTextField = "Status";
            ddStatus.DataValueField = "Status";
            ddStatus.DataBind();
            ddStatus.Items.Insert(0, new ListItem("--Select--", ""));

            ddFWTypeofStudy.DataSource = ds.Tables[6];
            ddFWTypeofStudy.DataTextField = "TypeofStudy";
            ddFWTypeofStudy.DataValueField = "TypeofStudy";
            ddFWTypeofStudy.DataBind();
            ddFWTypeofStudy.Items.Insert(0, new ListItem("--Select--", ""));

            ddFWType.DataSource = ds.Tables[7];
            ddFWType.DataTextField = "Method";
            ddFWType.DataValueField = "Method";
            ddFWType.DataBind();
            //ddFWType.Items.Insert(0, new ListItem("--Select--", ""));

            ddResearchEngineer.DataSource = ds.Tables[8];
            ddResearchEngineer.DataTextField = "EmpName";
            ddResearchEngineer.DataValueField = "EmployeeID";
            ddResearchEngineer.DataBind();
            ddResearchEngineer.Items.Insert(0, new ListItem("--Select--", ""));

            ddBillingCurrency.DataSource = ds.Tables[9];
            ddBillingCurrency.DataTextField = "CurrencyType";
            ddBillingCurrency.DataValueField = "CurrencyType";
            ddBillingCurrency.DataBind();
            ddBillingCurrency.Items.Insert(0, new ListItem("--Select--", ""));

            ddBaseCurrency.DataSource = ds.Tables[9];
            ddBaseCurrency.DataTextField = "CurrencyType";
            ddBaseCurrency.DataValueField = "CurrencyType";
            ddBaseCurrency.DataBind();
            ddBaseCurrency.Items.Insert(0, new ListItem("--Select--", ""));

        }

        void BindGrid()
        {
            grdDepts.DataSource = ds.Tables[1];
            grdDepts.DataBind();

        }

        protected void populateprojectDetails()
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                hidUID.Value = ds.Tables[0].Rows[0]["UID"].ToString();
                txtProjectID.Text = ds.Tables[0].Rows[0]["ProjectID"].ToString();
                if (txtProjectID.Text.Length == 0 && strProjectIDNext.Length > 0)
                    txtProjectID.Text = strProjectIDNext;
                txtProjectName.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
                txtProposalID.Text = ds.Tables[0].Rows[0]["ProposalRef"].ToString();
                txtProjectDesc.Text = ds.Tables[0].Rows[0]["ProjectDesc"].ToString();
                ddClientName.SelectedIndex = ddClientName.Items.IndexOf(ddClientName.Items.FindByText(ds.Tables[0].Rows[0]["ClientName"].ToString()));
                ddAgency.SelectedIndex = ddAgency.Items.IndexOf(ddAgency.Items.FindByText(ds.Tables[0].Rows[0]["Agency"].ToString()));
                ddLeader.SelectedIndex = ddLeader.Items.IndexOf(ddLeader.Items.FindByValue(ds.Tables[0].Rows[0]["Leader"].ToString()));
                ddResearchEngineer.SelectedIndex = ddResearchEngineer.Items.IndexOf(ddResearchEngineer.Items.FindByValue(ds.Tables[0].Rows[0]["ResearchEngineer"].ToString()));
                ddProjectType.SelectedIndex = ddProjectType.Items.IndexOf(ddProjectType.Items.FindByText(ds.Tables[0].Rows[0]["ProjectType"].ToString()));
                ddDepartment.SelectedIndex = ddDepartment.Items.IndexOf(ddDepartment.Items.FindByText(ds.Tables[0].Rows[0]["Department"].ToString()));
                txtStartDate.Text = ds.Tables[0].Rows[0]["StartDate"].ToString();
                txtEndDate.Text = ds.Tables[0].Rows[0]["EndDate"].ToString();
                ddStatus.SelectedIndex = ddStatus.Items.IndexOf(ddStatus.Items.FindByText(ds.Tables[0].Rows[0]["Status"].ToString()));
                txtFWPOFieldwork.Text = ds.Tables[0].Rows[0]["FWPOFieldwork"].ToString();
                ddFWTypeofStudy.SelectedIndex = ddFWTypeofStudy.Items.IndexOf(ddFWTypeofStudy.Items.FindByText(ds.Tables[0].Rows[0]["FWTypeofStudy"].ToString()));
                txtFWTargetSample.Text = ds.Tables[0].Rows[0]["FWTargetSample"].ToString();
                txtFWSampleCollected.Text = ds.Tables[0].Rows[0]["FWSampleCollected"].ToString();
                txtFWTargetDate.Text = ds.Tables[0].Rows[0]["FWTargetDate"].ToString();
                txtFWConSentDate.Text = ds.Tables[0].Rows[0]["FWConSentDate"].ToString();
                //ddFWType.SelectedIndex = ddFWType.Items.IndexOf(ddFWType.Items.FindByText(ds.Tables[0].Rows[0]["FWType"].ToString()));
                string strduFWType = ds.Tables[0].Rows[0]["FWType"].ToString();
                if (string.IsNullOrEmpty(strduFWType))
                    duFWType.Text = string.Empty;
                else
                    duFWType.Text = "[\"" + strduFWType.Replace(",", "\",\"") + "\"]";

                //string[] dFWType = ds.Tables[0].Rows[0]["FWType"].ToString().Split(',');
                //duFWType.Text = "[";
                //for (int j = 0; j < dFWType.Length; j++)
                //{
                //    if (!string.IsNullOrEmpty(dFWType[j]))
                //    {
                //        if (j > 0)
                //            duFWType.Text += ",";
                //        duFWType.Text += "{\"id\":\"" + dFWType[j] + "\",\"text\":\"" + dFWType[j] + "\"";
                //        duFWType.Text += ",\"element\":[{}],\"disabled\":false,\"locked\":false}";
                //    }
                //}
                //duFWType.Text += "]";

                if (string.IsNullOrEmpty(hidUID.Value))
                {
                    ddStatus.SelectedIndex = ddStatus.Items.IndexOf(ddStatus.Items.FindByText("Yet to Start"));
                }

                if (ds.Tables[0].Rows[0]["Status"].ToString() == "Invoiced")
                {
                    ddStatus.DataSource = "";
                    ddStatus.DataBind();
                    ddStatus.Items.Insert(0, new ListItem("Invoiced", "Invoiced"));
                    btnsave.Visible = false;
                    btnsavecontinue.Visible = false;
                    btnfinalsumbit.Visible = false;
                }

            }
            else
            {
                txtProposalID.Text = strProposalRef;
                
            }

        }

        protected void grdDepts_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRow row = ((DataRowView)e.Row.DataItem).Row;

                 DropDownList ddPDStatus = (DropDownList)e.Row.FindControl("ddPDStatus");
                TextBox txtPDSupervisor = (TextBox)e.Row.FindControl("txtPDSupervisor");
                
                if (ddPDStatus != null)
                {
                    ddPDStatus.DataSource = ds.Tables[2];
                    ddPDStatus.DataValueField = "Status";
                    ddPDStatus.DataTextField = "Status";
                    ddPDStatus.DataBind();
                    //ddPDStatus.Items.Insert(0, new ListItem("--Select--", ""));

                    if (row["Status"].ToString().Length > 0)
                        ddPDStatus.SelectedIndex = ddPDStatus.Items.IndexOf(ddPDStatus.Items.FindByText(row["Status"].ToString()));
                    else
                        ddPDStatus.SelectedIndex = ddPDStatus.Items.IndexOf(ddPDStatus.Items.FindByText("Yet to Start"));
                }
                if (txtPDSupervisor != null)
                {
                    DataView dvSup = ds.Tables[4].DefaultView;
                    dvSup.RowFilter = "Department = '" + row["Department"].ToString() + "'";
                    if (dvSup.Count > 0)
                    {
                        string strSupList = "[";
                        for (int i = 0; i < dvSup.Count; i++)
                        {
                            if (i > 0) 
                                strSupList += ",";

                            strSupList += "{\"id\":\"" + dvSup[i]["Supervisor"].ToString() + "\",\"text\":\"" + dvSup[i]["SupervisorName"].ToString() + "\"}";
                        }

                        strSupList += "]";
                        txtPDSupervisor.Text = strSupList;
                        //txtPDSupervisor.Text = "[{\"id\":\"00013\",\"text\":\"Employee13 Lname\"}]";
                    }
                }
                HtmlGenericControl SupTag = (HtmlGenericControl)e.Row.FindControl("SupTag");

                if (Session["EmployeeRole"].ToString() == "Administrator" || Session["Department"].ToString() == row["Department"].ToString())
                {
                    e.Row.Enabled = true;
                    SupTag.Attributes.Add("class", "zSupTag");
                }
                else
                {
                    e.Row.Enabled = false;
                    SupTag.Attributes.Remove("class");
                }
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            String strerrmsg;
            string newUID; string newProjectID;
            result = saveopertion(out strerrmsg, out newUID, out newProjectID);
            if (result == true)
            {
                if (hidUID.Value == "")
                {
                    hidtoaster.Value = "success|Added successfully";
                    hidUID.Value = newUID;
                    txtProjectID.Text = newProjectID;
                    brdProjectID.InnerText = newProjectID;
                    Session["ProjectID"] = newProjectID;
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
            string newUID; string newProjectID;
            result = saveopertion(out strerrmsg, out newUID, out newProjectID);
            if (result == true)
            {
                if (hidUID.Value == "")
                {
                    hidtoaster.Value = "success|Added successfully";
                    hidUID.Value = newUID;
                    txtProjectID.Text = newProjectID;
                    brdProjectID.InnerText = newProjectID;
                    Session["ProjectID"] = newProjectID;
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
            string newUID; string newProjectID;
            result = saveopertion(out strerrmsg, out newUID, out newProjectID);
            if (result == true)
            {
                if (hidUID.Value == "")
                    hidtoaster.Value = "success|Added successfully";
                else
                    hidtoaster.Value = "success|Updated successfully";
                Response.Redirect("ProjectAll.aspx");
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
                hidtoaster.Value = "error|" + strerrmsg;
            }
        }

        protected Boolean saveopertion(out String strerrmsg, out string newUID, out string newProjectID)
        {
            string UID, ProjectID, ProposalRef, ResearchEngineer, ProjectName, ProjectDesc, ClientName, Agency, Leader, ProjectType, Department, Status, FWPOFieldwork, FWTypeofStudy, FWTargetSample, FWSampleCollected, FWTargetDate, FWConSentDate, FWType;
            string StartDate, EndDate;
            string[] DeptXML;
            string InvoiceXML;
            Boolean result = false;

            if (string.IsNullOrEmpty(hidUID.Value.Trim()) == true)
                UID = string.Empty;
            else
                UID = hidUID.Value;

            ProjectID = txtProjectID.Text.Trim();
            if (ProjectID.Length == 0 && strProjectIDNext.Length > 0)
                ProjectID = strProjectIDNext;

            ProposalRef = txtProposalID.Text.Trim();
            ResearchEngineer = (ddResearchEngineer.SelectedIndex == 0) ? string.Empty : ddResearchEngineer.SelectedValue;

            ProjectName = txtProjectName.Text.Trim();
            ProjectDesc = txtProjectDesc.Text.Trim();
            ClientName = (ddClientName.SelectedIndex == 0) ? string.Empty : ddClientName.SelectedValue;
            Agency = (ddAgency.SelectedIndex == 0) ? string.Empty : ddAgency.SelectedValue;
            Leader = (ddLeader.SelectedIndex == 0) ? string.Empty : ddLeader.SelectedValue;
            ProjectType = (ddProjectType.SelectedIndex == 0) ? string.Empty : ddProjectType.SelectedValue;
            Department = (ddDepartment.SelectedIndex == 0) ? string.Empty : ddDepartment.SelectedValue;
            StartDate = txtStartDate.Text;
            EndDate = txtEndDate.Text;
            Status = (ddStatus.SelectedIndex == 0) ? string.Empty : ddStatus.SelectedValue;

            FWPOFieldwork = txtFWPOFieldwork.Text.Trim();
            FWTypeofStudy = (ddFWTypeofStudy.SelectedIndex == 0) ? string.Empty : ddFWTypeofStudy.SelectedValue;
            FWTargetSample = txtFWTargetSample.Text.Trim();
            FWSampleCollected = txtFWSampleCollected.Text.Trim();
            FWTargetDate = txtFWTargetDate.Text.Trim();
            FWConSentDate = txtFWConSentDate.Text.Trim();


            //FWType = (ddFWType.SelectedIndex == 0) ? string.Empty : ddFWType.SelectedValue;
            FWType = string.Empty;
            if (duFWType.Text.Length > 0)
            {
                FWType = duFWType.Text.Replace("[", "").Replace("]", "").Replace("\"", "");
            }

            DeptXML = getDeptXML();

            InvoiceXML = getInvoiceXML();

            result = dl.UP_IU_Projects(UID, ProjectID, ProposalRef, ResearchEngineer, ProjectName, ProjectDesc, ClientName, Agency, Leader, ProjectType, Department, StartDate, EndDate, Status, FWPOFieldwork, FWTypeofStudy, FWTargetSample, FWSampleCollected, FWTargetDate, FWConSentDate, FWType, strloginuser, DeptXML[0], DeptXML[1], InvoiceXML, out strerrmsg, out newUID, out newProjectID);

            return result;


        }

        

        private string[] getDeptXML()
        {
            string[] xmldetails = new string[2];
            xmldetails[0] = string.Empty;
            xmldetails[1] = string.Empty;
            xmldetails[0] = "<root>";
            xmldetails[1] = "<root>";

            foreach (GridViewRow row in grdDepts.Rows)
            {
                Label lblUID = (Label)row.FindControl("lblUID");
                TextBox txtPDDepartment = (TextBox)row.FindControl("txtPDDepartment");
                TextBox txtPDSupervisor = (TextBox)row.FindControl("txtPDSupervisor");
                TextBox txtPDNoofHours = (TextBox)row.FindControl("txtPDNoofHours");
                TextBox txtPDTargetDate = (TextBox)row.FindControl("txtPDTargetDate");
                DropDownList ddPDStatus = (DropDownList)row.FindControl("ddPDStatus");

                if (txtPDSupervisor.Text.Trim().Length > 3 && txtPDNoofHours.Text.Trim().Length > 0
                        && txtPDTargetDate.Text.Trim().Length > 0 && ddPDStatus.Text.Trim().Length > 0)
                {
                    xmldetails[0] += "<detail><UID>" + lblUID.Text + "</UID>";
                    xmldetails[0] += "<Department>" + txtPDDepartment.Text + "</Department>";
                    //xmldetails[0] += "<Supervisor>" + txtPDSupervisor.Text + "</Supervisor>";
                    xmldetails[0] += "<NoofHours>" + txtPDNoofHours.Text + "</NoofHours>";
                    xmldetails[0] += "<TargetDate>" + txtPDTargetDate.Text + "</TargetDate>";
                    xmldetails[0] += "<Status>" + ddPDStatus.Text + "</Status>";
                    xmldetails[0] += "</detail>";

                    JavaScriptSerializer js = new JavaScriptSerializer();
                    Supervisor[] Supervisors = js.Deserialize<Supervisor[]>(txtPDSupervisor.Text);
                    if (Supervisors != null)
                    {
                        for (int i = 0; i < Supervisors.Length; i++)
                        {
                            xmldetails[1] += "<detail><Department>" + txtPDDepartment.Text + "</Department>";
                            xmldetails[1] += "<Supervisor>" + Supervisors[i].id + "</Supervisor>";
                            xmldetails[1] += "</detail>";
                        }
                    }
                }

            }

            xmldetails[0] += "</root>";
            xmldetails[1] += "</root>";

            return xmldetails;
        }

        public class Supervisor
        {
            public string id { get; set; }
            public string text { get; set; }
        }

        private string getInvoiceXML()
        {
            string xmldetails = string.Empty;
            xmldetails = "<root>";

            foreach (DataRow row in ds.Tables[3].Rows)
            {
                xmldetails += "<detail><ProjectRef>" + row["ProjectRef"].ToString() + "</ProjectRef>";
                xmldetails += "<RecordSequence>" + row["RecordSequence"].ToString() + "</RecordSequence>";
                xmldetails += "<BillingCurrency>" + row["BillingCurrency"].ToString() + "</BillingCurrency>";
                xmldetails += "<BillingAmount>" + row["BillingAmount"].ToString() + "</BillingAmount>";
                //xmldetails += "<PaymentTerms>" + row["PaymentTerms"].ToString() + "</PaymentTerms>";
                xmldetails += "<BaseCurrency>" + row["BaseCurrency"].ToString() + "</BaseCurrency>";
                xmldetails += "<BaseAmount>" + row["BaseAmount"].ToString() + "</BaseAmount>";
                xmldetails += "<InvoiceDate>" + row["InvoiceDate"].ToString() + "</InvoiceDate>";
                xmldetails += "</detail>";
            }

            xmldetails += "</root>";

            return xmldetails;
        }


        void BindInvGrid()
        {
            //dsInvoice = dl.UP_Fetch_ProjectInvoice(strProjectID);
            gvInvoice.DataSource = ds.Tables[3];
            gvInvoice.DataBind();

            if (ds.Tables[3].Rows.Count > 0)
            {
                ddBillingCurrency.SelectedIndex = ddBillingCurrency.Items.IndexOf(ddBillingCurrency.Items.FindByText(ds.Tables[3].Rows[0]["BillingCurrency"].ToString()));
                ddBillingCurrency.Enabled = false;
            }
            ddBaseCurrency.SelectedIndex = ddBaseCurrency.Items.IndexOf(ddBaseCurrency.Items.FindByText(ds.Tables[5].Rows[0]["BaseCurrency"].ToString()));

            lblagreed.Text = ds.Tables[0].Rows[0]["Agreed"].ToString();

            decimal TotalInvoiceAmount = 0, TotalPendingValue = 0;
            foreach (DataRow row in ds.Tables[3].Rows)
            {
                TotalInvoiceAmount += Convert.ToDecimal(row["BillingAmount"].ToString().Replace(",", ""));
            }

            lblTotalInvoiceAmount.Text = TotalInvoiceAmount.ToString();

            decimal agreedamount = 0;
            decimal.TryParse(ds.Tables[0].Rows[0]["Agreed"].ToString().Replace(",", ""), out agreedamount);

            TotalPendingValue = agreedamount - TotalInvoiceAmount;
            if (TotalPendingValue < 0)
                TotalPendingValue =0;

            lblTotalPendingValue.Text = TotalPendingValue.ToString();
            
        }

        protected void btnAddInvoice_Click(object sender, EventArgs e)
        {
            /*string UID,ProjectRef,BillingCurrency,BillingAmount,PaymentTerms,BaseCurrency,BaseAmount;
            Boolean result;

            UID = string.Empty;
            ProjectRef = strProjectID;
            BillingCurrency = ddBillingCurrency.Text;
            BillingAmount = txtBillingAmount.Text;
            PaymentTerms = txtPaymentTerms.Text;
            BaseCurrency = ddBaseCurrency.Text;
            BaseAmount = txtBaseAmount.Text;

            result = dl.UP_IU_ProjectInvoice(UID, ProjectRef, BillingCurrency, BillingAmount, PaymentTerms, BaseCurrency, BaseAmount, strloginuser);

            if (result == true)
            {
                hidtoaster.Value = "success|Added successfully";
                BindInvGrid();
                resetInvcoltrols();
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }*/

            int LastSequence = 0;
            if (ds.Tables[3].Rows.Count > 0)
                LastSequence = Convert.ToInt32(ds.Tables[3].Compute("max(RecordSequence)", string.Empty));
            LastSequence++;

            DataRow dr = ds.Tables[3].NewRow();
            dr["ProjectRef"] = strProjectID;
            dr["RecordSequence"] = LastSequence.ToString();
            dr["BillingCurrency"] = ddBillingCurrency.Text;
            dr["BillingAmount"] = txtBillingAmount.Text;
            //dr["PaymentTerms"] = txtPaymentTerms.Text;
            dr["BaseCurrency"] = ddBaseCurrency.Text;
            dr["BaseAmount"] = txtBaseAmount.Text;
            dr["InvoiceDate"] = txtInvoiceDate.Text;
            
            ds.Tables[3].Rows.Add(dr);
            ds.Tables[3].AcceptChanges();
            resetInvcoltrols();
            BindInvGrid();
            hidtab.Value = "#tab4";
        }

        protected void btnUpdateInvoice_Click(object sender, EventArgs e)
        {
            /*string UID, ProjectRef, BillingCurrency, BillingAmount, PaymentTerms, BaseCurrency, BaseAmount;
            Boolean result;

            UID = hidInvUID.Value; 
            ProjectRef = strProjectID;
            BillingCurrency = ddBillingCurrency.Text;
            BillingAmount = txtBillingAmount.Text;
            PaymentTerms = txtPaymentTerms.Text;
            BaseCurrency = ddBaseCurrency.Text;
            BaseAmount = txtBaseAmount.Text;

            result = dl.UP_IU_ProjectInvoice(UID, ProjectRef, BillingCurrency, BillingAmount, PaymentTerms, BaseCurrency, BaseAmount, strloginuser);

            if (result == true)
            {
                hidtoaster.Value = "success|Updated successfully";
                BindInvGrid();
                resetInvcoltrols();
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }*/

            DataView dt = ds.Tables[3].DefaultView;
            dt.RowFilter = "RecordSequence = " + hidRecordSequence.Value;
            if (dt.Count == 1)
            {
                dt[0]["BillingCurrency"] = ddBillingCurrency.Text;
                dt[0]["BillingAmount"] = txtBillingAmount.Text;
                //dt[0]["PaymentTerms"] = txtPaymentTerms.Text;
                dt[0]["BaseCurrency"] = ddBaseCurrency.Text;
                dt[0]["BaseAmount"] = txtBaseAmount.Text;
                dt[0]["InvoiceDate"] = txtInvoiceDate.Text;

                ds.Tables[3].AcceptChanges();
                
            }
            dt.RowFilter = "";
            resetInvcoltrols();
            BindInvGrid();
            ViewState["BaseData"] = ds;

            hidtab.Value = "#tab4";
        }

        void resetInvcoltrols()
        {
            hidRecordSequence.Value = string.Empty;
            ddBillingCurrency.SelectedIndex = 0;
            txtBillingAmount.Text = string.Empty;
            txtPaymentTerms.Text = string.Empty;
            ddBaseCurrency.SelectedIndex = 0;
            txtBaseAmount.Text = string.Empty;
            txtInvoiceDate.Text = string.Empty;
        }

        protected void gvInv_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvInv_RowCommand(object sender, GridViewRowEventArgs e)
        {
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
                        ddpagesize.SelectedValue = gvInvoice.PageSize.ToString();
                    }

                    LinkButton pgprev = (LinkButton)pagerRow.Cells[0].FindControl("pgprev");
                    LinkButton pgfirst = (LinkButton)pagerRow.Cells[0].FindControl("pgfirst");
                    LinkButton pgsecond = (LinkButton)pagerRow.Cells[0].FindControl("pgsecond");
                    LinkButton pgthird = (LinkButton)pagerRow.Cells[0].FindControl("pgthird");
                    LinkButton pgfourth = (LinkButton)pagerRow.Cells[0].FindControl("pgfourth");
                    LinkButton pgfifth = (LinkButton)pagerRow.Cells[0].FindControl("pgfifth");
                    LinkButton pgnext = (LinkButton)pagerRow.Cells[0].FindControl("pgnext");

                    switch (gvInvoice.PageCount)
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
                    int currentPage = gvInvoice.PageIndex + 1;
                    if (currentPage <= 3)
                    {
                        pgfirst.Text = "1"; pgsecond.Text = "2"; pgthird.Text = "3"; pgfourth.Text = "4"; pgfifth.Text = "5";
                    }
                    else if (gvInvoice.PageCount - currentPage <= 1)
                    {
                        pgfifth.Text = gvInvoice.PageCount.ToString();
                        pgfourth.Text = (gvInvoice.PageCount - 1).ToString();
                        pgthird.Text = (gvInvoice.PageCount - 2).ToString();
                        pgsecond.Text = (gvInvoice.PageCount - 3).ToString();
                        pgfirst.Text = (gvInvoice.PageCount - 4).ToString();
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
                    if (currentPage == gvInvoice.PageCount)
                        pgnext.Enabled = false;


                    if (pageLabel != null)
                    {
                        //int currentPage = GridView1.PageIndex + 1;
                        int pagesize = gvInvoice.PageSize;
                        int startcnt = gvInvoice.PageIndex * pagesize + 1;
                        int endcnt = (gvInvoice.PageIndex + 1) * pagesize;
                        endcnt = (endcnt > totalrecordsinvoice) ? totalrecordsinvoice : endcnt;

                        pageLabel.Text = "Showing " + startcnt.ToString() + " to " + endcnt.ToString() +
                          " of " + totalrecordsinvoice.ToString() + " entries";

                    }

                }

            }
        }

        protected void btn_selectInvoice_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            Label lblInvUID = (Label)row.FindControl("lblInvUID");
            Label lblInvRecordSequence = (Label)row.FindControl("lblInvRecordSequence");
            Label BillingCurrency = (Label)row.FindControl("BillingCurrency");
            Label BillingAmount = (Label)row.FindControl("BillingAmount");
            //Label PaymentTerms = (Label)row.FindControl("PaymentTerms");
            Label BaseCurrency = (Label)row.FindControl("BaseCurrency");
            Label BaseAmount = (Label)row.FindControl("BaseAmount");
            Label InvoiceDate = (Label)row.FindControl("InvoiceDate");

            hidRecordSequence.Value = lblInvRecordSequence.Text;
            ddBillingCurrency.SelectedIndex = ddBillingCurrency.Items.IndexOf(ddBillingCurrency.Items.FindByText(BillingCurrency.Text));
            txtBillingAmount.Text = BillingAmount.Text;
            //txtPaymentTerms.Text = PaymentTerms.Text;
            ddBaseCurrency.SelectedIndex = ddBaseCurrency.Items.IndexOf(ddBaseCurrency.Items.FindByText(BaseCurrency.Text));
            txtBaseAmount.Text = BaseAmount.Text;
            txtInvoiceDate.Text = InvoiceDate.Text;

            hidtab.Value = "#tab4";

        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindInvGrid();
            gvInvoice.PageIndex = e.NewPageIndex;
            gvInvoice.DataBind();
        }

        protected void OnPaging(object sender, EventArgs e)
        {
            LinkButton lbsender = (LinkButton)sender;
            int newpageindex;
            switch (lbsender.Text)
            {
                case "<":
                    newpageindex = (gvInvoice.PageIndex == 0) ? 0 : gvInvoice.PageIndex - 1;
                    break;
                case ">":
                    newpageindex = (gvInvoice.PageIndex + 1 == gvInvoice.PageCount) ? gvInvoice.PageCount : gvInvoice.PageIndex + 1;
                    break;
                default:
                    newpageindex = Convert.ToInt16(lbsender.Text) - 1;
                    break;
            }
            BindInvGrid();
            gvInvoice.PageIndex = newpageindex;
            gvInvoice.DataBind();
        }

        protected void PageSize_Changed(Object sender, EventArgs e)
        {
            DataTable dtpz = dl.dt_PageSize();
            DropDownList ddpagesize = (DropDownList)gvInvoice.BottomPagerRow.Cells[0].FindControl("ddpagesize");

            BindInvGrid();
            gvInvoice.PageSize = Convert.ToInt16(ddpagesize.SelectedValue);
            gvInvoice.DataBind();
        }

        [System.Web.Services.WebMethod]
        public static string CalculateBaseAmount(DateTime InvoiceDate, string BillingCurrency, string BillingAmount)
        {
            dal dl = new dal();
            DataSet dsResult;
            string returnValue = string.Empty;
            try
            {
                dsResult = dl.UP_Fetch_BaseAmount(InvoiceDate, BillingCurrency, BillingAmount.Replace(",",""));
                if (dsResult.Tables[0].Rows.Count == 1)
                {
                    returnValue = dsResult.Tables[0].Rows[0]["Result"].ToString();
                }
                else
                {
                    returnValue = "Unable to calculate base amount.";
                }
            }
            catch (Exception ex)
            {
                returnValue = "Unable to calculate base amount.";
            }
            return returnValue;
        }
    }
}
