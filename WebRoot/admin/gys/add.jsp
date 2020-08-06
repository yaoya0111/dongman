<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
 
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet> 
 
</HEAD>
 
<script type="text/javascript">
function sub()
{
	if(document.form1.mc.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.bz.value.replace(/\s+$|^\s+/g,"").length<=0 )
	{
		alert("所有项目必须填写！");
		return false;
	}
	 
	 
	 
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
		String method=request.getParameter("method");
		 
		String mc = "";	 
		String bz="";
		 String id="";
		if(method.equals("upgys")){
			id=request.getParameter("id").trim();
			List newsList=cb.get1Com("select * from gys where id='"+id+"'",3);
			mc=newsList.get(1).toString(); 
			bz=newsList.get(2).toString(); 
		}		

%>
<BODY >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>ComServlet" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>">
    <td width='40%'><div align="right">地区名称：</div></td>
    <td align=left><input name="mc" type="text" id="mc" size="50" maxlength="100" value="<%=mc %>" required></td>
  </tr> 
  <tr bgcolor='#FFFFFF' align=center> 
  	<td width='40%'><div align="right">备注说明：</div></td>	
    <td  align=left><textarea name="bz" cols="50" rows="6" required><%=bz%></textarea></td>
    </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='submit' name='button' value='提交数据' >
      </td>
    </tr>
	
</table></form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
 