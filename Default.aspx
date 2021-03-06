﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EZ.Web.Default" ValidateRequest="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
    <meta name="viewport" content="initial-scale=0.5,user-scalable=no,maximum-scale=1,width=device-width" />
    <title>项目管理系统</title>
    <!-- CSS -->
    <link href="css/loginnk.css" rel="stylesheet" />
    <!-- Javascript -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
    <script src="js/PartIndex.js"></script>
</head>
<body>
    <div class="logobox">
        <div class="zbox">
            <img class="nklogo" src="img/desktop/nklogo.png" />
        </div>
    </div>
    <div class="zbox">
        <div class="loginbox">
            <h1>PM系统</h1>
            <div class="formbox">
                <form action="#" method="post" target="_self">
                    <div class="login_line login1">
                        <input type="text" id="UserName" placeholder="用户名" class="login_text" />
                    </div>
                    <div class="login_line login2">
                        <input type="password" id="loginPwd" placeholder="密码" class="login_text" />
                    </div>
                    <input type="button" value="登     录" id="loginBtn" class="login_btn" />
                    <span id="loginmsg2"></span>
                </form>
            </div>
        </div>
    </div>
    <div class="copyright">&copy; HENAN AGRIC.SYNTHESIS EXPLOITATION CO.,LTD ALL RIGHTS RESERVED</div>
</body>
</html>
