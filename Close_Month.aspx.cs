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

public partial class Close_Month : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("index.aspx");
            }
            string Session_Utype = Session["UserType"].ToString();
            if (Session_Utype == "0")
            {
                Menu_Admin_Reporting.Visible = true;
                Menu_Period.Visible = true;
                Menu_Logout.Visible = true;
                refreshGrid();
            }
            else
            {
                Menu_Admin_Reporting.Visible = false;
                Menu_Period.Visible = false;
                Menu_Logout.Visible = true;
                form1.Visible = false;
            }
            Code_no();
        }
    }
    protected void Code_no()
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
    protected void Select_Current_Month()
    {
        string Session_Utype = Session["UserType"].ToString();
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);
        try
        {
            if (con.State != ConnectionState.Open)
            {
                con.Close();
                con.Open();
            }
            if (Session_Utype == "0")
            {
                for (int i = 0; i < gridClose_Month.Rows.Count; i++)
                {
                    RadioButton rb = (RadioButton)gridClose_Month.Rows[i].Cells[1].FindControl("chkSelect");
                    CheckBox chkMonth = (CheckBox)gridClose_Month.Rows[i].Cells[5].FindControl("chkisClose_Month");
                    CheckBox chkYear = (CheckBox)gridClose_Month.Rows[i].Cells[6].FindControl("chkisClose_Year");
                    if (rb != null)
                    {
                        if (rb.Checked)
                        {
                            if (chkMonth != null && chkMonth.Checked == true)
                            {
                                Response.Write("<script> alert ('Month is already Closed, Please select another month')</script>");
                            }
                            else
                            {
                                if (chkYear != null && chkYear.Checked == true)
                                {
                                    Response.Write("<script> alert ('Year is already Closed, Please select another period')</script>");
                                }
                                else
                                {
                                    string strQuery = "Update tblPeriod set [IsCurrent_Month] = '0' where Year_Id = " + Session["Current_Year_Id"].ToString();
                                    strQuery = strQuery + "; Update tblPeriod set [IsCurrent_Month] = '1' where Month_ID = " + gridClose_Month.Rows[i].Cells[1].Text + " And Year_Id = " + Session["Current_Year_Id"].ToString();
                                    SqlCommand cmd = new SqlCommand(strQuery);
                                    cmd.CommandType = CommandType.Text;
                                    cmd.Connection = con;
                                    cmd.ExecuteNonQuery();

                                    string sCurrent_Year = "Select * from tblPeriod where Year_Id = " + Session["Current_Year_Id"] + " And IsCurrent_Month = 'True'";
                                    SqlCommand cmdCurre_Year = new SqlCommand(sCurrent_Year, con);
                                    DataTable dtCurr_Year = new DataTable();
                                    SqlDataAdapter daCurr_Year = new SqlDataAdapter(cmdCurre_Year);
                                    daCurr_Year.Fill(dtCurr_Year);
                                    Session["Current_Month_Id"] = dtCurr_Year.Rows[0]["Month_Id"].ToString();
                                    Session["Current_Month_Name"] = dtCurr_Year.Rows[0]["Month_Name"].ToString();
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script> alert ('You do not have sufficient rights to Select Month....')</script>");
                goto Exit_Process;
            }
        Exit_Process: ;
        }
        catch (Exception ex)
        {
            Response.Write("<script> alert ('" + ex.Message + "')</script>");
        }
        finally
        {
            con.Close();
            refreshGrid();
        }
    }
    protected void refreshGrid()
    {
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);
        DataTable dt = new DataTable();

        string sQry = "select * from tblPeriod Where Year_Id = " + Session["Current_Year_Id"].ToString();
        SqlCommand cmd = new SqlCommand(sQry, con);
        SqlDataAdapter sda = new SqlDataAdapter();
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gridClose_Month.DataSource = ds;
            gridClose_Month.DataSourceID = null;
            gridClose_Month.DataSource = ds;
            gridClose_Month.DataBind();

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
    protected void gridClose_Month_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        refreshGrid();
        gridClose_Month.PageIndex = e.NewPageIndex;
        gridClose_Month.DataBind();
    }
    protected void btnSelect_Month_Click(object sender, EventArgs e)
    {
        Select_Current_Month();
    }
    protected void btnClose_Year_Click(object sender, EventArgs e)
    {
        string Session_Utype = Session["UserType"].ToString();
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);

        try
        {
            if (con.State != ConnectionState.Open)
            {
                con.Close();
                con.Open();
            }
            if (Session_Utype == "0")
            {
                string strQuery = "Update tblPeriod set [IsClose_Year] = '1' where Year_Id = " + Session["Current_Year_Id"].ToString();
                strQuery = strQuery + " ; Update tblPeriod set [IsCurrent_Month] = '0' where Year_Id = " + Session["Current_Year_Id"].ToString();
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                Response.Write("<script> alert ('" + Session["Current_Year_Id"].ToString() + " year closed')</script>");
            }
            else
            {
                Response.Write("<script> alert('You do not have sufficient rights to Close Year....') </script>");
                goto Exit_Process;
            }
        Exit_Process: ;
        }
        catch (Exception ex)
        {
            Response.Write("<script> alert ('" + ex.Message + "')</script>");
        }
        finally
        {
            con.Close();
            refreshGrid();
        }
    }
    protected void gridClose_Month_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[5].Enabled = false;
            e.Row.Cells[6].Enabled = false;
        }
    }
    protected void btnClose_Month_Click(object sender, EventArgs e)
    {
        string Session_Utype = Session["UserType"].ToString();
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);

        try
        {
            if (con.State != ConnectionState.Open)
            {
                con.Close();
                con.Open();
            }
            if (Session_Utype == "0")
            {
                for (int i = 0; i < gridClose_Month.Rows.Count; i++)
                {
                    RadioButton rb = (RadioButton)gridClose_Month.Rows[i].Cells[1].FindControl("chkSelect");
                    if (rb != null)
                    {
                        if (rb.Checked)
                        {
                            string strQuery = "Update tblPeriod set [IsCurrent_Month] = '0' where Year_Id = " + Session["Current_Year_Id"].ToString();
                            strQuery = strQuery + "; Update tblPeriod set [IsClose_Month] = '1' where Month_ID = " + gridClose_Month.Rows[i].Cells[1].Text + " And Year_Id = " + Session["Current_Year_Id"].ToString();
                            //strQuery = strQuery + "; Update tblPeriod set [IsCurrent_Month] = '1' where Month_ID = " + gridClose_Month.Rows[i + 1].Cells[1].Text + " And Year_Id = " + Session["Current_Year_Id"].ToString();
                            SqlCommand cmd = new SqlCommand(strQuery);
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            cmd.ExecuteNonQuery();
                            Response.Write("<script> alert ('Month :-" + gridClose_Month.Rows[i].Cells[2].Text + "," + gridClose_Month.Rows[i].Cells[7].Text + " close successfully...')</script>");

                            string sCurrent_Year = "Select * from tblPeriod where Year_Id = " + Session["Current_Year_Id"] + " And IsCurrent_Month = 'True'";
                            SqlCommand cmdCurre_Year = new SqlCommand(sCurrent_Year, con);
                            DataTable dtCurr_Year = new DataTable();
                            SqlDataAdapter daCurr_Year = new SqlDataAdapter(cmdCurre_Year);
                            daCurr_Year.Fill(dtCurr_Year);
                            Session["Current_Month_Id"] = dtCurr_Year.Rows[0]["Month_Id"].ToString();
                            Session["Current_Month_Name"] = dtCurr_Year.Rows[0]["Month_Name"].ToString();
                            Session["Current_Year_Id"] = dtCurr_Year.Rows[0]["Year_Id"].ToString();
                            Session["Month_End_Date"] = Convert.ToDateTime(dtCurr_Year.Rows[0]["End_Date"].ToString()).ToString("yyyy-MM-dd");

                            Response.Redirect(Request.RawUrl);
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script> alert ('You do not have sufficient rights to Close Month....')</script>");
                goto Exit_Process;
            }
        Exit_Process: ;
        }
        catch (Exception ex)
        {
            Response.Write("<script> alert ('" + ex.Message + "')</script>");
        }
        finally
        {
            con.Close();
            refreshGrid();
        }
    }
    protected void btnCarry_Forward_Click(object sender, EventArgs e)
    {
        string Session_Utype = Session["UserType"].ToString();
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);
        try
        {
            if (con.State != ConnectionState.Open)
            {
                con.Close();
                con.Open();
            }
            if (Session_Utype == "0")
            {
                string sCurrent_Year = "Select * from tblPeriod where Year_Id = " + Session["Current_Year_Id"] + " And IsCurrent_Month = 'True'";
                SqlCommand cmdCurre_Year = new SqlCommand(sCurrent_Year, con);
                DataTable dtCurr_Year = new DataTable();
                SqlDataAdapter daCurr_Year = new SqlDataAdapter(cmdCurre_Year);
                daCurr_Year.Fill(dtCurr_Year);
                Session["Current_Month_Id"] = dtCurr_Year.Rows[0]["Month_Id"].ToString();
                Session["Current_Month_Name"] = dtCurr_Year.Rows[0]["Month_Name"].ToString();
                Session["Current_Year_Id"] = dtCurr_Year.Rows[0]["Year_Id"].ToString();
                Session["Month_End_Date"] = Convert.ToDateTime(dtCurr_Year.Rows[0]["End_Date"].ToString()).ToString("yyyy-MM-dd");

                string Session_Current_Month_Id = Session["Current_Month_Id"].ToString();
                string Session_Current_Year_Id = Session["Current_Year_Id"].ToString();
                string Session_TO_Month_ID = Convert.ToDateTime(Session["Month_End_Date"].ToString()).AddMonths(1).ToString("yyyy-MM-dd");

                string sQry = "Select tmp.User_id [ID], tmp.Emp_Name As [Name], SUM(tmp.Money_In) As [IN] , SUM(tmp.Money_Out) As [OUT], " +
                                " (SUM(tmp.Money_In) - SUM(tmp.Money_Out)) As [Balance]  From ( " +
                                " (Select B.User_id, B.Uname As [Emp_Name], A.Money_In As [Money_In], 0 As [Money_Out] " +
                                " From tblEntry As A " +
                                " LEFT JOIN tblUser_Master As B ON (A.Emp_ID = B.User_id) " +
                                " LEFT JOIN tblUser_Master As C ON (A.User_id = C.User_id) " +
                                " Where MONTH(A.Entry_Dt) = " + Session_Current_Month_Id + " And Year(A.Entry_Dt) = " + Session_Current_Year_Id + " And B.IsBlack_List = 0) " +
                                "	UNION ALL " +
                                " (Select C.User_id, C.Uname As [Emp_Name], 0 As [Money_In], A.Money_In As [Money_Out] " +
                                " From tblEntry As A " +
                                " LEFT JOIN tblUser_Master As C ON (A.User_id = C.User_id) " +
                                " Where MONTH(A.Entry_Dt) = " + Session_Current_Month_Id + " And Year(A.Entry_Dt) = " + Session_Current_Year_Id + " And C.IsBlack_List = 0 " +
                                " ) )As tmp Where tmp.Emp_Name Is NOT NULL Group By tmp.User_id, tmp.Emp_Name ";
                SqlCommand cmdCurry_Forward = new SqlCommand(sQry, con);
                DataTable dtCurry_Forward = new DataTable();
                SqlDataAdapter daCurrr_Forward = new SqlDataAdapter(cmdCurry_Forward);
                daCurrr_Forward.Fill(dtCurry_Forward);
                //Response.Write("<script> confirm('Do you want to Carry Forward " + Session_Current_Month_Id + "????') </script>");
                string strQuery = "";
                for (int i = 0; i <= dtCurry_Forward.Rows.Count - 1; i++)
                {
                    Code_no();
                    string sCount = " Select Count(*) from tblEntry Where Entry_Dt = '" + Convert.ToDateTime(Session_TO_Month_ID).Year + "-" + Convert.ToDateTime(Session_TO_Month_ID).Month + "-01 00:00:01' And " +
                                    " Emp_Id = " + dtCurry_Forward.Rows[i][0].ToString() + " And Remarks = 'OPB' And User_Id = 0";

                    SqlCommand cmdCount = new SqlCommand(sCount, con);
                    DataTable dtCount = new DataTable();
                    SqlDataAdapter daCount = new SqlDataAdapter(cmdCount);
                    daCount.Fill(dtCount);

                    if (Convert.ToInt32(dtCount.Rows[0][0].ToString()) > 0)
                    {
                        strQuery = strQuery + (strQuery == "" ? "" : "     ;   ") +
                               " Update tblEntry Set Entry_ID = '" + txtEntry_Id.Text + "'," +
                               " Emp_Voucher = 'No'," +
                               " Money_In = " + dtCurry_Forward.Rows[i][4].ToString() + ", " +
                               " Remarks = 'OPB'," +
                               " User_Id = 0" +
                               " Where Emp_ID = " + dtCurry_Forward.Rows[i][0].ToString() + " And " +
                               " Entry_Dt = '" + Convert.ToDateTime(Session_TO_Month_ID).Year + "-" + Convert.ToDateTime(Session_TO_Month_ID).Month + "-01 00:00:01'";
                    }
                    else
                    {
                        strQuery = strQuery + (strQuery == "" ? "" : "     ;   ") +
                                    " Insert Into tblEntry (Entry_ID, Entry_Dt,Emp_ID, Emp_Voucher, Money_In, Remarks, User_Id)" +
                                    " Values (" + txtEntry_Id.Text + ",  '" + Convert.ToDateTime(Session_TO_Month_ID).Year + "-" + Convert.ToDateTime(Session_TO_Month_ID).Month + "-01 00:00:01'," +
                                    " " + dtCurry_Forward.Rows[i][0].ToString() + " , 'No', " + dtCurry_Forward.Rows[i][4].ToString() + " , 'OPB', 0)";
                    }
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                }
                Response.Write("<script> confirm('Data Carry Forward to" + Session_TO_Month_ID + " Successfully....') </script>");
            }
            else
            {
                Response.Write("<script> alert ('You do not have sufficient rights to Select Month....')</script>");
                goto Exit_Process;
            }
        Exit_Process: ;
        }
        catch (Exception ex)
        {
            Response.Write("<script> alert ('" + ex.Message + "')</script>");
        }
        finally
        {
            con.Close();
            refreshGrid();
        }
    }
    protected void btn_Close_Click(object sender, EventArgs e)
    {
        Response.Redirect("support.aspx");
    }
}