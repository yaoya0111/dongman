<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<LINK href="images/default.css" type=text/css rel=stylesheet>
<LINK href="images/css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
 
<SCRIPT language=JavaScript src="images/inc.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/default.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/swfobject.js"></SCRIPT>
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
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
 	if(document.form1.sj.value=="")
 	{
 		alert("请填写送货时间！");
 		document.form1.sj.focus();
 		return false;
 	}if(document.form1.ts.value=="")
 	{
 		alert("请填写送货地点！");
 		document.form1.ts.focus();
 		return false;
 	}if(document.form1.lxr.value=="")
 	{
 		alert("请填写联系人！");
 		document.form1.lxr.focus();
 		return false;
 	}if(document.form1.lxfs.value=="")
 	{
 		alert("请填写联系方式！");
 		document.form1.lxfs.focus();
 		return false;
 	}
 form1.submit();
}
</script>
<%String member=(String)session.getAttribute("member"); 
if(member==null){response.sendRedirect("login.jsp");}else{
String title=Common.toChineseAndTrim(request.getParameter("title"));
 %>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
 
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head >
			<SPAN class=TAG>我要订购</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="center" >
		<form action="<%=basePath %>NewsServlet?method=addPrep" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
                    
        <TR><input type=hidden name=sid value=<%=request.getParameter("id")%>><input type=hidden name=title value=<%=title%>>
          <TD width=45% align=right>商品名称：</TD><TD align=left><%=title %></TD> 
		</TR> 
		<TR>
          <TD width=45% align=right>订购数量：</TD><TD align=left><input type=number name=rs required></TD>
		</TR>
		<TR>
          <TD  align=right>送货时间：</TD><TD align=left><input type=text name=sj  required></TD>
		</TR>
		<TR>
          <TD  align=right>送货地点：</TD><TD align=left><input type=text name=ts  required></TD>
		</TR>
		<TR>
          <TD  align=right>联 系 人：</TD><TD align=left><input type=text name=lxr required></TD>
		</TR>
		<TR>
          <TD  align=right>联系方式：</TD><TD align=left><input type=text name=lxfs required ></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><br><input type=submit value="提交预订"></TD>
		</TR>
				</TBODY>
			</TABLE>
			</form>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>
 
<%} %>
 

<%@ include file="iframe/foot.jsp"%>