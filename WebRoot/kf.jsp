<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
 

<script type="text/javascript">
function lostpwd()
{
	if(document.form1.username.value=="")
	{
		alert("�������û�����");
		document.form1.username.focus();
		return false;
	}
	if(document.form1.question.value=="")
	{
		alert("������������ʾ���⣡");
		document.form1.question.focus();
		return false;
	}
	if(document.form1.answer.value=="")
	{
		alert("��������ʾ����𰸣�");
		document.form1.answer.focus();
		return false;
	}
		document.form1.method.value="lostpwd";
		form1.submit();
}
</script>
      <DIV align=center>
 
            <TABLE   height=170 cellSpacing=0  cellPadding=0 width="100%"  border=0 hspace="12">
            <TBODY>
              
               
              <TR >
                <TD align=right width="38%"  height=30> </TD>
                <TD width="62%"  height=30 align=left> 
				</TD>
				</TR>
              <TR class=black >
                <TD align=right width="38%"  height=30>�ͷ�QQ:</TD>
                <TD width="62%"  height=30 align=left>888888888</TD>
				</TR>
              <TR class=black >
                <TD align=right width="38%"  height=30>��ϵ�绰:</TD>
                <TD width="62%"  height=30 align=left>13900000000</TD>
				</TR>
			<TR class=black >
                <TD align=right width="38%"  height=30>��ϵ��ַ:</TD>
                <TD width="62%"  height=30 align=left>��������kf.jspҳ������޸� �����ˢ��ҳ�漴��</TD>
				</TR>
              
			
			</TBODY>
			</TABLE> 
			</DIV>
<%@ include file="iframe/foot.jsp"%>