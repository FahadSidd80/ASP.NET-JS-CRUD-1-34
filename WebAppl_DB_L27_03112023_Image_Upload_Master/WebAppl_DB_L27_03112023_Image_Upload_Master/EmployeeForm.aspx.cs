using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace WebAppl_DB_L27_03112023_Image_Upload_Master
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetGrid();

            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text == "Save")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_tblEmployee", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action","INS");
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@img", Path.GetFileName(fuimg.PostedFile.FileName) );
                cmd.ExecuteNonQuery();
                conn.Close();
                fuimg.SaveAs(Server.MapPath("photos"+"\\"+ Path.GetFileName(fuimg.PostedFile.FileName)));
                GetGrid();


            }
        }
        public void GetGrid()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_tblEmployee", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action","SELECT");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}