using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComputerProject.dashboard
{
    public partial class FormCPE02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void getCalendar(object sender, EventArgs e)
        {
            date_text.Text = Calendar1.SelectedDate.ToString();
        }
        protected void nowCalendar(object sender, EventArgs e)
        {
            Calendar1.SelectedDate = DateTime.Now;
            date_text.Text = Calendar1.SelectedDate.ToString();
        }
    }
}