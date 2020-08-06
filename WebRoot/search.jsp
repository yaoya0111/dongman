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
<script type="text/javascript">
 
function f111()
{
 
 if(document.form1.title.value=="")
 {
 	alert("请输入查询内容，可以为关键字！");
 	document.form1.title.focus();
 	return false;
 }
 if(document.form1.jg1.value=="")
 {
 	alert("请输入起始价格！");
 	document.form1.jg1.focus();
 	return false;
 }
 if(document.form1.jg2.value=="")
 {
 	alert("请输入截至价格！");
 	document.form1.jg2.focus();
 	return false;
 }
 form1.submit();
}
</script>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
 
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head >
			<SPAN class=TAG>商品查询</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="center" >
		<form action="<%=basePath %>searchinfo.jsp" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
                    
        <TR>
          <TD width=350 align=right>商品类别：</TD><TD align=left><select name="dh">
    <%List flist=cb.getCom("select * from fenlei order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></TD>
		</TR>
		<TR>
          <TD  align=right>商品名称关键字：</TD><TD align=left><input type=text name=title size=30 required></TD>
		</TR>
		 <TR>
          <TD  align=right>价格：</TD><TD align=left><input type=number name=jg1 size=10  required> - <input type=number name=jg2 size=10  required></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><input type=submit value="查询信息"></TD>
		</TR>
				</TBODY>
			</TABLE>
			</form>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>
 

<%@ include file="iframe/foot.jsp"%>