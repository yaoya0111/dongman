package com.action;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addFenLei")){  //���ӷ���
			 
			 String fl = request.getParameter("bj"); 
			 String str=cBean.getString("select id from fenlei where fl='"+fl+"'");
			 if(str==null){
				 int flag = cBean.comUp("insert into fenlei(fl)  values('"+fl+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/hzp/fenlei.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/hzp/fenlei.jsp").forward(request, response); 
					} 
			 }
			 else { 
					request.setAttribute("message", "�����ظ���");
					request.getRequestDispatcher("admin/hzp/fenlei.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delFenLei")){  //ɾ������
			//hm xm dh zz  zj sj sjzj lx bz 
			String id = request.getParameter("id");  
			 int flag = cBean.comUp("delete from fenlei where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/hzp/fenlei.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/hzp/fenlei.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("addxw")){  //���ӹ���
			 
			 String title = request.getParameter("title"); 
			 String content = request.getParameter("content1"); 
			 
				 int flag = cBean.comUp("insert into xw(title,content,sj)  values('"+title+"','"+content+"','"+date2+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response); 
					} 
			 
		}
		else if(method.equals("upxw")){  //�޸Ĺ���
			//hm xm dh zz  zj sj sjzj lx bz 
			String id = request.getParameter("id");  
			String title = request.getParameter("title"); 
			 String content = request.getParameter("content1"); 
			 int flag = cBean.comUp("update xw set title='"+title+"',content='"+content+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response); 
				} 
		}
		 
		else if(method.equals("delxw")){  //ɾ������
			//hm xm dh zz  zj sj sjzj lx bz 
			String id = request.getParameter("id");  
			 int flag = cBean.comUp("delete from xw where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response); 
				} 
		}
		 
		
		 
		 
		///////////////////////////////////////////////////////////���ﳵ ���붼����ע�� û�¶࿴��
		else if(method.equals("gwc")){  //���빺�ﳵ
			String member=(String)session.getAttribute("member");
			if(member==null){
				request.setAttribute("message", "���ȵ�¼��");
				request.getRequestDispatcher("login.jsp").forward(request, response); 
			}
			else{
				String sid = request.getParameter("sid");  
				String smc=cBean.getString("select title from sale where id='"+sid+"'");
				String dj=cBean.getString("select dz from sale where id='"+sid+"'");
				String lb=cBean.getString("select dh from sale where id='"+sid+"'");
				String str=cBean.getString("select id from lb where sid='"+sid+"' and member='"+member+"' and zt='δ�ύ' and xz='����'");
				if(str==null){
					int flag = cBean.comUp("insert into lb(sid,sl,member,smc,lb,tjsj,xz,dj,zj) " +
							"values('"+sid+"','1','"+member+"','"+smc+"','"+lb+"','"+date2+"','����','"+dj+"','"+dj+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("nhzp.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("nhzp.jsp").forward(request, response); 
					} 
				}
				else{
					String sl=cBean.getString("select sl from lb where id='"+str+"' ");
					float zj=(Integer.parseInt(sl)+1)*Float.parseFloat(dj);
					int flag = cBean.comUp("update lb set sl=sl+1,zj='"+zj+"' where sid='"+sid+"' and member='"+member+"' and zt='δ�ύ' and xz='����'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("nhzp.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("nhzp.jsp").forward(request, response); 
					} 
				} 
			} 
		}
		else if(method.equals("upgwc")){  //�޸Ĺ��ﳵ
			 
			String id = request.getParameter("id");  
			String rs = request.getParameter("rs");  
			
			String sid=cBean.getString("select sid from lb where id='"+id+"'");
			String sdj=cBean.getString("select dz from sale where id='"+sid+"'");
			String dj=cBean.getString("select dj from sale where id='"+sid+"'");
			String xssl=cBean.getString("select xssl from sale where id='"+sid+"'");
			float zj=Integer.parseInt(rs)*Float.parseFloat(sdj);
			if(Integer.parseInt(rs)>(Integer.parseInt(dj)-Integer.parseInt(xssl))){
				request.setAttribute("message", "��������������棡");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
			else{
				int flag = cBean.comUp("update lb set sl='"+rs+"',dj='"+sdj+"',zj='"+zj+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
				}
				else{ 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
				} 
			} 
		}
		 
		else if(method.equals("delgwc")){  //ɾ�����ﳵ
			 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("delete from lb where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("tjgwc")){
			String member=(String)session.getAttribute("member");
			String sj = request.getParameter("sj");  
			String dd = request.getParameter("dd");  
			String lxr = request.getParameter("lxr");  
			String lxfs = request.getParameter("lxfs");  
			
			long ddh=System.currentTimeMillis();
			//int flag = cBean.comUp("update lb set zt='"+ddh+"' where member='"+member+"' and zt='δ�ύ'");
			float heji=0;
			
			int flag = cBean.comUp("insert into sh(ddh,sj,dd,lxr,lxfs,member,tjsj,xz) values('"+ddh+"','"+sj+"','"+dd+"','"+lxr+"','"+lxfs+"','"+member+"','"+date2+"','����')");
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("update lb set zt='"+ddh+"' where member='"+member+"' and zt='δ�ύ' and xz='����'");
				heji=cBean.getFloat("select sum(zj) from lb where zt='"+ddh+"'");
				cBean.comUp("update sh set heji='"+heji+"' where ddh='"+ddh+"'");
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
			} 
		}
		
		
		
		else if(method.equals("delgw2")){  //ɾ��
			 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("delete from sh where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/prep/tj.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/prep/tj.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delgw3")){  //ɾ��
			 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("delete from sh where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/prep/prep.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/prep/prep.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("gwfh")){   
			 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("update sh set zt='�ѷ���' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/prep/prep.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/prep/prep.jsp").forward(request, response); 
				} 
		}
		
		
		
		else if(method.equals("delgbook")){  //ɾ�� 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("delete from guestbook where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/guestbook/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/guestbook/index.jsp").forward(request, response); 
				} 
		}
		
		else if(method.equals("delmember")){  //ɾ�� 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("delete from member where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/member/person.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/member/person.jsp").forward(request, response); 
				} 
		}
		
		
		else if(method.equals("qrsh")){  //ɾ�� 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("update sh set qrsh='��ȷ��' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/prep/tj.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/prep/tj.jsp").forward(request, response); 
				} 
		}
		
		
		else if(method.equals("addgys")){  //���ӵ�����Ϣ
			 
			 String mc = request.getParameter("mc"); 
			 String bz = request.getParameter("bz"); 
			 String str=cBean.getString("select bz from gys where mc='"+mc+"'");
			 if(str==null){
				 int flag = cBean.comUp("insert into gys(mc,bz )  values('"+mc+"','"+bz+"' )");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/gys/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/gys/index.jsp").forward(request, response); 
					} 
			 }
			 else{
				 request.setAttribute("message", "��Ϣ�ظ���");
					request.getRequestDispatcher("admin/gys/index.jsp").forward(request, response); 
			 }
			 
		}
		else if(method.equals("upgys")){  //�޸ĵ�����Ϣ
			 
			String id = request.getParameter("id");  
			String mc = request.getParameter("mc"); 
			 String bz = request.getParameter("bz"); 
			 String str=cBean.getString("select bz from gys where mc='"+mc+"' and id!='"+id+"'");
			 if(str==null){
				 int flag = cBean.comUp("update gys set mc='"+mc+"',bz='"+bz+"' where id='"+id+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/gys/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/gys/index.jsp").forward(request, response); 
					} 
			 }
			 else{
				 request.setAttribute("message", "��Ϣ�ظ���");
					request.getRequestDispatcher("admin/gys/index.jsp").forward(request, response); 
			 }
			 
		}
		 
		else if(method.equals("delgys")){  //ɾ��������Ϣ
			 
			String id = request.getParameter("id");  
			 int flag = cBean.comUp("delete from gys where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/gys/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/gys/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("pj")){  //ɾ��
			 
			String ddid = request.getParameter("ddid");  
			String pj = request.getParameter("pj");  
			 	int flag = cBean.comUp("update sh set pj='"+pj+"' where id='"+ddid+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/prep/tj.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/prep/tj.jsp").forward(request, response); 
				} 
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
