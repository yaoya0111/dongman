<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<jsp:useBean id="hb" scope="page" class="com.bean.HzpBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>��̨������</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>

<script language="javascript" src="<%=basePath %>images/jquery1.9.0.min.js"></script>
<script language="javascript" src="<%=basePath %>images/jquery.jqprint-0.3.js"></script>

<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
 
<script language="javascript">
function  a(){
    $("#ddd").jqprint();
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
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<div id="ddd">
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
     <td width="5%" align="center">ID </td>
      <td  align="center">��Ʒ����</td>
      <td  align="center">���ۼ۸�</td> 
      <td  align="center">��Ʒ���</td>
      <td  align="center">��Ʒ����</td>
      <td  align="center">����ʱ��</td> 
      <td  align="center">�������</td>
      <td  align="center">�۳�����</td>
      <td  align="center">�������</td> 
    </tr>
    <%String title=Common.toChineseAndTrim(request.getParameter("title"));
    String dh=Common.toChineseAndTrim(request.getParameter("dh"));
    		 
			List pagelist3 = cb.getCom("select * from sale where dh='"+dh+"' and title like '%"+title+"%' order by id desc",10);
			 
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
					String str="";
					int sl=Integer.parseInt(pagelist2.get(9).toString());
					int scsl=cb.getCount("select sum(sl) from lb where sid='"+pagelist2.get(0).toString()+"' and zt!='δ�ύ'");
					int sy=sl-scsl;
					if(sy<=0)str="��治��";
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %> </td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(6).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(8).toString() %></td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=sl %></td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=scsl %></td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=sy %> <font color=red><%=str %></font></td>  
    </tr> 
<%
	}}
%>  
	 </TABLE>
</div>
	</td>
	</tr>
	<tr bgcolor='#FFFFFF'>
	<td colspan='10' align='right'>
	<TABLE width="100%" border=0 align="right" cellPadding=0 cellSpacing=0>
     <TBODY>
     <TR align="center" >
	 <TD ><input type="button" onclick=" a()" value="�����ӡ����"/></TD>
     </TR>
</table>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
