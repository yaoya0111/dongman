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
	if(document.form3.ps.value=="" )
	{
		alert("请填写内容！");
		//document.form2.ddid.focus();
		return false;
	} 
}
</script>
 
<%
	String user=(String)session.getAttribute("member");
	//String type=(String)session.getAttribute("type");
	if(user==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String method = request.getParameter("method");  String ddid = request.getParameter("ddid");  
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
	 
	  <form action="<%=basePath %>ComServlet?method=pj&ddid=<%=ddid%>" method="post" name="form3" onsubmit="return abc()" >  
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY> 
		  <TR align="center" bgColor=#ffffff><td> 
		  购物评价：<select name=pj>
    <option value="好评">好评</option> 
    <option value="中评">中评</option> 
    <option value="差评">差评</option> 
    </select> <input type="submit" value="提交"></TD>
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
