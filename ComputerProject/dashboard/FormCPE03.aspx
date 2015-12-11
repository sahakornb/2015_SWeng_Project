<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormCPE03.aspx.cs" Inherits="ComputerProject.dashboard.FormCPE03" %>
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
         <form ID="form1" runat="server">
      <!-- Show Header CPE FORM -->
            <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--2-col mdl-cell--1-col-tablet mdl-cell--12-col-phone"></div>
          <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--8-col-phone white-shadow" align="center">
             <h3 class="font-thai">แบบขอสอบข้อเสนอโครงงานวิศวกรรมคอมพิวเตอร์ [CPE-03]</h3>  
          </div>
         </div> 
        <!-- END Show Header CPE FORM -->
       <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--2-col mdl-cell--2-col-tablet mdl-cell--12-col-phone"></div>
          <div style="padding:1vw" class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--8-col-phone white-shadow">
               <div class="mdl-grid">
                             <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                                  <div style="padding:0.5vw;background-color:#FF9800">
                            <h4 class="font-thai font-2d0 white_color">ข้อมูลรายละเอียดโครงงาน</h4>
                        </div>
                                 </div>
                             </div>
                <div class="mdl-grid">
                             <div style="border:1px solid #D7CCC8;background-color:#E0E0E0;padding:0.5vw" class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                          <p class="font-thai font-2d0 ">รหัสโครงงาน</p> 
                                 </div>
                    <div style="border:1px solid #D7CCC8;background-color:#E0E0E0;padding:0.5vw" class="mdl-cell mdl-cell--5-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                          <p class="font-thai font-2d0 ">ชื่อโครงงานภาษาไทย</p>
                                 </div>
                    <div style="border:1px solid #D7CCC8;background-color:#E0E0E0;padding:0.5vw" class="mdl-cell mdl-cell--5-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                           <p class="font-thai font-2d0 "> ชื่อโครงงานภาษาอังกฤษ</p>
                                 </div>
                     </div>
                 <div class="mdl-grid">
                             <div style="border:1px solid #D7CCC8;padding:0.5vw" class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">

                          <p class="font-thai font-1d8 "><%=project_id %></p> 
                                 </div>
                    <div style="border:1px solid #D7CCC8;padding:0.5vw" class="mdl-cell mdl-cell--5-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                          <p class="font-thai font-1d8 "><%=project_name_th %></p>
                                 </div>
                    <div style="border:1px solid #D7CCC8;padding:0.5vw" class="mdl-cell mdl-cell--5-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                           <p class="font-thai font-1d8 "><%=project_name_en %></p>
                                 </div>
                     </div>
                            <div class="mdl-grid">
                  <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                                  <div style="padding:0.5vw;background-color:#FF9800">
                            <h4 class="font-thai font-2d0 white_color">ประเด็นปัญหาและขอบเขตของโครงงานโดยย่อ</h4>

                                 </div>
                  </div>

              </div>
                           <div class="mdl-grid">
                  <div  class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--2-col-phone"  align="center">
                                                  
                                      
                                              
                             <asp:TextBox  type="text" TextMode="multiline" Rows="10" ID="problem_scrope" Width="100%" runat="server"></asp:TextBox>
          
                                  
                          
                  </div>

              </div>
              <div class="mdl-grid">
                  <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                                  <div style="padding:0.5vw;background-color:#FF9800">
                            <h4 class="font-thai font-2d0 white_color">รายชื่อนิสิตผู้ทำโครงงาน</h4>
                                 </div>
                  </div>
                        <asp:Table ID="student_member" runat="server" width="100%" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable" align ="center">
                      
                         </asp:Table>
              </div>
              <div class="mdl-grid">
                   <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                            <div style="padding:0.5vw;background-color:#FF9800">
                                 <h4 class="font-thai font-2d0 white_color">กรรมการสอบโครงงาน</h4>
                             </div>
                  </div>
                     <asp:Table ID="Teacher" runat="server" width="100%" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable">
                      
                         </asp:Table>

                  </div>
                      <div class="mdl-grid">
                             <div  class="mdl-cell mdl-cell--3-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center"></div>
                         <div  class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <!-- Expandable Textfield -->
                    
                                <asp:Button ID="save" runat="server" Text="บันทึก" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent " OnClick="save_Click" />
                                 
                            
                     
                            
                         </div>
                         <div class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                       
                         
                             <asp:Button ID="save_send" runat="server" Text="บันทึกและส่ง" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" OnClick="save_send_Click"/>
                                    
                          
                         
                                
                         </div>
                                <div  class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                                    <asp:Button ID="cancel" runat="server" Text="ยกเลิก" class="mdl-button mdl-js-button mdl-button--primary" />

                         </div>
                           </form>
                         </div>
                    
          

       </div>

        

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
