<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<script type="text/javascript">
function aaa()
{
	regbb.submit();
}
function checkPasswords() {
        var pass1 = document.getElementById("password");
        var pass2 = document.getElementById("reg_pwd2");
 
        if (pass2.value != pass1.value)
            pass2.setCustomValidity("两次输入的密码不匹配");
        else
            pass2.setCustomValidity("");
}
</script>
<TABLE class=MainTable cellSpacing=0 cellPadding=0 width="100%" align=center 
border=0>
<TR>
<TD>
<TABLE class=dragTable id=viewarticle cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD class=head>
            <H3 class=L></H3><FONT 
                        color=#000000>您现在的位置：会员申请&gt;&gt; 填写资料</FONT>
	</TD>
	</TR>
  </TBODY>
</TABLE>


      <DIV align=center>
      <TABLE class=dragTable  cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD width=100% align=left  bgColor=#c8c8c8 height=28>　
		  <SPAN class=black><strong><FONT color=blue>请仔细填写以下资料：</FONT></strong></SPAN></TD></TR>
        <TR>
          <TD><FORM name="regbb" action="<%=basePath%>Member" method="post">
            <TABLE   height=170 cellSpacing=0  cellPadding=0 width="100%"  border=0 hspace="12">
            <TBODY>
              
              <INPUT type=hidden  name="method" value="reg2"> 
              <TR >
                <TD align=right width="38%"  height=30>用 户 名:</TD>
                <TD width="62%"  height=30 align=left> 
				<INPUT class=inputb id=username size=22 name=username  required>  
				</TD>
				</TR>
              <TR class=black >
                <TD align=right width="38%"  height=30>登陆密码:</TD>
                <TD width="62%"  height=30 align=left>
				<INPUT class=inputb id=password type=password size=22 name=password id="password" onchange="checkPasswords()" required>  
				</TD>
				</TR>
              <TR class=black >
                <TD align=right width="38%"  height=30>密码确认:<input type=hidden name=reg_type value=person></TD>
                <TD width="62%"  height=30 align=left>
				<INPUT class=inputb id=reg_pwd2 type=password size=22 name=reg_pwd2 id="reg_pwd2" onchange="checkPasswords()" required> 
				</TD>
				</TR>
             <TR class=black >
                <TD align=center  colSpan=2 height=40>
				<input type=submit value="提交信息"> 　 
                
                </TD>
				</TR>
			
			</TBODY>
			</TABLE></FORM>
	 
			</TD>
			</TR>
			</TBODY>
			</TABLE>　
			</DIV>
<%@ include file="iframe/foot.jsp"%>