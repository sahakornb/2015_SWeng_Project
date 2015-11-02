using Newtonsoft.Json;
using System;
using System.IO;
using System.Net;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Web;
using System.Text;
using System.Web.Security;
using System.Net.Mail;

namespace ServerComputerProject
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ServiceSave" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ServiceSave.svc or ServiceSave.svc.cs at the Solution Explorer and start debugging.
    public class ServiceSave : IServiceSave
    {
        public void DoWork()
        {
        }

        public string projectID = "";

        public class ResponseLogin
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string presID { get; set; }
            public string typeperson { get; set; }
        }

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
            public string projectEng { get ; set; }
        }

        public class Request
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string ProjID { get; set; }
            public string ReqID { get; set; }
            public string Date { get; set; }
        }

        public string hash(string pass)
        {
            string saltAndPwd = String.Concat(pass, "salt");
            string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPwd, "sha1");

            return hashedPwd;
        }

        //localhost:55713/ServiceSave.svc/login?username=Fai&password=asdf
        public string login(string user, string pass)
        {
            string hastPass = hash(pass);

            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);

            con.Open();

            string sqlLogin = "SELECT PersID,typeOfPers  FROM person WHERE Username = '" + user + "' AND Password = '" + hastPass + "'";
            SqlCommand qrLogin = new SqlCommand(sqlLogin, con);
            SqlDataReader reader = qrLogin.ExecuteReader();

            ResponseLogin m = new ResponseLogin();

            string type = "", PersID = "";

            if (reader.Read())
            {
                try
                {
                    PersID = reader["PersID"].ToString();
                    type = reader["typeOfPers"].ToString();                
                }
                catch
                {

                }
            }

            reader.Close();

            if (type != "")
            {
                m.code = 0;
                m.msg = "OK";                
                m.presID = PersID;
                m.typeperson = type;
            }
            else 
            {
                sqlLogin = "SELECT count(*) As result FROM person WHERE Username = '" + user + "'";
                SqlCommand qrLogins = new SqlCommand(sqlLogin, con);
                SqlDataReader readerUser = qrLogins.ExecuteReader();
                int result = 0;

                if (readerUser.Read())
                {
                    result = int.Parse(readerUser["result"].ToString());
                }

                readerUser.Close();

                if (result == 1)
                {
                    m.code = 6;
                    m.msg = "Wrong password";
                    m.presID = "";
                    m.typeperson = "";
                }
                else
                {
                    m.code = 3;
                    m.msg = "User-id not found ";
                    m.presID = "";
                    m.typeperson = "";
                }
            }

            con.Close();

            return JsonConvert.SerializeObject(m);
        }

        private string createProjectID()
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlMax = "SELECT MAX(ProjID)AS max FROM project";
            SqlCommand qrMaxvalue = new SqlCommand(sqlMax, con);
            SqlDataReader reader = qrMaxvalue.ExecuteReader();
            int max = 0;
            if (reader.Read())
            {
                try
                {
                    max = int.Parse(reader["max"].ToString());
                }
                catch
                {
                    max = 1000;
                }
                
            }

            reader.Close();
            con.Close();
            max++;

            return max.ToString();
        }

        private int chkValueMember(string pers)
        {
            if (pers != "")
            {
                return 1;
            }               
            return 0;
        }

        private string countMember(string pers1, string pers2, string pers3)
        {
            int num = 0;
            num = chkValueMember(pers1);
            num += chkValueMember(pers2);
            num += chkValueMember(pers3);

            return num.ToString();
        }

        private bool saveProject(string projectTh, string projectEng, string scope, string member)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            projectID = createProjectID();

            string sqlSave = "";

            sqlSave = "INSERT INTO project ";
            sqlSave += "VALUES ('" + projectID + "','" + projectTh + "','" + projectEng + "','" + member + "','" + scope + "', GETDATE() ,'0','0')";

            SqlCommand cmdSave = new SqlCommand(sqlSave, con);
            cmdSave.ExecuteNonQuery();

            ResponseMsg m = new ResponseMsg();

            m.code = 0;
            m.msg = "OK";
            m.value = "";

            con.Close();
            return true;
        }

        private void createRelation(string projectID, string pers, string status)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlInsert = "INSERT INTO Relation VALUES ( '"+ projectID+ "','" + pers +"','" +status +"')";
            SqlCommand cmdInsert = new SqlCommand(sqlInsert, con);
            cmdInsert.ExecuteNonQuery();
        }

        //--http://localhost:55713/ServiceSave.svc/saveCPE01?Th=ทดสอบ&Eng=ff&scope=few&pers1=55367854&pers2=&pers3=&advis1=T0000013&advis2=&commit=T0000023
        public string saveCPE01(bool fac, string projectTh, string projectEng, string scope, string pers1, string pers2, string pers3, string advis1, string advis2, string commit)
        {
            string member = countMember(pers1, pers2, pers3);
            saveProject(projectTh, projectEng, scope, member);

            createRelation(projectID, pers1, "0");

            if ( int.Parse(member) == 2)
            {
                createRelation(projectID, pers2, "0");               
            }
            else if (int.Parse(member) == 3)
            {                
                createRelation(projectID, pers2, "0");
                createRelation(projectID, pers3, "0");
            }

            createRelation(projectID, advis1, "1");
            
            if (advis2 != "")
            {
                createRelation(projectID, advis2, "2");
            }
            createRelation(projectID, commit, "3");


            if (!fac)
            {
                updateState(projectID, "1", "1");
            }
            else
            {
                updateState(projectID, "1", "2");
            }
            

            ResponseMsg m = new ResponseMsg();

            m.code = 0;
            m.msg = "OK";
            m.value = "";

            return JsonConvert.SerializeObject(m);
        }

        public string updateState(string project,string state, string status)
        {
            projectID = project;

            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string changeState = "";            
            changeState = "UPDATE project SET Status_ID='" + status +"', State='"+state +"' ";
            changeState += "WHERE ProjID ='" + project + "'";

            SqlCommand cmdUpdate = new SqlCommand(changeState, con);
            cmdUpdate.ExecuteNonQuery();

            ResponseMsg m = new ResponseMsg();

            m.code = 0;
            m.msg = "OK";
            m.value = "";

            return JsonConvert.SerializeObject(m);
        }

        private string getProject(string project)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlproject = "SELECT ProjName_TH,ProjName_ENG FROM project WHERE ProjID = '" + project + "'";
            SqlCommand qrproject = new SqlCommand(sqlproject, con);
            SqlDataReader reader = qrproject.ExecuteReader();

            string[] name = new string[2];

            if (reader.Read())
            {
                name[0] = reader["ProjName_TH"].ToString();
                name[1] = reader["ProjName_ENG"].ToString();
            }
            reader.Close();
            con.Close();

            Project p = new Project();

            p.code = 0;
            p.msg = "OK";
            p.projectID = project;
            p.projectTh = name[0];
            p.projectEng = name[1];

            return JsonConvert.SerializeObject(p);
        }

        public string getProjectID(string pers)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlproject = "SELECT ProjID FROM Relation WHERE PersID = '" + pers + "'";

            SqlCommand qrproject = new SqlCommand(sqlproject, con);
            SqlDataReader reader = qrproject.ExecuteReader();

            string result = "";

            if (reader.Read())
            {
                result = reader["ProjID"].ToString();
            }
            reader.Close();
            con.Close();

            return getProject(result); 
        }

        private string getID(string skema ,string table)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlget = "SELECT MAX(" + skema + ") AS result FROM " + table;
            SqlCommand qrget = new SqlCommand(sqlget, con);
            SqlDataReader reader = qrget.ExecuteReader();

            int result = 0;

            if (reader.Read())
            {
                try
                {
                    result = int.Parse(reader["result"].ToString());
                    result++;
                }
                catch
                {
                    result = 1;
                }
            }
            reader.Close();
            con.Close();

            return result.ToString();
        }

        public string saveCPE02(bool fac, string project,string userID, string date, string topic, string progress, string remark)
        {

            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlProgress = "";

            sqlProgress = "SET IDENTITY_INSERT ProjectOperations ON ";
            sqlProgress += "INSERT INTO ProjectOperations (ProjOperatID,ProjID,Date,Subject,Progress,Note,ApproveDate) ";
            sqlProgress += "VALUES ( '" + getID("ProjOperatID", "ProjectOperations") + "','" + project + "','" + date + "','" + topic + "','" + progress + "','" + remark + "',' ')";
            SqlCommand cmdProgress = new SqlCommand(sqlProgress, con);
            cmdProgress.ExecuteNonQuery();
            ResponseMsg m = new ResponseMsg();
            if (fac)
            {
                updateState(project, "2", "2");
                requestAdviser(project,userID);

                m.code = 0;
                m.msg = "OK";
                m.value = "Send Success";
            }
            else
            {
                updateState(project, "2", "1");
                m.code = 0;
                m.msg = "OK";
                m.value = "Save Success";
            }

            return JsonConvert.SerializeObject(m);
        }

        private string getAdviser()
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlproject = "SELECT PersID FROM Relation WHERE Status_ID = '1' AND ProjID='" + projectID +"'";

            SqlCommand qrproject = new SqlCommand(sqlproject, con);
            SqlDataReader reader = qrproject.ExecuteReader();

            string result = "";

            if (reader.Read())
            {
                result = reader["PersID"].ToString();
            }
            reader.Close();
            con.Close();

            return result;
        }

        private void requestAdviser(string project,string userID )
        {
            projectID = project;

            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlRequest = "";

            sqlRequest = "SET IDENTITY_INSERT Request_Title ON ";
            sqlRequest += "INSERT INTO Request_Title (Req_TitleiD,ReqID,ProjID,ApplicantID,AcceptanceID,Date) ";
            sqlRequest += "VALUES ( '" + getID("Req_TitleiD", "Request_Title") + "','2','" + project + "','" + userID + "','" + getAdviser() + "', GETDATE())";
            SqlCommand cmdProgress = new SqlCommand(sqlRequest, con);
            cmdProgress.ExecuteNonQuery();

        }

        public string getRequest(string pers)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlproject = "SELECT * FROM Request_Title WHERE AcceptanceID = '" + pers + "'";

            SqlCommand qrproject = new SqlCommand(sqlproject, con);
            SqlDataReader reader = qrproject.ExecuteReader();

            Request q = new Request();

            if (reader.Read())
            {
                q.code = 0;
                q.msg = "OK";
                q.ProjID = reader["ProjID"].ToString();
                q.ReqID = reader["ReqID"].ToString();
                q.Date = reader["Date"].ToString();
            }
            reader.Close();
            con.Close();

            return JsonConvert.SerializeObject(q);
        }

        public string approveProject(string project, string state, string status)
        {
            //updateState(project, state, status);
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sql = "DELETE FROM Request_Title WHERE ProjID='" + project + "'";
            SqlCommand cmdProgress = new SqlCommand(sql, con);
            cmdProgress.ExecuteNonQuery();

            con.Close();

            ResponseMsg m = new ResponseMsg();

            if (sendEmail())
            {
                m.code = 0;
                m.msg = "OK";
                m.value = "Send Success";
            }
            else
            {
                m.code = -1;
                m.msg = "mail server Error";
                m.value = "";
            }


            return JsonConvert.SerializeObject(m);
        }

        private bool sendEmail(){

            SmtpClient client = new SmtpClient("smtp-mail.outlook.com");

            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential("kwanchanok04@hotmail.com", "Possakorn");
            client.EnableSsl = true;
            client.Credentials = credentials;

            try
            {
                var mail = new MailMessage("kwanchanok04@hotmail.com", "Fainarakz@gmail.com");//(_sender.Trim(), recipient.Trim());
                mail.Subject = "Approve CPE 02";
                mail.Body = "Completed CPE 02 \n";
                mail.Body += "Please check ";
                client.Send(mail);
                //Response.Write("E-mail sent!");
                return true;
            }
            catch (Exception ex)
            {
                //    Console.WriteLine(ex.Message);
                //Response.Write("Could not send the e-mail - error: " + ex.Message);
                return false;
                throw ex;
            }
        }
   
    }
}
