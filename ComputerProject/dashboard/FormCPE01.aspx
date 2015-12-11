<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormCPE01.aspx.cs" Inherits="ComputerProject.dashboard.FormCPE01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CPE01</title>
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
        <a class="mdl-navigation__link font-1d8 font-thai" href="main.aspx"> <span class="material-icons mdl-badge" data-badge="3">account_box</span></a>
        <a class="mdl-navigation__link font-1d8 font-thai"><!-- Right aligned menu below button -->
                            <button id="demo-menu-lower-right"
                                    class="mdl-button mdl-js-button mdl-button--icon">
                              <i class="material-icons">more_vert</i>
                            </button>

                        <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                            for="demo-menu-lower-right">
                          <li  disabled class="mdl-menu__item  font-1d8">วิธีใช้งาน</li>
                          <li disabled class="mdl-menu__item  font-1d8">ติดต่อเรา</li>
                          <li  class="mdl-menu__item  font-1d8"><a href="clear.aspx" >ออกจากระบบ</li></a>
                          
                        </ul>

        </a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer">
    <span class="mdl-layout-title font-1d8 font-thai" style="background-color:#FF5722;color:#FFFFFF" align="center">ฟอร์มโครงงาน</span>
    <nav class="mdl-navigation" align="center">
      <a class="mdl-navigation__link font-1d8 font-thai" href="FormCPE01.aspx">CPE01</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="FormCPE02.aspx">CPE02</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE03</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE04</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE05</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE06</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">CPE07</a>
    </nav>
  </div>
  <main class="mdl-layout__content">
    <div class="page-content"><!-- Your content goes here -->
             <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--2-col mdl-cell--1-col-tablet mdl-cell--12-col-phone"></div>
          <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--8-col-phone white-shadow" align="center">
             <h3 class="font-thai">แบบเสนอหัวข้อโครงงานวิศวกรรมคอมพิวเตอร์ [CPE-01]</h3>  
          </div>
     </div> 
          <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--2-col mdl-cell--2-col-tablet mdl-cell--12-col-phone"></div>

          <div style="padding:1vw" class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--8-col-phone white-shadow">
              <!-- Simple Textfield -->
                <form id="form1" runat="server" >
                     <div class="mdl-grid">
                             <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                                  <div style="padding:0.5vw;background-color:#FF9800">
                   <h4 class="font-thai">ชื่อโครงงาน</h4>
                        </div>
                                 </div>
                             </div>
                     <div class="mdl-grid">
                         <div  style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          
                              <div class="mdl-textfield mdl-js-textfield">
                             <asp:TextBox  class="mdl-textfield__input" type="text" id="name_th"  runat="server"></asp:TextBox>
                              <label class="mdl-textfield__label" for="name_th">กรอกชื่อโครางงานภาษาไทย</label>
                                   
                           </div>
                         </div>

                         <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                           
                                <div class="mdl-textfield mdl-js-textfield">
                             <asp:TextBox  class="mdl-textfield__input" type="text" id="name_en"  runat="server"></asp:TextBox>
                              <label class="mdl-textfield__label" for="name_en">กรอกชื่อโครงงานภาษาอังกฤษ</label>
                                   
                           </div>
                         </div>
                         </div>
                    <!-- Name of student 1 -->

                         <div class="mdl-grid">
                             <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone" align ="center">
                                  <div style="padding:0.5vw;background-color:#FF9800">
                             <h4 class="font-thai">รายชื่อผู้ทำโครงงาน</h4>
                        </div>
                                 </div>
                             </div>
                               <div class="mdl-grid">
                         <div style="border:1px solid #D7CCC8;background-color:#E0E0E0" class="mdl-cell mdl-cell--3-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <h5 class="font-thai">รหัสนิสิต</h5>
                              
                              </div>
                                    <div  style="border:1px solid #D7CCC8;background-color:#E0E0E0" class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          <h5 class="font-thai">ชื่อ-สกุล</h5>
                                    </div>
                                   <div  style="border:1px solid #D7CCC8;background-color:#E0E0E0" class="mdl-cell mdl-cell--5-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <h5 class="font-thai">สังกัด</h5>
                                        </div>
                           
                         </div>
                    <asp:Panel ID="std_panel1" runat="server">
                        <div class="mdl-grid" >
                         <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--3-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                       <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="student_id_1" runat="server" Text="55362431"></asp:Label>
                         </div>
                              </div>
                                    <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="student_name_1" runat="server" Text="สหกรณ์ บัวงาม"></asp:Label>
                        </div>
                                    </div>
                                   <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--5-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="faculty1" runat="server" Text="วิศวกรรมคอมพิวเตอร์"></asp:Label>
                          </div>
                                        </div>
                           
                         </div>
                        </asp:Panel>
                      <asp:Panel ID="std_panel2" runat="server">
                          <div class="mdl-grid" >
                         <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--3-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                       <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="student_id_2" runat="server" Text="55362431"></asp:Label>
                         </div>
                              </div>
                                    <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="student_name_2" runat="server" Text="สหกรณ์ บัวงาม"></asp:Label>
                        </div>
                                    </div>
                                   <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--5-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="faculty2" runat="server" Text="วิศวกรรมคอมพิวเตอร์"></asp:Label>
                          </div>
                                        </div>
                           
                         </div>
                        </asp:Panel>
                      <asp:Panel ID="std_panel3" runat="server">
                          <div class="mdl-grid" >
                         <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--3-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                       <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="student_id_3" runat="server" Text="55362431"></asp:Label>
                         </div>
                              </div>
                                    <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="student_name_3" runat="server" Text="สหกรณ์ บัวงาม"></asp:Label>
                        </div>
                                    </div>
                                   <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--5-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-1d8" ID="faculty3" runat="server" Text="วิศวกรรมคอมพิวเตอร์"></asp:Label>
                          </div>
                                        </div>
                           
                         </div>
                        </asp:Panel>
                        
                        
                           <!-- add stdudent -->
                         <div class="mdl-grid">
                         <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <!-- Expandable Textfield -->
                             <h5 class="font-thai">ค้นหาสมาชิกโดยรหัสนิสิต</h5>
                              
                                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
                                    <label class="mdl-button mdl-js-button mdl-button--icon" for="search_id">
                                      <i class="material-icons">search</i>
                                    </label>
                                    <div class="mdl-textfield__expandable-holder">
                                      <input class="mdl-textfield__input" type="text" id="search_id" />
                                      <label class="mdl-textfield__label" for="sample-expandable">Expandable Input</label>
                                    </div>
                                  </div>
                                
                         </div>
                         <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                           <h5 class="font-thai">ค้นหาสมาชิกโดยชื่อ</h5>
                               

                                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
                                    <label class="mdl-button mdl-js-button mdl-button--icon" for="search_name">
                                      <i class="material-icons">search</i>
                                    </label>
                                    <div class="mdl-textfield__expandable-holder">
                                      <input class="mdl-textfield__input" type="text" id="search_name" />
                                      <label class="mdl-textfield__label" for="sample-expandable">Expandable Input</label>
                                    </div>
                                  </div>
                                
                         </div>
                         </div>


                          <!-- Save send -->
                         <div class="mdl-grid">
                         <div style="border:1px solid #D7CCC8;padding:0.5vw;" class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <!-- Expandable Textfield -->
                             <h5 class="font-thai">อาจารย์ที่ปรึกษา</h5>
                             <select id="Select1">
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                             </select>
                            
                         </div>
                         <div style="border:1px solid #D7CCC8;padding:0.5vw;" class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                           <h5 class="font-thai">อาจารย์ที่ปรึกษาร่วม</h5>
                              <select id="Select1">
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                             </select>
                                
                         </div>
                                <div style="border:1px solid #D7CCC8;padding:0.5vw;" class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                           <h5 class="font-thai">เลือกกรรมการ</h5>
                                     <select id="Select1">
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                                 <option>อาจารย์ สุชาติ แย้มเม่น</option>
                             </select>
                               
                                    
                         </div>
                         </div>
                         <!-- add teacher -->
                         <div class="mdl-grid">
                             <div  class="mdl-cell mdl-cell--3-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center"></div>
                         <div  class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <!-- Expandable Textfield -->
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                              บันทึก
                            </button>
                     
                            
                         </div>
                         <div class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                              บันทึกและส่ง
                            </button>
                         
                                
                         </div>
                                <div  class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                        <button class="mdl-button mdl-js-button mdl-button--primary">
                              ยกเลิก
                            </button>
                            
                               
                         </div>
                         </div>
                    
                </form>
            
               
          </div>
          
    </div>       
    </div>
  </main>
      <footer style="background-color:#424242;color:#FFFFFF;padding:1vw;" >
        <p class=" font-1d4" style="margin-bottom:-5px;"><a>Copyright © 2015 Tuxedo</a> | 305351 วิศวกรรมระบบคอมพิวเตอร์ Computer System Engineering </p>
       <p class=" font-1d4"  style="margin-bottom:-5px;"> <a>Edit by IRON © 2015 </a>  | 305471 วิศวกรรมซอร์ฟแวร์ Software Engineering</p>
        <p align="right" style="margin-bottom:-5px;">page_id: 03</p>
       
    </footer>
</div>
</body>
</html>