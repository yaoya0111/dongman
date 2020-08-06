package com.action;

/**
 *  传缩略图
 * 
 */
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.bean.SystemBean;
import com.bean.HzpBean;
import com.util.Constant;
import com.util.Filter;
import com.util.SmartFile; 
import com.util.SmartUpload;
import com.bean.ComBean;
public class NewsAction extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public NewsAction() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
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

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		String sysdir = new SystemBean().getDir();
		HttpSession session = request.getSession();
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		try{
			String username2 = (String)session.getAttribute("user");
			if(username2 == null){
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			else{
				 String method = null;
				 
				 ComBean cBean = new ComBean();
				 SmartUpload mySmartUpload = new SmartUpload();//init 
				 int count = 0;
				 try{
					 mySmartUpload.initialize(config,request,response);
		             mySmartUpload.upload(); 
		             method = mySmartUpload.getRequest().getParameter("method").trim();
		             if(method.equals("addlvyou")){//增加 
		            	String title = mySmartUpload.getRequest().getParameter("title");
						String dz = mySmartUpload.getRequest().getParameter("dz");
						String yb = mySmartUpload.getRequest().getParameter("yb");
						String dh = mySmartUpload.getRequest().getParameter("dh");
						String jd = mySmartUpload.getRequest().getParameter("jd");
						String content = mySmartUpload.getRequest().getParameter("content1");
						
						String sl = mySmartUpload.getRequest().getParameter("sl");
						String flag11 = mySmartUpload.getRequest().getParameter("flag");
						if(content.length()>8000){
						request.setAttribute("message", "对不起，内容不能超过8000个字符！");
						request.setAttribute("method", method);
						request.getRequestDispatcher(sysdir+"/hzp/add.jsp").forward(request, response);
						}
						else{
							SmartFile file = mySmartUpload.getFiles().getFile(0);
			            	String fileExt=file.getFileExt();	            
			            	String path="/upload_file/sale";
		                    count = mySmartUpload.save(path);
		                    String sql="insert into sale(title,url,dz,yb,dh,jd,content,addtime,dj) " +
		                    		"values('"+title+"','"+path+"/"+file.getFileName()+"','"+dz+"','"+yb+"','"+dh+"','"+jd+"','"+content+"','"+date+"','"+sl+"')";
		                   int flag = cBean.comUp(sql);
							if(flag == Constant.SUCCESS){
								request.setAttribute("message", "操作成功！");
								request.getRequestDispatcher(sysdir+"/hzp/index.jsp").forward(request, response);
							}
							else{
								request.setAttribute("message", "系统维护中，请稍后再试！");
								request.getRequestDispatcher(sysdir+"/hzp/index.jsp").forward(request, response);
							}
						}
		            }
		            //update
		            else if(method.equals("uplvyou")){
		            	String id = mySmartUpload.getRequest().getParameter("id");
		            	String title = mySmartUpload.getRequest().getParameter("title");
						String dz = mySmartUpload.getRequest().getParameter("dz");
						String yb = mySmartUpload.getRequest().getParameter("yb");
						String dh = mySmartUpload.getRequest().getParameter("dh");
						String jd = mySmartUpload.getRequest().getParameter("jd");
						String content = mySmartUpload.getRequest().getParameter("content1");
						String sl = mySmartUpload.getRequest().getParameter("sl");
						
						
						String flag11 = mySmartUpload.getRequest().getParameter("flag");
						if(content.length()>8000){
						request.setAttribute("message", "对不起，内容不能超过8000个字符！");
						request.setAttribute("method", method);
						request.getRequestDispatcher(sysdir+"/hzp/add.jsp").forward(request, response);
						}
						else{
							SmartFile file = mySmartUpload.getFiles().getFile(0);
			            	String fileExt=file.getFileExt();	            
			            	String path="/upload_file/sale";
		                    count = mySmartUpload.save(path);
		                    String sql="update sale set title='"+title+"',url='"+path+"/"+file.getFileName()+"',dz='"+dz+"'," +
		                    		"yb='"+yb+"',dh='"+dh+"',jd='"+jd+"',content='"+content+"',dj='"+sl+"' where id='"+id+"'";
		                    int flag = cBean.comUp(sql);
							if(flag == Constant.SUCCESS){
								request.setAttribute("message", "操作成功！");
								request.getRequestDispatcher(sysdir+"/hzp/index.jsp").forward(request, response);
							}
							else{
								request.setAttribute("message", "系统维护中，请稍后再试！");
								request.getRequestDispatcher(sysdir+"/hzp/index.jsp").forward(request, response);
							}
						}
		            }
		            
		            else{
		            	request.getRequestDispatcher("error.jsp").forward(request, response);
		            }
		        }catch(Exception ex){
		        	ex.printStackTrace();
		        	//request.getRequestDispatcher("error.jsp").forward(request, response);
		        }
			}
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
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
