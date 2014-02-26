using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Text;

namespace KedSys35
{
    public class dal
    {

#region proposal

        public DataSet UP_Fetch_Proposal(string EmployeeID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Proposal");
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, string.IsNullOrEmpty(EmployeeID) ? (object)DBNull.Value : EmployeeID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_Proposal_Costs(string ProposalID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Proposal_Costs");
            objDataBase.AddInParameter(cmd, "@ProposalID", DbType.String, (ProposalID == "") ? (object)DBNull.Value : ProposalID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_Proposal_Tasks(string ProposalID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Proposal_Tasks");
            objDataBase.AddInParameter(cmd, "@ProposalID", DbType.String, (ProposalID == "") ? (object)DBNull.Value : ProposalID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_Proposal_Task_LoadStatus(string ProposalID, string TaskXML)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Proposal_Task_LoadStatus");
            objDataBase.AddInParameter(cmd, "@ProposalID", DbType.String, (ProposalID == "") ? (object)DBNull.Value : ProposalID);
            objDataBase.AddInParameter(cmd, "@TaskXML", DbType.String, (TaskXML == "") ? (object)DBNull.Value : TaskXML);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_Proposal_DD()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            ds = objDataBase.ExecuteDataSet("UP_Fetch_Proposal_DD");
            return ds;
        }

        public DataSet UP_Fetch_Proposal_DD_Sector(string AccountName)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Proposal_DD_Sector");
            objDataBase.AddInParameter(cmd, "@AccountName", DbType.String, (AccountName == "") ? (object)DBNull.Value : AccountName);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_Proposals(string UID, string ProposalID, string ProposalDesc, string ClientName, string Manager, string Leader, string BroadCategory, string RFQRefDate, string Department, string Market, string Coordinator, string CurrencyType, string Value, string Offered, string Agreed, string Duedate, string Senddate, string Approvaldate, string Typeofstudy, string ProjectType, string ProjectDesc, string Probability, string Agency, string Status, string ProjectRefID, string Comments, string AgreedBaseCurrency, string strloginuser, string CostXML, string TimeCostXML, string TaskXML, out string strerrmsg, out string newUID, out string newProposalID)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            strerrmsg = "";
            newUID = "";
            newProposalID = "";
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_Proposals");

                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
                objDataBase.AddInParameter(cmd, "@ProposalID", DbType.String, (ProposalID == string.Empty) ? (object)DBNull.Value : ProposalID);
                objDataBase.AddInParameter(cmd, "@ProposalDesc", DbType.String, (ProposalDesc == string.Empty) ? (object)DBNull.Value : ProposalDesc);
                objDataBase.AddInParameter(cmd, "@ClientName", DbType.String, (ClientName == string.Empty) ? (object)DBNull.Value : ClientName);
                objDataBase.AddInParameter(cmd, "@Manager", DbType.String, (Manager == string.Empty) ? (object)DBNull.Value : Manager);
                objDataBase.AddInParameter(cmd, "@Leader", DbType.String, (Leader == string.Empty) ? (object)DBNull.Value : Leader);
                objDataBase.AddInParameter(cmd, "@BroadCategory", DbType.String, (BroadCategory == string.Empty) ? (object)DBNull.Value : BroadCategory);
                objDataBase.AddInParameter(cmd, "@RFQRefDate", DbType.String, (RFQRefDate == string.Empty) ? (object)DBNull.Value : RFQRefDate);
                objDataBase.AddInParameter(cmd, "@Department", DbType.String, (Department == string.Empty) ? (object)DBNull.Value : Department);
                objDataBase.AddInParameter(cmd, "@Market", DbType.String, (Market == string.Empty) ? (object)DBNull.Value : Market);
                objDataBase.AddInParameter(cmd, "@Coordinator", DbType.String, (Coordinator == string.Empty) ? (object)DBNull.Value : Coordinator);
                objDataBase.AddInParameter(cmd, "@CurrencyType", DbType.String, (CurrencyType == string.Empty) ? (object)DBNull.Value : CurrencyType);
                objDataBase.AddInParameter(cmd, "@Value", DbType.String, (Value == string.Empty) ? (object)DBNull.Value : Value);
                objDataBase.AddInParameter(cmd, "@Offered", DbType.String, (Offered == string.Empty) ? (object)DBNull.Value : Offered);
                objDataBase.AddInParameter(cmd, "@Agreed", DbType.String, (Agreed == string.Empty) ? (object)DBNull.Value : Agreed);
                objDataBase.AddInParameter(cmd, "@Duedate", DbType.String, (Duedate == string.Empty) ? (object)DBNull.Value : Duedate);
                objDataBase.AddInParameter(cmd, "@Senddate", DbType.String, (Senddate == string.Empty) ? (object)DBNull.Value : Senddate);
                objDataBase.AddInParameter(cmd, "@Approvaldate", DbType.String, (Approvaldate == string.Empty) ? (object)DBNull.Value : Approvaldate);
                objDataBase.AddInParameter(cmd, "@Typeofstudy", DbType.String, (Typeofstudy == string.Empty) ? (object)DBNull.Value : Typeofstudy);
                objDataBase.AddInParameter(cmd, "@ProjectType", DbType.String, (ProjectType == string.Empty) ? (object)DBNull.Value : ProjectType);
                objDataBase.AddInParameter(cmd, "@ProjectDesc", DbType.String, (ProjectDesc == string.Empty) ? (object)DBNull.Value : ProjectDesc);
                objDataBase.AddInParameter(cmd, "@Probability", DbType.String, (Probability == string.Empty) ? (object)DBNull.Value : Probability);
                objDataBase.AddInParameter(cmd, "@Agency", DbType.String, (Agency == string.Empty) ? (object)DBNull.Value : Agency);
                objDataBase.AddInParameter(cmd, "@Status", DbType.String, (Status == string.Empty) ? (object)DBNull.Value : Status);
                objDataBase.AddInParameter(cmd, "@ProjectRefID", DbType.String, (ProjectRefID == string.Empty) ? (object)DBNull.Value : ProjectRefID);
                objDataBase.AddInParameter(cmd, "@Comments", DbType.String, (Comments == string.Empty) ? (object)DBNull.Value : Comments);
                objDataBase.AddInParameter(cmd, "@AgreedBaseCurrency", DbType.String, (AgreedBaseCurrency == string.Empty) ? (object)DBNull.Value : AgreedBaseCurrency);
                objDataBase.AddInParameter(cmd, "@CostXML", DbType.String, (CostXML == string.Empty) ? (object)DBNull.Value : CostXML);
                objDataBase.AddInParameter(cmd, "@TimeCostXML", DbType.String, (TimeCostXML == string.Empty) ? (object)DBNull.Value : TimeCostXML);
                objDataBase.AddInParameter(cmd, "@TaskXML", DbType.String, (TaskXML == string.Empty) ? (object)DBNull.Value : TaskXML);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                ds = objDataBase.ExecuteDataSet(cmd);

                if (ds.Tables[0].Rows.Count == 1)
                {
                    newUID = ds.Tables[0].Rows[0]["newUID"].ToString();
                    newProposalID = ds.Tables[0].Rows[0]["newProposalID"].ToString();
                }
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                strerrmsg = ex.Message.ToString();
                result = false;
                
            }
            return result;
        }

        public void UP_D_Proposals(string UID, string ProposalID, string strloginuser)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_D_Proposals");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
            objDataBase.AddInParameter(cmd, "@ProposalID", DbType.String, (ProposalID == string.Empty) ? (object)DBNull.Value : ProposalID);
            objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
            objDataBase.ExecuteDataSet(cmd);
        }
        

#endregion

#region proposaldashboard

        public DataSet UP_Fetch_ProposalDB(string EmployeeID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProposalDB");
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, string.IsNullOrEmpty(EmployeeID) ? (object)DBNull.Value : EmployeeID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_ProposalDBChart(string XType, DateTime MonthYear, string EmployeeID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProposalDBChart");
            objDataBase.AddInParameter(cmd, "@XType", DbType.String, (XType == "") ? (object)DBNull.Value : XType);
            objDataBase.AddInParameter(cmd, "@MonthYear", DbType.DateTime, (MonthYear.ToString() == "") ? (object)DBNull.Value : MonthYear);
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, string.IsNullOrEmpty(EmployeeID) ? (object)DBNull.Value : EmployeeID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }
#endregion

#region projectdashboard
        public DataSet UP_Fetch_ProjectDB(string EmployeeID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProjectDB");
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, string.IsNullOrEmpty(EmployeeID) ? (object)DBNull.Value : EmployeeID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_ProjectDBChart(string XType, DateTime MonthYear, string EmployeeID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProjectDBChart");
            objDataBase.AddInParameter(cmd, "@XType", DbType.String, (XType == "") ? (object)DBNull.Value : XType);
            objDataBase.AddInParameter(cmd, "@MonthYear", DbType.DateTime, (MonthYear.ToString() == "") ? (object)DBNull.Value : MonthYear);
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, string.IsNullOrEmpty(EmployeeID) ? (object)DBNull.Value : EmployeeID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }
#endregion

#region dashboard

        public DataSet UP_Fetch_Dashboard()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Dashboard");
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_Dashboard_Proposal()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Dashboard_Proposal");
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_Dashboard_Project()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Dashboard_Project");
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

#endregion

#region project

        public DataSet UP_Fetch_Project_DD()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            ds = objDataBase.ExecuteDataSet("UP_Fetch_Project_DD");
            return ds;
        }

        public DataSet UP_Fetch_Project(string ProjectID, string ProposalRef)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Project");
            objDataBase.AddInParameter(cmd, "@ProjectID", DbType.String, (ProjectID == "") ? (object)DBNull.Value : ProjectID);
            objDataBase.AddInParameter(cmd, "@ProposalRef", DbType.String, (ProposalRef == "") ? (object)DBNull.Value : ProposalRef);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_ProjectAll(string EmployeeID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProjectAll");
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, string.IsNullOrEmpty(EmployeeID) ? (object)DBNull.Value : EmployeeID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_Project_Task_LoadStatus(string ProjectID, string TaskXML)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Project_Task_LoadStatus");
            objDataBase.AddInParameter(cmd, "@ProjectID", DbType.String, (ProjectID == "") ? (object)DBNull.Value : ProjectID);
            objDataBase.AddInParameter(cmd, "@TaskXML", DbType.String, (TaskXML == "") ? (object)DBNull.Value : TaskXML);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_Projects(string UID, string ProjectID, string ProposalRef, string ResearchEngineer, string ProjectName, string ProjectDesc, string ClientName, string Agency, string Leader, string ProjectType, string Department, string StartDate, string EndDate, string Status, string FWPOFieldwork, string FWTypeofStudy, string FWTargetSample, string FWSampleCollected, string FWTargetDate, string FWConSentDate, string FWType, string ActualCompletionDate, string strloginuser, string DeptXML, string DeptSupervisors, string InvoiceXML, out string strerrmsg, out string newUID, out string newProjectID)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            strerrmsg = "";
            newUID = "";
            newProjectID = "";
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_Projects");

                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
                objDataBase.AddInParameter(cmd, "@ProjectID", DbType.String, (ProjectID == string.Empty) ? (object)DBNull.Value : ProjectID);
                objDataBase.AddInParameter(cmd, "@ProposalRef", DbType.String, (ProposalRef == string.Empty) ? (object)DBNull.Value : ProposalRef);
                objDataBase.AddInParameter(cmd, "@ResearchEngineer", DbType.String, (ResearchEngineer == string.Empty) ? (object)DBNull.Value : ResearchEngineer);
                objDataBase.AddInParameter(cmd, "@ProjectName", DbType.String, (ProjectName == string.Empty) ? (object)DBNull.Value : ProjectName);
                objDataBase.AddInParameter(cmd, "@ProjectDesc", DbType.String, (ProjectDesc == string.Empty) ? (object)DBNull.Value : ProjectDesc);
                objDataBase.AddInParameter(cmd, "@ClientName", DbType.String, (ClientName == string.Empty) ? (object)DBNull.Value : ClientName);
                objDataBase.AddInParameter(cmd, "@Agency", DbType.String, (Agency == string.Empty) ? (object)DBNull.Value : Agency);
                objDataBase.AddInParameter(cmd, "@Leader", DbType.String, (Leader == string.Empty) ? (object)DBNull.Value : Leader);
                objDataBase.AddInParameter(cmd, "@ProjectType", DbType.String, (ProjectType == string.Empty) ? (object)DBNull.Value : ProjectType);
                objDataBase.AddInParameter(cmd, "@Department", DbType.String, (Department == string.Empty) ? (object)DBNull.Value : Department);
                objDataBase.AddInParameter(cmd, "@StartDate", DbType.String, (StartDate == string.Empty) ? (object)DBNull.Value : StartDate);
                objDataBase.AddInParameter(cmd, "@EndDate", DbType.String, (EndDate == string.Empty) ? (object)DBNull.Value : EndDate);
                objDataBase.AddInParameter(cmd, "@Status", DbType.String, (Status == string.Empty) ? (object)DBNull.Value : Status);
                objDataBase.AddInParameter(cmd, "@FWPOFieldwork", DbType.String, (FWPOFieldwork == string.Empty) ? (object)DBNull.Value : FWPOFieldwork);
                objDataBase.AddInParameter(cmd, "@FWTypeofStudy", DbType.String, (FWTypeofStudy == string.Empty) ? (object)DBNull.Value : FWTypeofStudy);
                objDataBase.AddInParameter(cmd, "@FWTargetSample", DbType.String, (FWTargetSample == string.Empty) ? (object)DBNull.Value : FWTargetSample);
                objDataBase.AddInParameter(cmd, "@FWSampleCollected", DbType.String, (FWSampleCollected == string.Empty) ? (object)DBNull.Value : FWSampleCollected);
                objDataBase.AddInParameter(cmd, "@FWTargetDate", DbType.String, (FWTargetDate == string.Empty) ? (object)DBNull.Value : FWTargetDate);
                objDataBase.AddInParameter(cmd, "@FWConSentDate", DbType.String, (FWConSentDate == string.Empty) ? (object)DBNull.Value : FWConSentDate);
                objDataBase.AddInParameter(cmd, "@FWType", DbType.String, (FWType == string.Empty) ? (object)DBNull.Value : FWType);
                objDataBase.AddInParameter(cmd, "@ActualCompletionDate", DbType.String, (ActualCompletionDate == string.Empty) ? (object)DBNull.Value : ActualCompletionDate);
                objDataBase.AddInParameter(cmd, "@DeptXML", DbType.String, (DeptXML == string.Empty) ? (object)DBNull.Value : DeptXML);
                objDataBase.AddInParameter(cmd, "@DeptSupervisors", DbType.String, (DeptSupervisors == string.Empty) ? (object)DBNull.Value : DeptSupervisors);
                objDataBase.AddInParameter(cmd, "@InvoiceXML", DbType.String, (InvoiceXML == string.Empty) ? (object)DBNull.Value : InvoiceXML);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                ds = objDataBase.ExecuteDataSet(cmd);

                if (ds.Tables[0].Rows.Count == 1)
                {
                    newUID = ds.Tables[0].Rows[0]["newUID"].ToString();
                    newProjectID = ds.Tables[0].Rows[0]["newProjectID"].ToString();
                }
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                strerrmsg = ex.Message.ToString();
                result = false;

            }
            return result;
        }

        public DataSet UP_Fetch_Project_Tasks(string ProjectID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Project_Tasks");
            objDataBase.AddInParameter(cmd, "@ProjectID", DbType.String, (ProjectID == "") ? (object)DBNull.Value : ProjectID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_ProjectTasks(string ProjectID, string TaskXML, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_ProjectTasks");

                objDataBase.AddInParameter(cmd, "@ProjectID", DbType.String, (ProjectID == string.Empty) ? (object)DBNull.Value : ProjectID);
                objDataBase.AddInParameter(cmd, "@TaskXML", DbType.String, (TaskXML == string.Empty) ? (object)DBNull.Value : TaskXML);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                objDataBase.ExecuteDataSet(cmd);

                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;

            }
            return result;
        }

#endregion

#region projectinvoice
        public DataSet UP_Fetch_ProjectInvoiceGrid()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProjectInvoiceGrid");
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_ProjectInvoice(string ProjectRef)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProjectInvoice");
            objDataBase.AddInParameter(cmd, "@ProjectRef", DbType.String, (ProjectRef == "") ? (object)DBNull.Value : ProjectRef);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_ProjectInvoice_UID(string UID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProjectInvoice_UID");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_ProjectInvoice(string UID, string ProjectRef, string BillingCurrency, string BillingAmount, string PaymentTerms, string BaseCurrency, string BaseAmount, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_ProjectInvoice");

                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
                objDataBase.AddInParameter(cmd, "@ProjectRef", DbType.String, (ProjectRef == string.Empty) ? (object)DBNull.Value : ProjectRef);
                objDataBase.AddInParameter(cmd, "@BillingCurrency", DbType.String, (BillingCurrency == string.Empty) ? (object)DBNull.Value : BillingCurrency);
                objDataBase.AddInParameter(cmd, "@BillingAmount", DbType.String, (BillingAmount == string.Empty) ? (object)DBNull.Value : BillingAmount);
                objDataBase.AddInParameter(cmd, "@PaymentTerms", DbType.String, (PaymentTerms == string.Empty) ? (object)DBNull.Value : PaymentTerms);
                objDataBase.AddInParameter(cmd, "@BaseCurrency", DbType.String, (BaseCurrency == string.Empty) ? (object)DBNull.Value : BaseCurrency);
                objDataBase.AddInParameter(cmd, "@BaseAmount", DbType.String, (BaseAmount == string.Empty) ? (object)DBNull.Value : BaseAmount);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                ds = objDataBase.ExecuteDataSet(cmd);

                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;

            }
            return result;
        }

