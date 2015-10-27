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
                          <li  class="mdl-menu__item  font-1d8">ออกจากระบบ</li>
                          
                        </ul>

        </a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer">
    <span class="mdl-layout-title font-1d8 font-thai" style="background-color:#FF5722;color:#FFFFFF" align="center">ฟอร์มโครงงาน</span>
    <nav class="mdl-navigation" align="center">
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE01</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE02</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE03</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE04</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE05</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE06</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE07</a>
    </nav>
  </div>
  <main class="mdl-layout__content">
    <div class="page-content"><!-- Your content goes here -->
       
         <!-- START TEACHER PANEL  -->
        <form runat ="server" id="form1">
           <asp:Panel ID="teacher_panel" runat="server">
         <div class="mdl-grid">
          
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
                 <asp:Panel ID="req_1" runat="server">
                     <div class="mdl-grid" >
                         <div   class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         
                              <asp:Label  class="font-thai font-1d8" ID="Label1" runat="server" Text="CPE5654"></asp:Label>
                          
                         </div>
                       
                         <div   class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          
                              <asp:Label  class="font-thai font-1d8" ID="Label3" runat="server" Text="แบบขอเสนอชื่อโครงงาน"></asp:Label>
                         
                         </div>

                         <div  class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                             
                                  <asp:Button class="mdl-button mdl-js-button mdl-button--accent" ID="Button1" runat="server" Text="รายละเอียด" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="Button2" runat="server" Text="อนุมัติ" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" ID="Button3" runat="server" Text="ไม่อนุมัติ" />
                         
                         </div>
                         </div>
                     </asp:Panel>
                            <!-- Recent Request 2-->
                   <asp:Panel ID="req_2" runat="server">
                     <div class="mdl-grid" >
                         <div   class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         
                              <asp:Label  class="font-thai font-1d8" ID="Label4" runat="server" Text="CPE5654"></asp:Label>
                          
                         </div>
                       
                         <div   class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          
                              <asp:Label  class="font-thai font-1d8" ID="Label5" runat="server" Text="แบบขอเสนอชื่อโครงงาน"></asp:Label>
                         
                         </div>

                         <div  class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                             
                                  <asp:Button class="mdl-button mdl-js-button mdl-button--accent" ID="Button4" runat="server" Text="รายละเอียด" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="Button5" runat="server" Text="อนุมัติ" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" ID="Button6" runat="server" Text="ไม่อนุมัติ" />
                         
                         </div>
                         </div>
                       </asp:Panel>
                            <!-- Recent Request 3-->
                <asp:Panel ID="req_3" runat="server">
                     <div class="mdl-grid" >
                         
                         <div   class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         
                              <asp:Label  class="font-thai font-1d8" ID="Label6" runat="server" Text="CPE5654"></asp:Label>
                          
                         </div>
                       
                         <div   class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          
                              <asp:Label  class="font-thai font-1d8" ID="Label7" runat="server" Text="แบบขอเสนอชื่อโครงงาน"></asp:Label>
                         
                         </div>

                         <div  class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                             
                                  <asp:Button class="mdl-button mdl-js-button mdl-button--accent" ID="Button7" runat="server" Text="รายละเอียด" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="Button8" runat="server" Text="อนุมัติ" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" ID="Button9" runat="server" Text="ไม่อนุมัติ" />
                         
                         </div>
                         </div>
                  </asp:Panel>
                            <!-- Recent Request 4-->
              <asp:Panel ID="req_4" runat="server">
                     <div class="mdl-grid" >
                         <div   class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         
                              <asp:Label  class="font-thai font-1d8" ID="Label8" runat="server" Text="CPE5654"></asp:Label>
                          
                         </div>
                       
                         <div   class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          
                              <asp:Label  class="font-thai font-1d8" ID="Label9" runat="server" Text="แบบขอเสนอชื่อโครงงาน"></asp:Label>
                         
                         </div>

                         <div  class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                             
                                  <asp:Button class="mdl-button mdl-js-button mdl-button--accent" ID="Button10" runat="server" Text="รายละเอียด" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="Button11" runat="server" Text="อนุมัติ" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" ID="Button12" runat="server" Text="ไม่อนุมัติ" />
                         
                         </div>
                         </div>
            </asp:Panel>
                            <!-- Recent Request 5-->
            <asp:Panel ID="req_5" runat="server">
                     <div class="mdl-grid" >
                         <div   class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         
                              <asp:Label  class="font-thai font-1d8" ID="Label10" runat="server" Text="CPE5654"></asp:Label>
                          
                         </div>
                       
                         <div   class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          
                              <asp:Label  class="font-thai font-1d8" ID="Label11" runat="server" Text="แบบขอเสนอชื่อโครงงาน"></asp:Label>
                         
                         </div>

                         <div  class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                             
                                  <asp:Button class="mdl-button mdl-js-button mdl-button--accent" ID="Button13" runat="server" Text="รายละเอียด" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="Button14" runat="server" Text="อนุมัติ" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" ID="Button15" runat="server" Text="ไม่อนุมัติ" />
                         
                         </div>
                         </div>
             </asp:Panel>
                            <!-- Recent Request 6-->
            <asp:Panel ID="req_6" runat="server">
                     <div class="mdl-grid" >
                         <div   class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         
                              <asp:Label  class="font-thai font-1d8" ID="Label12" runat="server" Text="CPE5654"></asp:Label>
                          
                         </div>
                       
                         <div   class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          
                              <asp:Label  class="font-thai font-1d8" ID="Label13" runat="server" Text="แบบขอเสนอชื่อโครงงาน"></asp:Label>
                         
                         </div>

                         <div  class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                             
                                  <asp:Button class="mdl-button mdl-js-button mdl-button--accent" ID="Button16" runat="server" Text="รายละเอียด" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="Button17" runat="server" Text="อนุมัติ" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" ID="Button18" runat="server" Text="ไม่อนุมัติ" />
                         
                         </div>
                         </div>
                </asp:Panel>
                            <!-- button-->
                     <div class="mdl-grid" >
                       
                         <div  class="mdl-cell mdl-cell--12-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                             
                                 
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" ID="Button20" runat="server" Text="ก่อนหน้า" />
                                    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" ID="Button21" runat="server" Text="ถัดไป" />
                         
                         </div>
                         </div>

              </div>
               <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-phone  white-shadow" align ="center">
                    <div style="padding:0.1vw;background-color:#FF9800">
                                    
                             <h5 class="font-thai">โปรเจคในความรับผิดชอบ</h5>
                        </div>
              </div>
             </div>
   
            </asp:Panel>
        <!-- END TEACHER PANEL  -->





             <!-- START STUDENT PANEL  -->
           <asp:Panel ID="student_panel" runat="server">
         <div class="mdl-grid">
          
             <div  class="mdl-cell mdl-cell--8-col mdl-cell--4-col-tablet mdl-cell--12-col-phone white-shadow" align="center">
                 <div style="padding:0.1vw;background-color:#FF9800">
                             <h5 class="font-thai">Activity</h5>
                      </div>
              </div>
               <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-phone  white-shadow" align ="center">
                     <div style="padding:0.1vw;background-color:#FF9800">
                             <h5 class="font-thai">Recent Logs</h5>
                      </div>
                   <asp:Table ID="Table1" runat="server" width="100%" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable" onLoad="addLogs">
                      
                   </asp:Table>
                  
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
