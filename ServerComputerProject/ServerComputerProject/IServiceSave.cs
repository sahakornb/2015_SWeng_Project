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

        //--http://localhost:55713/ServiceSave.svc/login?username=Fai&password=asdf
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "saveCPE01?fac={fac}&Th={projectTh}&Eng={projectEng}&scope={scope}&pers1={pers1}&pers2={pers2}&pers3={pers3}&advis1={advis1}&advis2={advis2}&commit={commit}")]
        string saveCPE01(bool fac,string projectTh, string projectEng, string scope ,string pers1, string pers2, string pers3, string advis1, string advis2, string commit);

        //--http://localhost:55713/ServiceSave.svc/saveCPE01?Th=ทดสอบ&Eng=ff&scope=few&pers1=55367854&pers2=&pers3=&advis1=T0000013&advis2=&commit=T0000023
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "login?username={user}&password={pass}")]
        string login(string user, string pass);

        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "updateState?projectID={project}&state={state}&status={status}")]
        string updateState(string project, string state, string status);

        //--http://localhost:55713/ServiceSave.svc/getProject?pers=55367854
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "getProject?pers={pers}")]
        string getProjectID(string pers);

        //--http://localhost:55713/ServiceSave.svc/saveCPE02?fac=false&project=1004&date=10/28/2015%201:09:07%20AM&topic=meet&progress=few&remark=bre
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "saveCPE02?fac={fac}&project={project}&userID={userID}&date={date}&topic={topic}&progress={progress}&remark={remark}")]
        string saveCPE02(bool fac, string project, string userID,string date, string topic, string progress, string remark);

        //--http://localhost:55713/ServiceSave.svc/getRequest?pers=T0000013
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "getRequest?pers={pers}")]
        string getRequest(string pers);

        //--http://localhost:55713/ServiceSave.svc/approveProject?projectID=1004&state=2&status=2
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "approveProject?projectID={project}&state={state}&status={status}")]
        string approveProject(string project, string state, string status);

    }
}