        public DataSet UP_Fetch_ProjectInvoiceDD()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ProjectInvoiceDD");
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_U_ProjectInvoice(string UID, string ProjectID, string BillingCurrency, string BillingAmount, string PaymentTerms, string BaseCurrency, string BaseAmount, string ReceivedAmount, string ReceivedDate, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_U_ProjectInvoice");

                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
                objDataBase.AddInParameter(cmd, "@ProjectID", DbType.String, (ProjectID == string.Empty) ? (object)DBNull.Value : ProjectID);
                objDataBase.AddInParameter(cmd, "@BillingCurrency", DbType.String, (BillingCurrency == string.Empty) ? (object)DBNull.Value : BillingCurrency);
                objDataBase.AddInParameter(cmd, "@BillingAmount", DbType.String, (BillingAmount == string.Empty) ? (object)DBNull.Value : BillingAmount);
                objDataBase.AddInParameter(cmd, "@PaymentTerms", DbType.String, (PaymentTerms == string.Empty) ? (object)DBNull.Value : PaymentTerms);
                objDataBase.AddInParameter(cmd, "@BaseCurrency", DbType.String, (BaseCurrency == string.Empty) ? (object)DBNull.Value : BaseCurrency);
                objDataBase.AddInParameter(cmd, "@BaseAmount", DbType.String, (BaseAmount == string.Empty) ? (object)DBNull.Value : BaseAmount);
                objDataBase.AddInParameter(cmd, "@ReceivedAmount", DbType.String, (ReceivedAmount == string.Empty) ? (object)DBNull.Value : ReceivedAmount);
                objDataBase.AddInParameter(cmd, "@ReceivedDate", DbType.String, (ReceivedDate == string.Empty) ? (object)DBNull.Value : ReceivedDate);

                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                ds = objDataBase.ExecuteDataSet(cmd);

                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;

            }
            return result;
        }

