<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board_update.css" />
<script src="js/formChk.js"></script>
</head>
<body>
<%@include file="db_conn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String title ="";
	String contents = "";
	String id = "";
	String date = "";
	
	String select_query = "select * from find_board where bnum="+bnum;
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_query);
	if(rs.next()) {
		title = rs.getString("title");
		contents = rs.getString("contents");
		id = rs.getString("id");
		date = rs.getString("date");
	}
%>
<a class="btn_back" href="table_find.jsp"><button class="board_btn">돌아가기</button></a>
<br><br><font class="btn_back">수정하기</font><br>
<hr width="70%">
<form action="proc_table_find_update.jsp" name="frm" method="post">
	<table id="table">
		<tr>
		<td class="td1">제목</td>
			<td>
				<input type="text" id="title" name="title" value="<%= title %>">
			</td>
		</tr>
		<tr class="tr2">
		<td>내용</td>
		<td>
				<textarea id="contents" name="contents"><%= contents %></textarea>
				<input type="hidden" name="bnum" value="<%= bnum %>">
			</td>
		</tr>
		<tr>
		<td>파일</td>
			<td>
				<input type="file" id="f" name="f">
				<input type="hidden" name="file">
			</td>
			
		</tr>
</form>
	</table>
	<div class="btn">
	<input type="button" value="작성" onclick="formChk()">
	<input type="reset" value="다시" class="board_btn">
	</div>
</body>
</html>