using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace WebAppl_DB_L30_03212023_Chkbx_Edit_LoginPage
{
    public partial class LoginPageAdminMaster : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_UserRegistartion_LogIn", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "SelectLogin");
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                Session["LoginUid"] = dt.Rows[0]["uid"].ToString();
                Session["oldpassword"] = dt.Rows[0]["password"].ToString();
                Response.Redirect("HomePageMaster.aspx");
                //lblmsg.Text = "Login Successfully !!";
                //lblmsg.ForeColor = Color.Green;
            }
            else
            {
                lblmsg.Text = "Your email Id & password is wrong !! Login Failed !!";
                lblmsg.ForeColor = Color.Red;
            }
        }
    }
}