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
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>ph.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>ph.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>ph.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>ph.jsp?page="+(page-1);
    form3.submit();
  }
}

function next(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>ph.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>ph.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>ph.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>ph.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>ph.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
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
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
 
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head colspan="2">
			<SPAN class=TAG>销售排行</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="left" >
               <TABLE class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <%
                    
                    cb.setEVERYPAGENUM(6);
		int cou = cb.getMessageCount("select count(*) from sale");//得到信息总数			        
		String page1=request.getParameter("page");
		if(page1==null){
			page1="1";
		}
		session.setAttribute("busMessageCount", cou + "");
		session.setAttribute("busPage", page1);
		List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from sale order by xssl desc",11); //带进一个页数，并返回该页所要显示的信息 
		session.setAttribute("qqq", pagelist1);
		int pageCount = cb.getPageCount(); //得到页数  
		session.setAttribute("busPageCount", pageCount + ""); 
		List hotlist=(ArrayList)session.getAttribute("qqq");
                    
                   // List hotlist=tb.getAllPTrave();
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
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=right>
                <form action="" method="post" name="form3">	
			 <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
			 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
			<a href="#" onClick="top2()"><img src="<%=basePath %>images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="pre2()"><img src="<%=basePath %>images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="next()"><img src="<%=basePath %>images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="last2()"><img src="<%=basePath %>images/last.gif" border="0" /></a>
			 第<input name="busjump" type="text" size="3" />页<a href="#" onClick="bjump2()"><img src="<%=basePath %>images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			 </form>
                </TD>
                </TR>
                </TBODY>
                </TABLE>
 

<%@ include file="iframe/foot.jsp"%>