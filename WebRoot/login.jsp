<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp"%>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />
<SCRIPT language=javascript>
//������ĺϷ���
function checklogin() {
	if (document.form1.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\�����������û�����");
		document.form1.username.focus();
	}
	else if (document.form1.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\�������������룡");
		document.form1.password.focus();
	}
	 
	else{
	     form1.submit();
	}
}
</SCRIPT>
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
<FORM id=form1 name=form1 action=<%=basePath %>Login?method=PAGEUSERLOGIN method=post > 
                                  <TABLE align=center width="900" border=0>
                                  <TBODY>
                                  <TR>
                                  <TD height=25 align=center colspan=2><br><FONT color=#ff7700><STRONG>��ӭ��½<%=sysList.get(0).toString() %></STRONG></FONT><br><br></TD>
								  </TR>
                                  <TR>
                                  <TD width="40%" height=24 align=right>�û�����</TD>
                                  <TD align=left><INPUT class=input_new id=username style="WIDTH: 210px" name=username required></TD>
								  </TR>
                                  <TR>
                                  <TD height=25 align=right>�ܡ��룺<input type=hidden name=reg_type value=person></TD>
                                  <TD align=left height=25><INPUT class=input_new id=password style="WIDTH: 210px" type=password  name=password required></TD>
								  </TR>
								  <TR>
                                  <TD height=25 align=center colspan=2><br><input type=submit value="��½"  > <A href="lost.jsp">�һ�����</A> <A href="<%=basePath %>reg2.jsp">ע���Ա</A></TD>
								  </TR>
								  </TBODY>
								  </TABLE>
								   
								</FORM>
<%@ include file="iframe/foot.jsp"%>
