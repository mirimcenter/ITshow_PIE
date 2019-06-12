<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db_conn.jsp" %>
<%@ include file="cookie.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/board_comment.css" />
<script src="js/formChk.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	String contents="";
	String select_board_content = "select contents from find_comment where cnum="+cnum;
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_board_content);
	if(rs.next()) {
		contents = rs.getString("contents");
	}
%>
<a class="btn_back" href="table_find_content.jsp?bnum=<%=bnum%>"><button class="board_btn">돌아가기</button></a>
<br><br><font class="btn_back">수정하기</font><br>
<hr width="70%">
<table id="table">
<form action="table_find_comment_update.jsp" name="frm" method="post">
	<tr>
		<td><%= cookie_id %></td>
		<td><textarea id="contents" name="comment_contents"><%= contents %></textarea>
		<input type="hidden" name="bnum" value="<%= bnum %>">
		<input type="hidden" name="cnum" value="<%= cnum %>"></td>
	</tr>
	</form>
</table>
<div class="btn">
	<input type="button" value="수정하기" onclick="formChk_comment()">
	</div>
</body>
</html>