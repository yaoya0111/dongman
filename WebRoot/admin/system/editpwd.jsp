<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>后台操作区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css>BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
</STYLE>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
<script type="text/javascript">
function check()
{
	if(document.form1.oldpwd.value=="")
	{
		alert("请输入旧密码！");
		document.form1.oldpwd.focus();
		return false;
	}
	if(document.form1.newpwd.value=="")
	{
		alert("请输入新密码！");
		document.form1.newpwd.focus();
		return false;
	} 
	if(document.form1.repwd.value=="")
	{
		alert("请确认密码！");
		document.form1.repwd.focus();
		return false;
	}
	if(document.form1.repwd.value!=document.form1.newpwd.value)
	{
		alert("对不起，两次输入的密码不相同，请确认密码！");
		document.form1.repwd.focus();
		return false;
	}
}
function checkPasswords() {
        var pass1 = document.getElementById("newpwd");
        var pass2 = document.getElementById("repwd");
 
        if (pass2.value != pass1.value)
            pass2.setCustomValidity("两次输入的密码不匹配");
        else
            pass2.setCustomValidity("");
}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
			message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{
		List list=(List)session.getAttribute("list");
%>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 
background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no 
marginheight="0" marginwidth="0"><br><br><br>
<TABLE align="center" height="100%" cellSpacing=0 cellPadding=0 width="40%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top height="50%">
	<form action="<%=basePath %>Admin" method="post" name="form1" onSubmit="return checkPWD()">
		 <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
			<TBODY>
			<TR class=head>
			<TD colSpan=2 height=23>修改后台登录密码 当前用户：<FONT color=red><%=list.get(0).toString() %></FONT>&nbsp;&nbsp;</TD></TR>
			<TR bgColor=#ffffff>
			<TD width="50%" align="right" id=map>旧 密 码：<input type="hidden" name="method" value="editpwd"/></TD>
			<TD width="50%" align="left" id=map><input type="password" name="oldpwd" size="20" maxlength=16  class=input required></TD></TR>
			<TR bgColor=#ffffff>
			<TD width="50%" align="right" id=map>新 密 码：</TD>
			<TD width="50%" align="left" id=map><input type="password" name="newpwd" id="newpwd" onchange="checkPasswords()" size="20" maxlength=16 class=input required></TD>
			</TR>
			<TR bgColor=#ffffff>
			<TD width="50%" align="right" id=map>确认密码：</TD>
			<TD width="50%" align="left" id=map><input type="password" name="repwd" id="repwd" onchange="checkPasswords()"size="20" maxlength=16 class=input required></TD>
			</TR>
			<TR bgColor=#ffffff>
			<TD colspan="2" align="center" id=map><input type="submit" value="确定">&nbsp;&nbsp;<input type="reset" value="重填"></TD>
			</TR>
			</TBODY>
		</TABLE>
	</form>
   </TD></TR>
</TBODY></TABLE>
</BODY>
<%} %>
</HTML>
