using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAppl_DB_L22_02142023
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayBloodGroup();
                DisplayCourse();
                DisplayCountry();
                DisplayGrid();
            }
        }
        public void DisplayBloodGroup()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblRegist_gender_Course_country", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "BloodGroupGet");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rblbloodgroup.DataValueField = "bid";
            rblbloodgroup.DataTextField = "bname";
            con.Close();
            rblbloodgroup.DataSource = dt;
            rblbloodgroup.DataBind();
        }
        public void DisplayCourse()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblRegist_gender_Course_country", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "CourseGet");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlcourse.DataValueField = "crid";
            ddlcourse.DataTextField = "crname";
            con.Close();
            ddlcourse.DataSource = dt;
            ddlcourse.DataBind();
            ddlcourse.Items.Insert(0, new ListItem("--Select--","0"));
        }
        public void DisplayCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblRegist_gender_Course_country", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "CountryGet");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlcountry.DataValueField = "cnid";
            ddlcountry.DataTextField = "cnname";
            con.Close();
            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        public void DisplayGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblRegistration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "GridGet");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
            
        }
        public void ClearText()
        {
            txtname.Text = "";
            txtage.Text = "";
            rblgender.ClearSelection();
            ddlcourse.SelectedValue = "0";
            ddlcountry.SelectedValue = "0";
            rblbloodgroup.ClearSelection();
            btnsave.Text = "Save";
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Insert");
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@genderid", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@courseid", ddlcourse.SelectedValue);
                cmd.Parameters.AddWithValue("@countryid", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@bloodgroupid", rblbloodgroup.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
                ClearText();
            }
            else if (btnsave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Update");
                cmd.Parameters.AddWithValue("@uid", ViewState["abc"]);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@genderid", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@courseid", ddlcourse.SelectedValue);
                cmd.Parameters.AddWithValue("@countryid", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@bloodgroupid", rblbloodgroup.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
                ClearText();
            }
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Delete");
                cmd.Parameters.AddWithValue("@did", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
            }else if (e.CommandName=="Edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Edit");
                cmd.Parameters.AddWithValue("@eid", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["gender"].ToString();
                ddlcourse.SelectedValue = dt.Rows[0]["course"].ToString();
                ddlcountry.SelectedValue = dt.Rows[0]["country"].ToString();
                rblbloodgroup.SelectedValue = dt.Rows[0]["bloodgroup"].ToString();
                btnsave.Text = "Update";
                ViewState["abc"] = e.CommandArgument;
            }
        }
    }
}