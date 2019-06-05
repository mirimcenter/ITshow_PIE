<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/formChk.js"></script>
<link rel="stylesheet" type="text/css" href="css/board_update.css" />
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
	String space = "";
	
	String select_query = "select * from found_board where bnum="+bnum;
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_query);
	if(rs.next()) {
		title = rs.getString("title");
		contents = rs.getString("contents");
		id = rs.getString("id");
		date = rs.getString("date");
		space = rs.getString("space");
	}
%>
<form action="proc_table_found_update.jsp" name="frm" method="post">
	<table id="table_content">
		<tr>
			<td>
				<input type="text" id="title" name="title" value="<%= title %>">
			</td>
		</tr>
		<tr class="tr2">
			<td>
				<textarea id="contents" name="contents"><%= contents %></textarea>
				<input type="hidden" name="bnum" value="<%= bnum %>">
				<input type="hidden" name="space" value="<%= space %>">
			</td>
		</tr>
		<tr>
			<td>
				<input type="file" id="f" name="f">
				<input type="hidden" name="file">
			</td>
			
		</tr>
		<tr>
			<td>
				<input type="button" value="작성" onclick="formChk()">
				<input type="reset" value="다시">
				<a href="table_found.jsp?space=<%=space %>"><button>돌아가기</button></a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>