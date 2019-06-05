<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="cookie.jsp"%>
<%@include file="db_conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	String delete_query = "delete from member where id = '"+cookie_id+"'";
	try{
	
	pstmt = conn.prepareStatement(delete_query);
	pstmt.executeUpdate();
	}
	catch(SQLException e){
		System.out.println(e.getMessage());
	}
	catch(Exception e){
		System.out.println(e);
	}
	finally{
%>
	<jsp:forward page="Template.jsp">
	<jsp:param value="mypage_delete.jsp" name="CONTENTPAGE"/>
</jsp:forward>
<%
	}
%>