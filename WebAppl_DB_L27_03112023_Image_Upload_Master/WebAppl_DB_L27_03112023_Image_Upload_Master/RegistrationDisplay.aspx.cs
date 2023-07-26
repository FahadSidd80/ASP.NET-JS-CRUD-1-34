using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAppl_DB_L27_03112023_Image_Upload_Master
{
    public partial class RegistrationDisplay : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetGrid();

            }
        }

        public void GetGrid()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_Get_registration", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_delete_registration", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@did", e.CommandArgument);
                cmd.ExecuteNonQuery();
                conn.Close();
                GetGrid();

            }
            else if (e.CommandName == "Edt")
            {
                Response.Redirect("RegistrationForm.aspx?Qs=" + e.CommandArgument);
            }
        }
    }
}