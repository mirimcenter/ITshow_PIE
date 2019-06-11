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
<a class="btn_back" href="table_lost.jsp"><button class="board_btn">돌아가기</button></a>
<table id="table_content">
	<tr class="board_tr">
		<td class="td1" colspan=3><%= title %></td>
	</tr>
	<tr class="comment_tr">
		<td class="td2" colspan=2>게시자 : <%= id %></td>
		<td class="td3">게시일 : <%= date %></td>
	</tr>
	<tr class="board_tr2">
		<td colspan="3">
		<%if(img != null){ %>
			<img src="img_view.jsp?bnum=<%= bnum %>" class="img"><br>
		<%} %>
			<%= contents %>
		</td>
	</tr>
	
	<%if(cookie_id != null && cookie_id.equals(id)) { %>
		<tr class="board_tr">
		<td class="btn_delete"><a href="proc_table_found_delete.jsp?bnum=<%=bnum %>"><button class="board_btn">삭제</button></a></td>
		<td colspan=2 class="btn_update"><a href="table_found_update.jsp?bnum=<%=bnum %>"><button class="board_btn">수정</button></a></td>
		</tr>
		<% } 
		else{%>
		<%} %>
		
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
	else {%>
	<tr class="comment_bottom">
	<td colspan=3 style="text-align:left">댓글 <font style="color:#339933"><%= count %></font>개</td>
</tr>
<%
		while(rs.next()){
			String comment_contents = rs.getString("contents");
			String comment_id = rs.getString("id");
			int comment_cnum = rs.getInt("cnum");
%>
	<tr class="comment_tr">
	<%if(cookie_id != null && cookie_id.equals(comment_id)) { %>
	<td class="comment_id"><%= comment_id %></td>
	<% } 
		else{ %>
		<td><%= comment_id %></td>
		<%} %>
		<%if(cookie_id != null && cookie_id.equals(comment_id)) { %>
		<td class="comment_td"><%= comment_contents %></td>
		<td style="text-align:right">
			<a href="table_lost_comment.jsp?bnum=<%= bnum %>&cnum=<%= comment_cnum%>"><button class="board_btn">수정</button></a>
			<a href="table_lost_comment_delete.jsp?bnum=<%= bnum %>&cnum=<%= comment_cnum%>"><button class="board_btn">삭제</button></a>
		</td>
		<% } 
		else{ %>
		<td class="comment_td"><%= comment_contents %></td><td></td>
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
		<td style="text-align:right"><input type="hidden" name="space" value="<%= space %>">
		<input type="hidden" name="bnum" value="<%= bnum %>">
		<input type="button" value="등록" onclick="formChk_comment()"></td>
	</tr>
	</form>
	</table>

</body>
</html>