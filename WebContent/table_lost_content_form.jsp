<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board_show.css" />
<script src="js/formChk.js"></script>
</head>
<body>
<%@ include file="db_conn.jsp" %>
<%@ include file="cookie.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String title = "";
	String contents = "";
	String id = "";
	String date = "";
	int space = 0;
	String img = null;
	
	
	String select_board_content = "select * from found_board where bnum=" + bnum;
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_board_content);
	if(rs.next()) {
		title = rs.getString("title");
		contents = rs.getString("contents");
		id = rs.getString("id");
		date = rs.getString("date");
		img = rs.getString("img");
		bnum = rs.getInt("bnum");
		space = rs.getInt("space");
	}
%>
<table id="table_content">
	<tr class="tr1">
		<td class="td1"><%= title %></td>
		<td class="td2"><%= id %></td>
		<td class="td3"><%= date %></td>
	</tr>
	<tr class="tr2">
		<td colspan="3">
		<%if(img != null){ %>
			<img src="img_view.jsp?bnum=<%= bnum %>"><br>
		<%} %>
			<%= contents %>
		</td>
	</tr>
	<tr>
		<td colspan="3"><a href="table_lost.jsp"><button class="board_btn">돌아가기</button></a></td>
	</tr>
</table>
<table id="table_comment">
<%
	int count = 0;
	
	String select_board_result = "select * from found_comment where bnum="+bnum;
	String select_board_count = "select count(*) from found_comment where bnum="+bnum;
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_board_count);
	if(rs.next()) count = rs.getInt(1);
	
	rs = stmt.executeQuery(select_board_result);
	
	if(count == 0){ %>
	<tr>
		<td colspan="3">댓글이 없습니다!</td>
	</tr>
<%	}
	else {
		while(rs.next()){
			String comment_contents = rs.getString("contents");
			String comment_id = rs.getString("id");
			int comment_cnum = rs.getInt("cnum");
%>
	<tr>
		<td class="td1"><%= comment_id %></td>
		<%if(cookie_id != null && cookie_id.equals(comment_id)) { %>
		<td class="td2"><%= comment_contents %></td>
		<td class="td3">
			<a href="table_lost_comment.jsp?bnum=<%= bnum %>&cnum=<%= comment_cnum%>"><button class="board_btn">수정</button></a>
			<a href="table_lost_comment_delete.jsp?bnum=<%= bnum %>&cnum=<%= comment_cnum%>"><button class="board_btn">삭제</button></a>
		</td>
		<% } 
		else{ %>
		<td colspan="2"><%= comment_contents %></td>
		<%} %>
	</tr>
<% 
	} 
		} 
%>

<form action="table_lost_comment_write.jsp" name="frm" method="post">
	<tr>
	<% String write_id = (cookie_id != null) ? cookie_id : "익명"; %>
		<td><%= write_id %><input type="hidden" name="id" value="<%= cookie_id %>"></td>
		<td><textarea name="comment_contents"></textarea></td>
		<td><input type="hidden" name="space" value="<%= space %>">
		<input type="hidden" name="bnum" value="<%= bnum %>">
		<input type="button" value="등록" onclick="formChk_comment()"></td>
	</tr>
	</form>
	</table>

</body>
</html>