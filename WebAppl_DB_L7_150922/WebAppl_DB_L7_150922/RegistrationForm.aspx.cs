using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebAppl_DB_L7_150922
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LTIN254607; initial catalog=DB_L7_150922; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayGrid();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if(btnsave.Text=="Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Registration(name,gender,age)values('" + txtname.Text + "','" + txtgender.Text + "','" + txtage.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
            }
            else if (btnsave.Text=="Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Registration set name='"+txtname.Text+"',gender='"+txtgender.Text+"',age='"+txtage.Text+"' where rid ='" + ViewState["abc"] +"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
            } 

        }
        public void DisplayGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Registration",con);
            SqlDataAdapter da= new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Registration where rid ='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
            }
            else if (e.CommandName=="Edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Registration where rid ='"+e.CommandArgument+"'",con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                //txtname.Text = dt.Rows[0][1].ToString();
                txtgender.Text = dt.Rows[0]["gender"].ToString();
                //txtgender.Text = dt.Rows[0][2].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                //txtage.Text = dt.Rows[0][3].ToString();
                btnsave.Text = "Update";
                ViewState["abc"] = e.CommandArgument;
            }
           
        }
    }
}