<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<jsp:useBean id="guestbean" class="com.bean.GuestBookBean" scope="page" /> 

<script  language="javascript" >
function top(){
   	form3.action="<%=basePath%>guestbook.jsp?page=1";
    form3.submit();
}
function last(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%>guestbook.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>guestbook.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>guestbook.jsp?page="+(page-1);
    form3.submit();
  }
}

function next(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>guestbook.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
	  if(pageCount==0){	
	  form3.action="<%=basePath%>guestbook.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>guestbook.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>guestbook.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>guestbook.jsp?page="+page;
      form3.submit();
   }

}

}
//****�ж��Ƿ���Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
</script>
<SCRIPT language=JavaScript src="<%=basePath %>images/css/Common.js"></SCRIPT>
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
<DIV align=center>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD >
<TABLE class=dragTable height=28 cellSpacing=0 cellPadding=0 width=100% align=center background=<%=basePath %>images/head1.gif border=0>
  <TBODY>
  
  </TBODY>
</TABLE></TD></TR>
        <TR>
          <TD class=middle><br>
	<!--ѭ����ʼ==============================================================-->
	<%
	 
		guestbean.setEVERYPAGENUM(6);
		int cou = guestbean.getMessageCount();//�õ���Ϣ����			        
		String page1=request.getParameter("page");
		if(page1==null){
			page1="1";
		}
		session.setAttribute("busMessageCount", cou + "");
		session.setAttribute("busPage", page1);
		List pagelist1 = guestbean.getMessage(Integer.parseInt(page1)); //����һ��ҳ���������ظ�ҳ��Ҫ��ʾ����Ϣ 
		session.setAttribute("qqq", pagelist1);
		int pageCount = guestbean.getPageCount(); //�õ�ҳ��  
		session.setAttribute("busPageCount", pageCount + ""); 
		List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
			for(int i=0;i<pagelist3.size();i++){
				List pagelist2 =(ArrayList)pagelist3.get(i);
				List replay=guestbean.getReplayInfo(Integer.parseInt(pagelist2.get(0).toString()));
	%>
	<TABLE class=guestbook cellSpacing=0 cellPadding=0 width="100%" 
            border=0>
              <TBODY>
              <TR>
                <TD class=Ftd align=middle width="18%" rowSpan=2> 
                  <DIV class=name><%=pagelist2.get(1).toString() %></DIV></TD>
                <TD class=Ctd vAlign=top width="82%" height=75>
                  <TABLE style="TABLE-LAYOUT: fixed; WORD-WRAP: break-word" cellSpacing=0 cellPadding=0 width="80%" border=0>
                    <TBODY>
                    <TR>
                      <TD class=content align=left> 
                        <%=pagelist2.get(8).toString() %>
                        <%
                        if(!replay.isEmpty()){	
                        %>
                        <FIELDSET>
						<LEGEND>����ظ� </LEGEND><%=replay.get(0).toString() %> 
                        (����: <%=replay.get(1).toString() %>/����:<%=replay.get(2).toString() %>)
						</FIELDSET>
						<%}%>
					  </TD>
					 </TR>
					</TBODY>
				</TABLE>
				</TD>
				</TR>
              <TR>
                <TD class=Atd width="82%">
                ʱ�䣺 <%=pagelist2.get(9).toString()%> 
				</TD>
			  </TR>
			  </TBODY>
			  </TABLE>
	<%}}%>
	<!--ѭ������==================================================================-->        
          <br>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=right>
                <form action="" method="post" name="form3">	
			 <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
			 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->         
			<a href="#" onClick="top()"><img src="<%=basePath %>images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="pre()"><img src="<%=basePath %>images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="next()"><img src="<%=basePath %>images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="last()"><img src="<%=basePath %>images/last.gif" border="0" /></a>
			 ��<input name="busjump" type="text" size="3" />ҳ<a href="#" onClick="bjump()"><img src="<%=basePath %>images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			 </form>
                </TD>
                </TR>
                </TBODY>
                </TABLE></TD></TR>
        <TR>
          <TD class=foot>
            <H3 class=L></H3>
            <H3 class=R></H3></TD></TR></TBODY></TABLE>
<TABLE class=dragTable height=28 cellSpacing=0 cellPadding=0 width=100% align=center border=0>
        <TBODY>
        <TR>
          <TD align=left class=head>&nbsp;��������</TD></TR>
        <TR>
          <TD class=middle>
 
<FORM name="form1" action="<%=basePath%>GuestBook?method=add" method="post" onSubmit="return checkGUEST()" >
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              
              <TBODY>
              <TR>
                <TD width="24%" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;��: </TD>
                <TD align=left><INPUT name=nikename maxlength=20 size=60>  
              </TD></TR>
               
               
              <TR>
                <TD width="24%" align="right">������������:</TD>
                <TD align=left><TEXTAREA name=content rows=7 cols=80></TEXTAREA> 
                </TD></TR>
              <TR>
                <TD width="24%">&nbsp;</TD>
                <TD align=left><INPUT type=submit value="�� ��" name=Submit> 
            </TD></TR></TBODY></TABLE></FORM></TD></TR>
        <TR>
          <TD >
            <H3></H3>
            <H3></H3></TD></TR></TBODY></TABLE>
</DIV>
<%@ include file="iframe/foot.jsp"%>