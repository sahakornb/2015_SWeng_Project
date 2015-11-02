using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Web.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Web.Security;

namespace ComputerProject.website
{
    public partial class Login : System.Web.UI.Page
    {
        public class ResponseMsg
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string presID { get; set; }
            public string typeperson { get; set; }
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

        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void submit_login_Click(object sender, EventArgs e)
        {
            string jsonRecieveMes = getServiceResult("http://localhost:55713/ServiceSave.svc/login?username="+ username.Text + "&password=" + pass.Text );
            dynamic _jsonRecieveMes = JsonConvert.DeserializeObject(jsonRecieveMes);
            dynamic _jsonRecieveMes2 = JsonConvert.DeserializeObject<ResponseMsg>(_jsonRecieveMes);

            if (_jsonRecieveMes2.code == 0)
            {
                //Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.value +  "');</script>");
                
                Session["username"] = username.Text;
                Session["typeperson"] = _jsonRecieveMes2.typeperson;
                Session["userID"] = _jsonRecieveMes2.presID;
                
                Response.Redirect("http://localhost:54520/dashboard/main.aspx");
            }
            else 
            {
                Response.Write("<script>alert(' code : " + _jsonRecieveMes2.code + "  " + _jsonRecieveMes2.msg + "');</script>");
            }
        }
    }
}