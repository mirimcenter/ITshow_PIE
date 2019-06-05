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
	
	cookies = request.getCookies() ;
    
    if(cookies != null){
        for(int i=0; i < cookies.length; i++){
             
            // 쿠키의 유효시간을 0으로 설정하여 만료시킨다
            cookies[i].setMaxAge(0) ;
             
            // 응답 헤더에 추가한다
            response.addCookie(cookies[i]) ;
        }
    }

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