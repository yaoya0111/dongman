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
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
 
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head colspan="2">
			<SPAN class=TAG>��Ʒ��Ϣ</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="left" >
               <TABLE class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <%String str="";
                    String id=request.getParameter("id").trim();
                    List hotlist=tb.getOneTrave(Integer.parseInt(id));
                    if(!hotlist.isEmpty()){
                    int sl=Integer.parseInt(hotlist.get(9).toString());
                    int scsl=cb.getCount("select sum(sl) from lb where sid='"+hotlist.get(0).toString()+"' and zt!='δ�ύ'");
                    int sy=sl-scsl;
					if(sy<=0)str="��治�㣬���ܹ���";
         			%>
        <TR>
          <TD width=40% align=center>
		  <IMG height=150 src="<%=basePath+hotlist.get(2).toString()%>" width=180 onload=makesmallpic(this,180,150); border=0>
		   </TD>
		  <TD align=left><br>
		  ��Ʒ���ƣ�<%=hotlist.get(1).toString()%> <br>
		  ���ۼ۸�<%=hotlist.get(3).toString()%>  &nbsp;&nbsp;&nbsp;���֣�<%=hotlist.get(4).toString()%><br>
		  ��Ʒ���ͣ�<%=hotlist.get(5).toString()%>  <br> 
		  ��Ʒ���ʣ�<%=hotlist.get(6).toString()%> ������<%=sl %> ���۳���<%=scsl %> ��棺<%=sy %><br>
		  ����ʱ�䣺<%=hotlist.get(8).toString()%><br>
		  <%if(sy<=0){ %><%=str %><%}else{ %>
		  <a href="<%=basePath%>ComServlet?method=gwc&sid=<%=id%>">����</a> �����¼��<%} %>
		  </TD>
		</TR>
		<TR>
          <TD align=center colspan=2><%=hotlist.get(7).toString() %>
		  </TD>
		</TR>
		<%}%>
		
				</TBODY>
			</TABLE>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>


 

<%@ include file="iframe/foot.jsp"%>