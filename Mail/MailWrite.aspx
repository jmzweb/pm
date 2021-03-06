﻿<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="MailWrite.aspx.cs" Inherits="EIS.Web.Mail.MailWrite" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>写邮件 </title>
    <meta http-equiv="Pragma" content="no-cache"/>
    <link rel="stylesheet" type="text/css" href="../Css/appMail.css" />
    <link type="text/css" rel="stylesheet" href="../Editor/kindeditor-4.1.11/themes/default/default.css" />
    <script type="text/javascript" src="../js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="../DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Editor/kindeditor-4.1.11/kindeditor-min.js"></script>
    <script type="text/javascript" src="../Editor/kindeditor-4.1.11/lang/zh_CN.js"></script>
    
    <script type="text/javascript">
        $(function () {
            //$('input,select').change(updatexml)
            $("#TO_NAME,#CC_Name,#BCC_Name").attr("readonly", true);
            var cc = $("#CC_Name").val();
            if (cc != "")
                $("#tr_cc").show();

            $("#maindiv").height($(document.body).height() - 40);
            var editor;
            KindEditor.ready(function (K) {
                editor = K.create('#MailBody', {
                    resizeType: 2,
                    uploadJson: '../UploadImage.axd'
                });
            });

            $(".serverBtn").click(function () {
                editor.sync();
                return true;
            });

        });
	function openpage(url)
	{
	    openCenter(url,"_blank",600,500);
	}
	function openCenter(url,name,width,height)
    {
        var str = "height=" + height + ",innerHeight=" + height + ",width=" + width + ",innerWidth=" + width;
        if (window.screen)
        {
            var ah = screen.availHeight - 30;
            var aw = screen.availWidth - 10;
            var xc = (aw - width) / 2;
            var yc = (ah - height) / 2;
            str += ",left=" + xc + ",screenX=" + xc + ",top=" + yc + ",screenY=" + yc;
            str += ",resizable=yes,scrollbars=yes,directories=no,status=no,toolbar=no,menubar=no,location=no";
        }
        return window.open(url, name, str);
    }
    function show_btn(tr_id, btn) {
        var tr = document.getElementById(tr_id), str_hide = "email_hiddenwebemail.jpg", str_add = "email_addwebemail.jpg";
        if (!tr)
            return;

        if (tr.style.display == "none") {
            tr.style.display = "";
            btn.firstChild.src = '../img/email/' + str_hide;
        }
        else {
            tr.style.display = "none";
            btn.firstChild.src = '../img/email/' + str_add;
        }
    }
    function SelectUser(ctlid, ctlname)
    {
        openpage('../SysFolder/Common/UserTree.aspx?method=1&self=0&queryfield=empname,empid&cid='+ctlname+","+ctlid);
    }
    function ClearUser(ctlid, ctlname) {
        $("#" + ctlid).val("");
        $("#" + ctlname).val("");
    }
    function show_tr(tr_id, btn) {
        var tr = document.getElementById(tr_id), str_hide = "隐藏", str_add = "添加";
        if (!tr)
            return;

        if (tr.style.display == "none") {
            tr.style.display = "";
            btn.innerText = str_hide + btn.innerText.substring(str_add.length, btn.innerText.length);
        }
        else {
            tr.style.display = "none";
            btn.innerText = str_add + btn.innerText.substring(str_hide.length, btn.innerText.length);
        }
    }

    </script>
    <style type="text/css">

    	a img
    	{
    		border-collapse: collapse;
    		border-width:0px;
    	}
    	#chkSms{vertical-align:middle;}
    	#Subject{height:24px;line-height:24px;padding-left:3px;padding-right:2px;}
    	label{color:#0088cc;vertical-align:middle;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="menubar">
        <div class="topnav">
            <ul>

                <li>
                    <asp:LinkButton ID="LinkButton1" CssClass="serverBtn" runat="server" onclick="LinkButton1_Click">立即发送</asp:LinkButton>
                </li>
                <li style="width:80px">
                    <asp:LinkButton ID="LinkButton2" CssClass="serverBtn" runat="server" onclick="LinkButton2_Click">保存到草稿箱</asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>

    <div id="maindiv" style="margin-left:auto;margin-right:auto;width:820px;background:#f6f7f9;color:#393939;padding-top:5px;">
        <%=msgInfo%>
        <table class="TableTop" width="800" align="center">
        <tbody>
            <tr>
                <td class="left"></td>
                <td class="center subject">邮件发送</td>
                <td class="right"></td>
            </tr>
        </tbody>
        </table>
        <table class="defaultstyle" border="1"  width="800px;" align="center">
        <tbody>
        <tr>
        <td  width="80">&nbsp;收 件 人：</td>
        <td style="padding:3px">
            <asp:TextBox TextMode="MultiLine"  runat="server" Height="40px" CssClass="TextBoxInChar" Width="500px" Rows="3" ID='TO_NAME'></asp:TextBox>
            <asp:TextBox  runat="server" CssClass="TextBoxInChar hidden"   ID='TO_ID'></asp:TextBox>
            &nbsp;
            <a href="javascript:" style="line-height:50px;" onclick="SelectUser('TO_ID', 'TO_NAME')" title="添加收件人">添加</a>
            <a href="javascript:" onclick="ClearUser('TO_ID', 'TO_NAME')" title="清空收件人">清空</a>
            <br/>
            <div style="clear:both;padding:3px">
            <!--
            <a onclick="show_btn('tr_webmail',this);" href="#">
            <img alt="点击切换" style="vertical-align:middle"  src="../img/email/email_addwebemail.jpg" width="98" height="24"/></a>-
            --> 
             <a onclick="show_tr('tr_cc',this);" href="javascript:">添加抄送</a> 
            - <a onclick="show_tr('tr_bcc',this);" href="javascript:">添加密送</a>
            - <a onclick="show_tr('tr_attach',this);" href="javascript:">添加附件</a>
            </div>
            
            
        </td>
        </tr>

        <tr id="tr_cc" style="display:none">
        <td  style="height:25px;">&nbsp;抄送：</td>
        <td style="padding:3px">
            <asp:TextBox  runat="server" CssClass="TextBoxInChar" Width="500px"  ID='CC_Name'></asp:TextBox>
            <asp:TextBox  runat="server" CssClass="TextBoxInChar hidden"   ID='CC_ID'></asp:TextBox>
            &nbsp;
            <a href="javascript:" onclick="SelectUser('CC_ID', 'CC_Name')" title="添加收件人">添加</a>
            <a href="javascript:" onclick="ClearUser('CC_ID', 'CC_Name')" title="清空收件人">清空</a>
        </td>
        </tr>
        <tr id="tr_bcc" style="display:none">
        <td   style="height:25px;">&nbsp;密送：</td>
        <td style="padding:3px">
            <asp:TextBox  runat="server" CssClass="TextBoxInChar" Width="500px"  ID='BCC_Name'></asp:TextBox>
            <asp:TextBox  runat="server" CssClass="TextBoxInChar hidden"  ID='BCC_ID'></asp:TextBox>
            &nbsp;
            <a href="javascript:"  onclick="SelectUser('BCC_ID', 'BCC_Name')" title="添加收件人">添加</a>
            <a href="javascript:"  onclick="ClearUser('BCC_ID', 'BCC_Name')" title="清空收件人">清空</a>

        </td>
        </tr>
        <tr id="tr_webmail" style="display:none">
        <td   style="height:25px;">&nbsp;外部收件人：</td>
        <td style="padding:3px">
            <asp:TextBox  runat="server" CssClass="TextBoxInChar" Width="500px"  ID='Out_ID'></asp:TextBox>
            <asp:TextBox  runat="server" CssClass="TextBoxInChar hidden"   ID='Out_Name'></asp:TextBox>
            &nbsp;
            <a href="javascript:"  onclick="SelectUser('Out_ID', 'Out_Name')" title="添加收件人">添加</a>
            <a href="javascript:"  onclick="ClearUser('Out_ID', 'Out_Name')" title="清空收件人">清空</a>

        </td>
        </tr>
        <tr id="tr_attach" style="display:none">
        <td   style="height:25px;">&nbsp;附件列表：</td>
        <td style="padding:3px">
            <iframe src="../SysFolder/Common/FileListFrame.aspx?AppId=<%=mailId %>&AppName=T_E_Mail_Message" width="100%" frameborder="0" height="60"></iframe>
        </td>
        </tr>
        <tr>
        <td  style="height:25px;">&nbsp;邮件主题：</td>
        <td style="padding:3px">
            <asp:TextBox  runat="server" CssClass="TextBoxInChar" Width="500px" ID='Subject'></asp:TextBox>
            &nbsp;&nbsp;<asp:CheckBox ID="chkSms" runat="server" Text=" 短信通知" />
        </td>
        </tr>
        <tr>
        <td colspan="2">
            <asp:TextBox TextMode="MultiLine" runat="server" style="display:none" rows="3" Width="100%"  Height="340" ID='MailBody'></asp:TextBox>
        </td>
        </tr>
        </tbody>
        </table>

    </div>
    </form>
</body>
</html>
