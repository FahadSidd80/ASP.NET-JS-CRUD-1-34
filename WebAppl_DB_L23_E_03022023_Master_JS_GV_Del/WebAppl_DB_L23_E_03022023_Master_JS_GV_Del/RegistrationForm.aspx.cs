using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
     

namespace WebAppl_DB_L23_E_03022023_Master_JS_GV_Del
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetGrid();
                GetCountry();
            }
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
            ddlcountry.Items.Insert(0, new ListItem("--Select--","0"));
           
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_Insert_registration", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@age", txtage.Text);
            cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
            cmd.Parameters.AddWithValue("@country", ddlcountry.SelectedValue);
            cmd.ExecuteNonQuery();
            conn.Close();
            GetGrid();
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}