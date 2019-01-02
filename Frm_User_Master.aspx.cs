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

public partial class Frm_User_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["Save_Status"] = "Insert";
            if (Session["UserId"] == null)
            {
                Response.Redirect("index.aspx");
            }
            string Session_User_Type = Session["UserType"].ToString();
            if (Session_User_Type == "22")
            {
                //Response.Redirect("Frm_User_Master.aspx");
                Menu_Logout.Visible = true;
            }
            else
            {
                Response.Redirect("support.aspx");
            }
            //txtdate.Text = Today_Date.ToString("dd/MM/yyyy hh:mm:ss tt");
            refreshGrid();
            Disable_Fields();
        }
    }

    private void Disable_Fields()
    {
        txtUsername.Enabled = false;
        txtpassword.Enabled = false;
        cmbUsertype.Enabled = false;
        chkIs_Blacklist.Enabled = false;
        txtbranchcode.Enabled = false;
    }
    private void Enable_Fields()
    {
        txtUsername.Enabled = true;
        txtpassword.Enabled = true;
        cmbUsertype.Enabled = true;
        chkIs_Blacklist.Enabled = true;
        txtbranchcode.Enabled = true;
    }
    private void IniText()
    {
        txtUser_ID.Text = "";
        txtUsername.Text = "";
        txtpassword.Text = "";
        txtbranchcode.Text = "";
        cmbUsertype.SelectedIndex = 0;
        chkIs_Blacklist.Checked = false;
        btnAdd.Enabled = true;
        btn_Save.Enabled = false;
        btn_Delete.Enabled = false;
    }
    protected void refreshGrid()
    {
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        string Session_Uname = Session["Uname"].ToString();
        string Session_Utype = Session["UserType"].ToString();
        SqlConnection con = new SqlConnection(connect);
        DataTable dt = new DataTable();

        string sQry = " Select User_id, Uname, Pwd, UserType, IsBlack_List, Branchcode From tblUser_Master Order By User_id";

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
    protected void gridCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);

        if (e.CommandName.Equals("Edt"))
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Close();
                    con.Open();
                }
                string strQuery = "Select * from tblUser_Master Where User_id = " + e.CommandArgument;
                SqlDataAdapter dapt = new SqlDataAdapter(strQuery, con);
                DataTable dt = new DataTable();
                dapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txtUser_ID.Text = dt.Rows[0]["User_id"].ToString();
                    txtUsername.Text = dt.Rows[0]["Uname"].ToString();
                    txtpassword.Text = dt.Rows[0]["Pwd"].ToString();
                    cmbUsertype.SelectedValue = dt.Rows[0]["UserType"].ToString();
                    chkIs_Blacklist.Checked = Convert.ToBoolean(dt.Rows[0]["IsBlack_List"].ToString());
                    txtbranchcode.Text = dt.Rows[0]["Branchcode"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "') </script>");
            }
            finally
            {
                con.Close();
                Session["Save_Status"] = "Update";
                Enable_Fields();
                btn_Save.Enabled = true;
                btn_Delete.Enabled = true;
                btnAdd.Enabled = false;
                btn_Cancel.Enabled = true;
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Session["Save_Status"] = "Insert";
        IniText();
        Enable_Fields();
        btnAdd.Enabled = false;
        btn_Delete.Enabled = false;
        btn_Save.Enabled = true;
        btn_Cancel.Enabled = true;
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);

        string Insert_Update_Delete = Session["Save_Status"].ToString();
        if(Insert_Update_Delete == "Insert")
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Close();
                    con.Open();
                }
                string strQuery = " insert into tblUser_Master (Uname, Pwd, UserType, IsBlack_List, Branchcode)" +
                                 " values('" + txtUsername.Text + "', '" + txtpassword.Text + "' , '" + cmbUsertype.SelectedValue + "' , '" + chkIs_Blacklist.Checked + "', '"+txtbranchcode.Text+"')";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + txtUsername.Text + " added successfully....');window.location='Frm_User_Master.aspx';</script>'");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='Frm_User_Master.aspx';</script>'");
            }
            finally
            {
                con.Close();
                IniText();
                Disable_Fields();
                refreshGrid();
            }
        }
        else if (Insert_Update_Delete == "Update")
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Close();
                    con.Open();
                }
                string strQuery = " Update tblUser_Master SET " +
                                  " Uname = '" + txtUsername.Text + "', " +
                                  " Pwd = '" + txtpassword.Text + "', " +
                                  " UserType = '" + cmbUsertype.SelectedValue + "', " +
                                  " IsBlack_List = '" + chkIs_Blacklist.Checked + "'," +
                                  " Branchcode = '" + txtbranchcode.Text + "'" +
                                 " Where User_id = '" + txtUser_ID.Text + "'";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + txtUsername.Text + " Updated successfully....');window.location='Frm_User_Master.aspx';</script>'");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='Frm_User_Master.aspx';</script>'");
            }
            finally
            {
                con.Close();
                IniText();
                Disable_Fields();
                refreshGrid();
            }
        }
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connect);

        string Insert_Update_Delete = Session["Save_Status"].ToString();
        if (Insert_Update_Delete == "Update")
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Close();
                    con.Open();
                }
                string strQuery = "Delete tblUser_Master Where User_id = '" + txtUser_ID.Text + "'";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + txtUsername.Text + " Deleted successfully....');window.location='Frm_User_Master.aspx';</script>'");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='Frm_User_Master.aspx';</script>'");
            }
            finally
            {
                con.Close();
                IniText();
                Disable_Fields();
                refreshGrid();
            }
        }
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        IniText();
        Disable_Fields();
        refreshGrid();
    }
}