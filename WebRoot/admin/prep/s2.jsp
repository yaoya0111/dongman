<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
 <jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML><HEAD>
<LINK href="<%=basePath %>member/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>member/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %>images/css/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>member/images/calendar.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<SCRIPT language=JavaScript src="<%=basePath %>member/images/city.js"></SCRIPT>
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
<script type="text/javascript">
function cc()
{
	if(document.form1.ksj.value==""||document.form1.esj.value=="")
	{
		alert("输入统计时间段");
		//document.form2.ddid.focus();
		return false;
	} 
}
function abc()
{
	if(document.form3.mc.value=="" )
	{
		alert("请填写商品全名！");
		//document.form2.ddid.focus();
		return false;
	} 
}
</script>
 
<%
	String user=(String)session.getAttribute("user");
	//String type=(String)session.getAttribute("type");
	if(user==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		 
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
	<form action="<%=basePath %>admin/prep/s2info.jsp" method="post" name="form1" onsubmit="return cc()">  
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY>
		  <TR align="center" class=head>
			<TD  align="center" >订单数量统计 </TD>
		  </TR> 
		
		  <TR align="center" bgColor=#ffffff>
			<TD  align="center" >起始日期：<input type=date size=20 name=ksj required>
			 -  <input type=date size=20 name=esj  required> <input type="submit" value="提交"></TD>
		  </TR>
		
		  
		 
		</TBODY>
	   </TABLE>
	  </form>
	   
    </TD>
  </TR>
  </TBODY>
</TABLE> 
</BODY>
<%} %>
</HTML>
