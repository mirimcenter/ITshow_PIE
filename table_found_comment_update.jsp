<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int space = Integer.parseInt(request.getParameter("space"));
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	String contents = request.getParameter("contents");
	
	String update_query = "update found_comment set contents = '"+contents+"' where cnum="+cnum;
	try{
	pstmt = conn.prepareStatement(update_query);
	pstmt.executeUpdate();
	}
	catch(SQLException e){
		System.out.println(e.getMessage());
	}
	catch(Exception e){
		System.out.println(e);
	}
	finally{
	response.sendRedirect("table_found_content.jsp?bnum="+bnum + "&space=" + space);
	}
%>