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

public partial class Frm_Admin_Report : System.Web.UI.Page
{
	public string sTable_String = "";
	protected void Page_Load(object sender, EventArgs e)
	{
		User_Report();
	}
	private void User_Report()
	{
		string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
		SqlConnection con = new SqlConnection(connect);
		try
		{
			if (con.State != ConnectionState.Open)
			{
				con.Close();
				con.Open();
			}
			DataSet tmpDs = (DataSet)Session["Rpt_Pettycash_Report"];
			DataTable dt = new DataTable();
			SqlCommand cmd = new SqlCommand(Session["sQry"].ToString(), con);
			SqlDataAdapter sda = new SqlDataAdapter();
			try
			{
				sda.SelectCommand = cmd;
				tmpDs.Tables.Clear();
				sda.Fill(tmpDs);
				gridCustomer.DataSource = tmpDs;
				sda.Fill(dt);
				gridCustomer.DataSource = dt;
				gridCustomer.DataSourceID = null;
				tmpDs.Tables.Add(dt);
				gridCustomer.DataSource = tmpDs.Tables[0];
				gridCustomer.DataBind();
				double TotalBalance = 0;
				foreach (DataRow dr in tmpDs.Tables[0].Rows)
				{
					TotalBalance += Convert.ToDouble(dr["In"]) - Convert.ToDouble(dr["Out"]);
				}
				lblBalance.Text = "Balance Amount : " + TotalBalance.ToString() + ",";

				decimal total = 0; ;
				gridCustomer.FooterRow.Cells[1].Text = "Total";
				gridCustomer.FooterRow.Cells[1].Font.Bold = true;
				gridCustomer.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Left;
				total = dt.AsEnumerable().Sum(row => row.Field<decimal>("In"));
				gridCustomer.FooterRow.Cells[4].Text = total.ToString();
				gridCustomer.FooterRow.Cells[4].Font.Bold = true;
				gridCustomer.FooterRow.BackColor = System.Drawing.Color.LightPink;

				total = dt.AsEnumerable().Sum(row => row.Field<decimal>("Out"));
				gridCustomer.FooterRow.Cells[5].Text = total.ToString();
				gridCustomer.FooterRow.Cells[5].Font.Bold = true;
				gridCustomer.FooterRow.BackColor = System.Drawing.Color.LightPink;
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

		catch (Exception ex)
		{
			ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='Frm_Admin_Report.aspx';</script>'");
		}
		finally
		{
			con.Close();
		}
	}
}