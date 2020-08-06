package com.bean;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.util.CheckCode;
import com.util.Constant;
import com.util.DBO;
import com.util.MD5;

/**
 * 前台会员登陆 注册 修改资料 找回密码
 * @author Administrator
 *
 */

public class MemberBean {

	private List list;
	private ResultSet rs;
	private String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
	
	
	/****************************************************************
	 * 会员注册 验证个人  
	 * 
	 * @return
	 ********************************************************************/

//  检查是否重名
    public int checkRegName(String username){
    	String sql = "select * from member where username='"+username+"'";
    	DBO dbo = new DBO();
		dbo.open();
		try{
			
				rs = dbo.executeQuery(sql);
				if(rs.next()){
					return Constant.SAME_NAME;
				}
				else{
					return Constant.SUCCESS;
				}	
							
		}catch(Exception e){
			e.printStackTrace();
			return Constant.SYSTEM_ERROR;
		}finally{
			dbo.close();
		}
    }

	/****************************************************************
	 * 会员密码修改 登陆 登陆信息修改通用部分
	 * 
	 * @return
	 ********************************************************************/
//	会员修改密码
	public int editPassword(String username,String oldpwd,String newpwd){
		String sql="select * from member where username = '"+username+"' and password = '"+oldpwd+"'";
		String sql2="update member set password = '"+newpwd+"' where username = '"+username+"'";
		DBO dbo = new DBO();
		dbo.open();
		try{
			rs = dbo.executeQuery(sql);
			if(rs.next()){
				int i = dbo.executeUpdate(sql2);
				if(i == 1){
					return Constant.SUCCESS;
				}
				else{
					return Constant.SYSTEM_ERROR;
				}
			}
			else{
				return Constant.PASSWORD_ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			return Constant.SYSTEM_ERROR;
		}finally{
			dbo.close();
		}
	}
//	会员登陆
	public int memberLogin(String username,String password,String type){
		password=MD5.MD5(password);
		String sql = "select password from member where username='"+username+"' and type='"+type+"' and ifuse='1' ";
		//String sql2 = "update member set logintimes=logintimes+1,lasttime='"+date+"',lastip='"+lastip+"' where username='"+username+"' ";
		DBO dbo = new DBO();
		dbo.open();
		try{
			rs = dbo.executeQuery(sql);
			if(rs.next()){//如果有该用户名
				String str = rs.getString("password");
				if(str.trim().equals(password)){
					//dbo.executeUpdate(sql2);
					return Constant.SUCCESS;
				}
				else{
					return Constant.PASSWORD_ERROR;
				}
			}
			else{//如果没有
				return Constant.NAME_ERROR;
			}
		}catch(Exception e){
			return Constant.SYSTEM_ERROR;
		}finally{
			dbo.close();
		}		
	}
//	登陆信息
	public String getLastTimeIP(String username){
		String sql = "select lasttime,lastip from member where username='"+username+"'";
		DBO dbo = new DBO();
		dbo.open();
		try{
			rs = dbo.executeQuery(sql);
			rs.next();
			String str=rs.getString(1)+"/"+rs.getString(2);
			return str;
		}catch(Exception e){
			return null;
		}finally{
			dbo.close();
		}	
	}
	//更新登陆信息
	public int upmemberLogin(String username,String lastip ){
		String sql = "update member set logintimes=logintimes+1,lasttime='"+date+"',lastip='"+lastip+"' where username='"+username+"' ";
		DBO dbo = new DBO();
		dbo.open();
		try{
			int i = dbo.executeUpdate(sql);
			if(i == 1)
				return Constant.SUCCESS;
			else
				return Constant.SYSTEM_ERROR;
		}catch(Exception e){
			return Constant.SYSTEM_ERROR;
		}finally{
			dbo.close();
		}		
	}
	//登陆次数 本次登陆时间
	public String getLogintimes(String username){
		String sql = "select lasttime,logintimes from member where username='"+username+"'";
		DBO dbo = new DBO();
		dbo.open();
		try{
			rs = dbo.executeQuery(sql);
			rs.next();
			String str=rs.getString(1)+"/"+rs.getString(2);
			return str;
		}catch(Exception e){
			return null;
		}finally{
			dbo.close();
		}	
	}
	/****************************************************************
	 * 个人会员注册 修改资料 登陆 找回密码
	 * 
	 * @return
	 ********************************************************************/
	//个人会员注册
	public int personReg(String username,String password,String type,String realname,String sex,String bir,
			String sheng,String city,String telphone,String email,String question,String answer,String lastip,int off,String address){
		password=MD5.MD5(password);
		String sql = "insert into member(username,password,type,regtime,ifuse,logintimes,lasttime,lastip)" +
		" values('"+username+"','"+password+"','"+type+"','"+date+"','"+off+"','0','"+date+"','"+lastip+"') ";
		DBO dbo = new DBO();
		dbo.open();
		try{
			int i = dbo.executeUpdate(sql);
			if(i == 1){
				rs = dbo.executeQuery("select id from member where username='"+username+"'");
				rs.next();
				int mid = rs.getInt(1);
				String sql2 = "insert into pmember(mid,realname,sex,bir,sheng,city,telphone,email,question,answer,address)" +
								"values('"+mid+"','"+realname+"','"+sex+"','"+bir+"','"+sheng+"','"+city+"','"+telphone+"','"+email+"','"+question+"','"+answer+"','"+address+"') ";
				int j = dbo.executeUpdate(sql2);
				if(j == 1)
					return Constant.SUCCESS;
				else
					return Constant.SYSTEM_ERROR;
			}
			else{
				return Constant.SYSTEM_ERROR;
			}
		}catch(Exception e){
			return Constant.SYSTEM_ERROR;
		}finally{
			dbo.close();
		}		
	}
	
	//某个人会员资料
	public List getRegInfo(String username){
		String sql = "select * from pmember where mid=(select id from member where username='"+username+"') ";
		DBO dbo = new DBO();
		list = new ArrayList();
		dbo.open();
		try{
			rs = dbo.executeQuery(sql);
			rs.next();
			list.add(rs.getString("mid"));//0
			list.add(rs.getString("realname"));//1
			list.add(rs.getString("sex"));//2
			list.add(rs.getString("bir"));//3
			list.add(rs.getString("sheng"));//4
			list.add(rs.getString("city"));//5
			list.add(rs.getString("telphone"));//6
			list.add(rs.getString("email"));//7
			list.add(rs.getString("question"));//8
			list.add(rs.getString("answer"));//9
			list.add(rs.getString("address"));//9
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return list;
		}finally{
			dbo.close();
		}	
	}
	//个人会员修改资料
	public int uppersonReg(String username,String realname,String sex,String bir,String sheng,String city,String telphone,String email,String question,String answer,String address){		
		String sql = "select id from member where username='"+username+"'";
		DBO dbo = new DBO(); 
		dbo.open();
		try{
			rs = dbo.executeQuery(sql);
			if(rs.next()){
				int mid = rs.getInt(1);
				String sql2 = "update pmember set realname='"+realname+"',sex='"+sex+"',bir='"+bir+"',sheng='"+sheng+"',city='"+city+"',telphone='"+telphone+"'," +
						"email='"+email+"',question='"+question+"',answer='"+answer+"',address='"+address+"' where mid='"+mid+"' ";
				int i = dbo.executeUpdate(sql2);
				if(i == 1)
					return Constant.SUCCESS;
				else
					return Constant.SYSTEM_ERROR;
			}
			else{
				return Constant.SYSTEM_ERROR;
			}
		}catch(Exception e){
			return Constant.SYSTEM_ERROR;
		}finally{
			dbo.close();
		}		
	}
	
	 
	public int findPwd(String username){
		String sql="select id from member where username='"+username+"'";
		DBO dbo=new DBO();
		dbo.open();
		try{
			rs = dbo.executeQuery(sql);
			if(rs.next()){
				return rs.getInt(1);
			}
			else{
				return 0;
			}
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			dbo.close();
		}		
	}
	public String returnPwd(String username,String question,String answer,String type){
		int i=this.findPwd(username);
		if(i!=0){
			if(type.equals("person")){
				type="pmember";
			}
			else{
				type="cmember";
			}
			String sql ="select * from "+type+" where mid='"+i+"' and question='"+question+"' and answer='"+answer+"'";
			DBO dbo=new DBO();
			dbo.open();
			try{
				rs = dbo.executeQuery(sql);
				if(rs.next()){
					String yzm=new CheckCode().getCheckCode()+"123";
					String pwd=MD5.MD5(yzm);
					int k=dbo.executeUpdate("update member set password='"+pwd+"' where username='"+username+"'");
					if(k==1){
						return yzm;
					}
					else{System.out.print("aaaaaaaaaaaaaa");
						return "error";
					}
				}
				else{
					return "error";
				}
			}catch(Exception e){
				e.printStackTrace();
				return "error";
			}finally{
				dbo.close();
			}		
		}
		else{
			return "nameerror";
		}
	}
	 
}
