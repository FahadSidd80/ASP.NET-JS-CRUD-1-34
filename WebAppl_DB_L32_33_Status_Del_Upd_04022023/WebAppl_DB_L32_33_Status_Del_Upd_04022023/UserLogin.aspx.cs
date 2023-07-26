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

namespace WebAppl_DB_L32_33_Status_Del_Upd_04022023
{
    public partial class UserLogin : System.Web.UI.Page
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
                Session["name"] = dt.Rows[0]["name"].ToString();
                Session["oldpassword"] = dt.Rows[0]["password"].ToString();
                Session["uid"] = dt.Rows[0]["uid"].ToString();
                Response.Redirect("UserHome.aspx");
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