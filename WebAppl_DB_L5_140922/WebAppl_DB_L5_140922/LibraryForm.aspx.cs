using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebAppl_DB_L5_140922
{
    public partial class LibraryForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LTIN254607; initial catalog=DB_L5_140922; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayTable();
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert Library(bookname,price,author)values('"+txtbname.Text+"','"+txtbprice.Text+"','"+txtbauthor.Text+"')",con);
            cmd.ExecuteNonQuery();
            con.Close();
            DisplayTable();
        }

        public void DisplayTable()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Library", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }
    }
}