        public DataSet UP_Fetch_BaseAmount(DateTime InvoiceDate, string BillingCurrency, string BillingAmount)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_BaseAmount");
            objDataBase.AddInParameter(cmd, "@InvoiceDate", DbType.DateTime, InvoiceDate);
            objDataBase.AddInParameter(cmd, "@BillingCurrency", DbType.String, (BillingCurrency == "") ? (object)DBNull.Value : BillingCurrency);
            objDataBase.AddInParameter(cmd, "@BillingAmount", DbType.String, (BillingAmount == "") ? (object)DBNull.Value : BillingAmount);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

#endregion

#region TimeSheet

        public DataSet UP_Fetch_TimeSheet_DD(string UserID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_TimeSheet_DD");
            objDataBase.AddInParameter(cmd, "@UserID", DbType.String, (UserID == "") ? (object)DBNull.Value : UserID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_TimeSheet(string EmployeeID, string TimeSheetDate)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_TimeSheet");
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, (EmployeeID == "") ? (object)DBNull.Value : EmployeeID);
            objDataBase.AddInParameter(cmd, "@TimeSheetDate", DbType.String, (TimeSheetDate == "") ? (object)DBNull.Value : TimeSheetDate);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_I_TimeSheetLog_Start(string EmployeeID, string TimeSheetDate, string ProjectTaskUID, string ProjectRef, string TaskName, string AdhocTask, DateTime StartTime)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_I_TimeSheetLog_Start");
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, (EmployeeID == "") ? (object)DBNull.Value : EmployeeID);
            objDataBase.AddInParameter(cmd, "@TimeSheetDate", DbType.String, (TimeSheetDate == "") ? (object)DBNull.Value : TimeSheetDate);
            objDataBase.AddInParameter(cmd, "@ProjectTaskUID", DbType.String, (ProjectTaskUID == string.Empty) ? (object)DBNull.Value : ProjectTaskUID);
            objDataBase.AddInParameter(cmd, "@ProjectRef", DbType.String, (ProjectRef == string.Empty) ? (object)DBNull.Value : ProjectRef);
            objDataBase.AddInParameter(cmd, "@TaskName", DbType.String, (TaskName == string.Empty) ? (object)DBNull.Value : TaskName);
            objDataBase.AddInParameter(cmd, "@AdhocTask", DbType.String, (AdhocTask == string.Empty) ? (object)DBNull.Value : AdhocTask);
            objDataBase.AddInParameter(cmd, "@StartTime", DbType.DateTime, StartTime);

            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_I_TimeSheetLog_Start_Override(string UID, string EmployeeID, string TimeSheetDate, string ProjectTaskUID, string ProjectRef, string TaskName, string AdhocTask)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_I_TimeSheetLog_Start_Override");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, (EmployeeID == "") ? (object)DBNull.Value : EmployeeID);
            objDataBase.AddInParameter(cmd, "@TimeSheetDate", DbType.String, (TimeSheetDate == "") ? (object)DBNull.Value : TimeSheetDate);
            objDataBase.AddInParameter(cmd, "@ProjectTaskUID", DbType.String, (ProjectTaskUID == string.Empty) ? (object)DBNull.Value : ProjectTaskUID);
            objDataBase.AddInParameter(cmd, "@ProjectRef", DbType.String, (ProjectRef == string.Empty) ? (object)DBNull.Value : ProjectRef);
            objDataBase.AddInParameter(cmd, "@TaskName", DbType.String, (TaskName == string.Empty) ? (object)DBNull.Value : TaskName);
            objDataBase.AddInParameter(cmd, "@AdhocTask", DbType.String, (AdhocTask == string.Empty) ? (object)DBNull.Value : AdhocTask);


            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_U_TimeSheetLog_StopEnd(string UID, DateTime EndTime, string TaskLogStatus, string Comments, string TotalMinutes, string Overridden)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_U_TimeSheetLog_StopEnd");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, UID);
            objDataBase.AddInParameter(cmd, "@EndTime", DbType.DateTime, EndTime);
            objDataBase.AddInParameter(cmd, "@TaskLogStatus", DbType.String, (TaskLogStatus == string.Empty) ? (object)DBNull.Value : TaskLogStatus);
            objDataBase.AddInParameter(cmd, "@Comments", DbType.String, (Comments == string.Empty) ? (object)DBNull.Value : Comments);
            objDataBase.AddInParameter(cmd, "@TotalMinutes", DbType.String, (TotalMinutes == string.Empty) ? (object)DBNull.Value : TotalMinutes);
            objDataBase.AddInParameter(cmd, "@Overridden", DbType.String, (Overridden == string.Empty) ? (object)DBNull.Value : Overridden);

            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_D_TimeSheetLog(string UID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_D_TimeSheetLog");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, UID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_TimeSheetLog(string EmployeeID, string TimeSheetDate, string TSXML)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_TimeSheetLog");
                objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, (EmployeeID == "") ? (object)DBNull.Value : EmployeeID);
                objDataBase.AddInParameter(cmd, "@TimeSheetDate", DbType.String, (TimeSheetDate == "") ? (object)DBNull.Value : TimeSheetDate);
                objDataBase.AddInParameter(cmd, "@TSXML", DbType.String, (TSXML == "") ? (object)DBNull.Value : TSXML);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }

        

        public Boolean UP_IU_TimeSheet(string EmployeeID, string TimeSheetDate, string InTime, string OutTime, string Updateby)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_TimeSheet");
                objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, (EmployeeID == string.Empty) ? (object)DBNull.Value : EmployeeID);
                objDataBase.AddInParameter(cmd, "@TimeSheetDate", DbType.String, (TimeSheetDate == string.Empty) ? (object)DBNull.Value : TimeSheetDate);
                objDataBase.AddInParameter(cmd, "@InTime", DbType.String, (InTime == string.Empty) ? (object)DBNull.Value : InTime);
                objDataBase.AddInParameter(cmd, "@OutTime", DbType.String, (OutTime == string.Empty) ? (object)DBNull.Value : OutTime);
                objDataBase.AddInParameter(cmd, "@Updateby", DbType.String, (Updateby == string.Empty) ? (object)DBNull.Value : Updateby);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }
        
