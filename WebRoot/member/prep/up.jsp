<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="mb" scope="page" class="com.bean.MemberBean"></jsp:useBean>
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
<script type="text/javascript">
function f1()
{//rs  sj ts lxr lxfs
 	if(document.form1.rs.value=="")
 	{
 		alert("请填写订购数量！");
 		document.form1.rs.focus();
 		return false;
 	}
 	if(isNaN(document.form1.rs.value))
 	{
 		alert("订购数量只能为整数！");
 		document.form1.rs.focus();
 		return false;
 	}
 	 
 form1.submit();
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
	String member=(String)session.getAttribute("member");
	String type=(String)session.getAttribute("type");
	if(member==null||type==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		 String id=request.getParameter("id");
		 List list=cb.get1Com("select * from lb where id='"+id+"'",5);
%>
<BODY >
<br><br>
<form action="<%=basePath %>ComServlet?method=upgwc&id=<%=id%>" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
                    
         
		<TR>
          <TD width=45% align=right>数量：</TD><TD align=left><input type=text name=rs value=<%=list.get(2).toString() %>></TD>
		</TR>
		 
		<TR>
          <TD  align=center colspan=2><br><input type=button onclick="f1()" value="提交"></TD>
		</TR>
				</TBODY>
			</TABLE>
			</form>			
</BODY>
<%} %>
</HTML>
