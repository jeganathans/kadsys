using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace KedSys35
{
    public partial class ExchangeRate : System.Web.UI.Page
    {
        dal dl = new dal();
        string strloginuser = "";

        PageAccess PGAccess;
        string empRole;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginuser"] == null)
            {
                Response.Redirect("SessionExpired.aspx");
            }

            PageAccessControl();

            strloginuser = Session["loginuser"].ToString();
            if (!IsPostBack)
            {
                BindCombo();
                BindGrid();
            }
            brdPageID.InnerText = ddDateEffective.SelectedItem.Text;
        }

        void PageAccessControl()
        {
            empRole = Session["EmployeeRole"].ToString();
            if (!IsPostBack)
            {
                PGAccess = dl.UP_Fetch_ModuleAccess("Exchange Rate", empRole);
                ViewState["PGAccess"] = PGAccess;
            }
            else
            {
                PGAccess = (PageAccess)ViewState["PGAccess"];
            }
            if (!PGAccess.AllowPage)
                Response.Redirect("NoAccess.aspx");

            if (PGAccess.AllowEdit)
                btn_submit.Visible = true;
            else
                btn_submit.Visible = false;

        }

        void BindCombo()
        {
            DataSet ds = dl.UP_Fetch_ExchangeRate_DD();

            ddDateEffective.DataSource = ds.Tables[0];
            ddDateEffective.DataTextField = "MonthYear";
            ddDateEffective.DataValueField = "CalenderDate";
            ddDateEffective.DataBind();

            DateTime timenow = DateTime.UtcNow.AddMinutes(420);
            DateTime currentmonth = new DateTime(timenow.Year, timenow.Month, 1);
            ddDateEffective.SelectedIndex = ddDateEffective.Items.IndexOf(ddDateEffective.Items.FindByValue(currentmonth.ToString()));
        }

        void BindGrid()
        {
            DateTime DateEffective;
            DateEffective = Convert.ToDateTime(ddDateEffective.SelectedValue);
            DataSet ds = dl.UP_Fetch_ExchangeRate(DateEffective);

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            lblBaseCurrency.Text = ds.Tables[1].Rows[0]["BaseCurrency"].ToString();
        }


        protected void ddDateEffective_Changed(Object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Boolean result = false;
            DateTime DateEffective;
            DateEffective = Convert.ToDateTime(ddDateEffective.SelectedValue);

            string xmldetails = string.Empty;
            xmldetails = "<root>";
            foreach (GridViewRow row in GridView1.Rows)
            {
                Label CurrencyType = (Label)row.FindControl("CurrencyType");
                TextBox CurrencyValue = (TextBox)row.FindControl("CurrencyValue");
                xmldetails += "<detail><CurrencyType>" + CurrencyType.Text + "</CurrencyType>";
                xmldetails += "<CurrencyValue>" + CurrencyValue.Text.Replace(",","") + "</CurrencyValue>";
                xmldetails += "</detail>";
            }
            xmldetails += "</root>";

            result = dl.UP_IU_ExchangeRate(DateEffective, xmldetails, strloginuser);


            if (result == true)
            {
                hidtoaster.Value = "success|Updated successfully";
            }
            else
            {
                hidtoaster.Value = "error|Transaction Failed";
            }

            BindGrid();
        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gv_RowCommand(object sender, GridViewRowEventArgs e)
        {
            
        }
    }
}
