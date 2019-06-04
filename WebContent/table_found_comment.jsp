<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db_conn.jsp" %>
<%@ include file="cookie.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int space = Integer.parseInt(request.getParameter("space"));
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	String contents="";
	String select_board_content = "select contents from found_comment where cnum="+cnum;
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_board_content);
	if(rs.next()) {
		contents = rs.getString("contents");
	}
%>
<table>
<form action="table_found_comment_update.jsp" name="frm" method="post">
	<tr>
		<td><%= cookie_id %></td>
		<td><textarea id="contents" name="contents"><%= contents %></textarea></td>
		<td><input type="hidden" name="space" value="<%= space %>">
		<input type="hidden" name="bnum" value="<%= bnum %>">
		<input type="hidden" name="cnum" value="<%= cnum %>"></td>
	</tr>
	<tr>
	<td><input type="submit" value="수정하기"></td>
	</tr>
	</form>
</table>
</body>
</html>