#endregion



#region accounts_master
        public DataSet UP_Fetch_Accounts()
        {
            //Database objDataBase = DatabaseFactory.CreateDatabase();
            //DataSet ds = new DataSet();
            //ds = objDataBase.ExecuteDataSet("UP_Fetch_Accounts");
            //return ds;

            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Accounts");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, DBNull.Value);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_Accounts(string UID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Accounts");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? string.Empty : UID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_Accounts(string UID, string AccountName,string AccountType,string AddrBilling,string City,string Country,string EmailAdd,string Website,string TaxNo,string Sector,string Phone,string Fax,string annual_rev,string NoOfEmp,string Notes,string PrimaryContactID, string Approved, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_Accounts");
                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? string.Empty:UID  );
                objDataBase.AddInParameter(cmd, "@AccountName", DbType.String, (AccountName == string.Empty) ? (object)DBNull.Value : AccountName);
                objDataBase.AddInParameter(cmd, "@AccountType", DbType.String, (AccountType == "0") ? (object)DBNull.Value : AccountType);
                objDataBase.AddInParameter(cmd, "@AddrBilling", DbType.String, (AddrBilling == string.Empty) ? (object)DBNull.Value : AddrBilling);
                objDataBase.AddInParameter(cmd, "@City", DbType.String, (City == string.Empty) ? (object)DBNull.Value : City);
                objDataBase.AddInParameter(cmd, "@Country", DbType.String, (Country == string.Empty) ? (object)DBNull.Value : Country);
                objDataBase.AddInParameter(cmd, "@EmailAdd", DbType.String, (EmailAdd == string.Empty) ? (object)DBNull.Value : EmailAdd);
                objDataBase.AddInParameter(cmd, "@Website", DbType.String, (Website == string.Empty) ? (object)DBNull.Value : Website);
                objDataBase.AddInParameter(cmd, "@TaxNo", DbType.String, (TaxNo == string.Empty) ? (object)DBNull.Value : TaxNo);
                objDataBase.AddInParameter(cmd, "@Sector", DbType.String, (Sector == "0") ? (object)DBNull.Value : Sector);
                objDataBase.AddInParameter(cmd, "@Phone", DbType.String, (Phone == string.Empty) ? (object)DBNull.Value : Phone);
                objDataBase.AddInParameter(cmd, "@Fax", DbType.String, (Fax == string.Empty) ? (object)DBNull.Value : Fax);
                objDataBase.AddInParameter(cmd, "@annual_rev", DbType.String, (annual_rev == string.Empty) ? (object)DBNull.Value : annual_rev);
                objDataBase.AddInParameter(cmd, "@NoOfEmp", DbType.String, (NoOfEmp == string.Empty) ? (object)DBNull.Value : NoOfEmp);
                objDataBase.AddInParameter(cmd, "@Notes", DbType.String, (Notes == string.Empty) ? (object)DBNull.Value : Notes);
                objDataBase.AddInParameter(cmd, "@PrimaryContactID", DbType.String, (PrimaryContactID == "0") ? (object)DBNull.Value : PrimaryContactID);
                objDataBase.AddInParameter(cmd, "@Approved", DbType.String, (Approved == string.Empty) ? (object)DBNull.Value : Approved);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }

        public DataSet  UP_I_Client(string AccountName, string strloginuser)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_I_Client");
            objDataBase.AddInParameter(cmd, "@AccountName", DbType.String, (AccountName == string.Empty) ? (object)DBNull.Value : AccountName);
            objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }
