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
    public partial class FormCPE03 : System.Web.UI.Page
    {

        public class Project
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string projectID { get; set; }
            public string projectTh { get; set; }
            public string projectEng { get; set; }
        }

        public class ResponseMsg
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string value { get; set; }
        }

        public class ComitteeList
        {
            public int code { get; set; }
            public string msg { get; set; }
            public List<Committee> commitee { get; set; }

        }
        public class Committee
        {
            public string title_person { get; set; }
            public string firstName { get; set; }
            public string lastName { get; set; }
        }

        public string project_id;
        public string project_name_th;
        public string project_name_en;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                getProject();
                getCommittee();
                create_header_member();
                create_student_member("1", "ขวัญใจ ยินดี", "55367854", "0867653458", "kwanchanokn55@email.nu.ac.th");
            }
            else
            {
                Response.Redirect("http://localhost:54520/website/Login.aspx");
            }

        }
        public void create_header_member(){

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>ลำดับ</h4>";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>ชื่อ-สกุล</h4>";
            row.Cells.Add(cell1);

            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>รหัสนิสิต</h4>";
            row.Cells.Add(cell1);

            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>เบอร์โทร</h4>";
            row.Cells.Add(cell1);

            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>อีเมล์</h4>";
            row.Cells.Add(cell1);
            student_member.Rows.Add(row);
        }
        public void create_student_member(string stg,string stg1, string stg2,string stg3,string stg4)
        {
        
          
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + stg + "</h4>";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + stg1 + "</h4>";
            row.Cells.Add(cell1);

            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + stg2 + "</h4>";
            row.Cells.Add(cell1);

            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + stg3 + "</h4>";
            row.Cells.Add(cell1);

            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + stg4 + "</h4>";
            row.Cells.Add(cell1);
            student_member.Rows.Add(row);
        }

        protected void save_Click(object sender, EventArgs e)
        {
            if (problem_scrope.Text != null)
            {
                string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/send_form_three?person_id=" + Session["userID"].ToString() + "&project_scrop=" + problem_scrope.Text + "&send_approve=false");
                dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
                dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseMsg>(_jsonRecieveMes);


                if (_jsonRecieveMes2.code == 0)
                {
                    //Response.Redirect("http://localhost:54520/dashboard/main.aspx");
                    Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "\n\n save success');</script>");
                    //Response.Write("<script>alert(' code : " + _jsonRecieveMes2.projectTh + "  " + _jsonRecieveMes2.projectID + "');</script>");
                }
                else
                {
                    Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
                }
            }
            else
            {
                Response.Redirect("http://localhost:54520/website/Login.aspx");
            }
            
        }

        protected void save_send_Click(object sender, EventArgs e)
        {
            if (problem_scrope.Text != null)
            {
                string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/send_form_three?person_id=" + Session["userID"].ToString() + "&project_scrop=" + problem_scrope.Text + "&send_approve=true");
                dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
                dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseMsg>(_jsonRecieveMes);


                if (_jsonRecieveMes2.code == 0)
                {
                    Response.Redirect("http://localhost:54520/dashboard/main.aspx");
                    //Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "\n\n save success');</script>");
                    //Response.Write("<script>alert(' code : " + _jsonRecieveMes2.projectTh + "  " + _jsonRecieveMes2.projectID + "');</script>");
                }
                else
                {
                    Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
                }
            }
            else
            {
                Response.Redirect("http://localhost:54520/website/Login.aspx");
            }
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
        public void getProject()
        {
            //--http://localhost:55713/ServiceSave.svc/getProject?pers=55367854
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/getProject_sync?person_id=" + Session["userID"].ToString());
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<Project>(_jsonRecieveMes);


            if (_jsonRecieveMes2.code == 0)
            {
                project_id = _jsonRecieveMes2.projectID;
                project_name_th = _jsonRecieveMes2.projectTh;
                project_name_en = _jsonRecieveMes2.projectEng;

                //Response.Write("<script>alert(' code : " + _jsonRecieveMes2.projectTh + "  " + _jsonRecieveMes2.projectID + "');</script>");
            }
            else
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
        }
        public void addCommittee(int n, string tile, string fname, string lname)
        {
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + n.ToString() + "</h4>";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + tile + "</h4>";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + fname + "</h4>";
            row.Cells.Add(cell1);
            cell1 = new TableCell();
            cell1.Text = "<h4 class = 'font-thai font-1d8'>" + lname + "</h4>";
            row.Cells.Add(cell1);
            Teacher.Rows.Add(row);
        }
        public void getCommittee()
        {
            //--http://localhost:55713/ServiceSave.svc/getProject?pers=55367854
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/get_committee?project_id=" + project_id + "&type_person=3");
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ComitteeList>(_jsonRecieveMes);

            if (_jsonRecieveMes2.code == 0)
            {
                int i = 1;
                foreach (Committee readList in _jsonRecieveMes2.commitee)
                {
                    addCommittee(i, readList.title_person, readList.firstName, readList.lastName);
                    i++;
                }
        
                //Response.Write("<script>alert(' code : " + _jsonRecieveMes2.projectTh + "  " + _jsonRecieveMes2.projectID + "');</script>");
            }
            else
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
        }
    }
}