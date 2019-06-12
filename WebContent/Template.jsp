<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contentpage = request.getParameter("CONTENTPAGE");
%>
<head>
<title>미림 분실물 센터</title>
<style>
	body{
		overflow-x: hidden;
	}
</style>
</head>
<body>
<table width=100% height=100% border=0 cellpadding=0 cellspacing=0>
	<tr height="0px">
		<td>
			<jsp:include page="nav.jsp" flush="false"/>
		</td>
		
	</tr>
	
	<tr>
		<td>
			<jsp:include page="<%=contentpage %>" flush="false"/>
		</td>
	</tr>
	

</table>
</body>
</html>