#endregion

#region Contacts_master
        public DataSet UP_Fetch_Contacts(string UID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Contacts");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_Contacts(string UID, string ContactFName, string ContactLName, string Title, string Department, string MobileNo, string WorkPhoneNo, string EmailAddress, string Birthday, string AccountRefID, string Notes, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_Contacts");
                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? string.Empty : UID);
                //objDataBase.AddInParameter(cmd, "@ContactID", DbType.String, (ContactID == string.Empty) ? (object)DBNull.Value : ContactID);
                objDataBase.AddInParameter(cmd, "@ContactFName", DbType.String, (ContactFName == string.Empty) ? (object)DBNull.Value : ContactFName);
                objDataBase.AddInParameter(cmd, "@ContactLName", DbType.String, (ContactLName == string.Empty) ? (object)DBNull.Value : ContactLName);
                objDataBase.AddInParameter(cmd, "@Title", DbType.String, (Title == string.Empty) ? (object)DBNull.Value : Title);
                objDataBase.AddInParameter(cmd, "@Department", DbType.String, (Department == string.Empty) ? (object)DBNull.Value : Department);
                objDataBase.AddInParameter(cmd, "@MobileNo", DbType.String, (MobileNo == string.Empty) ? (object)DBNull.Value : MobileNo);
                objDataBase.AddInParameter(cmd, "@WorkPhoneNo", DbType.String, (WorkPhoneNo == string.Empty) ? (object)DBNull.Value : WorkPhoneNo);
                objDataBase.AddInParameter(cmd, "@EmailAddress", DbType.String, (EmailAddress == string.Empty) ? (object)DBNull.Value : EmailAddress);
                objDataBase.AddInParameter(cmd, "@Birthday", DbType.String, (Birthday == string.Empty) ? (object)DBNull.Value : Birthday);
                objDataBase.AddInParameter(cmd, "@AccountRefID", DbType.String, (AccountRefID == string.Empty) ? (object)DBNull.Value : AccountRefID);
                objDataBase.AddInParameter(cmd, "@Notes", DbType.String, (Notes == string.Empty) ? (object)DBNull.Value : Notes);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }
#endregion

#region costitem_master
        public DataSet UP_Fetch_MasterCostItems(string UID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_MasterCostItems");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_MasterCostItems(string UID, string CostItemname, string Code, string isFormula, string Formula, string decimalplace, string showaspercent, string isEditable, string isCountable, string isTimecost, string perCity, string perMethod, string perOption, string isActive, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_MasterCostItems");
                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? string.Empty : UID);
                objDataBase.AddInParameter(cmd, "@CostItemname", DbType.String, (CostItemname ==string.Empty) ? (object)DBNull.Value:CostItemname);
                objDataBase.AddInParameter(cmd, "@Code", DbType.String, (Code ==string.Empty) ? (object)DBNull.Value:Code);
                objDataBase.AddInParameter(cmd, "@isFormula", DbType.String, isFormula);
                objDataBase.AddInParameter(cmd, "@Formula", DbType.String, (Formula ==string.Empty) ? (object)DBNull.Value:Formula);
                objDataBase.AddInParameter(cmd, "@decimalplace", DbType.String, (decimalplace == string.Empty) ? (object)DBNull.Value : decimalplace);
                objDataBase.AddInParameter(cmd, "@showaspercent", DbType.String, showaspercent);
                objDataBase.AddInParameter(cmd, "@isEditable", DbType.String, isEditable);
                objDataBase.AddInParameter(cmd, "@isCountable", DbType.String, isCountable);
                objDataBase.AddInParameter(cmd, "@isTimecost", DbType.String, isTimecost);
                objDataBase.AddInParameter(cmd, "@perCity", DbType.String, perCity);
                objDataBase.AddInParameter(cmd, "@perMethod", DbType.String, perMethod);
                objDataBase.AddInParameter(cmd, "@perOption", DbType.String, perOption);
                objDataBase.AddInParameter(cmd, "@isActive", DbType.String, isActive);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }
