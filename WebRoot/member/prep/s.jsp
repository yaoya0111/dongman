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
		alert("����ͳ��ʱ���");
		//document.form2.ddid.focus();
		return false;
	} 
}
function abc()
{
	if(document.form3.mc.value=="" )
	{
		alert("����д��Ʒȫ����");
		//document.form2.ddid.focus();
		return false;
	} 
}
</script>
 
<%
	String member=(String)session.getAttribute("member");
	//String type=(String)session.getAttribute("type");
	if(member==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		 
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
	 
	  <form action="<%=basePath %>member/prep/sinfo.jsp" method="post" name="form2"  >  
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY> 
		  <TR align="center" class=head>
			<TD  align="center" >������ѯ </TD>
		  </TR> 
		  <TR align="center" bgColor=#ffffff>
			<TD  align="center" >������ţ�<input type=text size=20 name=ddh  required> 
		   <input type="submit" value="�ύ"></TD>
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
