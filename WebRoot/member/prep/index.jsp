<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
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
 		alert("请填写地区信息！");
 		document.form1.sj.focus();
 		return false;
 	}if(document.form1.dd.value=="")
 	{
 		alert("请填写送货地点！");
 		document.form1.dd.focus();
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
		List pagelist3=cb.getCom("select * from lb where member='"+member+"' and zt='未提交' and xz='购物'  order by id desc",5);
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="10%" align="center">编号</td>
      <td  align="center">商品名称</td>
      <td  align="center">订购数量</td>
      <td  align="center">单价</td>
      <td  align="center">总价</td> 
      <td  align="center">积分</td> 
      <td  align="center">订购用户</td> 
      <td  align="center">修改</td>
      <td  align="center">删除</td>
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
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>member/prep/up.jsp?id=<%=pagelist2.get(0).toString()%>">修改</a></td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>ComServlet?method=delgwc&id=<%=pagelist2.get(0).toString()%>">删除</a></td> 
    </tr>
	
<%
	} 
%>  
<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td align="center" style="border-bottom:1px dotted #ccc;" colspan=15>合计：<%=hj %></td> 
    </tr>
</table>
</TD>
</TR>
</TBODY>
</TABLE>
<form action="<%=basePath %>ComServlet?method=tjgwc" method="post" name="form1" >
<p align=center>付款方式：<input type=radio name=fkfs value="银行转账" checked> 银行转账 <input type=radio name=fkfs value="货到付款" > 货到付款
<TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY> 
		<TR>
          <TD  align=right width=45%>地区信息：</TD><TD align=left><select name="sj"> 
    <%List flist=cb.getCom("select * from gys order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></TD>
		</TR>
		<TR>
          <TD  align=right>送货地点：</TD><TD align=left><input type=text name=dd size=50 required></TD>
		</TR>
		<TR>
          <TD  align=right>联 系 人：</TD><TD align=left><input type=text name=lxr size=50 required></TD>
		</TR>
		<TR>
          <TD  align=right>联系方式：</TD><TD align=left><input type=text name=lxfs size=50 required></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><br><input type=submit value="提交预订"></TD>
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
