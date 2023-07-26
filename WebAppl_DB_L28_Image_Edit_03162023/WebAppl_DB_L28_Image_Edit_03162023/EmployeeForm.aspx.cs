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

namespace WebAppl_DB_L28_Image_Edit_03162023
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayGrid();
            }
        }
        public void ClearText()
        {
            txtname.Text = "";
            txtage.Text = "";
            fuimg.Dispose();
            //fuimg.PostedFile.InputStream.Dispose();
            btnsave.Text = "Save";

        }
        public void DisplayGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action","SELECT");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();


        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text == "Save")
            {
                String FN = DateTime.Now.Ticks.ToString() + Path.GetFileName(fuimg.PostedFile.FileName);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action","INS");
                cmd.Parameters.AddWithValue("@name",txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@img", FN);
                fuimg.SaveAs(Server.MapPath("Photos" + "\\" + FN));
                cmd.ExecuteNonQuery();
                con.Close();
                DisplayGrid();
                ClearText();
            }
            else if (btnsave.Text=="Update")
            {
                String FN = Path.GetFileName(fuimg.PostedFile.FileName) ;
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Update");
                cmd.Parameters.AddWithValue("@uid", ViewState["abc"]);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                if (FN != "")
                {
                    FN = DateTime.Now.Ticks.ToString() + FN;
                    cmd.Parameters.AddWithValue("@img", FN);
                    fuimg.SaveAs(Server.MapPath("Photos" + "\\" + FN));
                    File.Delete(Server.MapPath("Photos" + "\\" + ViewState["IMG"]));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@img", ViewState["IMG"]);
                }
                cmd.ExecuteNonQuery();
                con.Close(); 
                DisplayGrid();
                ClearText();

            }
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Edit");
                cmd.Parameters.AddWithValue("@empid",e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                ViewState["IMG"] = dt.Rows[0]["img"].ToString();
                btnsave.Text = "Update";
                ViewState["abc"] = e.CommandArgument;
            }
        }
    }
}