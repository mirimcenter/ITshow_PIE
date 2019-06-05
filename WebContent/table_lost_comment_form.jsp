<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db_conn.jsp" %>
<%@ include file="cookie.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/board_show.css" />
<script src="js/formChk.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	String contents="";
	String select_board_content = "select contents from found_comment where cnum="+cnum;
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_board_content);
	if(rs.next()) {
		contents = rs.getString("contents");
	}
%>
<table id="comment_content">
<form action="table_lost_comment_update.jsp" name="frm" method="post">
	<tr>
		<td><%= cookie_id %></td>
		<td><textarea id="contents" name="comment_contents"><%= contents %></textarea></td>
		<input type="hidden" name="bnum" value="<%= bnum %>">
		<input type="hidden" name="cnum" value="<%= cnum %>"></td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="button" value="수정하기" onclick="formChk_comment()">
	</form>
			<a href="table_found_content.jsp?bnum=<%=bnum%>"><button class="board_btn">돌아가기</button></a>
		</td>
	</tr>
</table>
</body>
</html>