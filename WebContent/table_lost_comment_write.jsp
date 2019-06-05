<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String id = request.getParameter("id");
	String contents = request.getParameter("comment_contents");
	int space = Integer.parseInt(request.getParameter("space"));
	System.out.println(space);
	
	String board_query = "insert into found_comment (bnum, id, contents, space) value (?, ?, ?, ?)";
	
	try{ 
		
		pstmt = conn.prepareStatement(board_query); 
		pstmt.setInt(1,bnum); 
		pstmt.setString(2,id);
		pstmt.setString(3, contents);
		pstmt.setInt(4, space);
		
		pstmt.executeUpdate(); 
		System.out.println("Inserting Board Successfully!"); 
		pstmt.close(); 
		conn.close(); 
		} 
	catch (Exception e){ 
		System.out.println(e.getMessage()); 
	} 
	finally{
		response.sendRedirect("table_lost_content.jsp?bnum="+bnum);
	}

%>