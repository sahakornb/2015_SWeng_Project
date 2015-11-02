using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace ServerComputerProject
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IServiceSave" in both code and config file together.
    [ServiceContract]
    public interface IServiceSave
    {
        [OperationContract]
        void DoWork();

        //--http://localhost:55713/ServiceSave.svc/saveCPE02?fac=false&project=1004&date=10/28/2015%201:09:07%20AM&topic=meet&progress=few&remark=bre
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "saveCPE02?fac={fac}&project={project}&userID={userID}&date={date}&topic={topic}&progress={progress}&remark={remark}")]
        string saveCPE02(bool fac, string project, string userID, string date, string topic, string progress, string remark);

    
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "updateState?project_temp={project_temp}&state={state}&status={status}")]
        string updateState(string project_temp, string state, string status);

        //--http://localhost:55713/ServiceSave.svc/getProject?pers=55367854
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "getProject?person_id={person_id}")]
        string getProjectID(string person_id);
        
        //--http://localhost:55713/ServiceSave.svc/getRequest?pers=T0000013
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "getRequest?person_id={person_id}")]
        string getRequest(string person_id);

        //--http://localhost:55713/ServiceSave.svc/approveProject?projectID=1004&state=2&status=2
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "approveProject?project_temp={project_temp}&state={state}&status={status}")]
        string approveProject(string project_temp, string state, string status);
        
     

        //========================== Login =============================//
        // Login Example : -http://localhost:55713/ServiceSave.svc/login?username=Fai&password=asdf

        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "login?username={username}&password={password}")]
        string login(string username, string password);

        //========================== save_form_one =============================//
        //--http://localhost:55713/ServiceSave.svc/sen_form_one?project_name_th=ทดสอบ&project_name_en=ff&scope=few&member_one=55367854&member_two=&member_three=&project_adviser=T0000013&project_co_adviser=&project_committee=T0000023&send_approve=false
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "sen_form_one?project_name_th={project_name_th}&project_name_en={project_name_en}" +
        "&member_one={member_one}&member_two={member_two}&member_three={member_three}&project_adviser={project_adviser}&project_co_adviser={project_co_adviser}" +
        "&project_committee={project_committee}&send_approve={send_approve}")]

        string send_form_one(string project_name_th, string project_name_en, string member_one, string member_two, string member_three,
                             string project_adviser, string project_co_adviser, string project_committee, bool send_approve);

        //========================== Login =============================//
        // Login Example : -http://localhost:55713/ServiceSave.svc/student_sync?person_id=Fai&type_person=asdf
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "student_sync?person_id={person_id}&type_person={type_person}")]
        string student_sync(string person_id, int type_person);
    }
}
