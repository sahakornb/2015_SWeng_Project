using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComputerProject.dashboard
{
    public partial class FormCPE01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            std_panel2.Visible = false;
            std_panel2.Enabled = false;
            std_panel3.Visible = false;
            std_panel3.Enabled = false;

        }
    }
}