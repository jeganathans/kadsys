using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace KedSys35
{
    public partial class tempprop : System.Web.UI.Page
    {
        dal dl = new dal();
        DataSet ds;
        int cellwidth = 100;
        string txtAltOption = "", txtAltMethod = "", txtAltCity = "";

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ds = dl.temp_prop();
                Session["BaseData"] = ds;
            }
            else
            {
                ds = (DataSet)Session["BaseData"];

                txtAltOption = Request.Form[txtoption.UniqueID];
                txtAltMethod = Request.Form[txtmethod.UniqueID];
                txtAltCity = Request.Form[txtcity.UniqueID];
                if (txtAltOption.Trim().Length > 0 && txtAltMethod.Trim().Length > 0 && txtAltCity.Trim().Length > 0)
                {
                    DataRow dr = ds.Tables[1].NewRow();
                    dr["option"] = txtAltOption;
                    dr["method"] = txtAltMethod;
                    dr["city"] = txtAltCity;
                    ds.Tables[1].Rows.Add(dr);
                    Session["BaseData"] = ds;
                }
                
            }
            BindGrid();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        void BindGrid()
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

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
                                int noMethods, noCity, totalCity = 0;

                                Table tblHeader = (Table)ctrl;
                                strOption = tblHeader.ID.ToString().Replace("tbpoption","");

                                dvOption = ds.Tables[1].DefaultView;
                                dvOption.RowFilter = "option = '" + strOption + "'";
                                dtMethod = dvOption.ToTable(true, "method");
                                dvCity = dvOption.ToTable(true, "method", "city").DefaultView;
                                noMethods = dtMethod.Rows.Count;

                                TableRow tRowMethod = new TableRow();
                                TableRow tRowCity = new TableRow();

                                foreach (DataRow drMethod in dtMethod.Rows)
                                {
                                    strMethod = drMethod["method"].ToString();
                                    dvCity.RowFilter = "method = '" + strMethod +"'";
                                    noCity = dvCity.Count;

                                    foreach (DataRowView drcity in dvCity)
                                    {
                                        strCity = drcity["city"].ToString();
                                        totalCity++;
                                        TableCell tCellCity = new TableCell();
                                        tCellCity.Text = strCity;
                                        tCellCity.CssClass = "cscity";
                                        tCellCity.Width = Unit.Pixel(cellwidth);
                                        tRowCity.Cells.Add(tCellCity);
                                    }

                                    TableCell tCellMethod = new TableCell();
                                    tCellMethod.Text = strMethod;
                                    tCellMethod.ColumnSpan = noCity;
                                    tCellMethod.CssClass = "csmethod";
                                    tCellMethod.Width = Unit.Pixel(cellwidth * noCity);
                                    tRowMethod.Cells.Add(tCellMethod);


                                    
                                }

                                TableCell tCellTotal = new TableCell();
                                tCellTotal.Text = "Total";
                                tCellTotal.RowSpan = 2;
                                tCellTotal.CssClass = "cstotal";
                                tCellTotal.Width = Unit.Pixel(cellwidth);
                                tRowMethod.Cells.Add(tCellTotal);

                                tRowMethod.HorizontalAlign = HorizontalAlign.Center;
                                tRowCity.HorizontalAlign = HorizontalAlign.Center;
                                tblHeader.Rows[0].HorizontalAlign = HorizontalAlign.Center;

                                tblHeader.Rows.Add(tRowMethod);
                                tblHeader.Rows.Add(tRowCity);

                                tblHeader.Rows[0].Cells[0].ColumnSpan = totalCity + 1;
                                tblHeader.Rows[0].Cells[0].Text = "Option " + strOption;
                                //tblHeader.Width = Unit.Pixel(cellwidth * (totalCity+1));
                                //cell.Width = Unit.Pixel(cellwidth * (totalCity+1));
                                //cell.Width = Unit.Percentage(100);
                                //tblHeader.Width = Unit.Percentage(100);
                                tblHeader.CssClass = "csoption";
                                tblHeader.CellPadding = 0;

                            }
                        }
                    }
                }
            }
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

                                DataView dvOption;
                                DataTable dtMethod, dtCity;
                                DataView dvCity;
                                string strOption, strMethod, strCity;
                                int noMethods, noCity, totalCity = 0;

                                Table tblDetail = (Table)ctrl;
                                strOption = tblDetail.ID.ToString().Replace("tbdoption", "");

                                dvOption = ds.Tables[1].DefaultView;
                                dvOption.RowFilter = "option = '" + strOption + "'";
                                dtMethod = dvOption.ToTable(true, "method");
                                dvCity = dvOption.ToTable(true, "method", "city").DefaultView;
                                noMethods = dtMethod.Rows.Count;

                                //TableRow tRowMethod = new TableRow();
                                //TableRow tRowCity = new TableRow();
                                TableRow tRowDetail = tblDetail.Rows[0];

                                foreach (DataRow drMethod in dtMethod.Rows)
                                {
                                    strMethod = drMethod["method"].ToString();
                                    dvCity.RowFilter = "method = '" + strMethod + "'";
                                    noCity = dvCity.Count;

                                    foreach (DataRowView drcity in dvCity)
                                    {
                                        strCity = drcity["city"].ToString();
                                        totalCity++;
                                        TableCell tCellCity = new TableCell();
                                        TextBox txtCellCity = new TextBox();
                                        txtCellCity.ID = "txto" + strOption + "_" + totalCity;
                                        txtCellCity.Text = "txto" + strOption + "_" + totalCity;
                                        txtCellCity.Width = Unit.Pixel(cellwidth);
                                        tCellCity.Controls.Add(txtCellCity);
                                        tCellCity.CssClass = "cscity";
                                        tCellCity.Width = Unit.Pixel(cellwidth);
                                        tRowDetail.Cells.Add(tCellCity);
                                    }

                                }

                                TableCell tCellTotal = new TableCell();
                                TextBox txtCellTotal = new TextBox();
                                txtCellTotal.ID = "txto" + strOption + "_tot" ;
                                txtCellTotal.Text = "txto" + strOption + "_tot" ;
                                txtCellTotal.Width = Unit.Pixel(cellwidth);
                                //txtCellTotal.BorderStyle = BorderStyle.None;
                                //txtCellTotal.BorderColor = System.Drawing.Color.Transparent;
                                tCellTotal.Controls.Add(txtCellTotal);
                                tCellTotal.CssClass = "cstotal";
                                tCellTotal.Width = Unit.Pixel(cellwidth);
                                tRowDetail.Cells.Add(tCellTotal);

                                tblDetail.HorizontalAlign = HorizontalAlign.Center;
                                tblDetail.CssClass = "csoption";
                                tblDetail.CellPadding = 0;

                            }
                        }
                    }
                }
            }
        }
    }
}
