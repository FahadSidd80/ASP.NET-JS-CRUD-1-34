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
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null && Session["uid"].ToString() != "")
            {
                // page load code .. like country/state bind 
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
            // need to go deepdive in &, && operator in c#
            //if (Session["uid"] != null & Session["uid"].ToString() != "")
            //{
            //    // page load code .. like country/state bind 
            //}
            //else
            //{
            //    Response.Redirect("Logout.aspx");
            //}
        }
        public void clearText()
        {
            txtoldpassword.Text = "";
            txtnewpassword.Text = "";
            txtconfirmnewpassword.Text = "";

        }

        protected void btnupdatepassword_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_User_ChangePassword", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Updatepassword");
            cmd.Parameters.AddWithValue("@pid", Session["uid"]);
            cmd.Parameters.AddWithValue("@oldpassword", txtoldpassword.Text);
            cmd.Parameters.AddWithValue("@newpassword", txtnewpassword.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            //lblmsg.Text = "Your password has been updated successfully !!";
            //lblmsg.ForeColor = Color.Green;
            if (Session["oldpassword"].ToString() == txtoldpassword.Text)
            {
                lblmsg.Text = "Your password has been updated successfully !!";
                lblmsg.ForeColor = Color.Green;
            }
            else
            {
                lblmsg.Text = "Old password didn't match, Enter correct password!!";
                lblmsg.ForeColor = Color.Red;
                // have some bug need to correct. 
            }
            clearText();
        }
    }
}