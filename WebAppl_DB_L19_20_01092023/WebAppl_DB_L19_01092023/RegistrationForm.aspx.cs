using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAppl_DB_L19_01092023
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //DisplayGrid();
            if (!IsPostBack)
            {
                DisplayGrid(); //insert ke baad call ho raha hai iss liye yaha call kar liye.
                DisplayBloodGroup(); // for radiobuttonlist
                DisplayCourse(); // for dropdownlist
            }
            
        }
        public void DisplayGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Registration_Get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();

        }

        public void DisplayBloodGroup()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblBloodgroup_Get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rblbg.DataValueField = "bid";
            rblbg.DataTextField = "bname";
            rblbg.DataSource = dt;
            rblbg.DataBind(); /*byte default 0 hoti hai radiobutton ke case me */

        }

        public void DisplayCourse()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblCourse_Get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcourse.DataValueField = "cid";
            ddlcourse.DataTextField = "cname";
            ddlcourse.DataSource = dt;
            ddlcourse.DataBind();
            ddlcourse.Items.Insert(0, new ListItem("--Select--","0") );/* by default 1 hoti hai value iss liye 0 pe insert maar rahe hai.*/ 

        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Registration_Insert", con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name",txtname.Text); /*-- @name is input parameter */
            cmd.Parameters.AddWithValue("@bloodgroup",rblbg.SelectedValue); /*-- @bloodgroup is input parameter */
            cmd.Parameters.AddWithValue("@course",ddlcourse.SelectedValue); /*-- @course is input parameter */
            cmd.ExecuteNonQuery();
            con.Close();
            DisplayGrid();
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}