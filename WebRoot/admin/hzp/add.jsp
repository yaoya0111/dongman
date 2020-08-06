<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet> 
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<link rel="stylesheet" href="<%=basePath %>editor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=basePath %>editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath %>editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=basePath %>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath %>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath %>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<script type="text/javascript">
function sub()
{
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.pic.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dz.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.yb.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.dh.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.jd.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.sl.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("所有项目必须填写！");
		return false;
	}
	if(document.form1.pic.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		var fileext=form1.pic.value.substring(form1.pic.value.length-4,form1.pic.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			form1.pic.focus(); 
			return false; 
		} 
	}
	 
	 
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
		String method=request.getParameter("method");
		if(method==null){
			method="addlvyou";
		}
		String title = "";	
		String dz="";
		String yb="";
		String dh="";
		String jd="";
		String content="";String sl="";
		String id="";
		//String s="如无缩略图请保持为空";
		if(method.equals("uplvyou")){
			id=request.getParameter("id").trim();
			List newsList=tb.getOneTrave(Integer.parseInt(id));
			title=newsList.get(1).toString();
			dz=newsList.get(3).toString();
			yb=newsList.get(4).toString();			
			dh=newsList.get(5).toString();
			jd=newsList.get(6).toString();
			content=newsList.get(7).toString();
			sl=newsList.get(9).toString();htmlData=content;
		}		

%>
<BODY >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>News" method="post"  enctype="multipart/form-data"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>">
    <td width='30%'><div align="right">商品名称：</div></td>
    <td ><input name="title" type="text" id="title" size="40" maxlength="100" value="<%=title %>" required></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">商品类别：</div></td>
    <td ><select name="dh">
    <%if(method.equals("uplvyou")){ %><option value="<%=dh%>"><%=dh %></option><%} %>
    <%List flist=cb.getCom("select * from fenlei order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select> </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">缩略图：</div></td>
    <td ><input name="pic" type="file"   size="40" maxlength="150" required>&nbsp;<font color=red>300K以下gif或jpg格式图片</font></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='30%'><div align="right">销售价格：</div></td>
    <td ><input name="dz" type="number" id="dz" size="20" maxlength="100" value="<%=dz %>"  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}" required> 元</td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">用户积分：</div></td>
    <td ><input name="yb" type="number" id="yb" size="20" maxlength="100" value="<%=yb %>" required></td>
  </tr>
  
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">商品材质：</div></td>
    <td ><input name="jd" type="text" id="jd" size="40" maxlength="100" value="<%=jd %>" required></TD>
  </tr>
  <tr bgcolor='#FFFFFF' align=center> 
    <td width='30%'><div align="right">商品描述：</div></td>
    <td align="left"><textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></td>
    </tr>
   
   <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">商品数量：</div></td>
    <td ><input name="sl" type="number" id="sl" size="20" maxlength="100" value="<%=sl %>" required> </TD>
  </tr> 
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='submit' name='button' value='提交数据' >
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
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>