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

public partial class Frm_Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("index.aspx");
            }
            refreshGrid();
        }
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
						" ) As tmp Where DAY(Entry_Dt) BETWEEN '" + Convert.ToDateTime(Session["From_Date"].ToString()).ToString("dd") + "' And " + 
						" '" + Convert.ToDateTime(Session["To_Date"].ToString()).ToString("dd") + "'  order by Entry_Dt";

        SqlCommand cmd = new SqlCommand(sQry, con);
        SqlDataAdapter sda = new SqlDataAdapter();
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(dt);
            gridCustomer.DataSource = dt;
            gridCustomer.DataSourceID = null;
            ds.Tables.Add(dt);
            gridCustomer.DataSource = ds.Tables[0];
            gridCustomer.DataBind();

            double TotalBalance = 0;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                TotalBalance += Convert.ToDouble(dr["In"]) - Convert.ToDouble(dr["Out"]);
            }
            lblBalance.Text = "Balance Amount : " + Session["Balance_Amount"].ToString() + ",";

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
}