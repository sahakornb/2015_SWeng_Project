<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ComputerProject.website.index" %>



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
      <span class="mdl-layout-title  font-2d0 font-thai">ระบบติดตามโครงงานวิศวกรรมคอมพิวเตอร์</span>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation mdl-layout--large-screen-only">
        <a class="mdl-navigation__link font-1d8 font-thai"href="index.aspx">หน้าหลัก</a>
        <a class="mdl-navigation__link font-1d8 font-thai" href="">วิธีใช้งาน</a>
        <a class="mdl-navigation__link font-1d8 font-thai"  href="about.aspx">เกี่ยวกับเรา</a>
        <a class="mdl-navigation__link font-1d8 font-thai" href="Login.aspx">ลงชื่อเข้าใช้</a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer">
    <span class="mdl-layout-title" style="background-color:#FF5722;color:#FFFFFF">Title</span>
    <nav class="mdl-navigation">
      <a class="mdl-navigation__link font-1d8" href="index.aspx">หน้าหลัก</a>
      <a class="mdl-navigation__link font-1d8" href="">วิธีใช้งาน</a>
      <a class="mdl-navigation__link font-1d8" href="about.aspx">เกี่ยวกับเรา</a>
      <a class="mdl-navigation__link font-1d8" href="Login.aspx">ลงชื่อเข้าใช้</a>
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
          <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet mdl-cell--8-col-phone white-shadow ">
                 <img src="http://www.nstda.or.th/ystp/images/YSTP58.gif" width="100%" />
              <div>
                  <p class="font-thai font-1d8">เปิดสมัครเพื่อขอรับทุนสนับสนุนการวิจัยปริญญานิพนธ์ (Senior Project) ปีการศึกษา 2558</p>
              </div>
          </div>
          <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet mdl-cell--8-col-phone white-shadow ">
              <img src="http://www.nstda.or.th/ystp/images/YSTP58.gif" width="100%" />
              <div >
                  <p class="font-thai font-1d8">เปิดสมัครเพื่อขอรับทุนสนับสนุนการวิจัยปริญญานิพนธ์ (Senior Project) ปีการศึกษา 2558</p>
              </div>
          </div>
               <div class="mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet mdl-cell--8-col-phone white-shadow">
                 <img src="http://www.nstda.or.th/ystp/images/YSTP58.gif" width="100%" />
              <div>
                  <p class="font-thai font-1d8">เปิดสมัครเพื่อขอรับทุนสนับสนุนการวิจัยปริญญานิพนธ์ (Senior Project) ปีการศึกษา 2558</p>
                  

              </div>
          </div>
          
    </div>
  
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

