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

public partial class Admin_Reporting : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			if (Session["UserId"] == null)
			{
				Response.Redirect("index.aspx");
			}
			string Session_Utype = Session["UserType"].ToString();
			if (Session_Utype == "0")
			{
				form1.Visible = true;
				FillYearCombo();
				FillUserNameCombo();
				Menu_Admin_Reporting.Visible = true;
				Menu_Period.Visible = true;
				Menu_Logout.Visible = true;
				refreshGrid();
			}
			else
			{
				form1.Visible = false;
				Menu_Admin_Reporting.Visible = false;
				Menu_Period.Visible = false;
				Menu_Logout.Visible = true;
			}
		}
	}
	protected void FillUserNameCombo()
	{
		string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();

		using (SqlConnection con = new SqlConnection(connect))
		{
			using (SqlCommand cmd = new SqlCommand("SELECT User_Id, Uname FROM tblUser_Master"))
			{
				cmd.CommandType = CommandType.Text;
				cmd.Connection = con;
				con.Open();
				cmbEmp.DataSource = cmd.ExecuteReader();
				cmbEmp.DataTextField = "Uname";
				cmbEmp.DataValueField = "User_Id";
				cmbEmp.DataBind();
				con.Close();
			}
		}
		cmbEmp.Items.Insert(0, new ListItem("-- Select Employee --", "0"));
	}
	private void FillYearCombo()
	{
		string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
		using (SqlConnection con = new SqlConnection(connect))
		{
			using (SqlCommand cmd = new SqlCommand("Select Year_ID From tblPeriod Group By Year_ID"))
			{
				cmd.CommandType = CommandType.Text;
				cmd.Connection = con;
				con.Open();
				cmbYear.DataSource = cmd.ExecuteReader();
				cmbYear.DataTextField = "Year_Id";
				cmbYear.DataValueField = "Year_Id";
				cmbYear.DataBind();
				con.Close();
			}
		}
	}
	private void FillMonthCombo()
	{
		string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
		using (SqlConnection con = new SqlConnection(connect))
		{
			using (SqlCommand cmd = new SqlCommand("Select Month_Id, Month_Name From tblPeriod where Year_Id = '" + cmbYear.Text + "' Order By Month_Id"))
			{
				cmd.CommandType = CommandType.Text;
				cmd.Connection = con;
				con.Open();
				cmbMonth.DataSource = cmd.ExecuteReader();
				cmbMonth.DataTextField = "Month_Name";
				cmbMonth.DataValueField = "Month_Id";
				cmbMonth.DataBind();
				con.Close();
			}
		}
	}
	protected void refreshGrid()
	{
		string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
		string Session_Uname = Session["Uname"].ToString();
		string Session_Utype = Session["UserType"].ToString();
		SqlConnection con = new SqlConnection(connect);
		DataTable dt = new DataTable();

		string sQry = " Select tmp.Emp_Name As [Name], SUM(tmp.Money_In) As [IN] , SUM(tmp.Money_Out) As [OUT], " +
						" (SUM(tmp.Money_In) - SUM(tmp.Money_Out)) As [Balance]  From (  " +
						" (Select B.Uname As [Emp_Name], A.Money_In As [Money_In], 0 As [Money_Out] " +
						" From tblEntry As A " +
						" LEFT JOIN tblUser_Master As B ON (A.Emp_ID = B.User_id) " +
						" LEFT JOIN tblUser_Master As C ON (A.User_id = C.User_id) " +
						" Where MONTH(A.Entry_Dt) = " + Session["Current_Month_Id"] + " And Year(A.Entry_Dt) = " + Session["Current_Year_Id"] + " ) " +
						" UNION ALL " +
						" (Select C.Uname As [Emp_Name], 0 As [Money_In], A.Money_In As [Money_Out]  " +
						" From tblEntry As A  " +
						" LEFT JOIN tblUser_Master As C ON (A.User_id = C.User_id) " +
						" Where MONTH(A.Entry_Dt) = " + Session["Current_Month_Id"] + " And Year(A.Entry_Dt) = " + Session["Current_Year_Id"] + " ) " +
						" ) As tmp Where tmp.Emp_Name Is NOT NULL Group By tmp.Emp_Name ";

		SqlCommand cmd = new SqlCommand(sQry, con);
		SqlDataAdapter sda = new SqlDataAdapter();
		try
		{
			con.Open();
			sda.SelectCommand = cmd;
			DataSet ds = new DataSet();
			sda.Fill(ds);
			gridEmp_Balance.DataSource = ds;

			gridEmp_Balance.DataSourceID = null;
			gridEmp_Balance.DataSource = ds;
			gridEmp_Balance.DataBind();
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
	private void User_Report()
	{
		//String SQry = "";
		String sQry = " Select * From ( " +
						" (Select B.Uname As [Emp_Name], A.Entry_Dt, A.Emp_Voucher As [Jobcard], A.Money_In As [In], 0 As [Out], A.Remarks, C.Uname As [User_Name] " +
						"	From tblEntry As A " +
						"	LEFT JOIN tblUser_Master As B ON (A.Emp_ID = B.User_id) " +
						"	LEFT JOIN tblUser_Master As C ON (A.User_id = C.User_id) Where A.Emp_ID = '" + cmbEmp.SelectedValue + "' And MONTH(A.Entry_Dt) = '" + cmbMonth.SelectedValue + "' And Year(A.Entry_Dt) = '" + cmbYear.SelectedValue + "') " +
						"   UNION ALL " +
						" (Select B.Uname As [Emp_Name], A.Entry_Dt, A.Emp_Voucher, 0 As [In], A.Money_In As [Out], A.Remarks, C.Uname As [User_Name] " +
						"	From tblEntry As A " +
						"	LEFT JOIN tblUser_Master As B ON (A.Emp_ID = B.User_id) " +
						"	LEFT JOIN tblUser_Master As C ON (A.User_id = C.User_id) Where A.User_ID = '" + cmbEmp.SelectedValue + "' And MONTH(A.Entry_Dt) = '" + cmbMonth.SelectedValue + "' And Year(A.Entry_Dt) = '" + cmbYear.SelectedValue + "') " +
						" ) As tmp order by Entry_Dt";

		SqlCommand cmd = new SqlCommand(sQry);
		using (SqlDataAdapter sda = new SqlDataAdapter())
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
				cmd.Connection = con;
				sda.SelectCommand = cmd;
				using (DataSet ds = new DataSet())
				{
					sda.Fill(ds);
					Session["Rpt_Pettycash_Report"] = ds;
					Session["sQry"] = sQry;
					Session["Emp_Id"] = cmbEmp.SelectedValue;
					Session["Emp_Month_Id"] = cmbMonth.SelectedValue;
					Session["Emp_Year_Id"] = cmbYear.SelectedValue;
					Session["Emp_Name"] = cmbEmp.SelectedItem;
					Session["Emp_Month_Name"] = cmbMonth.SelectedItem;
				}
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

	}

	protected void btnView_Report_Click(object sender, EventArgs e)
	{
		User_Report();
		Response.Redirect("Frm_Admin_Report.aspx");
		//string pageurl = "Frm_Admin_Report.aspx";
		//ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>window.open('" + pageurl + "','_blank') ;window.location='Admin_Reporting.aspx'; </script>'");
	}
}