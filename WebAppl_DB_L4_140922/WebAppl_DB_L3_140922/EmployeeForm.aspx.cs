using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebAppl_DB_L3_140922
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LTIN254607;initial catalog=DB_L3_140922; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Employee(name,city,age)values('"+txtname.Text+"','"+txtcity.Text+"','"+txtage.Text+"')",con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}