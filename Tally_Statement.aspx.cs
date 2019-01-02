using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Configuration;

public partial class Nitai_Statement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Comp_Name"] == null)
        {
            //Response.Redirect("index.aspx");
        }
        refreshGrid();
        Comp_Details();
    }
    protected void refreshGrid()
    {
        SqlConnection con = new SqlConnection(@"Data Source=SOHAM-PC\SQLEXPRESS2008;Initial Catalog=Tally_VB;User ID=sa;Password=123");
        con.Open();
        string sQry = " select Name, " +
                        " ABS( sum(case when Closingbalance < 0 then Closingbalance else 0 end) )as Debit," +
                        " sum(case when Closingbalance >= 0 then Closingbalance else 0 end) as Credit " +
                        " from  tblDeb_Statement " +
                        " group by Name" ;

        SqlCommand cmd = new SqlCommand(sQry, con);
        SqlDataAdapter sda = new SqlDataAdapter();
        try
        {
            //con.Open();
            DataTable dt = new DataTable();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(dt);
            gridCustomer.DataSource = dt;
            gridCustomer.DataSourceID = null;
            ds.Tables.Add(dt);
            gridCustomer.DataSource = ds.Tables[0];
            gridCustomer.DataBind();
            
            decimal total = 0; ;
            gridCustomer.FooterRow.Cells[0].Text = "Total";
            gridCustomer.FooterRow.Cells[0].Font.Bold = true;
            gridCustomer.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Left;
            total = dt.AsEnumerable().Sum(row => row.Field<decimal>("Debit"));
            gridCustomer.FooterRow.Cells[1].Text = total.ToString("##,0.00");
            gridCustomer.FooterRow.Cells[1].Font.Bold = true;
            gridCustomer.FooterRow.BackColor = System.Drawing.Color.LightPink;
            //gridCustomer.FooterRow.Cells[1].ToString() = Convert.ToDouble(gridCustomer.Rows[1][]).ToString("##,0.00");

            total = dt.AsEnumerable().Sum(row => row.Field<decimal>("Credit"));
            gridCustomer.FooterRow.Cells[2].Text = total.ToString("##,0.00");
            gridCustomer.FooterRow.Cells[2].Font.Bold = true;
            gridCustomer.FooterRow.BackColor = System.Drawing.Color.LightPink;
            //Convert.ToDouble(gridCustomer.FooterRow.Cells[2]).ToString("##,0.00");

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
    }
    protected void Comp_Details()
    {
        SqlConnection con = new SqlConnection(@"Data Source=SOHAM-PC\SQLEXPRESS2008;Initial Catalog=Tally_VB;User ID=sa;Password=123");
        con.Open();
        SqlCommand cmd = new SqlCommand("Select Name, Address1, Address2, IncomeTaxNumber, CountryName from tblCompany", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["Comp_Name"] = dt.Rows[0]["Name"].ToString();
            Session["Add"] = dt.Rows[0]["Address1"].ToString();
            Session["Add2"] = dt.Rows[0]["Address2"].ToString();
            Session["Country"] = dt.Rows[0]["CountryName"].ToString();
            Session["Pin"] = dt.Rows[0]["IncomeTaxNumber"].ToString();
        }
        con.Close();
    }
}

