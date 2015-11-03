using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Net;
using System.IO;
using System.Drawing;
namespace ComputerProject.dashboard
{
    public partial class index : System.Web.UI.Page
    {

        // ---- Teacher Sync -------//
        
        public class ProjectRequest
        {
            public string project_id { get; set; }
            public string project_title { get; set; }
            public string date { get; set; }
        }

        public class ResponseRequestList
        {
            public int code { get; set; }
            public string msg { get; set; }
            public List<ProjectRequest> request { get; set; }
        }
        public class ProjectOwner
        {
            public string project { get; set; }
        }
        public class ResponseProjectList
        {
            public int code { get; set; }
            public string msg { get; set; }
            public List<ProjectOwner> projectlist { get; set; }
        }

        // ---- --------- -------//

        // ---- Student Sync -------//

        public class ResponseMsgList
        {
            public int code { get; set; }
            public string msg { get; set; }
            public List<ProjectLogs> Logs { get; set; }
            public int state { get; set; }
        }

        public class ProjectLogs
        {
            public string logs_topic { get; set; }
            public string date { get; set; }
        }

         public int progressbar = 13*100/28;
         public string project_name;
         public string project_id_;
        
        // ---- --------- -------//

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
            if (Session["username"] != null && Session["typeperson"] != null )
            {      

                 
                // Student
                if (Session["typeperson"].ToString() == "0")
                {
                    student_sync_data();
                   
                    student_panel.Visible = true;
                    student_panel.Enabled = true;
                    teacher_panel.Visible = false;
                    teacher_panel.Enabled = false;
                   
                }
                else// teacher
                {
                    student_panel.Visible = false;
                    student_panel.Enabled = false;
                    teacher_panel.Visible = true;
                    teacher_panel.Enabled = true;
                    teacher_sync_data();
                    getOwner_project();
                }
            }
            else
            {
                Response.Redirect("http://localhost:54520/website/Login.aspx");
            }

        }
        public void create_teacher_project_view(string stg)
        {
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
             cell1.Text = stg;
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            Button bt = new Button();
            bt.CssClass = "mdl-button mdl-js-button mdl-button--accent";
            bt.Text = "ดู";
            cell1.Controls.Add(bt);
            row.Cells.Add(cell1);
            teaher_project_table.Rows.Add(row);
        }
        public void create_request_table(string stg1, string stg2 ){
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = stg1;
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = stg2;
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            Button bt = new Button();
            bt.CssClass = "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent";
            bt.Text = "ยืนยัน";
            bt.Click += delegate
            {
                teacher_delete(stg1);

            };
            cell1.Controls.Add(bt);
            bt = new Button();
            bt.CssClass = "mdl-button mdl-js-button mdl-button--raised mdl-button--colored";
            bt.Text = "ดู";
            cell1.Controls.Add(bt);
            bt = new Button();
            bt.CssClass = "mdl-button mdl-js-button mdl-button--accent";
            bt.Text = "ทิ้ง";
            bt.Click += delegate
            {
                teacher_delete(stg1);
                
            };
            cell1.Controls.Add(bt);
            row.Cells.Add(cell1);
            request_view_table.Rows.Add(row);
        }
        private void getOwner_project()
        {
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/teacherSync_project?person_id=" + Session["userID"].ToString() + "&type_person=" + Session["typeperson"].ToString());
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseProjectList>(_jsonRecieveMes);

            foreach (ProjectOwner readList in _jsonRecieveMes2.projectlist)
            {
                create_teacher_project_view(readList.project.ToString());

            }
        }
        private void teacher_sync_data()
        {
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/teacherSync_request?person_id=" + Session["userID"].ToString() + "&type_person=" + Session["typeperson"].ToString());
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseRequestList>(_jsonRecieveMes);
          
            foreach (ProjectRequest readList in _jsonRecieveMes2.request)
            {
                create_request_table(readList.project_id.ToString(), readList.project_title.ToString());
                
            }
        }
        private void student_sync_data()
        {
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/student_sync?person_id=" + Session["userID"].ToString() + "&type_person=" + Session["typeperson"].ToString());
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseMsgList>(_jsonRecieveMes);
            addLogs("<h4>หัวข้อ</h4>", "<h4>วันที่</h4>");
            foreach (ProjectLogs readList in _jsonRecieveMes2.Logs)
            {
                addLogs(readList.logs_topic.ToString(), readList.date.ToString());
            }
            progressbar = _jsonRecieveMes2.state;
        }
        public void addLogs(string stg1, string stg2)
        {
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = stg1;
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = stg2;
            row.Cells.Add(cell1);
            student_logs_table.Rows.Add(row);

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
        public void teacher_delete(string stg)
        {
            Response.Write(stg);
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/approveProject?project_temp=" + stg + "&state=3&status=0");
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

        protected void Button2_Click(object sender, EventArgs e,string stg)
        {
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/approveProject?projectID=" + project_id_ + "&state=3&status=0");
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
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/approveProject?projectID=" + "Label1.Text" + "&state=3&status=0");
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