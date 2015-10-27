<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="ComputerProject.website.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Page</title>
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
          <div class="mdl-cell mdl-cell--3-col mdl-cell--1-col-tablet mdl-cell--12-col-phone"></div>
          <div class="mdl-cell mdl-cell--6-col mdl-cell--12-col-tablet mdl-cell--12-col-phone" align="center">
              พัฒนาเว็บไซต์โดยทีม Tuxedo<br />

เว็บไซต์นี้เป็นส่วนหนึ่งของรายวิชา<br />

305351 วิศวกรรมระบบคอมพิวเตอร์ Computer System Engineering<hr />


          </div>

    </div>
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--1-col mdl-cell--12-col-tablet mdl-cell--12-col-phone "></div>
          <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone ">
              <img src="../images/faith.jpg" width="100%" />
                <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55361236 <br>นายวจนะชัย ว่องวีระยุทธ์<br>wajanachaiw55@email.nu.ac.th</p>
              </div>
          </div>
                    <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
              <img src="../images/bring.jpg" width="100%" />
                        <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55361830 <br>นายชนกันต์ ฟองศรัณย์<br>babringing@gmail.com</p>
              </div>
          </div>
            <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
              <img src="../images/non.jpg" width="100%" />
              <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55361885 <br>นายชานน วงศ์รจิต<br>chanonchanom@gmail.com</p>
              </div>
          </div>
            <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
              <img src="../images/tob.jpg" width="90%" />
                        <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55362257 <br>นายพีระพล จันทร์บ่อโพธิ์<br>peerapolj55@email.nu.ac.th</p>
              </div>
          </div>
            <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
              <img src="../images/top.jpg" width="100%" />
              <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55362318 <br>นายรัชวุธ คืนมาเมือง<br>ratchawutk55@email.nu.ac.th</p>
              </div>
          </div>
    </div>
     <div class="page-content"><!-- Your content goes here -->
                <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--3-col mdl-cell--1-col-tablet mdl-cell--12-col-phone"></div>
          <div class="mdl-cell mdl-cell--6-col mdl-cell--12-col-tablet mdl-cell--12-col-phone" align="center">
              พัฒนาเว็บไซต์ต่อโดยทีม IRON<br />

เว็บไซต์นี้เป็นส่วนหนึ่งของรายวิชา<br />

305471  วิศวกรรมซอฟต์แวร์ Software Engineering<hr />


          </div>

    </div>
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--1-col mdl-cell--12-col-tablet mdl-cell--12-col-phone "></div>
          <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone ">
              <img src="../images/kwanchanok.jpg" width="100%" height="200px"/>
                <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55361076 <br>นางสาวขวัญชนก นวลนภาศรี<br>kwanchanokn55@email.nu.ac.th</p>
              </div>
          </div>
                    <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
              <img src="../images/thee.jpg" width="100%" height="200px"/>
                        <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55361151 <br>นายธีรวัฒน์ หินแก้ว<br>theerawath55@email.nu.ac.th</p>
              </div>
          </div>
            <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
              <img src="../images/nontakorn.jpg" width="100%" height="200px" />
              <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55361168 <br>นายนนทกรณ์ มางิ้ว<br>oppy963@gmail.com</p>
              </div>
          </div>
            <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
              <img src="../images/sakchai.jpg" width="200px" height="200px"/>
                        <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55362417 <br>นายศักดิ์ชัย ศรีโสม<br>Bodekvidva@gmail.com</p>
              </div>
          </div>
            <div class="mdl-cell mdl-cell--2-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
              <img src="../images/sahakorn.jpg" width="200px" height="200px"/>
              <div class="org-bg" >
                  <p class="font-thai font-1d8 " align="center">55362431 <br>นายสหกรณ์ บัวงาม<br>sahakornb55@email.nu.ac.th</p>
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
