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
	
	String select_query = "select space from find_board where bnum=" + bnum;
	String delete_query = "delete from find_board where bnum=" + bnum;

	pstmt = conn.prepareStatement(delete_query);
	pstmt.executeUpdate();
	
	response.sendRedirect("table_find.jsp");

%>