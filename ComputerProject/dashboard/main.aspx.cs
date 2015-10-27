using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComputerProject.dashboard
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            student_panel.Visible = true;
            student_panel.Enabled = true;
            teacher_panel.Visible = false;
            teacher_panel.Enabled = false;

            req_1.Visible = false;
            req_2.Visible = false;
            req_3.Visible = false;
            req_4.Visible = false;
            req_5.Visible = false;
            req_6.Visible = false;
            req_6.Enabled = false;
            req_5.Enabled = false;
            req_4.Enabled = false;
            req_3.Enabled = false;
            req_2.Enabled = false;
            req_1.Enabled = false;

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "CPE01";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = "SEND";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = DateTime.Now.ToString();
            row.Cells.Add(cell1);
            Table1.Rows.Add(row);

        }
        protected void addLogs(object sender, EventArgs e)
        {
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "CPE01";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = "APPROVE";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = DateTime.Now.ToString();
            row.Cells.Add(cell1);
            Table1.Rows.Add(row);

        }

        }
}