<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
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
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
 
 
<!--*******************************最新开始*******************************-->
<TABLE class=MainTable style="MARGIN-TOP: 0px" cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD class=Main vAlign=top height=100>
      <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
	  <TBODY>
        <TR>
          <TD class=head>
            <SPAN class=TAG>商品信息</SPAN> 
            
		  </TD>
		</TR>
        <TR>
          <TD class=middle>
            <TABLE align=center cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
              <%
              	List resList=cb.getCom("select id,title,url from sale order by id desc limit 4",3);
              	if(!resList.isEmpty()){
              		for(int res=0;res<resList.size();res++)
              		{
              			List resList2=(List)resList.get(res);
              %>
              <TD width="14%">
                  <DIV >
                  <P class=img>
				  <a href="<%=basePath %>hinfo.jsp?id=<%=resList2.get(0).toString()%>"><IMG height=200 src="<%=basePath+resList2.get(2).toString()%>" width=200 onload=makesmallpic(this,200,200); border=0></A>
				  </P>
                  <P class=title style="TEXT-ALIGN: center">
				  <a href="<%=basePath %>hinfo.jsp?id=<%=resList2.get(0).toString()%>"><%=resList2.get(1).toString()%></a>
				  </P>
				  </DIV>
				</TD>
              <%
              		}
              	}
               %>
              
			</TR>
		</TBODY>
	</TABLE>
	</TD>
	</TR>
	
	
	
	
	<TR>
          <TD class=middle>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
              <%
              	List res2List=cb.getCom("select id,title,url from sale order by id desc limit 8",3);
              	if(!res2List.isEmpty()){
              		for(int res=4;res<res2List.size();res++)
              		{
              			List resList2=(List)res2List.get(res);
              %>
              <TD width="14%">
                  <DIV >
                  <P class=img>
				  <a href="<%=basePath %>hinfo.jsp?id=<%=resList2.get(0).toString()%>"><IMG height=200 src="<%=basePath+resList2.get(2).toString()%>" width=200 onload=makesmallpic(this,200,200); border=0></A>
				  </P>
                  <P class=title style="TEXT-ALIGN: center">
				  <a href="<%=basePath %>hinfo.jsp?id=<%=resList2.get(0).toString()%>"><%=resList2.get(1).toString()%></a>
				  </P>
				  </DIV>
				</TD>
              <%
              		}
              	}
               %>
              
			</TR>
		</TBODY>
	</TABLE>
	</TD>
	</TR>
	
	
	
	
	<TR>
          <TD class=middle>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
              <%
              	List res2dList=cb.getCom("select id,title,url from sale order by id desc limit  12",3);
              	if(!res2dList.isEmpty()){
              		for(int res=8;res<res2dList.size();res++)
              		{
              			List resList2=(List)res2dList.get(res);
              %>
              <TD width="14%">
                  <DIV >
                  <P class=img>
				  <a href="<%=basePath %>hinfo.jsp?id=<%=resList2.get(0).toString()%>"><IMG height=200 src="<%=basePath+resList2.get(2).toString()%>" width=200 onload=makesmallpic(this,200,200); border=0></A>
				  </P>
                  <P class=title style="TEXT-ALIGN: center">
				  <a href="<%=basePath %>hinfo.jsp?id=<%=resList2.get(0).toString()%>"><%=resList2.get(1).toString()%></a>
				  </P>
				  </DIV>
				</TD>
              <%
              		}
              	}
               %>
              
			</TR>
		</TBODY>
	</TABLE>
	</TD>
	</TR>
   </TBODY>
   </TABLE>
   </TD>
  </TR>
  </TBODY>
</TABLE>


 

<%@ include file="iframe/foot.jsp"%>