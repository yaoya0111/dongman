<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<jsp:directive.page import="com.util.Common"/>
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
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
 
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head colspan="2">
			<SPAN class=TAG>分类商品</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="left" >
               <TABLE class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <%
                    String type=request.getParameter("id");
                    type=Common.toChineseAndTrim(type);
                    List hotlist=cb.getCom("select * from sale where dh='"+type+"' order by id desc ",11);
                    if(!hotlist.isEmpty()){
					for(int alln1=0;alln1<hotlist.size();alln1++){
						List allnew=(List)hotlist.get(alln1);
			%>
         <TR>
          <TD width=20% align=left>
		  <a href="<%=basePath %>hinfo.jsp?id=<%=allnew.get(0).toString()%>"><IMG height=80 src="<%=basePath+allnew.get(2).toString()%>" width=120 onload=makesmallpic(this,120,80); border=0></A>
		   </TD>
		  <TD align=left>
		  商品名称：<%=allnew.get(1).toString()%> <br>
		  销售价格：<%=allnew.get(3).toString()%>  &nbsp;&nbsp;&nbsp;积分：<%=allnew.get(4).toString()%><br>
		  商品类型：<%=allnew.get(5).toString()%>  <br> 
		  商品材质：<%=allnew.get(6).toString()%> <br>
		  发布时间：<%=allnew.get(8).toString()%>  &nbsp;&nbsp;&nbsp;售出：<%=allnew.get(10).toString()%> 
		  &nbsp;&nbsp;<a href="<%=basePath %>hinfo.jsp?id=<%=allnew.get(0).toString()%>">点击查看详细...</a>
		  </TD>
		</TR>
		<%}} %>
				</TBODY>
			</TABLE>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>

 

<%@ include file="iframe/foot.jsp"%>