using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAppl_DB_L25_All_CRUD_DD_03082023_Master
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (! IsPostBack)
            {
                GetGrid();
                GetCountry();
                ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
                ddlstate.Enabled = false;

               
            }
        }
        public void clearText()
        {
            txtname.Text = "";
            txtage.Text = "";
            rblgender.ClearSelection();
            ddlcountry.SelectedValue = "0";
            ddlstate.Enabled = false;
            btnsave.Text = "Save";

        }

        public void GetGrid()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_Get_registration", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }

        public void GetCountry()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_Get_tblcountry", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            ddlcountry.DataValueField = "cid";
            ddlcountry.DataTextField = "cname";
            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("--Select--", "0"));

        }

        public void GetState()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_tblState_Get", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@countryid", ddlcountry.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            ddlstate.Enabled = true;
            ddlstate.DataValueField = "sid";
            ddlstate.DataTextField = "sname";
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));

        }


        protected void btnsave_Click(object sender, EventArgs e)
        {
            if(btnsave.Text == "Save")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_Insert_registration", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@country", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@state", ddlstate.SelectedValue);
                cmd.ExecuteNonQuery();
                conn.Close();
                GetGrid();
                clearText();
            }
            else if (btnsave.Text=="Update")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_Update_registration", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uid", ViewState["abc"]);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@country", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@state", ddlstate.SelectedValue);
                cmd.ExecuteNonQuery();
                conn.Close();
                GetGrid();
                clearText();
            }
            
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_delete_registration", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@did", e.CommandArgument);
                cmd.ExecuteNonQuery();
                conn.Close();
                GetGrid();
            }
            else if(e.CommandName=="Edt")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_Edit_Registration", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@eid", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                conn.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["gender"].ToString();
                ddlcountry.SelectedValue = dt.Rows[0]["country"].ToString();
                GetState();
                ddlstate.SelectedValue = dt.Rows[0]["state"].ToString();
                ViewState["abc"] = e.CommandArgument;
                btnsave.Text = "Update";
            }
          
        }

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcountry.SelectedValue == "0")
            {
                ddlstate.Enabled = false;
            }
            else
            {
                GetState();
            }
        }
    }
}