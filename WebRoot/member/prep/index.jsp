<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>��̨������</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function f1()
{
	if(document.form1.sj.value=="")
 	{
 		alert("����д������Ϣ��");
 		document.form1.sj.focus();
 		return false;
 	}if(document.form1.dd.value=="")
 	{
 		alert("����д�ͻ��ص㣡");
 		document.form1.dd.focus();
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
	if(member==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		List pagelist3=cb.getCom("select * from lb where member='"+member+"' and zt='δ�ύ' and xz='����'  order by id desc",5);
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="10%" align="center">���</td>
      <td  align="center">��Ʒ����</td>
      <td  align="center">��������</td>
      <td  align="center">����</td>
      <td  align="center">�ܼ�</td> 
      <td  align="center">����</td> 
      <td  align="center">�����û�</td> 
      <td  align="center">�޸�</td>
      <td  align="center">ɾ��</td>
    </tr>
    <% float hj=0;
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
					float dj=Float.parseFloat(cb.getString("select dz from sale where id='"+pagelist2.get(1).toString()+"'"));
					float zj=Integer.parseInt(pagelist2.get(2).toString())*dj;
					hj+=zj;
					int jf=cb.getCount("select yb from sale where id='"+pagelist2.get(1).toString()+"'") ;
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='10%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select title from sale where id='"+pagelist2.get(1).toString()+"'") %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=dj %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=zj %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=jf*Integer.parseInt(pagelist2.get(2).toString()) %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>member/prep/up.jsp?id=<%=pagelist2.get(0).toString()%>">�޸�</a></td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>ComServlet?method=delgwc&id=<%=pagelist2.get(0).toString()%>">ɾ��</a></td> 
    </tr>
	
<%
	} 
%>  
<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td align="center" style="border-bottom:1px dotted #ccc;" colspan=15>�ϼƣ�<%=hj %></td> 
    </tr>
</table>
</TD>
</TR>
</TBODY>
</TABLE>
<form action="<%=basePath %>ComServlet?method=tjgwc" method="post" name="form1" >
<p align=center>���ʽ��<input type=radio name=fkfs value="����ת��" checked> ����ת�� <input type=radio name=fkfs value="��������" > ��������
<TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY> 
		<TR>
          <TD  align=right width=45%>������Ϣ��</TD><TD align=left><select name="sj"> 
    <%List flist=cb.getCom("select * from gys order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></TD>
		</TR>
		<TR>
          <TD  align=right>�ͻ��ص㣺</TD><TD align=left><input type=text name=dd size=50 required></TD>
		</TR>
		<TR>
          <TD  align=right>�� ϵ �ˣ�</TD><TD align=left><input type=text name=lxr size=50 required></TD>
		</TR>
		<TR>
          <TD  align=right>��ϵ��ʽ��</TD><TD align=left><input type=text name=lxfs size=50 required></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><br><input type=submit value="�ύԤ��"></TD>
		</TR>
				</TBODY>
			</TABLE>
 
</form>	
<%
	} 
%> 		
</BODY>
<%} %>
</HTML>
