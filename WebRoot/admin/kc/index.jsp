<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="com.fredck.FCKeditor.*" %> 
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="FCK" %> 
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
<script type="text/javascript" src="<%=path %>FCKeditor/fckeditor.js"></script> 
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function sub()
{
	if(document.form1.dh.value.replace(/\s+$|^\s+/g,"").length<=0 )
	{
		alert("请填写查询关键字！");
		return false;
	} 
	form1.submit();
}
function sub2()
{
	if(document.form2.title.value.replace(/\s+$|^\s+/g,"").length<=0 )
	{
		alert("请填写查询关键字！");
		return false;
	} 
	form2.submit();
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
<BODY   >
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
    <form name="form1" action="<%=basePath %>admin/kc/cinfo.jsp" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth"> 
  <tr bgcolor='#FFFFFF'> 
    <td align=center>按商品类别： <select name="dh">
    <%List flist=cb.getCom("select * from fenlei order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select> <input class=mmcinb type='button' name='button' value='提交查询' onclick='sub()'>
      </td>
    </tr> 
</table></form>
   </TD>
	</TR>
	
	  <TR>
    <TD align="left" vAlign=top ><form name="form2" action="<%=basePath %>admin/kc/cinfo2.jsp" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
  <tr bgcolor='#FFFFFF'> 
    <td align=center>按商品名称： <input name="title" type="text" id="title" size="40" maxlength="100" required > <input class=mmcinb type='submit' name='button' value='提交查询'  >
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
