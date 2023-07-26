using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppl_DB_L31_SignIn_Up_Mail_Valid_03252023
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null && Session["uid"].ToString() != "")
            {
                // page load code .. like country/state bind 
                lblname.Text = Session["name"].ToString();
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
    }
}