﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAppl_DB_L30_03212023_Chkbx_Edit_LoginPage
{
    public partial class UserRegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayGrid();
            }
        }
        public void ClearText()
        {
            txtname.Text = "";
            txtemail.Text = "";
            txtpassword.Text = "";
            rblgender.ClearSelection();
            cblhobbies.ClearSelection();
            btnsave.Text = "Save";

        }
        public void DisplayGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_UserRegistration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "SELECT");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();


        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            String cbl = "";
            for (int i = 0; i < cblhobbies.Items.Count; i++)
            {
                if (cblhobbies.Items[i].Selected == true)
                {
                    cbl += cblhobbies.Items[i].Text + ",";
                }
            }
            cbl = cbl.TrimEnd(',');

            if (btnsave.Text == "Save")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("sp_UserRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "INS");
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@hobbies", cbl);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
                ClearText();
            }
            else if (btnsave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_UserRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Update");
                cmd.Parameters.AddWithValue("@uid", ViewState["abc"]);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@hobbies", cbl);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
                ClearText();

            }
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_UserRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Edit");
                cmd.Parameters.AddWithValue("@eid", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtemail.Text = dt.Rows[0]["email"].ToString();
                txtpassword.Text = dt.Rows[0]["password"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["gender"].ToString();
                String[] arr = dt.Rows[0]["hobbies"].ToString().Split(',');
                for (int i=0; i<cblhobbies.Items.Count; i++)
                {
                    for (int j=0; j<arr.Length;j++)
                    {
                       if(cblhobbies.Items[i].Text == arr[j])
                       {
                            cblhobbies.Items[i].Selected = true;
                       }
                    }
                }
                btnsave.Text = "Update";
                ViewState["abc"] = e.CommandArgument;
            }
            else if (e.CommandName == "Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_UserRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Delete");
                cmd.Parameters.AddWithValue("@did", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();

            }

        }
    }
}