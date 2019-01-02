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
using System.Management;
using System.Net.NetworkInformation;
using System.Configuration;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["UserId"] = null;
            SetCurrent_Month();
            FillCombo();
        }
    }
    private void SetCurrent_Month()
    {
        string sQry = "Select * From tblPeriod Where Year_ID = " + DateTime.Now.Year + "";
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);

        con.Open();
        SqlCommand cmd = new SqlCommand(sQry, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count <= 0)
        {
            for (int i = 1; i <= 12; i++)
            {
                DateTime startDt = Convert.ToDateTime(DateTime.Now.Year + "/" + i + "/01");
                DateTime lastDt = Convert.ToDateTime(startDt.AddMonths(1).AddDays(-1));
                bool IsCurrent_Month = (i == 1 ? true : false);

                string strQuery = " insert into tblPeriod (Month_Id, Month_Name, Start_Date, End_Date, IsCurrent_Month, IsClose_Month, Year_Id, IsClose_Year)" +
                                " values (" + i + ", '" + startDt.ToString("MMMM") + "', '" + startDt.ToString("yyyy/MM/dd") + "', '" + lastDt.ToString("yyyy/MM/dd") + "', '" + IsCurrent_Month + "', 'False', " + startDt.Year + ", 'False')";
                SqlCommand cmd2 = new SqlCommand(strQuery);
                cmd2.CommandType = CommandType.Text;
                cmd2.Connection = con;
                cmd2.ExecuteNonQuery();
            }
        }
    }
    protected void btnSignin_Click(object sender, EventArgs e)
    {
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);

        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from tblUser_Master where Uname='" + txtUsername.Text + "' and Pwd ='" + txtPassword.Text + "' And IsBlack_List = 'False'",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["UserId"] = dt.Rows[0]["User_Id"].ToString();
            Session["Uname"] = dt.Rows[0]["Uname"].ToString();
            Session["UserType"] = dt.Rows[0]["UserType"].ToString();

            string Session_UserType = Session["UserType"].ToString();

            Response.Write("<script>alert('Login successfull..." + Session["UserId"].ToString() + "'" + Session["UserType"].ToString() + "'" + Session["Uname"].ToString() + "')</script>");

            string sCurrent_Year = "Select * from tblPeriod where Year_Id = " + cmbYear.SelectedValue + " And IsCurrent_Month = 'True'";
            SqlCommand cmdCurre_Year = new SqlCommand(sCurrent_Year, con);
            DataTable dtCurr_Year = new DataTable();
            SqlDataAdapter daCurr_Year = new SqlDataAdapter(cmdCurre_Year);
            daCurr_Year.Fill(dtCurr_Year);
            Session["Current_Year_Id"] = dtCurr_Year.Rows[0]["Year_Id"].ToString();
            Session["Current_Month_Id"] = dtCurr_Year.Rows[0]["Month_Id"].ToString();
            Session["Start_Date"] = dtCurr_Year.Rows[0]["Start_Date"].ToString();
            Session["End_Date"] = dtCurr_Year.Rows[0]["End_Date"].ToString();
            Session["Current_Month_Name"] = dtCurr_Year.Rows[0]["Month_Name"].ToString();
            UpdateIP_PCname();

            if (Session_UserType == "22")
            {
                Response.Redirect("Frm_User_Master.aspx");
            }
            else
            {
                Response.Redirect("support.aspx");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Warning", "<script type='text/javascript'>alert('Please enter valid Username and Password !!!!');window.location='index.aspx';</script>'");
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtUsername.Text = "";
        txtPassword.Text = "";
        Response.Redirect("index.aspx");
    }
    private void FillCombo()
    {
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        using (SqlConnection con = new SqlConnection(connect))
        {
            using (SqlCommand cmd = new SqlCommand("Select Year_ID From tblPeriod Where IsClose_Year = 0 Group By Year_ID"))
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
    protected void UpdateIP_PCname()
    {
        string ipaddress, PCName;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        //PCName = Request.ServerVariables["REMOTE_HOST"];
        string[] computer_name = System.Net.Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName.Split(new Char[] { '.' });
            String ecn = System.Environment.MachineName;

        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);
        try
        {
            if (con.State != ConnectionState.Open)
            {
                con.Close();
                con.Open();
            }
            string strQuery = " Update tblUser_Master set Last_Login_IP = '" + ipaddress + "', Last_Login_PCname = '" + computer_name[0].ToString() +"' Where Uname = '" + txtUsername.Text + "'";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='support.aspx';</script>'");
        }
        finally
        {
            con.Close();
        }
    }
}