<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="db_conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String id, pw;
	%>
	<%
	request.setCharacterEncoding("UTF-8");

	id = request.getParameter("id");
	pw = request.getParameter("pw");
	
	String select_member = "select pw from member where id=?";
	
	pstmt = conn.prepareStatement(select_member);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		if(rs.getString(1).equals(pw)){
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			response.sendRedirect("index_temp.jsp");
		}else{
			out.println("<script>");
			out.println("alert('정보가 틀렸습니다!')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		}
	}else{
		out.println("<script>");
		out.println("alert('아이디를 확인하세요')");
		out.println("location.href='login.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>