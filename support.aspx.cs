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

public partial class _Default : System.Web.UI.Page
{
	DateTime Today_Date = DateTime.Now;
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			if (Session["UserId"] == null)
			{
				Response.Redirect("index.aspx");
			}
			string Session_User_Type = Session["UserType"].ToString();
			if (Session_User_Type == "0")
			{
				Menu_Admin_Reporting.Visible = true;
				Menu_Period.Visible = true;
				Menu_Logout.Visible = true;
			}
			else
			{
				Menu_Admin_Reporting.Visible = false;
				Menu_Period.Visible = false;
				Menu_Logout.Visible = true;
			}
			//txtdate.Text = Today_Date.ToString("dd/MM/yyyy hh:mm:ss tt");
			refreshGrid();
			IniText();
			FillUserNameCombo();

			string zoneId2 = "E. Africa Standard Time";
			TimeZoneInfo tzi2 = TimeZoneInfo.FindSystemTimeZoneById(zoneId2);
			DateTime result2 = TimeZoneInfo.ConvertTimeFromUtc(System.DateTime.UtcNow, tzi2);
			string Current_Date = result2.ToString();

			txtdate.Text = Current_Date;

			CalendarExtender1.StartDate = Convert.ToDateTime("01" + "/" + Session["Current_Month_Id"] + "/" + Session["Current_Year_Id"]);
			CalendarExtender1.EndDate = Convert.ToDateTime(CalendarExtender1.StartDate).AddMonths(1).AddDays(-1);
		}
	}
	private void IniText()
	{
        Code_no();
		txtdate.Text = Today_Date.ToString("dd/MM/yyyy hh:mm:ss tt");
		cmbUser.SelectedIndex = 0;
		txtMoneyIn.Text = "";
		cmbVoucher.SelectedIndex = 0;
		txtremarks.Text = "";
	}
	public void Code_no()
	{
		string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
		SqlConnection con = new SqlConnection(connect);

		int r;
		try
		{
			if (con.State != ConnectionState.Open)
			{
				con.Close();
				con.Open();
			}
			SqlCommand cmd = new SqlCommand("Select max(Entry_ID) from tblEntry", con);
			SqlDataReader dr = cmd.ExecuteReader();

			if (dr.Read())
			{
				string d = dr[0].ToString();
				if (d == "")
				{
					txtEntry_Id.Text = "1";           //set the value in textbox which name is id
				}
				else
				{
					r = Convert.ToInt32(dr[0].ToString());
					r = r + 1;
					txtEntry_Id.Text = r.ToString();
				}
			}
		}
		catch (Exception ex)
		{
			Response.Write("<script>alert(" + ex.Message + ")</script>");
		}
		finally
		{
			con.Close();
		}
	}
	protected void insert_data()
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
			Code_no();
			string strQuery = " insert into tblEntry (Entry_ID, Entry_Dt, Emp_ID, Emp_Voucher, Money_In,Remarks,User_id)" +
							 " values('" + txtEntry_Id.Text + "', '" + DateTime.Parse(txtdate.Text).ToString("yyyy-MM-dd hh:mm:ss tt") + "' , '" + cmbUser.SelectedValue + "' , '" + cmbVoucher.Text + "' , '" + txtMoneyIn.Text + "' , '" + txtremarks.Text + "' , '" + Session["UserId"].ToString() + "')";
			SqlCommand cmd = new SqlCommand(strQuery);
			cmd.CommandType = CommandType.Text;
			cmd.Connection = con;
			cmd.ExecuteNonQuery();
			ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + cmbUser.SelectedItem + " added successfully....');window.location='support.aspx';</script>'");

			//Response.Write("<script> alert('" + cmbUser.SelectedValue + " added successfully....')</script>");
			//Response.Redirect(Request.Url.AbsoluteUri);
			//Response.Write("inserted successfully....");
		}
		catch (Exception ex)
		{
			ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='support.aspx';</script>'");
			//Response.Write("<script> alert ('" + ex.Message + "')</script>");
		}
		finally
		{
			con.Close();
			IniText();
			refreshGrid();
		}
	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		insert_data();
	}
	protected void refreshGrid()
	{
		string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
		string Session_Uname = Session["Uname"].ToString();
		string Session_Utype = Session["UserType"].ToString();
		SqlConnection con = new SqlConnection(connect);
		DataTable dt = new DataTable();

		string sQry = " Select * From ( " +
						" (Select B.Uname As [Emp_Name], A.Entry_Dt, A.Emp_Voucher As [Jobcard], A.Money_In As [In], 0 As [Out], A.Remarks, C.Uname As [User_Name] " +
						"	From tblEntry As A " +
						"	LEFT JOIN tblUser_Master As B ON (A.Emp_ID = B.User_id) " +
						"	LEFT JOIN tblUser_Master As C ON (A.User_id = C.User_id) Where A.Emp_ID = '" + Session["UserId"] + "' And MONTH(A.Entry_Dt) = '" + Session["Current_Month_Id"] + "' And Year(A.Entry_Dt) = '" + Session["Current_Year_Id"] + "') " +
						"   UNION ALL " +
						" (Select B.Uname As [Emp_Name], A.Entry_Dt, A.Emp_Voucher, 0 As [In], A.Money_In As [Out], A.Remarks, C.Uname As [User_Name] " +
						"	From tblEntry As A " +
						"	LEFT JOIN tblUser_Master As B ON (A.Emp_ID = B.User_id) " +
						"	LEFT JOIN tblUser_Master As C ON (A.User_id = C.User_id) Where A.User_ID = '" + Session["UserId"] + "' And MONTH(A.Entry_Dt) = '" + Session["Current_Month_Id"] + "' And Year(A.Entry_Dt) = '" + Session["Current_Year_Id"] + "') " +
						" ) As tmp order by Entry_Dt";

		SqlCommand cmd = new SqlCommand(sQry, con);
		SqlDataAdapter sda = new SqlDataAdapter();
		try
		{
			con.Open();
			sda.SelectCommand = cmd;
			DataSet ds = new DataSet();
			sda.Fill(ds);
			gridCustomer.DataSource = ds;

			gridCustomer.DataSourceID = null;
			gridCustomer.DataSource = ds;
			gridCustomer.DataBind();
			double totalSalary = 0;
			foreach (DataRow dr in ds.Tables[0].Rows)
			{
				totalSalary += Convert.ToDouble(dr["In"]) - Convert.ToDouble(dr["Out"]);
			}
			lblBalance_Amount.Text = totalSalary.ToString();
			Session["Balance_Amount"] = totalSalary.ToString();
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
	protected void gridCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		refreshGrid();
		gridCustomer.PageIndex = e.NewPageIndex;
		gridCustomer.DataBind();
	}
	protected void FillUserNameCombo()
	{
		string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
		string Session_Uname = Session["Uname"].ToString();
		string Session_Utype = Session["UserType"].ToString();

		using (SqlConnection con = new SqlConnection(connect))
		{
			if (Session_Utype == "1")
			{
				lblname.Visible = true;
				cmbUser.Visible = true;
				using (SqlCommand cmd = new SqlCommand("SELECT User_Id, Uname FROM tblUser_Master Where (UserType = '2' Or UserType = '1') And IsBlack_List = 'False'"))
				{
					cmd.CommandType = CommandType.Text;
					cmd.Connection = con;
					con.Open();
					cmbUser.DataSource = cmd.ExecuteReader();
					cmbUser.DataTextField = "Uname";
					cmbUser.DataValueField = "User_Id";
					cmbUser.DataBind();
					con.Close();
				}
			}
			else if (Session_Utype == "0")
			{
				lblname.Visible = true;
				cmbUser.Visible = true;
				using (SqlCommand cmd = new SqlCommand("SELECT User_Id, Uname FROM tblUser_Master Where UserType = 1 And IsBlack_List = 'False'"))
				{
					cmd.CommandType = CommandType.Text;
					cmd.Connection = con;
					con.Open();
					cmbUser.DataSource = cmd.ExecuteReader();
					cmbUser.DataTextField = "Uname";
					cmbUser.DataValueField = "User_Id";
					cmbUser.DataBind();
					con.Close();
				}
			}
			else if (Session_Utype == "2" && Session_Uname == Session["Uname"].ToString())
			{
				lblname.Visible = false;
				cmbUser.Visible = false;
			}
		}
		cmbUser.Items.Insert(0, new ListItem("-- Select Employee --", "0"));
	}
	protected void Button2_Click(object sender, EventArgs e)
	{
		txtdate.Text = "";
		cmbUser.SelectedIndex = 0;
		cmbVoucher.SelectedIndex = 0;
		txtMoneyIn.Text = "";
		txtremarks.Text = "";
		Response.Redirect("index.aspx");
	}
	protected void btn_Print_Click(object sender, EventArgs e)
	{
		Session["From_Date"] = txtFromDate.Text;
		Session["To_Date"] = txtToDate.Text;
		Response.Redirect("Frm_Report.aspx");
	}
	protected void GetCurrentTime()
	{
		//DateTime serverTime = DateTime.Now;
		//DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "Eastern Africa Time Zone");
		//return _localTime;
		string zoneId2 = "E. Africa Standard Time";
		TimeZoneInfo tzi2 = TimeZoneInfo.FindSystemTimeZoneById(zoneId2);
		DateTime result2 = TimeZoneInfo.ConvertTimeFromUtc(System.DateTime.UtcNow, tzi2);
		string Text = "Time is " + result2.ToString() + " in Tanzania ";
	}
}