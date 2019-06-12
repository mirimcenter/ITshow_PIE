<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board_write.css" />
<script src="js/formChk.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int space = Integer.parseInt(request.getParameter("space"));
	
	System.out.println(space);
%>
<a class="btn_back" href="table_found.jsp?space=<%=space %>"><button class="board_btn">돌아가기</button></a>
<br><br><font class="btn_back">글쓰기</font><br>
<hr width="70%">
<table id="table">
	<form action="proc_table_found_write.jsp" name="frm" method="post">
		<tr class="tr1">
			<td class="td1">제목</td>
			<td>
				<input type="text" id="title" name="title" placeholder="제목을 입력하세요">
			</td>
		</tr>
		<tr class="tr2">
		<td>내용</td>
			<td>
				<textarea id="contents" name="contents" placeholder="내용을 입력하세요"></textarea>
				<input type="hidden" name="space" value="<%= space %>">
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