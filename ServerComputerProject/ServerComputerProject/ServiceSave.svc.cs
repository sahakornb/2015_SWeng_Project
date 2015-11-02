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

        public string project_id = "";

        public class ResponseLogin
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string presID { get; set; }
            public string typeperson { get; set; }
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

        public class ProjectLogs
        {
            public string logs_topic { get; set; }
            public string date { get; set; }
        }

        public class ResponseMsgList
        {
            public int code { get; set; }
            public string msg { get; set; }
            public List<ProjectLogs> Logs { get; set; }
            public int state { get; set; }
        }

        public class ResponseMsg
        {
            public int code { get; set; }
            public string msg { get; set; }
            public string value { get; set; }
        }

        public string hash(string pass)
        {
            string saltAndPwd = String.Concat(pass, "salt");
            string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPwd, "sha1");

            return hashedPwd;
        }

        //localhost:55713/ServiceSave.svc/login?username=Fai&password=asdf
        public string login(string username, string password)
        {
            string hash_password = hash(password);
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlLogin = "SELECT PersID,typeOfPers  FROM person WHERE Username = '" + username + "' AND Password = '" + hash_password + "'";
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
                sqlLogin = "SELECT count(*) As result FROM person WHERE Username = '" + username + "'";
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

        public string updateState(string project_temp ,string state, string status)
        {
            project_id = project_temp;
            ResponseMsg m = new ResponseMsg();
            try
            {
                string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                string changeState = "";
                changeState = "UPDATE project SET Status_ID='" + status + "', State='" + state + "' ";
                changeState += "WHERE ProjID ='" + project_temp + "'";

                SqlCommand cmdUpdate = new SqlCommand(changeState, con);
                cmdUpdate.ExecuteNonQuery();

                m.code = 0;
                m.msg = "OK";
                m.value = "";
            }
            catch
            {
                m.code = 9;
                m.msg = "Database Error";
                m.value = "";
            }

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

        public string getProjectID(string person_id)
        {
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sqlproject = "SELECT ProjID FROM Relation WHERE PersID = '" + person_id + "'";

            SqlCommand qrproject = new SqlCommand(sqlproject, con);
            SqlDataReader reader = qrproject.ExecuteReader();

            string result = "";

            if (reader.Read())
            {
                result = reader["ProjID"].ToString();
            }
            reader.Close();
            con.Close();
            //**** getProject(result) **************
            return result; 
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
                if (requestAdviser(project, userID))
                {
                    m.code = 0;
                    m.msg = "OK";
                    m.value = "Send Success";
                }                
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

        //complete
        private string getAdviser()
        {
            try
            {
                string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                string sqlproject = "SELECT PersID FROM Relation WHERE Status_ID = '1' AND ProjID='" + project_id + "'";

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
            catch
            {
                return "false";
            }        
        }

        //complete
        private bool requestAdviser(string project,string userID )
        {
            project_id = project;

            if (getAdviser() != "false")
            {
                string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                string sqlRequest = "";

                sqlRequest = "SET IDENTITY_INSERT Request_Title ON ";
                sqlRequest += "INSERT INTO Request_Title (Req_TitleiD,ReqID,ProjID,ApplicantID,AcceptanceID,Date) ";
                sqlRequest += "VALUES ( '" + getID("Req_TitleiD", "Request_Title") + "','2','" + project + "','" + userID + "','" + getAdviser() + "', GETDATE())";
                SqlCommand cmdProgress = new SqlCommand(sqlRequest, con);
                cmdProgress.ExecuteNonQuery();

                return true;
            }
            else
            {
                return false;
            }
        }

        //complete
        public string getRequest(string person_id)
        {
            Request q = new Request();

            try
            {
                string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                string sqlproject = "SELECT * FROM Request_Title WHERE AcceptanceID = '" + person_id + "'";

                SqlCommand qrproject = new SqlCommand(sqlproject, con);
                SqlDataReader reader = qrproject.ExecuteReader();

                if (reader.Read())
                {
                    q.ProjID = reader["ProjID"].ToString();
                    q.ReqID = reader["ReqID"].ToString();
                    q.Date = reader["Date"].ToString();
                }
                reader.Close();
                con.Close();

                q.code = 0;
                q.msg = "OK";
            }
            catch
            {
                q.code = 9;
                q.msg = "Database Error";
            }

            return JsonConvert.SerializeObject(q);
        }
        
        //complete
        public string approveProject(string project_temp, string state, string status)
        {
            //updateState(project, state, status);
            string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string sql = "DELETE FROM Request_Title WHERE ProjID='" + project_temp + "'";
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

        //complete
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
        
        //-----------------------------------------------------NEW

        public string student_sync(string person_id, int type_person)
        {
            ResponseMsgList q = new ResponseMsgList();
            ProjectLogs s = new ProjectLogs();
           if (type_person != 0)
            {
                q.code = 11;
                q.msg = "Parameter Wrong";
            }
            else
            {
                try
                {
                    string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(constr);
                    con.Open();

                    project_id = getProjectID(person_id);

                    string sqlproject = "SELECT * FROM ProjectOperations WHERE ProjID = '" + project_id + "'";

                    SqlCommand qrproject = new SqlCommand(sqlproject, con);
                    SqlDataReader reader = qrproject.ExecuteReader();

                    q.Logs = new List<ProjectLogs>();                            

                    while(reader.Read())
                    {
                       s = new ProjectLogs();
                        s.logs_topic = reader["Subject"].ToString();
                        s.date = reader["Date"].ToString();
                        q.Logs.Add(s);
                    }

                    reader.Close();
                    con.Close();

                    q.code = 0;
                    q.msg = "OK";

                    if (getState(project_id) != -1)
                    {
                        q.state = getState(project_id);
                    }
                    else
                    {
                        q.code = 11;
                        q.msg = "Parameter Wrong";
                    }                    
                }
                catch
                {
                    q.code = 9;
                    q.msg = "Database Error";
                }
            }
            return JsonConvert.SerializeObject(q);
        }

        public int getState(string project)
        {
            try
            {
                string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                string sqlproject = "SELECT Status_ID,State FROM project WHERE ProjID = '" + project + "'";

                SqlCommand qrproject = new SqlCommand(sqlproject, con);
                SqlDataReader reader = qrproject.ExecuteReader();

                int state = 0 , status = 0;

                if (reader.Read())
                {
                    status = int.Parse( reader["Status_ID"].ToString());
                    state = int.Parse( reader["State"].ToString());
                }

                int value ;

                if (status == 0)
                    value = 0;
                else if (state == 1)
                    value = 1;
                else if (state == 2)
                    value = 5;
                else if (state == 3)
                    value = 9;
                else if (state == 4)
                    value = 13;
                else if (state == 5)
                    value = 17;
                else if (state == 6)
                    value = 21;
                else if (state == 7)
                    value = 25;
                else
                    value = -1;

                value += status;

                reader.Close();
                con.Close();

                return value;
            }
            catch
            {
                return -1;
            }
        }

        public string send_form_one(string project_name_th, string project_name_en, string member_one, string member_two, string member_three,
                             string project_adviser, string project_co_adviser, string project_committee, bool send_approve)
        {   ResponseMsg m = new ResponseMsg();
            try
            {
                string member = countMember(member_one, member_two, member_three);
                
                if (saveProject(project_name_th, project_name_en, "null", member))
                {
                   //{
                    if (createRelation(project_id, member_one, "0"))
                        {
                            m.code = 0;
                            m.msg = "OK";
                        }
                    else
                        {
                            m.code = 9;
                            m.msg = "Database Error";
                        }

                    //}

                    //{
                        if (int.Parse(member) == 2)
                        {
                            if (createRelation(project_id, member_two, "0"))
                            {
                                m.code = 0;
                                m.msg = "OK";
                            }
                            else
                            {
                                m.code = 9;
                                m.msg = "Database Error";
                            }
                
                        }

                        else if (int.Parse(member) == 3)
                        {
                            if (createRelation(project_id, member_two, "0") && createRelation(project_id, member_three, "0"))
                            {
                                m.code = 0;
                                m.msg = "OK";
                            }
                            else
                            {
                                m.code = 9;
                                m.msg = "Database Error";
                            }

                        }
                        //}

                        //{
                            if(createRelation(project_id, project_adviser, "1"))
                            {
                                m.code = 0;
                                m.msg = "OK";
                            }
                            else
                            {
                                m.code = 9;
                                m.msg = "Database Error";
                            }
                            //}

                            //{
                        if (project_co_adviser != "")
                        {
                            if (createRelation(project_id, project_co_adviser, "2"))
                            {
                                m.code = 0;
                                m.msg = "OK";
                            }
                            else
                            {
                                m.code = 9;
                                m.msg = "Database Error";
                            }
                        }
                        else
                        {
                            m.code = 11;
                            m.msg = "Parameter Wrong";
                        }
                        //}

                        //{
                    if (createRelation(project_id, project_committee, "3"))
                        {
                            m.code = 0;
                            m.msg = "OK";
                        }
                        else
                        {
                            m.code = 9;
                            m.msg = "Database Error";
                        }

                    //}
                            string status = "";
                            if (send_approve != null)
                            {
                                if (!send_approve)
                                {
                                    status = "1";
                                }
                                else
                                {
                                    status = "2";
                                }
                                m.code = 0;
                                m.msg = "OK";
                            }
                            else
                            {
                                m.code = 11;
                                m.msg = "Parameter Wrong";
                            }
                            dynamic update = JsonConvert.DeserializeObject(updateState(project_id, "1", status));
                            dynamic decode_update = JsonConvert.DeserializeObject<ResponseMsg>(update);

                            m.code = decode_update.code;
                            m.msg = decode_update.msg;
                            m.value = decode_update.value;
                }
                else
                {
                    m.code = 12;
                    m.msg = "Database Error";
                }
            }
            catch
            {
                m.code = 12;
                m.msg = "Can't to save form to system";
            }
            return JsonConvert.SerializeObject(m);
        }

        //complete
        private int chkValueMember(string pers)
        {
            if (pers != "")
            {
                return 1;
            }
            return 0;
        }

        //complete
        private string countMember(string member_one, string member_two, string member_three)
        {      
            int num = 0;
            num = chkValueMember(member_one);
            num += chkValueMember(member_two);
            num += chkValueMember(member_three);

            return num.ToString();
        }

        //complete
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

        //complete
        private bool saveProject(string project_name_th, string project_name_en, string scope, string member)
        {
            ResponseMsg m = new ResponseMsg();
            try
            {
                string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                project_id = createProjectID();

                string sqlSave = "";

                sqlSave = "INSERT INTO project ";
                sqlSave += "VALUES ('" + project_id + "','" + project_name_th + "','" + project_name_en + "','" + member + "','" + scope + "', GETDATE() ,'0','0')";

                SqlCommand cmdSave = new SqlCommand(sqlSave, con);
                cmdSave.ExecuteNonQuery();
                                
                con.Close();

                return true;
            }
            catch
            {
                return false;
            }
        }

        //complete
        private bool createRelation(string projectID, string person_id, string status)
        {
            try
            {
                string constr = WebConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                string sqlInsert = "INSERT INTO Relation VALUES ( '" + projectID + "','" + person_id + "','" + status + "')";
                SqlCommand cmdInsert = new SqlCommand(sqlInsert, con);
                cmdInsert.ExecuteNonQuery();

                return true;
            }
            catch
            {
                return false;
            }
        }
    
    }
}
