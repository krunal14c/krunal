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
        txtBranchcode.Enabled = false;
        txtBranchname.Enabled = false;
        txtcalfrom.Enabled = false;
        txtcalto.Enabled = false;
    }
    private void Enable_Fields()
    {
        txtBranchcode.Enabled = true;
        txtBranchname.Enabled = true;
        txtcalfrom.Enabled = true;
        txtcalto.Enabled = true;
    }
    private void IniText()
    {
        txtBranch_ID.Text = "";
        txtBranchcode.Text = "";

        txtBranchname.Text = "";
        txtcalfrom.Text = "";
        txtcalto.Text = "";
        btnAdd.Enabled = true;
        btn_Save.Enabled = false;
        btn_Delete.Enabled = false;
    }
    protected void refreshGrid()
    {
        string connect = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        //string Session_Uname = Session["Uname"].ToString();
        //string Session_Utype = Session["UserType"].ToString();
        SqlConnection con = new SqlConnection(connect);
        DataTable dt = new DataTable();

        string sQry = " Select branchid, branchcode, branchname, fromdt, todt From tblBranch_Master Order By branchid";

        SqlCommand cmd = new SqlCommand(sQry, con);
        SqlDataAdapter sda = new SqlDataAdapter();
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gridBranch.DataSource = ds;

            gridBranch.DataSourceID = null;
            gridBranch.DataSource = ds;
            gridBranch.DataBind();
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
    protected void gridBranch_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        refreshGrid();
        gridBranch.PageIndex = e.NewPageIndex;
        gridBranch.DataBind();
    }
    protected void gridBranch_RowCommand(object sender, GridViewCommandEventArgs e)
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
                string strQuery = "Select * from tblBranch_Master Where branchid = " + e.CommandArgument;
                SqlDataAdapter dapt = new SqlDataAdapter(strQuery, con);
                DataTable dt = new DataTable();
                dapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txtBranch_ID.Text = dt.Rows[0]["branchid"].ToString();
                    txtBranchcode.Text = dt.Rows[0]["branchcode"].ToString();
                    txtBranchname.Text = dt.Rows[0]["branchname"].ToString();
                    txtcalto.Text = dt.Rows[0]["fromdt"].ToString();
                    txtcalto.Text = dt.Rows[0]["todt"].ToString();
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
                string strQuery = " insert into tblBranch_Master (branchcode, branchname, fromdt, todt)" +
                                 " values('" + txtBranchcode.Text + "', '" + txtBranchname.Text + "' , '" + DateTime.Parse(txtcalfrom.Text).ToString("yyyy-MM-dd") + "' , '" + DateTime.Parse(txtcalto.Text).ToString("yyyy-MM-dd") + "')";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + txtBranchname.Text + " added successfully....');window.location='Frm_Branch_Master.aspx';</script>'");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='Frm_Branch_Master.aspx';</script>'");
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
                string strQuery = " Update tblBranch_Master SET " +
                                  " branchcode = '" + txtBranchcode.Text + "', " +
                                  " branchname = '" + txtBranchname.Text + "', " +
                                  " fromdt = '" + txtcalfrom.Text + "', " +
                                  " todt = '" + txtcalto.Text + "'";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + txtBranchname.Text + " Updated successfully....');window.location='Frm_Branch_Master.aspx';</script>'");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='Frm_Branch_Master.aspx';</script>'");
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
                string strQuery = "Delete tblBranch_Master Where branchid = '" + txtBranch_ID.Text + "'";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + txtBranch_ID.Text + " Deleted successfully....');window.location='Frm_Branch_Master.aspx';</script>'");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('" + ex.Message + "');window.location='Frm_Branch_Master.aspx';</script>'");
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