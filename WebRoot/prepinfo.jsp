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
 		alert("����д����������");
 		document.form1.rs.focus();
 		return false;
 	}
 	if(isNaN(document.form1.rs.value))
 	{
 		alert("��������ֻ��Ϊ������");
 		document.form1.rs.focus();
 		return false;
 	}
 	if(document.form1.sj.value=="")
 	{
 		alert("����д�ͻ�ʱ�䣡");
 		document.form1.sj.focus();
 		return false;
 	}if(document.form1.ts.value=="")
 	{
 		alert("����д�ͻ��ص㣡");
 		document.form1.ts.focus();
 		return false;
 	}if(document.form1.lxr.value=="")
 	{
 		alert("����д��ϵ�ˣ�");
 		document.form1.lxr.focus();
 		return false;
 	}if(document.form1.lxfs.value=="")
 	{
 		alert("����д��ϵ��ʽ��");
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
			<SPAN class=TAG>��Ҫ����</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="center" >
		<form action="<%=basePath %>NewsServlet?method=addPrep" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
                    
        <TR><input type=hidden name=sid value=<%=request.getParameter("id")%>><input type=hidden name=title value=<%=title%>>
          <TD width=45% align=right>��Ʒ���ƣ�</TD><TD align=left><%=title %></TD> 
		</TR> 
		<TR>
          <TD width=45% align=right>����������</TD><TD align=left><input type=number name=rs required></TD>
		</TR>
		<TR>
          <TD  align=right>�ͻ�ʱ�䣺</TD><TD align=left><input type=text name=sj  required></TD>
		</TR>
		<TR>
          <TD  align=right>�ͻ��ص㣺</TD><TD align=left><input type=text name=ts  required></TD>
		</TR>
		<TR>
          <TD  align=right>�� ϵ �ˣ�</TD><TD align=left><input type=text name=lxr required></TD>
		</TR>
		<TR>
          <TD  align=right>��ϵ��ʽ��</TD><TD align=left><input type=text name=lxfs required ></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><br><input type=submit value="�ύԤ��"></TD>
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