#endregion

#region common_master
        public DataSet UP_Fetch_Masterlists(string mastername)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Masterlists");
            objDataBase.AddInParameter(cmd, "@master", DbType.String, (mastername == "") ? (object)DBNull.Value : mastername);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_Masterlists(string UID, string master, string Listval1, string Listval2, string Listval3, string Listval4, string isActive, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_Masterlists");
                objDataBase.AddInParameter(cmd, "@master", DbType.String, master);
                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? string.Empty : UID);
                objDataBase.AddInParameter(cmd, "@Listval1", DbType.String, (Listval1 == string.Empty) ? (object)DBNull.Value : Listval1);
                objDataBase.AddInParameter(cmd, "@Listval2", DbType.String, (Listval2 == string.Empty) ? (object)DBNull.Value : Listval2);
                objDataBase.AddInParameter(cmd, "@Listval3", DbType.String, (Listval3 == string.Empty) ? (object)DBNull.Value : Listval3);
                objDataBase.AddInParameter(cmd, "@Listval4", DbType.String, (Listval4 == string.Empty) ? (object)DBNull.Value : Listval4);
                objDataBase.AddInParameter(cmd, "@isActive", DbType.String, isActive);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }
#endregion

#region employee_master

        public string UP_Fetch_UserAvailability(string UserID)
        {
            string result;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_UserAvailability");
            objDataBase.AddInParameter(cmd, "@UserID", DbType.String, UserID);
            result = objDataBase.ExecuteScalar(cmd).ToString();
            return result;
        }

        public string UP_Fetch_EmployeeIDAvailability(string EmployeeID)
        {
            string result;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_EmployeeIDAvailability");
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, EmployeeID);
            result = objDataBase.ExecuteScalar(cmd).ToString();
            return result;
        }

        public string UP_Fetch_EmailIDAvailability(string EmailAddress, string UserID)
        {
            string result;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_EmailIDAvailability");
            objDataBase.AddInParameter(cmd, "@EmailAddress", DbType.String, EmailAddress);
            objDataBase.AddInParameter(cmd, "@UserID", DbType.String, UserID);
            result = objDataBase.ExecuteScalar(cmd).ToString();
            return result;
        }


        public DataSet UP_Fetch_Employees_DD()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            ds = objDataBase.ExecuteDataSet("UP_Fetch_Employees_DD");
            return ds;
        }

        public DataSet UP_Fetch_Employees(string UID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Employees");
            objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? (object)DBNull.Value : UID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_Employees(string UID, string EmployeeFName, string EmployeeLName, string UserID, string UserPWD, string Title, string Department, string EmailAddress, string MobileNo, string WorkPhoneNo, string Homeno, string HomeAddress, string JoinDate, string EndDate, string Gender, string Birthday, string SalesPerson, string Manager, string Leader, string Coordinator, string Active, string SharedResource, string DirectManager, string IndirectManager, string Notes, string EmployeeRole, string Locked, string Director, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_Employees");
                objDataBase.AddInParameter(cmd, "@UID", DbType.String, (UID == "") ? string.Empty : UID);
                //objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, (EmployeeID == string.Empty) ? (object)DBNull.Value : EmployeeID);
                objDataBase.AddInParameter(cmd, "@EmployeeFName", DbType.String, (EmployeeFName == string.Empty) ? (object)DBNull.Value : EmployeeFName);
                objDataBase.AddInParameter(cmd, "@EmployeeLName", DbType.String, (EmployeeLName == string.Empty) ? (object)DBNull.Value : EmployeeLName);
                objDataBase.AddInParameter(cmd, "@UserID", DbType.String, (UserID == string.Empty) ? (object)DBNull.Value : UserID);
                objDataBase.AddInParameter(cmd, "@UserPWD", DbType.String, (UserPWD == string.Empty) ? (object)DBNull.Value : UserPWD);
                objDataBase.AddInParameter(cmd, "@Title", DbType.String, (Title == string.Empty) ? (object)DBNull.Value : Title);
                objDataBase.AddInParameter(cmd, "@Department", DbType.String, (Department == string.Empty) ? (object)DBNull.Value : Department);
                objDataBase.AddInParameter(cmd, "@EmailAddress", DbType.String, (EmailAddress == string.Empty) ? (object)DBNull.Value : EmailAddress);
                objDataBase.AddInParameter(cmd, "@MobileNo", DbType.String, (MobileNo == string.Empty) ? (object)DBNull.Value : MobileNo);
                objDataBase.AddInParameter(cmd, "@WorkPhoneNo", DbType.String, (WorkPhoneNo == string.Empty) ? (object)DBNull.Value : WorkPhoneNo);
                objDataBase.AddInParameter(cmd, "@Homeno", DbType.String, (Homeno == string.Empty) ? (object)DBNull.Value : Homeno);
                objDataBase.AddInParameter(cmd, "@HomeAddress", DbType.String, (HomeAddress == string.Empty) ? (object)DBNull.Value : HomeAddress);
                objDataBase.AddInParameter(cmd, "@JoinDate", DbType.String, (JoinDate == string.Empty) ? (object)DBNull.Value : JoinDate);
                objDataBase.AddInParameter(cmd, "@EndDate", DbType.String, (EndDate == string.Empty) ? (object)DBNull.Value : EndDate);
                objDataBase.AddInParameter(cmd, "@Gender", DbType.String, (Gender == string.Empty) ? (object)DBNull.Value : Gender);
                objDataBase.AddInParameter(cmd, "@Birthday", DbType.String, (Birthday == string.Empty) ? (object)DBNull.Value : Birthday);
                objDataBase.AddInParameter(cmd, "@SalesPerson", DbType.String, (SalesPerson == string.Empty) ? (object)DBNull.Value : SalesPerson);
                objDataBase.AddInParameter(cmd, "@Manager", DbType.String, (Manager == string.Empty) ? (object)DBNull.Value : Manager);
                objDataBase.AddInParameter(cmd, "@Leader", DbType.String, (Leader == string.Empty) ? (object)DBNull.Value : Leader);
                objDataBase.AddInParameter(cmd, "@Coordinator", DbType.String, (Coordinator == string.Empty) ? (object)DBNull.Value : Coordinator);
                objDataBase.AddInParameter(cmd, "@Active", DbType.String, (Active == string.Empty) ? (object)DBNull.Value : Active);
                objDataBase.AddInParameter(cmd, "@SharedResource", DbType.String, (SharedResource == string.Empty) ? (object)DBNull.Value : SharedResource);
                objDataBase.AddInParameter(cmd, "@DirectManager", DbType.String, (DirectManager == string.Empty) ? (object)DBNull.Value : DirectManager);
                objDataBase.AddInParameter(cmd, "@IndirectManager", DbType.String, (IndirectManager == string.Empty) ? (object)DBNull.Value : IndirectManager);
                objDataBase.AddInParameter(cmd, "@Notes", DbType.String, (Notes == string.Empty) ? (object)DBNull.Value : Notes);
                objDataBase.AddInParameter(cmd, "@EmployeeRole", DbType.String, (EmployeeRole == string.Empty) ? (object)DBNull.Value : EmployeeRole);
                objDataBase.AddInParameter(cmd, "@Locked", DbType.String, (Locked == string.Empty) ? (object)DBNull.Value : Locked);
                objDataBase.AddInParameter(cmd, "@Director", DbType.String, (Director == string.Empty) ? (object)DBNull.Value : Director);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }

        public DataSet UP_Fetch_Emp_ManagerDirector(string EmployeeID)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Emp_ManagerDirector");
            objDataBase.AddInParameter(cmd, "@EmployeeID", DbType.String, (EmployeeID == "") ? (object)DBNull.Value : EmployeeID);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }
