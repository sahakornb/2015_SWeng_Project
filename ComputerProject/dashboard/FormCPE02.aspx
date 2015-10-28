<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormCPE02.aspx.cs" Inherits="ComputerProject.dashboard.FormCPE02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CPE02</title>
     <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.5/material.deep_orange-orange.min.css" /> 
        <script src="https://storage.googleapis.com/code.getmdl.io/1.0.5/material.min.js"></script>
        <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="../css/iron-min.css" />
</head>
<body runat="server">
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
             <h3 class="font-thai">แบบบันทึกการดำเนินงานโครงงานวิศวกรรมคอมพิวเตอร์ [CPE-02]</h3>  
          </div>
     </div> 
        <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--2-col mdl-cell--2-col-tablet mdl-cell--12-col-phone"></div>
          <div style="padding:1vw" class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--8-col-phone white-shadow">
              <!-- Simple Textfield -->
              <form ID="form1" runat="server">
                      <div class="mdl-grid">
                             
                             <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                                  <div style="padding:0.5vw;background-color:#FF9800">
                                    
                             <h4 class="font-thai">ชื่อโครงงาน</h4>
                        </div>
                                 </div>
                             </div>
                     <div class="mdl-grid">
                         <div  style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          <div class="mdl-textfield mdl-js-textfield ">
                              <asp:Label  class="font-thai font-2d0" ID="id_project" runat="server" Text="รหัสโครงงาน"></asp:Label>
                          </div>
                         </div>

                         <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                              <div class="mdl-textfield mdl-js-textfield ">
                             <asp:Label  class="font-thai font-2d0" ID="name_project" runat="server" Text="ชื่อโครงงาน"></asp:Label>

                          </div>
                         </div>
                         </div>

                                  <div class="mdl-grid">
                             <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--2-col-phone" align ="center">
                                  <div style="padding:0.5vw;background-color:#FF9800">
                        <h4 class="font-thai">บันทึกการดำเนินงานโครงงาน</h4>
                        </div>
                                 </div>
                             </div>
                      <!--Date  -->
                      <div class="mdl-grid">
                       

                         <div class="mdl-cell mdl-cell--4-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                            
                            
                               

                                         <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="getCalendar" OnLoad="nowCalendar"></asp:Calendar>  
                                 
                         </div>
                        
                         <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                          
                              <div style="padding:0.5vw;background-color:#FF9800">
                              <asp:Label ID="date_text" runat="server" Text="Label"></asp:Label>
                                  </div>
                           <br />
                              <div class="mdl-textfield mdl-js-textfield">
                             <asp:TextBox  class="mdl-textfield__input" type="text" TextMode="multiline" Rows="2" id="Topic"  runat="server"></asp:TextBox>
                              <label class="mdl-textfield__label" for="TextBox1">ประเด็น/หัวข้อ/งานที่รับมอบหมาย</label>
                                   
                           </div>
                          
                         </div>
                        
              
                         </div>
                    <!--Edit Message  -->
                         <div class="mdl-grid">
                       

                               <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                                                           
                                        <div class="mdl-textfield mdl-js-textfield">
                             <asp:TextBox  class="mdl-textfield__input" type="text" TextMode="multiline" Rows="3" id="Progress"  runat="server"></asp:TextBox>
                              <label class="mdl-textfield__label" for="TextBox2">ข้อสรุป/ความคืบหน้า</label>
                                   
                           </div>
                                    
                          
                         </div>
                                 <div style="border:1px solid #D7CCC8" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                                            <div class="mdl-textfield mdl-js-textfield">
                             <asp:TextBox  class="mdl-textfield__input" type="text" TextMode="multiline" Rows="3" id="Remark"  runat="server"></asp:TextBox>
                              <label class="mdl-textfield__label" for="TextBox3">หมายเหตุ</label>
                                   
                           </div>
                                    
                          
                         </div>
                         </div>
                        


                       
                         <!-- add teacher -->
                         <div class="mdl-grid">
                             <div  class="mdl-cell mdl-cell--3-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center"></div>
                         <div  class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                         <!-- Expandable Textfield -->
                    
                                <asp:Button ID="save" runat="server" Text="บันทึก" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" OnClick="save_Click" />
                                 
                            </button>
                     
                            
                         </div>
                         <div class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                       
                         
                             <asp:Button ID="save_send" runat="server" Text="บันทึกและส่ง" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" OnClick="save_send_Click" />
                                    
                            </button>
                         
                                
                         </div>
                                <div  class="mdl-cell mdl-cell--2-col mdl-cell--10-col-tablet mdl-cell--12-col-phone" align ="center">
                                    <asp:Button ID="cancel" runat="server" Text="ยกเลิก" class="mdl-button mdl-js-button mdl-button--primary" />
                                    
                            
                            </button>
                            
                               
                         </div>
                         </div>
                    
               
            
               
          </div>
          
    </div>
                
    </div>
      
                            </form>
  </main>
      <footer style="background-color:#424242;color:#FFFFFF;padding:1vw;" >
        <p class=" font-1d4" style="margin-bottom:-5px;"><a>Copyright © 2015 Tuxedo</a> | 305351 วิศวกรรมระบบคอมพิวเตอร์ Computer System Engineering </p>
       <p class=" font-1d4"  style="margin-bottom:-5px;"> <a>Edit by IRON © 2015 </a>  | 305471 วิศวกรรมซอร์ฟแวร์ Software Engineering</p>
        <p align="right" style="margin-bottom:-5px;">page_id: 03</p>
       
    </footer>
</div>
</body>
</html>