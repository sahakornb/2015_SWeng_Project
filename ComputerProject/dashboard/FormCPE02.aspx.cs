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
    public partial class FormCPE02 : System.Web.UI.Page
    {
        public class ResponseMsg
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string value { get; set; }
        }

        public class Project
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string projectID { get; set; }
            public string projectTh { get; set; }
            public string projectEng { get; set; }
        }

        public void getProject()
        {
            //--http://localhost:55713/ServiceSave.svc/getProject?pers=55367854
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/getProject?pers=" + Session["userID"].ToString() );
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<Project>(_jsonRecieveMes);

            
            if (_jsonRecieveMes2.code == 0)
            {
                id_project.Text = _jsonRecieveMes2.projectID;
                name_project.Text = _jsonRecieveMes2.projectTh;

                //Response.Write("<script>alert(' code : " + _jsonRecieveMes2.projectTh + "  " + _jsonRecieveMes2.projectID + "');</script>");
            }
            else
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getProject();

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

        public void saveLog(bool fac)
        {
            //--http://localhost:55713/ServiceSave.svc/saveCPE02?fac=false&project=1004&date=10/28/2015%201:09:07%20AM&topic=meet&progress=few&remark=bre
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/saveCPE02?fac=" + fac + "&project=" + id_project.Text + "&userID=" + Session["userID"].ToString() + "&date=" + date_text.Text + "&topic=" + Topic.Text + "&progress=" + Progress.Text + "&remark=" + Remark.Text);
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseMsg>(_jsonRecieveMes);

            if (_jsonRecieveMes2.code == 0)
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
            else
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            saveLog(false);
        }

        protected void save_send_Click(object sender, EventArgs e)
        {
            saveLog(true);
        }
    }
}