<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>��̨������</TITLE>
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
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
	  if(pageCount==0){	
	  form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%><%=dir %>/prep/fh.jsp?page="+page;
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

function del()
{
	pageform.submit();
}
</script>
<script type="text/javascript">
function f1()
{
	if(document.form1.sj.value=="")
 	{
 		alert("����д������Ϣ��");
 		document.form1.sj.focus();
 		return false;
 	}if(document.form1.dd.value=="")
 	{
 		alert("����д�ͻ��ص㣡");
 		document.form1.dd.focus();
 		return false;
 	}if(document.form1.lxr.value=="")
 	{
 		alert("����д��ϵ�ˣ�");
 		document.form1.lxr.focus();
 		return false;
 	}if(document.form1.lxfs.value=="")
 	{
 		alert("����д��ϵ��ʽ��");
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
	String user=(String)session.getAttribute("user");
	if(user==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		//List pagelist3=cb.getCom("select * from sh where zt='�ѷ���' and xz='����' order by id desc",9);
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="10%" align="center">���</td>
      <td  align="center">������</td>
      <td  align="center">������Ϣ</td>
      <td  align="center">�ͻ��ص�</td>
      <td  align="center">��ϵ��</td> 
      <td  align="center">��ϵ��ʽ</td> 
      <td  align="center">�û�</td>
      <td  align="center">�ύʱ��</td>
      <td  align="center">״̬</td>
      <td  align="center">ȷ���ջ�</td>
      <td  align="center">��ϸ</td>
       <td  align="center">�����ܼ�</td> 
      <td  align="center">����</td>  
      <td  align="center">ɾ��</td>
    </tr>
    <%  
			cb.setEVERYPAGENUM(10);
			int cou = cb.getMessageCount("select count(*) from sh where zt='�ѷ���' and xz='����' ");//�õ���Ϣ����			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from sh where zt='�ѷ���' and xz='����' order by id desc",13); //����һ��ҳ���������ظ�ҳ��Ҫ��ʾ����Ϣ 
			session.setAttribute("qqq", pagelist1);
			int pageCount = cb.getPageCount(); //�õ�ҳ��  
			session.setAttribute("busPageCount", pageCount + ""); 
			List pagelist3=(ArrayList)session.getAttribute("qqq");
			 
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
					 
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='10%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>  
       <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(6).toString() %></td>  
        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(7).toString() %></td>  
         <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>ComServlet?method=gwfh&id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(8).toString() %></a></td> 
        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(10).toString() %></td>   
         <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>admin/lb/info.jsp?ddid=<%=pagelist2.get(1).toString()%>">�鿴</a></td>
         <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(11).toString() %></td>   
         <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(12).toString() %></td>   
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>ComServlet?method=delgw3&id=<%=pagelist2.get(0).toString()%>">ɾ��</a></td> 
    </tr>
	
<%
	} 
%>  
 
</table>
</TD>
</TR>
<TR>
    	   <TD align="right" vAlign=top >
             <TABLE width="100%" border=0 align="right" cellPadding=3 cellSpacing=1>
		     <TBODY>
		     <TR align="right" class=head>
			 <TD >
			 <form action="" method="post" name="form3">	 
			 <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
			 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->         
							<a href="#" onClick="top2()"><img src="<%=basePath %>images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="pre2()"><img src="<%=basePath %>images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="next2()"><img src="<%=basePath %>images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="last2()"><img src="<%=basePath %>images/last.gif" border="0" /></a>
			 ��<input name="busjump" type="text" size="3" />ҳ<a href="#" onClick="bjump2()"><img src="<%=basePath %>images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			 </form>
             </TD>
             </TR>
			 </TBODY>
			 </TABLE>
		  </TD>
		</TR>
</TBODY>
</TABLE>
 		
</BODY>
<%} %>
</HTML>
