﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocView_Frame.aspx.cs" Inherits="EIS.Web.Doc.DocView_Frame" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<frameset cols="300,*" frameborder="no">
	<frame name="left" id="left" src="DocView_Tree.aspx?<%=Request.QueryString%>">
	<frame name="main" id="main" src="../Welcome.htm">
	<noframes>
	</noframes>
</frameset>
</html>
