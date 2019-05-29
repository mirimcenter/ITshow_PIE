<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
		Cookie[] cookies = request.getCookies();
		String cookie_id = null;
	
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id"))
				cookie_id = cookies[i].getValue();
		}
	%>