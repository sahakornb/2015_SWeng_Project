using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComputerProject.dashboard
{
    public partial class clear : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("http://localhost:54520/website/index.aspx");
        }
    }
}