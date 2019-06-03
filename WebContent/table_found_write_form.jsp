<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/formChk.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int space = Integer.parseInt(request.getParameter("space"));
	
	System.out.println(space);
%>
<form action="proc_table_found_write.jsp" name="frm" method="post">
	<table>
		<tr>
			<td>
				<input type="text" id="title" name="title">
			</td>
		</tr>
		<tr>
			<td>
				<textarea id="contents" name="contents"></textarea>
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
			</td>
		</tr>
	</table>
</form>
</body>
</html>