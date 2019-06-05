<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<%@include file="cookie.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	
	String update_query = "";

		update_query = "update member set id=?,pw=?,email=? where id='"+cookie_id+"'";
	
	try{ 
		
		//board내용 -> db저장
		pstmt = conn.prepareStatement(update_query); 
		pstmt.setString(1,id); 
		pstmt.setString(2,pw);
		pstmt.setString(3,email);
		pstmt.executeUpdate(); 
		System.out.println("Update Member Successfully!"); 
		pstmt.close(); 
		conn.close(); 
		String cook=request.getHeader("Cookie");
		if(cook!=null){
			Cookie[] cookies2 = request.getCookies();
			for(int i = 0; i < cookies2.length; i++){
					Cookie cookie = new Cookie("id", id);
					response.addCookie(cookie);
			}
		}
		} 
	catch (Exception e){ 
		System.out.println(e.getMessage()); 
	} 
	finally{
		response.sendRedirect("mypage.jsp");
	}

%>