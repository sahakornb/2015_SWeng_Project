using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Net;
using System.IO;

namespace ComputerProject.dashboard
{
    public partial class index : System.Web.UI.Page
    {

        public class Request_
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string ProjID { get; set; }
            public string ReqID { get; set; }
            public string Date { get; set; }
        }
        public class ResponseMsg
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string value { get; set; }
        }
        public int  value_bar {get;set;}

        protected void Page_Load(object sender, EventArgs e)
        {        
     

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

            if (Session["typeperson"].ToString() == "0")
            {
                student_panel.Visible = true;
                student_panel.Enabled = true;
                teacher_panel.Visible = false;
                teacher_panel.Enabled = false;
            }
            else
            {
                student_panel.Visible = false;
                student_panel.Enabled = false;
                teacher_panel.Visible = true;
                teacher_panel.Enabled = true;
                getRequest();
            }

        }

        private void getRequest()
        {
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/getRequest?pers=" + Session["userID"].ToString());
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<Request_>(_jsonRecieveMes);

            if (_jsonRecieveMes2.code == 0)
            {
               // req_1.Visible = true;
              //  req_1.Enabled = true;
               
              
                if (_jsonRecieveMes2.ReqID == "2")
                {
                    req_1.Visible = true;
                    req_1.Enabled = true;
                    Label1.Text = _jsonRecieveMes2.ProjID;
                    Label3.Text = "เสนอความคืบหน้าโครงงาน";
                   
                }

                
                
               
            }
            else
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
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

      
        public string getServiceResult(string serviceUrl)
        {
            try
            {
                HttpWebRequest HttpWReq;
                HttpWebResponse HttpWResp;
                HttpWReq = (HttpWebRequest)WebRequest.Create(serviceUrl);
                HttpWReq.Method = "GET";
                HttpWResp = (HttpWebResponse)HttpWReq.GetResponse();
                if (HttpWResp.StatusCode == HttpStatusCode.OK)
                {
                    StreamReader reader = new StreamReader(HttpWResp.GetResponseStream());
                    return reader.ReadToEnd();
                }
                else
                {
                    throw new Exception("Error on remote IP to Country service: " + HttpWResp.StatusCode.ToString());
                }
            }
            catch { return "Error"; }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/approveProject?projectID=" + Label1.Text + "&state=3&status=0");
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseMsg>(_jsonRecieveMes);

            if (_jsonRecieveMes2.code == 0)
            {
                Response.Redirect("http://localhost:54520/dashboard/main.aspx");


            }
            else
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/approveProject?projectID=" + Label1.Text + "&state=3&status=0");
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseMsg>(_jsonRecieveMes);

            if (_jsonRecieveMes2.code == 0)
            {
                Response.Redirect("http://localhost:54520/dashboard/main.aspx");


            }
            else
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
        }
    }
}