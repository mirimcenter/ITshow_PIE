<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int space= 1;
	
	String select_query = "select space from found_board where bnum=" + bnum;
	String delete_query = "delete from found_board where bnum=" + bnum;

	stmt = conn.createStatement(); 
	
	rs= stmt.executeQuery(select_query);
	if(rs.next()) space = rs.getInt("space");	
	
	pstmt = conn.prepareStatement(delete_query);
	pstmt.executeUpdate();
	
	response.sendRedirect("table_found.jsp?space="+space);

%>