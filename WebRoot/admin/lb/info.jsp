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
	String user=(String)session.getAttribute("user");
	if(user==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	String ddid=request.getParameter("ddid");
		List pagelist3=tb.gegComMethod("select * from lb where  zt='"+ddid+"' order by  id desc",5);
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
  <div id="ddd">
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="10%" align="center">编号</td>
      <td  align="center">商品名称</td>
      <td  align="center">订购数量</td>
      <td  align="center">单价</td>
      <td  align="center">总价</td> 
      <td  align="center">订购用户</td>  
    </tr>
    <%float hj=0;
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
					float dj=Float.parseFloat(cb.getString("select dz from sale where id='"+pagelist2.get(1).toString()+"'"));
					float zj=Integer.parseInt(pagelist2.get(2).toString())*dj;
					hj+=zj;
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='10%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=cb.getString("select title from sale where id='"+pagelist2.get(1).toString()+"'") %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=dj %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=zj %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>  
    </tr>
	
<%
	}} 
%>  
<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td align="center" style="border-bottom:1px dotted #ccc;" colspan=10>订单总金额：<%=hj %> 元 </td>  
    </tr>
</table>
</div>
</TD>
</TR>
</TBODY>
</TABLE>
 <p align=center><input type="button" onclick=" a()" value="打印"/>
</BODY>
<%} %>
</HTML>
