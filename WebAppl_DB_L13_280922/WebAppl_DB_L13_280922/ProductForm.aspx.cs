using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
     

namespace WebAppl_DB_L13_280922
{
    public partial class ProductForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LTIN254607; initial catalog=DB_L13_280922; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            Display();
        }

        public void Clear()
        {
            txtname.Text = "";
            txtprice.Text="";
            txtmobile.Text = "";
            txtpassword.Text = "";
            txtcpassword.Text = "";
            
        }

        public void Display()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Display_Product", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource =dt;
            grd.DataBind();
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Insert_Product", con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name",txtname.Text);
            cmd.Parameters.AddWithValue("@price",txtprice.Text);
            cmd.Parameters.AddWithValue("@mobileno",txtmobile.Text);
            cmd.Parameters.AddWithValue("@password",txtpassword.Text);
            cmd.Parameters.AddWithValue("@confirmpassword",txtcpassword.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Display();
            Clear();
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Delete_Product", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",e.CommandArgument);
            cmd.ExecuteNonQuery();
            con.Close();
            Display(); 

        }
    }
}