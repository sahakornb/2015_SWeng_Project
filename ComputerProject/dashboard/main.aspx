<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="ComputerProject.dashboard.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard | Computer Engineering Project</title>
     <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.5/material.deep_orange-orange.min.css" /> 
        <script src="https://storage.googleapis.com/code.getmdl.io/1.0.5/material.min.js"></script>
        <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="../css/iron-min.css" />
</head>
<body>
   <!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
  <header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
      <!-- Title -->
      <span class="mdl-layout-title font-2d0 font-thai">ระบบติดตามโครงงานวิศวกรรมคอมพิวเตอร์</span>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation mdl-layout--large-screen-only">
        <a class="mdl-navigation__link font-1d8 font-thai" href=""> <span class="material-icons mdl-badge" data-badge="3">account_box</span></a>
        <a class="mdl-navigation__link font-1d8 font-thai"><!-- Right aligned menu below button -->
                            <button id="demo-menu-lower-right"
                                    class="mdl-button mdl-js-button mdl-button--icon">
                              <i class="material-icons">more_vert</i>
                            </button>
                         

                        <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                            for="demo-menu-lower-right">
                          <li  disabled class="mdl-menu__item  font-1d8">วิธีใช้งาน</li>
                          <li disabled class="mdl-menu__item  font-1d8">ติดต่อเรา</li>
                          <li  class="mdl-menu__item  font-1d8"><a href="clear.aspx" >ออกจากระบบ</a></li>
                        </ul>

        </a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer">
    <span class="mdl-layout-title font-1d8 font-thai" style="background-color:#FF5722;color:#FFFFFF" align="center">ฟอร์มโครงงาน</span>
    <nav class="mdl-navigation" align="center">
      <a class="mdl-navigation__link font-1d8 font-thai" href="">วิธีการใช้งาน</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">ติดต่อเรา</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="clear.aspx">ออกจากระบบ</a>
    </nav>
  </div>
  <main class="mdl-layout__content">
    <div class="page-content"><!-- Your content goes here -->
       
         <!-- START TEACHER PANEL  -->
        <form runat ="server" id="form1">
           <asp:Panel ID="teacher_panel" runat="server">
         <div class="mdl-grid">
                  <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-phone  white-shadow" align ="center">
                    <div style="padding:0.1vw;background-color:#FF9800">
                                    
                             <h3 class="font-thai font-1d8 white_color">โปรเจคในความรับผิดชอบ</h3>
                         
                        </div>
                     <asp:Table ID="teaher_project_table" runat="server" width="100%" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable" >
                      
                          </asp:Table>
              </div>
             <div  class="mdl-cell mdl-cell--8-col mdl-cell--4-col-tablet mdl-cell--12-col-phone white-shadow" align="center">
                 
                   <div class="mdl-grid">
                         <div  style="border:1px solid #D7CCC8;background-color:#E0E0E0" class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="id_project" runat="server" Text="รหัสโครงงาน"></asp:Label>
                          </div>
                         </div>
                       
                         <div  style="border:1px solid #D7CCC8;background-color:#E0E0E0" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="Label2" runat="server" Text="คำขอ"></asp:Label>
                          </div>
                         </div>
                       
                         <div style="border:1px solid #D7CCC8;background-color:#E0E0E0" class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                              <div class="mdl-textfield mdl-js-textfield ">
                             <asp:Label  class="font-thai font-1d8" ID="name_project" runat="server" Text="กิจกรรม"></asp:Label>
                          </div>
                         </div>
                         </div>
                 <!-- Recent Request 1-->
                 <asp:Table ID="request_view_table" runat="server" width="100%" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable">
                      
                   </asp:Table>
                    
                            <!-- button-->
                     <div class="mdl-grid" >
                       
                         <div  class="mdl-cell mdl-cell--12-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                             
                                 
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" ID="Button20" runat="server" Text="ก่อนหน้า" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" ID="Button21" runat="server" Text="ถัดไป" />
                         
                         </div>
                         </div>

              </div>
       
             </div>
   
            </asp:Panel>
        <!-- END TEACHER PANEL  -->





             <!-- START STUDENT PANEL  -->
           <asp:Panel ID="student_panel" runat="server">
         <div class="mdl-grid">
                         <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-phone  white-shadow" align ="center">
                     <div style="padding:0.1vw;background-color:#FF9800">
                             <h4 class="white_color font-thai font-2d0">Recent Logs</h4>
                      </div>
                   <asp:Table ID="student_logs_table" runat="server" width="100%" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable" >
                      
                   </asp:Table>
                  
              </div>
             <div  class="mdl-cell mdl-cell--8-col mdl-cell--4-col-tablet mdl-cell--12-col-phone white-shadow" align="center">
                 <div style="padding:0.1vw;background-color:#FF9800">
                             <h4 class=" white_color font-thai font-2d0">Activity</h4>
                      </div>
               <div class="mdl-grid">
                   <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet">
                           <div class="mdl-grid">
                                             <h4 class=" font-thai font-2d0">ยินดีต้อนรับ : <u>คุณ<%=  Session["first_name"]%> <%=  Session["last_name"]%></u></h4>
                            </div>
                   </div>
                    <div class="mdl-cell mdl-cell--5-col mdl-cell--8-col-tablet"></div>
                     <div class="mdl-cell mdl-cell--12-col mdl-cell--8-col-tablet">
                                       <!-- Default Slider -->
                         <button class="mdl-button mdl-js-button mdl-button--primary" >
                             <p class=" font-thai font-2d0" > ดำเนินการไปแล้ว :<%= progressbar %>  %</p>
                            </button>
                       
                     </div>
                   </div>
                 <div class="mdl-grid ">
                     <div class="mdl-cell mdl-cell--2-col mdl-cell--8-col-tablet"></div>
                      
                      <div class="mdl-cell mdl-cell--1-col mdl-cell--8-col-tablet">
                          <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"  href="FormCPE01.aspx">CPE01</a>
                        

                      </div>
                     <div class="mdl-cell mdl-cell--1-col mdl-cell--8-col-tablet">
                          <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"  href="FormCPE02.aspx">CPE02</a>

                      </div>
                     <div class="mdl-cell mdl-cell--1-col mdl-cell--8-col-tablet">
                         <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"  href="FormCPE03.aspx">CPE03</a>

                      </div>
                     <div class="mdl-cell mdl-cell--1-col mdl-cell--8-col-tablet">
                          <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                          CPE04
                        </button>

                      </div>
                     <div class="mdl-cell mdl-cell--1-col mdl-cell--8-col-tablet">
                          <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                          CPE05
                        </button>

                      </div>
                     <div class="mdl-cell mdl-cell--1-col mdl-cell--8-col-tablet">
                          <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                          CPE06
                        </button>

                      </div>
                     <div class="mdl-cell mdl-cell--1-col mdl-cell--8-col-tablet">
                          <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                          CPE07
                        </button>

                      </div>
                    </div>

                    <div class="mdl-grid">
                           <div class="mdl-cell mdl-cell--2-col mdl-cell--8-col-tablet"></div>

                            <div class="mdl-cell mdl-cell--8-col mdl-cell--8-col-tablet">
                       <iframe width="760" height="360" style="border: 3px solid #cccccc;" src="http://api.thingspeak.com/channels/63852/charts/1?width=760&height=360&yaxismax=100&yaxismin=0&max=240&min=0&results=60&dynamic=true&yaxis=%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%84%E0%B8%B7%E0%B8%9A%E0%B8%AB%E0%B8%99%E0%B9%89%E0%B8%B2%20%5B%20%25%20%5D&xaxis=%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B0%E0%B9%80%E0%B8%A7%E0%B8%A5%E0%B8%B2%20&title=%E0%B8%95%E0%B8%B4%E0%B8%94%E0%B8%95%E0%B8%B2%E0%B8%A1%E0%B9%80%E0%B8%AD%E0%B8%81%E0%B8%AA%E0%B8%B2%E0%B8%A3" ></iframe>
                               </div>
                                   
                       

                        </div>
                        
              </div>

             </div>
   
            </asp:Panel>
        <!-- END STUDENT PANEL  -->

        </form>



    </div>
  </main>
    <footer style="background-color:#424242;color:#FFFFFF;padding:1vw;" >
        <p class=" font-1d4" style="margin-bottom:-5px;"><a>Copyright © 2015 Tuxedo</a> | 305351 วิศวกรรมระบบคอมพิวเตอร์ Computer System Engineering </p>
       <p class=" font-1d4"  style="margin-bottom:-5px;"> <a>Edit by IRON © 2015 </a>  | 305471 วิศวกรรมซอร์ฟแวร์ Software Engineering</p>
        <p align="right" style="margin-bottom:-5px;">page_id: 02</p>
       
    </footer>
</div>
 
</body>
</html>
