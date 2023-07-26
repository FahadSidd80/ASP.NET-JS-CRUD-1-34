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
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnupdatepassword_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_User_ChangePassword", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Updatepassword");
            cmd.Parameters.AddWithValue("@pid", Session["LoginUid"]);
            cmd.Parameters.AddWithValue("@oldpassword", txtoldpassword.Text);
            cmd.Parameters.AddWithValue("@newpassword", txtnewpassword.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.Text = "Your password has been updated successfully !!";
            lblmsg.ForeColor = Color.Green;
        }
    }
}