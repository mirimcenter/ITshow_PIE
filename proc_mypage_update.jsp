<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<%@include file="cookie.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	String pw = request.getParameter("pw");
	
	String update_query = "";

		update_query = "update member set pw=? where id='"+cookie_id+"'";
	
	try{ 
		
		//board내용 -> db저장
		pstmt = conn.prepareStatement(update_query); 
		pstmt.setString(1,pw);
		pstmt.executeUpdate(); 
		System.out.println("Update Member Successfully!"); 
		pstmt.close(); 
		conn.close(); 
		} 
	catch (Exception e){ 
		System.out.println(e.getMessage()); 
	} 
	finally{
		response.sendRedirect("mypage.jsp");
	}

%>