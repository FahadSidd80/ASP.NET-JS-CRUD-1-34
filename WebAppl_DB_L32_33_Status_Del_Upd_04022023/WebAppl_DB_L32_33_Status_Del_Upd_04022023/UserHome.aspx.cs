using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppl_DB_L32_33_Status_Del_Upd_04022023
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null && Session["uid"].ToString() != "")
            {
                lblname.Text = Session["name"].ToString();
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
    }
}