#endregion

#region login

        public DataSet UP_Fetch_Authentication(string UserID, string UserPWD, out int Result)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Authentication");
            objDataBase.AddInParameter(cmd, "@UserID", DbType.String, UserID);
            objDataBase.AddInParameter(cmd, "@UserPWD", DbType.String, UserPWD);
            objDataBase.AddOutParameter(cmd, "@Result", DbType.Int16, 8 );
            ds = objDataBase.ExecuteDataSet(cmd);
            Result = Convert.ToInt16(objDataBase.GetParameterValue(cmd, "@Result").ToString());
            return ds;
        }

        public void UP_U_ChangePassword(string UserID, string OldPWD, string NewPWD, out int Result)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_U_ChangePassword");
            objDataBase.AddInParameter(cmd, "@UserID", DbType.String, UserID);
            objDataBase.AddInParameter(cmd, "@OldPWD", DbType.String, OldPWD);
            objDataBase.AddInParameter(cmd, "@NewPWD", DbType.String, NewPWD);
            objDataBase.AddOutParameter(cmd, "@Result", DbType.Int16, 8);
            objDataBase.ExecuteDataSet(cmd);
            Result = Convert.ToInt16(objDataBase.GetParameterValue(cmd, "@Result").ToString());
            return;
        }

        public void UP_U_ForgetPassword(string EmailAddress, string NewPWD, out int Result, out string EmpName)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_U_ForgetPassword");
            objDataBase.AddInParameter(cmd, "@EmailAddress", DbType.String, EmailAddress);
            objDataBase.AddInParameter(cmd, "@NewPWD", DbType.String, NewPWD);
            objDataBase.AddOutParameter(cmd, "@Result", DbType.Int16, 8);
            objDataBase.AddOutParameter(cmd, "@EmpName", DbType.String, 100);
            objDataBase.ExecuteDataSet(cmd);
            Result = Convert.ToInt16(objDataBase.GetParameterValue(cmd, "@Result").ToString());
            EmpName = objDataBase.GetParameterValue(cmd, "@EmpName").ToString();
            return;
        }


        public string GetHashedValue(string strVal)
        {
            string strHashedValue;
            try
            {
                System.Security.Cryptography.SHA1CryptoServiceProvider sha1 = new System.Security.Cryptography.SHA1CryptoServiceProvider();
                byte[] hash = null;
                hash = sha1.ComputeHash(Encoding.ASCII.GetBytes(strVal));
                char[] base64data = new char[(int)(Math.Ceiling((double)hash.Length / 3) * 4)];
                Convert.ToBase64CharArray(hash, 0, hash.Length, base64data, 0);
                string convertedBaseData = new string(base64data);
                strHashedValue = convertedBaseData;
            }
            catch (Exception ex)
            {
                strHashedValue = string.Empty;
            }
            return strHashedValue;
        }


        public DataSet UP_Fetch_InitialPage(string Role)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;

            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_InitialPage");
            objDataBase.AddInParameter(cmd, "@Role", DbType.String, Role);
            ds = objDataBase.ExecuteDataSet(cmd);

            return ds;
        }


#endregion

#region ExchangeRate
        public DataSet UP_Fetch_ExchangeRate_DD()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ExchangeRate_DD");
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_ExchangeRate(DateTime DateEffective)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ExchangeRate");
            objDataBase.AddInParameter(cmd, "@DateEffective", DbType.DateTime, DateEffective);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_IU_ExchangeRate(DateTime DateEffective, string ERXML, string strloginuser)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_ExchangeRate");
                objDataBase.AddInParameter(cmd, "@DateEffective", DbType.DateTime, DateEffective);
                objDataBase.AddInParameter(cmd, "@ERXML", DbType.String, (ERXML == string.Empty) ? (object)DBNull.Value : ERXML);
                objDataBase.AddInParameter(cmd, "@LoginID", DbType.String, strloginuser);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }
#endregion

#region EMailTemplate
        public DataSet UP_Fetch_EMailTemplate_DD()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_EMailTemplate_DD");
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public DataSet UP_Fetch_EMailTemplate(string TemplateName)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_EMailTemplate");
            objDataBase.AddInParameter(cmd, "@TemplateName", DbType.String, TemplateName);
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }

        public Boolean UP_U_EMailTemplate(string TemplateName, string TempaleSubject, string TempaleContent)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_U_EMailTemplate");
                objDataBase.AddInParameter(cmd, "@TemplateName", DbType.String, TemplateName);
                objDataBase.AddInParameter(cmd, "@TempaleSubject", DbType.String, (TempaleSubject == string.Empty) ? (object)DBNull.Value : TempaleSubject);
                objDataBase.AddInParameter(cmd, "@TempaleContent", DbType.String, (TempaleContent == string.Empty) ? (object)DBNull.Value : TempaleContent);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }

        public DataSet UP_Fetch_AdminEmailIds()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;
            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_AdminEmailIds");
            ds = objDataBase.ExecuteDataSet(cmd);
            return ds;
        }
