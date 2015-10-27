<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ComputerProject.website.Login" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ลงชื่อเข้าใช้</title>
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
      <span class="mdl-layout-title  font-2d0 font-thai">ระบบติดตามโครงงานวิศวกรรมคอมพิวเตอร์</span>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation mdl-layout--large-screen-only">
        <a class="mdl-navigation__link font-1d8 font-thai"href="index.aspx">หน้าหลัก</a>
        <a class="mdl-navigation__link font-1d8 font-thai" href="">วิธีใช้งาน</a>
        <a class="mdl-navigation__link font-1d8 font-thai"  href="about.aspx">เกี่ยวกับเรา</a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer">
    <span class="mdl-layout-title font-thai" style="background-color:#FF5722;color:#FFFFFF">เมนู</span>
    <nav class="mdl-navigation">
      <a class="mdl-navigation__link font-1d8 font-thai" href="index.aspx">หน้าหลัก</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="">วิธีใช้งาน</a>
      <a class="mdl-navigation__link font-1d8 font-thai" href="about.aspx">เกี่ยวกับเรา</a>
    </nav>
  </div>
  <main class="mdl-layout__content">
    <div class="page-content"><!-- Your content goes here -->
             <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--2-col mdl-cell--2-col-tablet mdl-cell--2-col-phone"></div>
          <div class="mdl-cell mdl-cell--8-col mdl-cell--8-col-tablet mdl-cell--8-col-phone">
              <img src="../images/1.png" width="100%" />
          </div>
          
    </div>
          <form ID="form1" runat="server">
        <div class="mdl-grid"style="padding :1.2vw">
          <div class="mdl-cell mdl-cell--3-col mdl-cell--1-col-tablet mdl-cell--12-col-phone"></div>
          <div  style="border:1px solid #D7CCC8;padding :1vw" class="mdl-cell mdl-cell--6-col mdl-cell--10-col-tablet mdl-cell--8-col-phone  white-shadow" align="center">
             <h3 class="font-thai">เข้าสู่ระบบ</h3> 
            
                         
                                 <div class="mdl-textfield mdl-js-textfield">
                             <asp:TextBox  class="mdl-textfield__input" type="text" id="username"  runat="server"></asp:TextBox>
                              <label class="mdl-textfield__label" for="username">กรุณากรอก Username</label>
                                   
                           </div>
                           
                       <br>
            
                              <div class="mdl-textfield mdl-js-textfield">
                             <asp:TextBox  class="mdl-textfield__input" type="text" id="pass"  runat="server"></asp:TextBox>
                              <label class="mdl-textfield__label" for="pass">กรุณากรอก Password</label>
                                   
                           </div> <br>
                      
                    <!-- Primary-colored flat button -->
                <asp:Button ID="submit_login" runat="server" Text="ลงชื่อเข้าใช้งาน" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" />
                                    
                            </button>
                    

              </div>
          </div>

        
  
</form>
     </div>

  
  </main>
      <footer style="background-color:#424242;color:#FFFFFF;padding:1vw;" >
        <p class=" font-1d4" style="margin-bottom:-5px;"><a>Copyright © 2015 Tuxedo</a> | 305351 วิศวกรรมระบบคอมพิวเตอร์ Computer System Engineering </p>
       <p class=" font-1d4"  style="margin-bottom:-5px;"> <a>Edit by IRON © 2015 </a>  | 305471 วิศวกรรมซอร์ฟแวร์ Software Engineering</p>
        <p align="right" style="margin-bottom:-5px;">page_id: 01</p>
       
    </footer>
</div>
 
</body>
</html>

