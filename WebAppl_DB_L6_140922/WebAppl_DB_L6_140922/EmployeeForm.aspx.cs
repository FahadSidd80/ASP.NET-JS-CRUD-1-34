using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebAppl_DB_L6_140922
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        SqlConnection con= new SqlConnection("data source=LTIN254607; initial catalog=DB_L6_140922; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayBind();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Employee(name,age,city)values('"+txtname.Text+"','"+txtage.Text+"','"+txtcity.Text+"')",con);
            cmd.ExecuteNonQuery();
            con.Close();
            DisplayBind();
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

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Employee where empid='"+e.CommandArgument+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            DisplayBind();
        }
    }
}