#endregion

#region RoleBasedAccess

        public PageAccess UP_Fetch_ModuleAccess(string Modulename, string Role)
        {
            PageAccess result = new PageAccess();
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;

            if (Role == "Administrator")
            {
                result.AllowAdd = true; result.AllowEdit = true; result.AllowDelete = true; result.AllowPage = true;
            }
            else
            {
                cmd = objDataBase.GetStoredProcCommand("UP_Fetch_ModuleAccess");
                objDataBase.AddInParameter(cmd, "@Modulename", DbType.String, Modulename);
                objDataBase.AddInParameter(cmd, "@Role", DbType.String, Role);
                ds = objDataBase.ExecuteDataSet(cmd);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    result.AllowAdd = Convert.ToBoolean(ds.Tables[0].Rows[0]["AllowAdd"].ToString());
                    result.AllowEdit = Convert.ToBoolean(ds.Tables[0].Rows[0]["AllowEdit"].ToString());
                    result.AllowDelete = Convert.ToBoolean(ds.Tables[0].Rows[0]["AllowDelete"].ToString());
                    result.AllowPage = true;
                }
                else
                {
                    result.AllowAdd = false; result.AllowEdit = false; result.AllowDelete = false; result.AllowPage = false;
                }
            }

            return result;
        }


        public DataSet UP_Fetch_Modules(string Role)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;

            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_Modules");
            objDataBase.AddInParameter(cmd, "@Role", DbType.String, Role);
            ds = objDataBase.ExecuteDataSet(cmd);

            return ds;
        }

        public DataSet UP_Fetch_AccessModule_DD()
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;

            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_AccessModule_DD");
            ds = objDataBase.ExecuteDataSet(cmd);

            return ds;
        }

        public DataSet UP_Fetch_RoleBasedAccess(string Role)
        {
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DataSet ds = new DataSet();
            DbCommand cmd;

            cmd = objDataBase.GetStoredProcCommand("UP_Fetch_RoleBasedAccess");
            objDataBase.AddInParameter(cmd, "@Role", DbType.String, Role);
            ds = objDataBase.ExecuteDataSet(cmd);

            return ds;
        }

        public Boolean UP_IU_RoleBasedAccess(string Role, string RBAXML)
        {
            Boolean result = false;
            Database objDataBase = DatabaseFactory.CreateDatabase();
            DbCommand cmd;
            try
            {
                cmd = objDataBase.GetStoredProcCommand("UP_IU_RoleBasedAccess");
                objDataBase.AddInParameter(cmd, "@Role", DbType.String, Role);
                objDataBase.AddInParameter(cmd, "@RBAXML", DbType.String, (RBAXML == string.Empty) ? (object)DBNull.Value : RBAXML);
                objDataBase.ExecuteDataSet(cmd);
                result = true;
            }
            catch (Exception ex)
            {
                //throw ex;
                result = false;
            }
            return result;
        }
#endregion

        public string SendMailtest(string body, string subject, string messageTo)
        {

            try
            {
                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                msg.Body = body;
                msg.IsBodyHtml = true;
                string mailServer = System.Configuration.ConfigurationManager.AppSettings["MailServer"].ToString();
                string messageFrom = System.Configuration.ConfigurationManager.AppSettings["MailFromAddress"].ToString();
                msg.From = new System.Net.Mail.MailAddress(messageFrom);
                msg.To.Add(messageTo);
                msg.Subject = subject;
                System.Net.Mail.SmtpClient sc;
                if (mailServer == "smtp.gmail.com")
                    sc = new System.Net.Mail.SmtpClient(mailServer, 587);
                else
                    sc = new System.Net.Mail.SmtpClient(mailServer);
                if (messageFrom == "kadsysv2@gmail.com")
                {
                    sc.EnableSsl = true;
                    sc.UseDefaultCredentials = false;
                    sc.Credentials = new System.Net.NetworkCredential("kadsysv2@gmail.com", "kadsysv2123");
                }
                sc.Send(msg);
                return "true";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        public bool SendMail(string body, string subject, string messageTo)
        {

            try
            {
                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                msg.Body = body;
                msg.IsBodyHtml = true;
                string mailServer = System.Configuration.ConfigurationManager.AppSettings["MailServer"].ToString();
                string messageFrom = System.Configuration.ConfigurationManager.AppSettings["MailFromAddress"].ToString();
                msg.From = new System.Net.Mail.MailAddress(messageFrom);
                msg.To.Add(messageTo);
                msg.Subject = subject;
                System.Net.Mail.SmtpClient sc;
                if (mailServer == "smtp.gmail.com")
                    sc = new System.Net.Mail.SmtpClient(mailServer, 587);
                else
                    sc = new System.Net.Mail.SmtpClient(mailServer);
                if (messageFrom == "kadsysv2@gmail.com")
                {
                    sc.EnableSsl = true;
                    sc.UseDefaultCredentials = false;
                    sc.Credentials = new System.Net.NetworkCredential("kadsysv2@gmail.com", "kadsysv2123");
                }
                sc.Send(msg);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool SendMail(string body, string subject, string[] messageTo)
        {

            try
            {
                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                msg.Body = body;
                msg.IsBodyHtml = true;
                string mailServer = System.Configuration.ConfigurationManager.AppSettings["MailServer"].ToString();
                string messageFrom = System.Configuration.ConfigurationManager.AppSettings["MailFromAddress"].ToString();
                msg.From = new System.Net.Mail.MailAddress(messageFrom);
                for (int i = 0; i <= messageTo.GetUpperBound(0); i++)
                    msg.To.Add(messageTo[i]);
                msg.Subject = subject;
                System.Net.Mail.SmtpClient sc;
                if (mailServer == "smtp.gmail.com")
                    sc = new System.Net.Mail.SmtpClient(mailServer, 587);
                else
                    sc = new System.Net.Mail.SmtpClient(mailServer);
                if (messageFrom == "kadsysv2@gmail.com")
                {
                    sc.EnableSsl = true;
                    sc.UseDefaultCredentials = false;
                    sc.Credentials = new System.Net.NetworkCredential("kadsysv2@gmail.com", "kadsysv2123");
                }
                sc.Send(msg);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public DataTable dt_PageSize()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("intePageSize", typeof(int));
            dt.Rows.Add(10);
            dt.Rows.Add(20);
            dt.Rows.Add(30);
            return dt;
        }


    }

    [Serializable]
    public class PageAccess
    {
        public Boolean AllowAdd { get; set; }
        public Boolean AllowEdit { get; set; }
        public Boolean AllowDelete { get; set; }
        public Boolean AllowPage { get; set; }
    }
}