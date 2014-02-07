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
    public partial class Masters : System.Web.UI.Page
    {
        dal dl = new dal();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }



        void BindGrid()
        {
            DataSet ds = dl.masterdetails();
            GridView1.DataSource = ds.Tables[1];
            GridView1.DataBind();

            string strdetails;
            
            //strdetails = ds.Tables[0].Rows[0]["Listval2"].ToString() ;
            //string[] strcoldetails = strdetails.Split('|');
            //for (int i=1; i<strcoldetails.Length;i++)
            //{
            //    if (strcoldetails[i].Trim().Length == 0)
            //        this.GridView1.Columns[i].Visible = false;
            //    else
            //    {
            //        this.GridView1.HeaderRow.Cells[i].Text = strcoldetails[i].Trim().ToString();
            //    }
            //}
            
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            
            string strxml = "<root>";
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                strxml += "<detail>";
                strxml += "<UID>" + ((Label)GridView1.Rows[i].FindControl("lblUID")).Text + "</UID>";
                if (this.GridView1.Columns[1].Visible == true)
                    strxml += "<Listval1>" + ((TextBox)GridView1.Rows[i].FindControl("txtListval1")).Text + "</Listval1>";
                if (this.GridView1.Columns[2].Visible == true)
                    strxml += "<Listval2>" + ((TextBox)GridView1.Rows[i].FindControl("txtListval2")).Text + "</Listval2>";
                if (this.GridView1.Columns[3].Visible == true)
                    strxml += "<Listval3>" + ((TextBox)GridView1.Rows[i].FindControl("txtListval3")).Text + "</Listval3>";
                if (this.GridView1.Columns[4].Visible == true)
                    strxml += "<Listval4>" + ((TextBox)GridView1.Rows[i].FindControl("txtListval4")).Text + "</Listval4>";
                if (this.GridView1.Columns[5].Visible == true)
                    strxml += "<isActive>" + ((CheckBox)GridView1.Rows[i].FindControl("chkisActive")).Checked.ToString() + "</isActive>";
                strxml += "</detail>";
            }
            
            strxml += "</root>";

            dl.UpdateMasterlists("Broad Category", strxml);

        }
    }
}
