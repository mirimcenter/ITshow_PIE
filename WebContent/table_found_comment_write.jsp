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
	int cnum = 0;
	String id = request.getParameter("id");
	String contents = request.getParameter("comment_contents");
	int space = Integer.parseInt(request.getParameter("space"));
	System.out.println(space);
	
	String select_board_count = "select count(*) from found_board where space=" + space;
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_board_count);
	
	String board_query = "insert into found_comment (cnum, bnum, id, contents, space) value (?, ?, ?, ?, ?)";
	
	try{ 
		
		pstmt = conn.prepareStatement(board_query); 
		pstmt.setInt(1,cnum); 
		pstmt.setInt(2,bnum); 
		pstmt.setString(3,id);
		pstmt.setString(4, contents);
		pstmt.setInt(5, space);
		
		pstmt.executeUpdate(); 
		System.out.println("Inserting Board Successfully!"); 
		pstmt.close(); 
		conn.close(); 
		} 
	catch (Exception e){ 
		System.out.println(e.getMessage()); 
	} 
	finally{
		response.sendRedirect("table_found_content.jsp?space=" + space+"&bnum="+bnum);
	}

%>