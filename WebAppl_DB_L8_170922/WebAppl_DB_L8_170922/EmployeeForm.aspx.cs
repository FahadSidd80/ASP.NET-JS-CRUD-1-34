using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebAppl_DB_L8_170922
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LTIN254607; initial catalog=DB_L8_170922; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayBind();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text == "Save")
            {
                //con.Open();
                //SqlCommand cmd = new SqlCommand("insert into Employee(name,city,age)values('" + txtname.Text + "','" + txtcity.Text + "','" + txtage.Text + "')", con);
                //cmd.ExecuteNonQuery();
                //con.Close();
                //DisplayBind();
                //clearValue();

                // Same code by SQL Procedure
                
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Insert_Employee", con); // Recommended Aprroach
                cmd.CommandType=CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@a",txtname.Text);
                cmd.Parameters.AddWithValue("@b", txtcity.Text);
                cmd.Parameters.AddWithValue("@c", txtage.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayBind();
                clearValue();
            }
            else if (btnsave.Text == "update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Employee set name='"+txtname.Text+"',city='"+txtcity.Text+"',age='"+txtage.Text+"' where id='" + ViewState["pqr"] +"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayBind();
                clearValue();
            }
        }

        public void DisplayBind()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Employee",con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }
        public void clearValue() // created by me not explained by sir at this stage or lecture
        {
            txtname.Text = "";
            txtcity.Text = "";
            txtage.Text = "";
            btnsave.Text = "Save";
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                //con.Open();
                //SqlCommand cmd = new SqlCommand("delete from Employee where id='" + e.CommandArgument + "'", con);
                //cmd.ExecuteNonQuery();
                //con.Close();
                //DisplayBind();

                // By using SQL Procedure

                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Delete_Employee", con); // Recommended approach
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@a",e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayBind();
            }
            else if (e.CommandName=="Edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Employee where id='"+e.CommandArgument+"'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                //txtname.Text = dt.Rows[0]["1"].ToString();
                txtcity.Text = dt.Rows[0]["city"].ToString();
                //txtcity.Text = dt.Rows[0]["2"].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                //txtage.Text = dt.Rows[0]["3"].ToString();
                btnsave.Text = "update";
                ViewState["pqr"] = e.CommandArgument;
            }
        }
    }
}